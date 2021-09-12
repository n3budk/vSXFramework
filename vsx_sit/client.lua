local sitting, lastPos, currentSitCoords, currentScenario = {}
local disableControls = false
local currentObj = nil

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		if sitting and not IsPedUsingScenario(playerPed, currentScenario) then
			wakeup()
		end
		if IsControlJustPressed(0, 38) and IsControlPressed(0, 21) and IsInputDisabled(0) and IsPedOnFoot(playerPed) then
			if sitting then
				wakeup()
			end
		end
	end
end)

Citizen.CreateThread(function()
	local Sitables = {}
	for k, v in pairs(Config.Interactables) do
		local model = GetHashKey(v)
		table.insert(Sitables, model)
	end
	Wait(100)
	exports["vsx_target"]:AddTargetModel(Sitables, {
        options = {
			{event = "vsx_sit:Sit", icon = "fas fa-chair", label = "Sentar"}
		},
        distance = Config.MaxDistance
    })
end)

RegisterNetEvent("vsx_sit:Sit")
AddEventHandler("vsx_sit:Sit", function()
	local playerPed = PlayerPedId()
	if sitting and not IsPedUsingScenario(playerPed, currentScenario) then
		wakeup()
	end
	if disableControls then
		DisableControlAction(1, 37, true)
	end
	local object, distance = GetNearChair()
	if distance and distance < 1.4 then
		local hash = GetEntityModel(object)
		for k, v in pairs(Config.Sitable) do
			if GetHashKey(k) == hash then
				sit(object, k, v)
				break
			end
		end
	end
end)

function GetNearChair()
	local object, distance
	local coords = GetEntityCoords(GetPlayerPed(-1))
	for i = 1, #Config.Interactables do
		object = GetClosestObjectOfType(coords, 3.0, GetHashKey(Config.Interactables[i]), false, false, false)
		distance = #(coords - GetEntityCoords(object))
		if distance < 1.6 then
			return object, distance
		end
	end
	return nil, nil
end

function wakeup()
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	TaskStartScenarioAtPosition(playerPed, currentScenario, 0.0, 0.0, 0.0, 180.0, 2, true, false)
	while IsPedUsingScenario(GetPlayerPed(-1), currentScenario) do
		Wait(100)
	end
	ClearPedTasks(playerPed)
	FreezeEntityPosition(playerPed, false)
	FreezeEntityPosition(currentObj, false)
	TriggerServerEvent("vsx_sit:leavePlace", currentSitCoords)
	currentSitCoords, currentScenario = nil, nil
	sitting = false
	disableControls = false
end

function sit(object, modelName, data)
	if not HasEntityClearLosToEntity(GetPlayerPed(-1), object, 17) then
		return
	end
	disableControls = true
	currentObj = object
	FreezeEntityPosition(object, true)
	PlaceObjectOnGroundProperly(object)
	local pos = GetEntityCoords(object)
	local playerPos = GetEntityCoords(GetPlayerPed(-1))
	local objectCoords = pos.x .. pos.y .. pos.z
	VSX.TriggerServerCallback("vsx_sit:getPlace", function(occupied)
		if occupied then
			--exports["P7_notify"]:DoHudText("inform", "alguém já está sentado Nesse Lugar")
		else
			local playerPed = PlayerPedId()
			lastPos, currentSitCoords = GetEntityCoords(playerPed), objectCoords
			TriggerServerEvent("vsx_sit:takePlace", objectCoords)
			currentScenario = data.scenario
			TaskStartScenarioAtPosition(playerPed, currentScenario, pos.x, pos.y, pos.z + (playerPos.z - pos.z)/2, GetEntityHeading(object) + 180.0, 0, true, false)
			Citizen.Wait(2500)
			if GetEntitySpeed(GetPlayerPed(-1)) > 0 then
				ClearPedTasks(GetPlayerPed(-1))
				TaskStartScenarioAtPosition(playerPed, currentScenario, pos.x, pos.y, pos.z + (playerPos.z - pos.z)/2, GetEntityHeading(object) + 180.0, 0, true, true)
			end
			sitting = true
		end
	end, objectCoords)
end