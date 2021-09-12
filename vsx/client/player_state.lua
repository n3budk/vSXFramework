local state_ready = false

AddEventHandler("playerSpawned", function()
    state_ready = false
    Citizen.CreateThread(function()
        Citizen.Wait(30000)
        state_ready = true
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        if IsPlayerPlaying(PlayerId()) and state_ready then
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
            vSXserver.ping({})
            vSXserver.updatePos({x, y, z})
            vSXserver.updateHealth({tvSX.getHealth()})
        end
    end
end)

function tvSX.giveWeapons(weapons, clear_before)
    local player = GetPlayerPed(-1)
    if clear_before then
        RemoveAllPedWeapons(player, true)
    end
    for k, weapon in pairs(weapons) do
        local hash = GetHashKey(k)
        local ammo = weapon.ammo or 0
        GiveWeaponToPed(player, hash, ammo, false)
    end
end

function tvSX.removeWeapons(weaponName, ammo)
    local playerPed = PlayerPedId()
    local weaponHash = GetHashKey(weaponName)
    RemoveWeaponFromPed(playerPed, weaponHash)
    if ammo then
        local pedAmmo = GetAmmoInPedWeapon(playerPed, weaponHash)
        local finalAmmo = math.floor(pedAmmo - ammo)
        SetPedAmmo(playerPed, weaponHash, finalAmmo)
    else
        SetPedAmmo(playerPed, weaponHash, 0)
    end
end