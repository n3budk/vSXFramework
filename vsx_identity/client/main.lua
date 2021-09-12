local guiEnabled, hasIdentity, isDead = false, false, false
local myIdentity, myIdentifiers = {}, {}

AddEventHandler("playerSpawned", function(spawn)
	isDead = false
end)

function EnableGui(state)
	SetNuiFocus(state, state)
	guiEnabled = state
	SendNUIMessage({type = "enableui", enable = state})
end

RegisterNetEvent("vsx_identity:showRegisterIdentity")
AddEventHandler("vsx_identity:showRegisterIdentity", function()
	if not isDead then
		EnableGui(true)
	end
end)

RegisterNetEvent("vsx_identity:identityCheck")
AddEventHandler("vsx_identity:identityCheck", function(identityCheck)
	hasIdentity = identityCheck
end)

RegisterNetEvent("vsx_identity:saveID")
AddEventHandler("vsx_identity:saveID", function(data)
	myIdentifiers = data
end)

RegisterNUICallback("escape", function(data, cb)
	if hasIdentity then
		EnableGui(false)
	else
		TriggerEvent("bulletin:send", _U("create_a_character"))
	end
end)

RegisterNUICallback("register", function(data, cb)
	local reason = ""
	myIdentity = data
	for theData, value in pairs(myIdentity) do
		if theData == "firstname" or theData == "lastname" then
			reason = verifyName(value)
			if reason ~= "" then
				break
			end
		elseif theData == "dateofbirth" then
			if value == "invalid" then
				reason = "Invalid date of birth!"
				break
			end
		elseif theData == "height" then
			local height = tonumber(value)
			if height then
				if height > 200 or height < 140 then
					reason = "Unacceptable player height!"
					break
				end
			else
				reason = "Unacceptable player height!"
				break
			end
		end
	end
	if reason == "" then
		TriggerServerEvent("vsx_identity:setIdentity", data, myIdentifiers)
		EnableGui(false)
		Citizen.Wait(500)
		TriggerEvent("vsx_skin:openSaveableMenu", myIdentifiers.id)
	else
		TriggerEvent("bulletin:send", reason)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if guiEnabled then
			DisableControlAction(0, 1, true)
			DisableControlAction(0, 2, true)
			DisableControlAction(0, 106, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 30, true)
			DisableControlAction(0, 31, true)
			DisableControlAction(0, 21, true)
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 47, true)
			DisableControlAction(0, 58, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 143, true)
			DisableControlAction(0, 75, true)
			DisableControlAction(27, 75, true)
		else
			Citizen.Wait(500)
		end
	end
end)

function verifyName(name)
	local nameLength = string.len(name)
	if nameLength > 25 or nameLength < 2 then
		return "Your player name is either too short or too long."
	end
	local count = 0
	for i in name:gmatch("[abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789 -]") do
		count = count + 1
	end
	if count ~= nameLength then
		return "Your player name contains special characters that are not allowed on this server."
	end
	local spacesInName    = 0
	local spacesWithUpper = 0
	for word in string.gmatch(name, "%S+") do
		if string.match(word, "%u") then
			spacesWithUpper = spacesWithUpper + 1
		end
		spacesInName = spacesInName + 1
	end
	if spacesInName > 2 then
		return "Your name contains more than two spaces"
	end
	if spacesWithUpper ~= spacesInName then
		return "your name must start with a capital letter."
	end
	return ""
end