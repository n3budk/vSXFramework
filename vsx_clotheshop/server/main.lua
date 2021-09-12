local Proxy = module("vsx", "lib/Proxy")

local vSX = Proxy.getInterface("vSX")

TriggerEvent("vsx:vSXreturnCore", function(obj) 
	VSX = obj
end)

RegisterServerEvent("vsx_clotheshop:saveOutfit")
AddEventHandler("vsx_clotheshop:saveOutfit", function(label, skin)
	local xPlayer = vSX.getUserId({source})
	TriggerEvent("vsx_datastore:getDataStore", "vsx_clothes", xPlayer, function(store)
		local dressing = store.get("dressing")
		if dressing == nil then
			dressing = {}
		end
		table.insert(dressing, {label = label, skin = skin})
		store.set("dressing", dressing)
		store.save()
	end)
end)

VSX.RegisterServerCallback("vsx_clotheshop:buyClothes", function(source, cb)
	local xPlayer = vSX.getUserId({source})
	if vSX.getMoney({xPlayer}) >= Config.Price then
		vSX.tryPayment({xPlayer, Config.Price})
		--TriggerClientEvent("esx:showNotification", source, _U("you_paid", Config.Price))
		cb(true)
	else
		cb(false)
	end
end)

VSX.RegisterServerCallback("vsx_clotheshop:checkPropertyDataStore", function(source, cb)
	local xPlayer = vSX.getUserId({source})
	local foundStore = false
	TriggerEvent("vsx_datastore:getDataStore", "vsx_clothes", xPlayer, function(store)
		foundStore = true
	end)
	cb(foundStore)
end)