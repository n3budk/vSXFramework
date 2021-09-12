VSX = {}

VSX.ServerCallbacks = {}
VSX.TimeoutCount = -1
VSX.CancelledTimeouts = {}

AddEventHandler("vsx:vSXreturnCore", function(cb)
	cb(VSX)
end)

function vSXreturnCore()
	return VSX
end

RegisterServerEvent("vsx:triggerServerCallback")
AddEventHandler("vsx:triggerServerCallback", function(name, requestId, ...)
	local playerId = source
	VSX.TriggerServerCallback(name, requestId, playerId, function(...)
		TriggerClientEvent("vsx:serverCallback", playerId, requestId, ...)
	end, ...)
end)