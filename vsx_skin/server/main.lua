local Proxy = module("vsx", "lib/Proxy")

local vSX = Proxy.getInterface("vSX")

RegisterServerEvent("vsx_skin:save")
AddEventHandler("vsx_skin:save", function(skin)
	local user_id = vSX.getUserId({source})
	local defaultMaxWeight = vSX.getInventoryMaxWeight({user_id})
	local backpackModifier = Config.BackpackWeight[skin.bags_1]
	if backpackModifier then
        vSX.varyExp({user_id, "physical", "strength", tonumber(defaultMaxWeight + backpackModifier)})
	end
	MySQL.Async.execute("UPDATE vsx_user_identities SET skin = @skin WHERE user_id = @identifier", {["@skin"] = json.encode(skin), ["@identifier"] = user_id})
end)

VSX.RegisterServerCallback("vsx_skin:getPlayerSkin", function(source, cb)
	local user_id = vSX.getUserId({source})
	MySQL.Async.fetchAll("SELECT skin FROM vsx_user_identities WHERE user_id = @identifier", {
		["@identifier"] = user_id
	}, function(users)
		local user, skin = users[1]
		if user.skin then
			skin = json.decode(user.skin)
		end
		cb(skin)
	end)
end)

RegisterCommand("skin", function(source)
	TriggerClientEvent("vsx_skin:openSaveableMenu", source)
end)

AddEventHandler("vSX:playerSpawn", function(user_id, source, first_spawn)
	MySQL.Async.fetchAll("SELECT skin FROM vsx_user_identities WHERE user_id = @identifier", {
		["@identifier"] = user_id
	}, function(users)
		local skin = json.decode(users[1].skin)
		Citizen.Wait(1000)
		TriggerClientEvent("vsx_skinchanger:loadSkin", source, skin)
	end)
end)