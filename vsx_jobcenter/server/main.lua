local Proxy = module("vsx", "lib/Proxy")
local vSX = Proxy.getInterface("vSX")

RegisterServerEvent("vsx_jobcenter:setjob")
AddEventHandler("vsx_jobcenter:setjob", function(group)
    local _source = source
	local xPlayer  = vSX.getUserId({source})
    if xPlayer then
        vSX.addUserGroup({xPlayer, group})
    end
end)