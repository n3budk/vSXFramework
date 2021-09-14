local Proxy = module("lib/Proxy")
local Tunnel = module("lib/Tunnel")

Debug = module("lib/Debug")

local config = module("cfg/base")

Debug.active = config.debug

vSX = {}
Proxy.addInterface("vSX", vSX)

tvSX = {}
Tunnel.bindInterface("vSX", tvSX)

vSXclient = Tunnel.getInterface("vSX", "vSX")

vSX.users = {}
vSX.rusers = {}
vSX.user_tables = {}
vSX.user_tmp_tables = {}
vSX.user_sources = {}

function vSX.getUserIdByIdentifiers(ids, cbr)
    local task = Task(cbr)
    if ids ~= nil and #ids then
        local i = 0
        local function search()
            i = i+1
            if i <= #ids then
                MySQL.query("vSX/userid_byidentifier", {identifier = ids[i]}, function(rows, affected)
                    if #rows > 0 then
                        task({rows[1].user_id})
                    else
                        search()
                    end
                end)
            else
                MySQL.query("vSX/create_user", {}, function(rows, affected)
                    if #rows > 0 then
                        local user_id = rows[1].id
                        for l, w in pairs(ids) do
                            MySQL.query("vSX/add_identifier", {user_id = user_id, identifier = w})
                        end
                        task({user_id})
                    else
                        task()
                    end
                end)
            end
        end
        search()
    else
        task()
    end
end

function vSX.getSourceIdKey(source)
    local ids = GetPlayerIdentifiers(source)
    local idk = "idk_"
    for k, v in pairs(ids) do
        idk = idk..v
    end
    return idk
end

function vSX.isBanned(user_id, cbr)
    local task = Task(cbr, {false})
    MySQL.query("vSX/get_banned", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].banned})
        else
            task()
        end
    end)
end

function vSX.setBanned(user_id, banned)
    MySQL.query("vSX/set_banned", {user_id = user_id, banned = banned})
end

function vSX.isWhitelisted(user_id, cbr)
    local task = Task(cbr, {false})
    MySQL.query("vSX/get_whitelisted", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].whitelisted})
        else
            task()
        end
    end)
end

function vSX.setWhitelisted(user_id, whitelisted)
    MySQL.query("vSX/set_whitelisted", {user_id = user_id, whitelisted = whitelisted})
end

function vSX.getLastLogin(user_id, cbr)
    local task = Task(cbr, {""})
    MySQL.query("vSX/get_last_login", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].last_login})
        else
            task()
        end
    end)
end

function vSX.setUData(user_id, key, value)
    MySQL.query("vSX/set_userdata", {user_id = user_id, key = key, value = value})
end
  
function vSX.getUData(user_id, key, cbr)
    local task = Task(cbr, {""})
    MySQL.query("vSX/get_userdata", {user_id = user_id, key = key}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].dvalue})
        else
            task()
        end
    end)
end

function vSX.setSData(key, value)
    MySQL.query("vSX/set_srvdata", {key = key, value = value})
end
  
function vSX.getSData(key, cbr)
    local task = Task(cbr, {""})
    MySQL.query("vSX/get_srvdata", {key = key}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].dvalue})
        else
            task()
        end
    end)
end

function vSX.getUserDataTable(user_id)
    return vSX.user_tables[user_id]
end
  
function vSX.getUserTmpTable(user_id)
    return vSX.user_tmp_tables[user_id]
end
  
function vSX.isConnected(user_id)
    return vSX.rusers[user_id] ~= nil
end
  
function vSX.isFirstSpawn(user_id)
    local tmp = vSX.getUserTmpTable(user_id)
    return tmp and tmp.spawns == 1
end
  
function vSX.getUserId(source)
    if source ~= nil then
        local ids = GetPlayerIdentifiers(source)
        if ids ~= nil and #ids > 0 then
            return vSX.users[ids[1]]
        end
    end
    return nil
end

function vSX.getUsers()
    local users = {}
    for k, v in pairs(vSX.user_sources) do
       users[k] = v
    end
    return users
end

function vSX.getUserSource(user_id)
    return vSX.user_sources[user_id]
end
  
function vSX.ban(source, reason)
    local user_id = vSX.getUserId(source)
    if user_id ~= nil then
        vSX.setBanned(user_id, true)
        vSX.kick(source, ""..Lang("BANNED")..""..reason.."")
    end
end

function vSX.kick(source, reason)
    DropPlayer(source, reason)
end

function task_save_datatables()
    TriggerEvent("vSX:save")
    Debug.pbegin("vSX save datatables")
    for k, v in pairs(vSX.user_tables) do
        vSX.setUData(k, "vSX:datatable", json.encode(v))
    end
    Debug.pend()
    SetTimeout(config.save_interval*1000, task_save_datatables)
end
task_save_datatables()

local max_pings = math.ceil(config.ping_timeout*60/30)+1

function tvSX.ping()
    local user_id = vSX.getUserId(source)
    if user_id ~= nil then
        local tmpdata = vSX.getUserTmpTable(user_id)
        tmpdata.pings = 0
    end
end

local rejects = {}

