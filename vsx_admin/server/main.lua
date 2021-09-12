local Tunnel = module("vsx", "lib/Tunnel")
local Proxy = module("vsx", "lib/Proxy")

vSX = Proxy.getInterface("vSX")
vSXclient = Tunnel.getInterface("vSX", "vsx_admin")

RegisterCommand("addgroup", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if tonumber(args[1]) and args[2] then
        if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
            local user_id = tonumber(args[1])
            local group = args[2]
            vSX.addUserGroup({user_id, group})
            TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Adicionas-te o Grupo: "..group.." ao ID: "..user_id.."", 5000, "success")
        end
    end
end)

RegisterCommand("removegroup", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if tonumber(args[1]) and args[2] then
        if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
            local user_id = tonumber(args[1])
            local group = args[2]
            vSX.removeUserGroup({user_id, group})
            if vSX.getUserGroupByType({user_id, "job"}) == "" then
                vSX.addUserGroup({user_id, "Unemployed"})
            end
            TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Removes-te o Grupo: "..group.." ao ID: "..user_id.."", 5000, "success")
        end
    end
end)

RegisterCommand("emprego", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if xPlayer ~= nil then
        local emprego = vSX.getUserGroupByType({xPlayer, "job"})
        TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "O Teu Emprego é: "..emprego.."", 5000, "info")
    end
end)

RegisterCommand("addmoney", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if tonumber(args[1]) and tonumber(args[2]) then
        if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
            local user_id = tonumber(args[1])
            local amount = tonumber(args[2])
            vSX.giveMoney({user_id, amount})
            TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Deste Dinheiro no montante de: "..amount.." ao ID: "..user_id.."", 5000, "success")
        end
    end
end)

RegisterCommand("carteira", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if xPlayer ~= nil then
        local carteira = vSX.getBankMoney({xPlayer})
        TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Possuis: €"..carteira.." na Carteira", 5000, "info")
    end
end)

RegisterCommand("addbank", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if tonumber(args[1]) and tonumber(args[2]) then
        if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
            local user_id = tonumber(args[1])
            local amount = tonumber(args[2])
            vSX.giveBankMoney({user_id, amount})
            TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Deste Dinheiro(Banco) no montante de: "..amount.." ao ID: "..user_id.."", 5000, "success")
        end
    end
end)

RegisterCommand("banco", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if xPlayer ~= nil then
        local banco = vSX.getBankMoney({xPlayer})
        TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Possuis: €"..banco.." no Banco", 5000, "info")
    end
end)

RegisterCommand("givedirtymoney", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if tonumber(args[1]) and tonumber(args[2]) then
        if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
            local user_id = tonumber(args[1])
            local amount = tonumber(args[2])
            vSX.giveInventoryItem({user_id, "dirty_money", amount})
            TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Deste-te Dinheiro Sujo no Montante de "..amount.."", 5000, "info")
        end
    end
end)

RegisterCommand("dirtymoney", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if xPlayer ~= nil then
        local dirty_money = vSX.getInventoryItemAmount({xPlayer, "dirty_money"})
        TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Possuis: €"..dirty_money.." Dinheiro Sujo", 5000, "info")
    end
end)

RegisterCommand("additem", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if tonumber(args[1]) and args[2] and tonumber(args[3]) then
        if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
            local user_id = tonumber(args[1])
            local itemname = args[2]
            local amount = tonumber(args[3])
            if vSX.canCarry({user_id, itemname, amount}) then
                vSX.giveInventoryItem({user_id, itemname, amount})
                TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Deste-te "..vSX.getItemName({itemname}).." no Montante de "..amount.."", 5000, "info")
            else
                TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "O Inventário Do ID: "..user_id.." Está Cheio", 5000, "error")
            end
        end
    end
end)

RegisterCommand("clearinv", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if tonumber(args[1]) then
        if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
            local user_id = tonumber(args[1])
            vSX.clearInventory({user_id})
            TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Limpas-te o Inventário do ID: "..user_id.."", 5000, "success")
        end
    end
end)

RegisterCommand("revive", function(source, args)
    local xPlayer = vSX.getUserId({source})
    if tonumber(args[1]) then
        if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
            local user_id = tonumber(args[1])
            vSXclient.varyHealth(user_id, {100}) 
		    SetTimeout(150, function()
			    vSXclient.varyHealth(user_id, {100})
			    vSX.varyHunger({user_id, -100})
			    vSX.varyThirst({user_id, -100})
		    end)
            TriggerClientEvent("vsx_notify:Alert", source, "VSX Framework", "Tu Deste Revive ao ID: "..user_id.."", 5000, "success")
        end
    end
end)

RegisterCommand("noclip", function(source, args, rawCommand)
    local xPlayer = vSX.getUserId({source})
    if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
        TriggerClientEvent("vsx_admin:noclip", source)
    end
end)

RegisterCommand("tpm", function(source, args, rawCommand)
    local xPlayer = vSX.getUserId({source})
    if xPlayer ~= nil and vSX.hasGroup({xPlayer, "superadmin"}) then
        TriggerClientEvent("vsx_admin:tpm", source)
    end
end)