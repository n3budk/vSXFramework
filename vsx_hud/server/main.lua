local Proxy = module("vsx", "lib/Proxy")

local vSX = Proxy.getInterface("vSX")

TriggerEvent("vsx:vSXreturnCore", function(obj)
    VSX = obj 
end)

VSX.RegisterServerCallback("vsx_hud:getInfo", function(source, cb)
	local xPlayer = vSX.getUserId({source})
	cb(vSX.getUserGroupByType({xPlayer, "job"}), vSX.getMoney({xPlayer}), vSX.getBankMoney({xPlayer}), vSX.getInventoryItemAmount({xPlayer, "dirty_money"}))
end)

RegisterCommand("addmoney", function(source, args)
	local user_id = vSX.getUserId({source})
	vSX.giveMoney({user_id, args[1]})
end)