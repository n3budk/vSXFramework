local Proxy = module("vsx", "lib/Proxy")

local vSX = Proxy.getInterface("vSX")

function getIdentity(source, callback)
	local user_id = vSX.getUserId({source})
	MySQL.Async.fetchAll("SELECT user_id, firstname, lastname, dateofbirth, sex, height FROM `vsx_user_identities` WHERE `user_id` = @identifier", {
		["@identifier"] = user_id
	}, function(result)
		if result[1].firstname ~= nil then
			local data = {identifier = result[1].user_id, firstname = result[1].firstname, lastname = result[1].lastname, dateofbirth	= result[1].dateofbirth, sex = result[1].sex, height = result[1].height}
			callback(data)
		else
			local data = {identifier = "", firstname = "", lastname = "", dateofbirth	= "", sex = "", height = ""}
			callback(data)
		end
	end)
end

function setIdentity(identifier, data, callback)
	MySQL.Async.execute("UPDATE `vsx_user_identities` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE user_id = @identifier", {
		["@identifier"] = identifier,
		["@firstname"] = data.firstname,
		["@lastname"] = data.lastname,
		["@dateofbirth"] = data.dateofbirth,
		["@sex"] = data.sex,
		["@height"] = data.height
	}, function(rowsChanged)
		if callback then
			callback(true)
		end
	end)
end

function updateIdentity(playerId, data, callback)
	local user_id = vSX.getUserId({playerId})
	MySQL.Async.execute("UPDATE `vsx_user_identities` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE user_id = @identifier", {
		["@identifier"] = user_id,
		["@firstname"] = data.firstname,
		["@lastname"] = data.lastname,
		["@dateofbirth"] = data.dateofbirth,
		["@sex"] = data.sex,
		["@height"]	= data.height
	}, function(rowsChanged)
		if callback then
			TriggerEvent("vsx_identity:characterUpdated", playerId, data)
			callback(true)
		end
	end)
end

function deleteIdentity(source)
	local user_id = vSX.getUserId({source})
	MySQL.Async.execute("UPDATE `vsx_user_identities` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE user_id = @identifier", {
		["@identifier"] = user_id,
		["@firstname"] = "",
		["@lastname"] = "",
		["@dateofbirth"] = "",
		["@sex"] = "",
		["@height"] = "",
	})
end

RegisterServerEvent("vsx_identity:setIdentity")
AddEventHandler("vsx_identity:setIdentity", function(data, myIdentifiers)
	setIdentity(myIdentifiers.steamid, data, function(callback)
		if callback then
			TriggerClientEvent("vsx_identity:identityCheck", myIdentifiers.playerid, true)
			TriggerEvent("vsx_identity:characterUpdated", myIdentifiers.playerid, data)
		else
			TriggerEvent("bulletin:send", source, _U("failed_identity"), 5000, "bottomleft", false, "error")
		end
	end)
end)

AddEventHandler("vSX:playerSpawn", function(user_id, source, first_spawn)
	local myID = {steamid = user_id, playerid = source}
	TriggerClientEvent("vsx_identity:saveID", source, myID)
	getIdentity(source, function(data)
		if data.firstname == "" then
			TriggerClientEvent("vsx_identity:identityCheck", source, false)
			TriggerClientEvent("vsx_identity:showRegisterIdentity", source)
		else
			TriggerClientEvent("vsx_identity:identityCheck", source, true)
			TriggerEvent("vsx_identity:characterUpdated", source, data)
		end
	end)
end)

AddEventHandler("vsx_identity:characterUpdated", function(playerId, data)
	local user_id = vSX.getUserId({playerId})
	if user_id then
		MySQL.Async.execute("UPDATE `vsx_user_identities` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE user_id = @identifier", {
			["@identifier"] = user_id,
			["@firstname"] = data.firstname,
			["@lastname"] = data.lastname,
			["@dateofbirth"] = data.dateofbirth,
			["@sex"] = data.sex,
			["@height"]	= data.height
		}, function(rowsChanged)
		end)
	end
end)

AddEventHandler("onResourceStart", function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(3000)
		for user_id, player in pairs(vSX.getUsers({})) do
			if user_id then
				local myID = {steamid  = user_id, playerid = player}
				TriggerClientEvent("vsx_identity:saveID", player, myID)
				getIdentity(player, function(data)
					if data.firstname == "" then
						TriggerClientEvent("vsx_identity:identityCheck", player, false)
						TriggerClientEvent("vsx_identity:showRegisterIdentity", player)
					else
						TriggerClientEvent("vsx_identity:identityCheck", player, true)
						TriggerEvent("vsx_identity:characterUpdated", player, data)
					end
				end)
			end
		end
	end
end)

RegisterCommand("register", function(source)
	getIdentity(source, function(data)
		if data.firstname ~= "" then
			TriggerEvent("bulletin:send", source, _U("already_registered"), 5000, "bottomleft", false, "error")
		else
			TriggerClientEvent("vsx_identity:showRegisterIdentity", source)
		end
	end)
end, false)

RegisterCommand("char", function(source)
	getIdentity(source, function(data)
		if data.firstname == "" then
			TriggerEvent("bulletin:send", source, _U("not_registered"), 5000, "bottomleft", false, "error")
		else
			TriggerEvent("bulletin:send", source, _U("active_character", data.firstname, data.lastname), 5000, "bottomleft", false, "default")
		end
	end)
end, false)

RegisterCommand("chardel", function(source)
	getIdentity(source, function(data)
		if data.firstname == "" then
			TriggerEvent("bulletin:send", source, _U("not_registered"), 5000, "bottomleft", false, "error")
		else
			deleteIdentity(source)
			TriggerEvent("bulletin:send", source, _U("deleted_character"), 5000, "bottomleft", false, "info")
			TriggerClientEvent("vsx_identity:showRegisterIdentity", source)
		end
	end)
end, false)