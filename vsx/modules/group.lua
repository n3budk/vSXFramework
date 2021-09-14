local cfg = module("cfg/groups")

local groups = cfg.groups
local users = cfg.users

function vSX.getUserGroups(user_id)
    local data = vSX.getUserDataTable(user_id)
    if data then 
        if data.groups == nil then
            data.groups = {}
        end
        return data.groups
    else
        return {}
    end
end

function vSX.addUserGroup(user_id, group)
    if not vSX.hasGroup(user_id, group) then
        local user_groups = vSX.getUserGroups(user_id)
        local ngroup = groups[group]
        if ngroup then
            if ngroup._config and ngroup._config.gtype ~= nil then 
                local _user_groups = {}
                for k, v in pairs(user_groups) do
                    _user_groups[k] = v
                end
                for k, v in pairs(_user_groups) do
                    local kgroup = groups[k]
                    if kgroup and kgroup._config and ngroup._config and kgroup._config.gtype == ngroup._config.gtype then
                        vSX.removeUserGroup(user_id, k)
                    end
                end
            end
            user_groups[group] = true
            local player = vSX.getUserSource(user_id)
            if ngroup._config and ngroup._config.onjoin and player ~= nil then
                ngroup._config.onjoin(player)
            end
            local gtype = nil
            if ngroup._config then
                gtype = ngroup._config.gtype 
            end
            TriggerEvent("vSX:playerJoinGroup", user_id, group, gtype)
            TriggerClientEvent("vSX:getGroup", player, group)
        end
    end
end

function vSX.getUserGroupByType(user_id, gtype)
    local user_groups = vSX.getUserGroups(user_id)
    for k, v in pairs(user_groups) do
        local kgroup = groups[k]
        if kgroup then
            if kgroup._config and kgroup._config.gtype and kgroup._config.gtype == gtype then
                return k
            end
        end
    end
    return ""
end

function vSX.getUsersByGroup(group)
    local users = {}
    for k, v in pairs(vSX.rusers) do
        if vSX.hasGroup(tonumber(k), group) then
            table.insert(users, tonumber(k))
        end
    end
    return users
end

function vSX.getUsersByPermission(perm)
    local users = {}
    for k, v in pairs(vSX.rusers) do
        if vSX.hasPermission(tonumber(k), perm) then
            table.insert(users, tonumber(k))
        end
    end  
    return users
end

function vSX.removeUserGroup(user_id, group)
    local user_groups = vSX.getUserGroups(user_id)
    local groupdef = groups[group]
    if groupdef == nil then
        do return end
    else
        if groupdef and groupdef._config and groupdef._config.onleave then
            local source = vSX.getUserSource(user_id)
            if source ~= nil then
                groupdef._config.onleave(source)
            end
        end
        local gtype = nil
        if groupdef._config then
            gtype = groupdef._config.gtype 
        end
        TriggerEvent("vSX:playerLeaveGroup", user_id, group, gtype)
        user_groups[group] = nil
    end
end

function vSX.hasGroup(user_id, group)
    local user_groups = vSX.getUserGroups(user_id)
    return (user_groups[group] ~= nil)
end

function vSX.hasPermission(user_id, perm)
    local user_groups = vSX.getUserGroups(user_id)
    local fchar = string.sub(perm, 1, 1)
    if fchar == "@" then
        local _perm = string.sub(perm, 2, string.len(perm))
        local parts = splitString(_perm, ".")
        if #parts == 3 then
            local group = parts[1]
            local aptitude = parts[2]
            local op = parts[3]
            local alvl = math.floor(vSX.expToLevel(vSX.getExp(user_id, group, aptitude)))
            local fop = string.sub(op, 1, 1)
            if fop == "<" then
                local lvl = parseInt(string.sub(op, 2, string.len(op)))
            if alvl < lvl then
                return true
            end
            elseif fop == ">" then
                local lvl = parseInt(string.sub(op, 2, string.len(op)))
                if alvl > lvl then
                    return true
                end
            else
                local lvl = parseInt(string.sub(op, 1, string.len(op)))
                if alvl == lvl then
                    return true
                end
            end
        end
    elseif fchar == "#" then
        local _perm = string.sub(perm, 2, string.len(perm))
        local parts = splitString(_perm, ".")
        if #parts == 2 then
            local item = parts[1]
            local op = parts[2]
            local amount = vSX.getInventoryItemAmount(user_id, item)
            local fop = string.sub(op, 1, 1)
            if fop == "<" then
                local n = parseInt(string.sub(op, 2, string.len(op)))
                if amount < n then
                    return true
                end
            elseif fop == ">" then
                local n = parseInt(string.sub(op, 2, string.len(op)))
                if amount > n then
                    return true
                end
            else
                local n = parseInt(string.sub(op, 1, string.len(op)))
                if amount == n then
                    return true
                end
            end
        end
    else
        local nperm = "-"..perm
        for k, v in pairs(user_groups) do
            if v then
                local group = groups[k]
                if group then
                    for l, w in pairs(group) do
                        if l ~= "_config" and w == nperm then
                            return false
                        end
                    end
                end
            end
        end
        for k, v in pairs(user_groups) do
            if v then
                local group = groups[k]
                if group then
                    for l, w in pairs(group) do
                        if l ~= "_config" and w == perm then
                            return true
                        end
                    end
                end
            end
        end
    end  
    return false
end

function vSX.hasPermissions(user_id, perms)
    for k, v in pairs(perms) do
        if not vSX.hasPermission(user_id, v) then
            return false
        end
    end  
    return true
end

AddEventHandler("vSX:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then
        local user = users[user_id]
        if user ~= nil then
            for k, v in pairs(user) do
                vSX.addUserGroup(user_id, v)
            end
        end
        vSX.addUserGroup(user_id, "vSX User")
        if user_id ~= nil and vSX.getUserGroupByType(user_id, "job") == "" then
            vSX.addUserGroup(user_id, "Unemployed")
        end
    end
    local user_groups = vSX.getUserGroups(user_id)
    for k, v in pairs(user_groups) do
        local group = groups[k]
        if group and group._config and group._config.onspawn then
            group._config.onspawn(source)
        end
    end
end)
