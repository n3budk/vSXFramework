local loaded = false

Citizen.CreateThread(function()
    TriggerEvent("vsx:vSXreturnCore", function(obj)
        VSX = obj 
    end)
    loaded = true
    Citizen.Wait(1000)
    SendNUIMessage({type = "toggle", value = true})
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if loaded and not IsPauseMenuActive() then
            VSX.TriggerServerCallback("vsx_hud:getInfo", function(job, money, bank, dirty_money)
                SendNUIMessage({type = "update", money = ("€" .. money) or "0", bank = ("€" .. bank) or "0", job = string.upper(job) or "", dirty_money = ("€" .. dirty_money) or "0"})
            end)
        else
            SendNUIMessage({type = "toggle", value = false})
        end
    end
end)