local Proxy = module("vsx", "lib/Proxy")

local vSX = Proxy.getInterface("vSX")

local InService = {}
local MaxInService = {}

function GetInServiceCount(name)
	local count = 0
	for k, v in pairs(InService[name]) do
		if v == true then
			count = count + 1
		end
	end
	return count
end

RegisterServerEvent("vsx_service:activateService")
AddEventHandler("vsx_service:activateService", function(name, max)
	InService[name] = {}
	MaxInService[name] = max
end)

RegisterServerEvent("vsx_service:disableService")
AddEventHandler("vsx_service:disableService", function(name)
	InService[name][source] = nil
end)

VSX.RegisterServerCallback("vsx_service:enableService", function(source, cb, name)
	local inServiceCount = GetInServiceCount(name)
	if inServiceCount >= MaxInService[name] then
		cb(false, MaxInService[name], inServiceCount)
	else
		InService[name][source] = true
		cb(true, MaxInService[name], inServiceCount)
	end
end)

VSX.RegisterServerCallback("vsx_service:isInService", function(source, cb, name)
	local isInService = false
	if InService[name] ~= nil then
		if InService[name][source] then
			isInService = true
		end
	else
		print(('[vsx_service] [^3WARNING^7] A service "%s" is not activated'):format(name))
	end
	cb(isInService)
end)

VSX.RegisterServerCallback("vsx_service:isPlayerInService", function(source, cb, name, target)
	local isPlayerInService = false
	local targetXPlayer = vSX.getUserId({target})
	if InService[name][targetXPlayer] then
		isPlayerInService = true
	end
	cb(isPlayerInService)
end)

VSX.RegisterServerCallback("vsx_service:getInServiceList", function(source, cb, name)
	cb(InService[name])
end)

AddEventHandler("playerDropped", function()
	for k, v in pairs(InService) do
		if v[_source] == true then
			v[_source] = nil
		end
	end
end)