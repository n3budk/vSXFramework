local cfg = module("cfg/survival")

function vSX.getHunger(user_id)
    local data = vSX.getUserDataTable(user_id)
    if data then
        return data.hunger
    end
    return 0
end

function vSX.getThirst(user_id)
    local data = vSX.getUserDataTable(user_id)
    if data then
        return data.thirst
    end
    return 0
end

function vSX.setHunger(user_id, value)
    local data = vSX.getUserDataTable(user_id)
    if data then
        data.hunger = value
        if data.hunger < 0 then
            data.hunger = 0
        elseif data.hunger > 100 then
            data.hunger = 100 
        end
    end
end

function vSX.setThirst(user_id, value)
    local data = vSX.getUserDataTable(user_id)
    if data then
        data.thirst = value
        if data.thirst < 0 then
            data.thirst = 0
        elseif data.thirst > 100 then
            data.thirst = 100 
        end
    end
end

function vSX.varyHunger(user_id, variation)
    local data = vSX.getUserDataTable(user_id)
    if data then
        local was_starving = data.hunger >= 100
        data.hunger = data.hunger + variation
        local is_starving = data.hunger >= 100
        local overflow = data.hunger-100
        if overflow > 0 then
            vSXclient.varyHealth(vSX.getUserSource(user_id), {-overflow*cfg.overflow_damage_factor})
        end
        if data.hunger < 0 then
            data.hunger = 0
        elseif data.hunger > 100 then
            data.hunger = 100 
        end
    end
end

function vSX.varyThirst(user_id, variation)
    local data = vSX.getUserDataTable(user_id)
    if data then
        local was_thirsty = data.thirst >= 100
        data.thirst = data.thirst + variation
        local is_thirsty = data.thirst >= 100
        local overflow = data.thirst-100
        if overflow > 0 then
            vSXclient.varyHealth(vSX.getUserSource(user_id), {-overflow*cfg.overflow_damage_factor})
        end
  
        if data.thirst < 0 then
            data.thirst = 0
        elseif data.thirst > 100 then
            data.thirst = 100 
        end
    end
end

function tvSX.varyHunger(variation)
    local user_id = vSX.getUserId(source)
    if user_id ~= nil then
        vSX.varyHunger(user_id, variation)
    end
end
  
function tvSX.varyThirst(variation)
    local user_id = vSX.getUserId(source)
    if user_id ~= nil then
        vSX.varyThirst(user_id, variation)
    end
end

function task_update()
    for k, v in pairs(vSX.users) do
        vSX.varyHunger(v, cfg.hunger_per_minute)
        vSX.varyThirst(v, cfg.thirst_per_minute)
    end
    SetTimeout(60000, task_update)
end
task_update()

AddEventHandler("vSX:playerJoin",function(user_id, source, name, last_login)
    local data = vSX.getUserDataTable(user_id)
    if data.hunger == nil then
        data.hunger = 0
        data.thirst = 0
    end
end)

AddEventHandler("vSX:playerSpawn",function(user_id, source, first_spawn)
    local data = vSX.getUserDataTable(user_id)
    vSXclient.setFriendlyFire(source, {cfg.pvp})
    vSX.setHunger(user_id, data.hunger)
    vSX.setThirst(user_id, data.thirst)
end)