AddEventHandler("playerConnecting", function(name, setMessage)
    local source = source
    Debug.pbegin("playerConnecting")
    local ids = GetPlayerIdentifiers(source)
    local idk = vSX.getSourceIdKey(source)
    local function reject(reason)
        rejects[idk] = reason
    end
    if ids ~= nil and #ids > 0 then
        vSX.getUserIdByIdentifiers(ids, function(user_id)
            if user_id ~= nil then
                vSX.isBanned(user_id, function(banned)
                    if not banned then
                        vSX.isWhitelisted(user_id, function(whitelisted)
                            if not config.whitelist or whitelisted then
                                Debug.pbegin("playerConnecting_delayed")
                                if vSX.rusers[user_id] == nil then
                                    vSX.users[ids[1]] = user_id
                                    vSX.rusers[user_id] = ids[1]
                                    vSX.user_tables[user_id] = {}
                                    vSX.user_tmp_tables[user_id] = {}
                                    vSX.user_sources[user_id] = source
                                    vSX.getUData(user_id, "vSX:datatable", function(sdata)
                                        local data = json.decode(sdata)
                                        if type(data) == "table" then
                                            vSX.user_tables[user_id] = data
                                        end
                                        local tmpdata = vSX.getUserTmpTable(user_id)
                                        vSX.getLastLogin(user_id, function(last_login)
                                            tmpdata.last_login = last_login or ""
                                            tmpdata.spawns = 0
                                            local ep = GetPlayerEP(source)
                                            local last_login_stamp = ep.." "..os.date("%H:%M:%S %d/%m/%Y")
                                            MySQL.query("vSX/set_last_login", {user_id = user_id, last_login = last_login_stamp})
                                            print("[vSX] "..name.." ("..GetPlayerEP(source)..") joined (user_id = "..user_id..")")
                                            TriggerEvent("vSX:playerJoin", user_id, source, name, tmpdata.last_login)
                                        end)
                                    end)
                                else
                                    print("[vSX] "..name.." ("..GetPlayerEP(source)..") re-joined (user_id = "..user_id..")")
                                    TriggerEvent("vSX:playerRejoin", user_id, source, name)
                                    local tmpdata = vSX.getUserTmpTable(user_id)
                                    tmpdata.spawns = 0
                                end
                                Debug.pend()
                            else
                                print("[vSX] "..name.." ("..GetPlayerEP(source)..") rejected: not whitelisted (user_id = "..user_id..")")
                                reject("[vSX] Not whitelisted (user_id = "..user_id..").")
                            end
                        end)
                    else
                        print("[vSX] "..name.." ("..GetPlayerEP(source)..") rejected: banned (user_id = "..user_id..")")
                        reject("[vSX] Banned (user_id = "..user_id..").")
                    end
                end)
            else
                print("[vSX] "..name.." ("..GetPlayerEP(source)..") rejected: identification error")
                reject(Lang("IDENTIFIER_ERROR"))
            end
        end)
    else
        print("[vSX] "..name.." ("..GetPlayerEP(source)..") rejected: missing identifiers")
        setMessage(Lang("MISSING_IDENTIFIERS"))
        CancelEvent()
    end
    Debug.pend()
end)

AddEventHandler("playerDropped", function(reason)
    local source = source
    Debug.pbegin("playerDropped")
    rejects[source] = nil
    vSXclient.removePlayer(-1, {source})
    local user_id = vSX.getUserId(source)
    if user_id ~= nil then
        TriggerEvent("vSX:playerLeave", user_id, source)
        vSX.setUData(user_id, "vSX:datatable", json.encode(vSX.getUserDataTable(user_id)))
        print("[vSX] "..GetPlayerEP(source).." disconnected (user_id = "..user_id..")")
        vSX.users[vSX.rusers[user_id]] = nil
        vSX.rusers[user_id] = nil
        vSX.user_tables[user_id] = nil
        vSX.user_tmp_tables[user_id] = nil
        vSX.user_sources[user_id] = nil
    end
    Debug.pend()
end)

RegisterServerEvent("vSXcli:playerSpawned")
AddEventHandler("vSXcli:playerSpawned", function()
    Debug.pbegin("playerSpawned")
    local user_id = vSX.getUserId(source)
    local player = source
    if user_id ~= nil then
        vSX.user_sources[user_id] = source
        local tmp = vSX.getUserTmpTable(user_id)
        tmp.spawns = tmp.spawns+1
        local first_spawn = (tmp.spawns == 1)
        if first_spawn then
            for k, v in pairs(vSX.user_sources) do
                vSXclient.addPlayer(source, {v})
            end
            vSXclient.addPlayer(-1, {source})
        end
        SetTimeout(2000, function()
            TriggerEvent("vSX:playerSpawn", user_id, player, first_spawn)
            TriggerClientEvent("vsx_notify:Alert", player, Lang("SERVER_NAME_NOTIFY"), Lang("SERVER_NOTIFY"), 5000, "info")
        end)
    end
    local idk = vSX.getSourceIdKey(player)
    local reason = rejects[idk]
    if reason then
        vSX.kick(player, reason)
        rejects[idk] = nil
    end
    Debug.pend()
end)

RegisterServerEvent("vSX:playerDied")