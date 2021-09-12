VSX.Trace = function(msg)
	if Config.EnableDebug then
		print(("[^2TRACE^7] %s^7"):format(msg))
	end
end

VSX.SetTimeout = function(msec, cb)
	local id = VSX.TimeoutCount + 1
	SetTimeout(msec, function()
		if VSX.CancelledTimeouts[id] then
			VSX.CancelledTimeouts[id] = nil
		else
			cb()
		end
	end)
	VSX.TimeoutCount = id
	return id
end

VSX.ClearTimeout = function(id)
	VSX.CancelledTimeouts[id] = true
end

VSX.RegisterServerCallback = function(name, cb)
	VSX.ServerCallbacks[name] = cb
end

VSX.TriggerServerCallback = function(name, requestId, source, cb, ...)
	if VSX.ServerCallbacks[name] then
		VSX.ServerCallbacks[name](source, cb, ...)
	else
		print(('[^3WARNING^7] Server callback ^5"%s"^0 does not exist. ^1Please Check The Server File for Errors!'):format(name))
	end
end