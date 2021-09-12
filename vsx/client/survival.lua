function tvSX.varyHealth(variation)
    local ped = GetPlayerPed(-1)
    local n = math.floor(GetEntityHealth(ped)+variation)
    SetEntityHealth(ped, n)
end
  
function tvSX.getHealth()
    return GetEntityHealth(GetPlayerPed(-1))
end
  
function tvSX.setHealth(health)
    local n = math.floor(health)
    SetEntityHealth(GetPlayerPed(-1), n)
end
  
function tvSX.setFriendlyFire(flag)
    NetworkSetFriendlyFireOption(flag)
    SetCanAttackFriendly(GetPlayerPed(-1), flag, flag)
end

function tvSX.ejectVehicle()
    local ped = GetPlayerPed(-1)
    if IsPedSittingInAnyVehicle(ped) then
        local veh = GetVehiclePedIsIn(ped, false)
        TaskLeaveVehicle(ped, veh, 4160)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if IsPlayerPlaying(PlayerId()) then
            local ped = GetPlayerPed(-1)
            local vthirst = 0
            local vhunger = 0
            if IsPedOnFoot(ped) then
                local factor = math.min(tvSX.getSpeed(), 10)
                vthirst = vthirst+1*factor
                vhunger = vhunger+0.5*factor
            end
            if IsPedInMeleeCombat(ped) then
                vthirst = vthirst+10
                vhunger = vhunger+5
            end
            if IsPedHurt(ped) or IsPedInjured(ped) then
                vthirst = vthirst+2
                vhunger = vhunger+1
            end
            if vthirst ~= 0 then
                vSXserver.varyThirst({vthirst/12.0})
            end
            if vhunger ~= 0 then
                vSXserver.varyHunger({vhunger/12.0})
            end
        end
    end
end)

local in_coma = false
local coma_left = cfg.coma_duration*60

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        local health = GetEntityHealth(ped)
        if health <= cfg.coma_threshold and coma_left > 0 then
            if not in_coma then
                if IsEntityDead(ped) then
                    local x, y, z = tvSX.getPosition()
                    NetworkResurrectLocalPlayer(x, y, z, true, true, false)
                    Citizen.Wait(0)
                end
                in_coma = true
                vSXserver.updateHealth({cfg.coma_threshold})
                SetEntityHealth(ped, cfg.coma_threshold)
                SetEntityInvincible(ped, true)
                tvSX.playScreenEffect(cfg.coma_effect, -1)
                tvSX.ejectVehicle()
                tvSX.setRagdoll(true)
            else 
                if health < cfg.coma_threshold then 
                    SetEntityHealth(ped, cfg.coma_threshold) 
                end
            end
        else
            if in_coma then
                in_coma = false
                SetEntityInvincible(ped,false)
                tvSX.setRagdoll(false)
                tvSX.stopScreenEffect(cfg.coma_effect)
                if coma_left <= 0 then
                    SetEntityHealth(ped, 0)
                end
                SetTimeout(5000, function()
                    coma_left = cfg.coma_duration*60
                end)
            end
        end
    end
end)

function tvSX.isInComa()
    return in_coma
end

function tvSX.killComa()
    if in_coma then
        coma_left = 0
    end
end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1000)
        if in_coma then
            coma_left = coma_left-1
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0)
    end
end)