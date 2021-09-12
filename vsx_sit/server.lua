local seatsTaken = {}

RegisterNetEvent("vsx_sit:takePlace")
AddEventHandler("vsx_sit:takePlace", function(objectCoords)
	seatsTaken[objectCoords] = true
end)

RegisterNetEvent("vsx_sit:leavePlace")
AddEventHandler("vsx_sit:leavePlace", function(objectCoords)
	if seatsTaken[objectCoords] then
		seatsTaken[objectCoords] = nil
	end
end)

VSX.RegisterServerCallback("vsx_sit:getPlace", function(source, cb, objectCoords)
	cb(seatsTaken[objectCoords])
end)