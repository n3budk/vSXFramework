local cfg = module("cfg/player_state")

AddEventHandler("vSX:playerSpawn", function(user_id, source, first_spawn)
    Debug.pbegin("playerSpawned_player_state")
    local player = source
    local data = vSX.getUserDataTable(user_id)
    local tmpdata = vSX.getUserTmpTable(user_id)
    if first_spawn then
        if data.position == nil and cfg.spawn_enabled then
            local x = cfg.spawn_position[1]+math.random()*cfg.spawn_radius*2-cfg.spawn_radius
            local y = cfg.spawn_position[2]+math.random()*cfg.spawn_radius*2-cfg.spawn_radius
            local z = cfg.spawn_position[3]+math.random()*cfg.spawn_radius*2-cfg.spawn_radius
            data.position = {x = x, y = y, z = z}
        end
        if data.position ~= nil then
            vSXclient.teleport(source, {data.position.x, data.position.y, data.position.z})
        end
        if data.health ~= nil then
            vSXclient.setHealth(source, {data.health})
            SetTimeout(5000, function()
                vSXclient.isInComa(player, {}, function(in_coma)
                    vSXclient.killComa(player, {})
                end)
            end)
        end
    else
        vSX.setHunger(user_id, 0)
        vSX.setThirst(user_id, 0)
        vSX.clearInventory(user_id)
        if cfg.lose_aptitudes_on_death then
            data.gaptitudes = {}
        end
        vSX.setMoney(user_id, 0)
        if cfg.spawn_enabled then
            local x = cfg.spawn_position[1]+math.random()*cfg.spawn_radius*2-cfg.spawn_radius
            local y = cfg.spawn_position[2]+math.random()*cfg.spawn_radius*2-cfg.spawn_radius
            local z = cfg.spawn_position[3]+math.random()*cfg.spawn_radius*2-cfg.spawn_radius
            data.position = {x = x, y = y, z = z}
            vSXclient.teleport(source, {x, y, z})
        end
    end
    Debug.pend()
end)

AddEventHandler("vSX:playerDied", function()
    local user_id = vSX.getUserId(source)
    if user_id ~= nil then
        local data = vSX.getUserDataTable(user_id)
        if data ~= nil then
            data.position = nil
        end
    end
end)

function tvSX.updatePos(x, y, z)
    local user_id = vSX.getUserId(source)
    if user_id ~= nil then
        local data = vSX.getUserDataTable(user_id)
        if data ~= nil then
            data.position = {x = tonumber(x), y = tonumber(y), z = tonumber(z)}
        end
    end
end
  
function tvSX.updateHealth(health)
    local user_id = vSX.getUserId(source)
    if user_id ~= nil then
        local data = vSX.getUserDataTable(user_id)
        if data ~= nil then
            data.health = health
        end
    end
end