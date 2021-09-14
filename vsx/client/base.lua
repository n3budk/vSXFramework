cfg = module("cfg/client")

tvSX = {}

local players = {}

Tunnel.bindInterface("vSX", tvSX)

vSXserver = Tunnel.getInterface("vSX", "vSX")

Proxy.addInterface("vSX", tvSX)

function tvSX.teleport(x, y, z)
    SetEntityCoords(GetPlayerPed(-1), x+0.0001, y+0.0001, z+0.0001, 1, 0, 0, 1)
    vSXserver.updatePos({x, y, z})
end
  
function tvSX.getPosition()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    return x, y, z
end
  
function tvSX.isInside()
    local x, y, z = tvSX.getPosition()
    return not (GetInteriorAtCoords(x, y, z) == 0)
end
  
function tvSX.getSpeed()
    local vx, vy, vz = table.unpack(GetEntityVelocity(GetPlayerPed(-1)))
    return math.sqrt(vx*vx+vy*vy+vz*vz)
end

function tvSX.getCamDirection()
    local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
    local pitch = GetGameplayCamRelativePitch()
    local x = -math.sin(heading*math.pi/180.0)
    local y = math.cos(heading*math.pi/180.0)
    local z = math.sin(pitch*math.pi/180.0)
    local len = math.sqrt(x*x+y*y+z*z)
    if len ~= 0 then
        x = x/len
        y = y/len
        z = z/len
    end
    return x, y, z
end
  
function tvSX.addPlayer(player)
    players[player] = true
end
  
function tvSX.removePlayer(player)
    players[player] = nil
end

function tvSX.getNearestPlayers(radius)
    local r = {}
    local ped = GetPlayerPed(i)
    local pid = PlayerId()
    local px, py, pz = tvSX.getPosition()
    for k, v in pairs(players) do
        local player = GetPlayerFromServerId(k)
        if v and player ~= pid and NetworkIsPlayerConnected(player) then
            local oped = GetPlayerPed(player)
            local x, y, z = table.unpack(GetEntityCoords(oped,true))
            local distance = GetDistanceBetweenCoords(x, y, z, px, py, pz, true)
            if distance <= radius then
                r[GetPlayerServerId(player)] = distance
            end
        end
    end
    return r
end

function tvSX.getNearestPlayer(radius)
    local p = nil
    local players = tvSX.getNearestPlayers(radius)
    local min = radius+10.0
    for k, v in pairs(players) do
        if v < min then
            min = v
            p = k
        end
    end
    return p
end

function tvSX.playScreenEffect(name, duration)
    if duration < 0 then
        StartScreenEffect(name, 0, true)
    else
        StartScreenEffect(name, 0, true)
        Citizen.CreateThread(function()
            Citizen.Wait(math.floor((duration+1)*1000))
            StopScreenEffect(name)
        end)
    end
end
  
function tvSX.stopScreenEffect(name)
    StopScreenEffect(name)
end

local anims = {}
local anim_ids = Tools.newIDGenerator()

function tvSX.playAnim(upper, seq, looping)
    if seq.task ~= nil then
        tvSX.stopAnim(true)
        local ped = GetPlayerPed(-1)
        if seq.task == "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" then
            local x, y, z = tvSX.getPosition()
            TaskStartScenarioAtPosition(ped, seq.task, x, y, z-1, GetEntityHeading(ped), 0, 0, false)
        else
            TaskStartScenarioInPlace(ped, seq.task, 0, not seq.play_exit)
        end
    else
        tvSX.stopAnim(upper)
        local flags = 0
        if upper then
            flags = flags+48
        end
        if looping then
            flags = flags+1
        end
        Citizen.CreateThread(function()
            local id = anim_ids:gen()
            anims[id] = true
            for k, v in pairs(seq) do
                local dict = v[1]
                local name = v[2]
                local loops = v[3] or 1
                for i = 1, loops do
                    if anims[id] then
                        local first = (k == 1 and i == 1)
                        local last = (k == #seq and i == loops)
                        RequestAnimDict(dict)
                        local i = 0
                        while not HasAnimDictLoaded(dict) and i < 1000 do
                            Citizen.Wait(10)
                            RequestAnimDict(dict)
                            i = i+1
                        end
                        if HasAnimDictLoaded(dict) and anims[id] then
                            local inspeed = 8.0001
                            local outspeed = -8.0001
                            if not first then
                                inspeed = 2.0001
                            end
                            if not last then
                                outspeed = 2.0001
                            end
                            TaskPlayAnim(GetPlayerPed(-1), dict, name, inspeed, outspeed, -1, flags, 0, 0, 0, 0)
                        end
  
                        Citizen.Wait(0)
                        while GetEntityAnimCurrentTime(GetPlayerPed(-1), dict, name) <= 0.95 and IsEntityPlayingAnim(GetPlayerPed(-1), dict, name, 3) and anims[id] do
                            Citizen.Wait(0)
                        end
                    end
                end
            end
            anim_ids:free(id)
            anims[id] = nil
        end)
    end
end

function tvSX.stopAnim(upper)
    anims = {}
    if upper then
        ClearPedSecondaryTask(GetPlayerPed(-1))
    else
        ClearPedTasks(GetPlayerPed(-1))
    end
end
  
local ragdoll = false
  
function tvSX.setRagdoll(flag)
    ragdoll = flag
end

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(10)
      if ragdoll then
        SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
      end
    end
end)
  
function tvSX.playSpatializedSound(dict, name, x, y, z, range)
    PlaySoundFromCoord(-1, name, x+0.0001, y+0.0001, z+0.0001, dict, 0, range+0.0001, 0)
end
  
function tvSX.playSound(dict, name)
    PlaySound(-1, name, dict, 0, 0, 1)
end

AddEventHandler("playerSpawned", function()
    TriggerServerEvent("vSXcli:playerSpawned")
end)
  
AddEventHandler("onPlayerDied", function(player, reason)
    TriggerServerEvent("vSXcli:playerDied")
end)
  
AddEventHandler("onPlayerKilled", function(player, killer, reason)
    TriggerServerEvent("vSXcli:playerDied")
end)