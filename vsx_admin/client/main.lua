local noclip = false

RegisterNetEvent("vsx_admin:noclip")
AddEventHandler("vsx_admin:noclip", function(input)
    local player = PlayerId()
	local ped = PlayerPedId
    local msg = "disabled"
	if (noclip == false) then
		noclip_pos = GetEntityCoords(PlayerPedId(), false)
	end
	noclip = not noclip
	if (noclip) then
		msg = "enabled"
	end
end)
	
local heading = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if (noclip) then
			SetEntityCoordsNoOffset(PlayerPedId(), noclip_pos.x, noclip_pos.y, noclip_pos.z, 0, 0, 0)
			if (IsControlPressed(1, 34)) then
				heading = heading + 1.5
				if (heading > 360) then
					heading = 0
				end
				SetEntityHeading(PlayerPedId(), heading)
			end
			if (IsControlPressed(1, 9)) then
				heading = heading - 1.5
				if (heading < 0) then
					heading = 360
				end
				SetEntityHeading(PlayerPedId(), heading)
			end
			if (IsControlPressed(1, 8)) then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
			end
			if (IsControlPressed(1, 32)) then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.0, 0.0)
			end
			if (IsControlPressed(1, 27)) then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 1.0)
			end
			if (IsControlPressed(1, 173)) then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, -1.0)
			end
		else
			Citizen.Wait(200)
		end
	end
end)

RegisterNetEvent("vsx_admin:tpm")
AddEventHandler("vsx_admin:tpm", function()
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                break
            end
            Citizen.Wait(5)
        end
    end
end)