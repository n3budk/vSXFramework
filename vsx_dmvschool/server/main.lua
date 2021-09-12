local Proxy = module("vsx", "lib/Proxy")

vSX = Proxy.getInterface("vSX")

VSX.RegisterServerCallback("vsx_dmvschool:canYouPay", function(source, cb, type)
	local xPlayer = vSX.getUserId({source})
	if vSX.getMoney({xPlayer}) >= Config.Prices[type] then
		vSX.tryPayment({xPlayer, Config.Prices[type]})
		--print("Tu Pagas-te "..Config.Prices[type].." "..source.."")
		cb(true)
	else
		cb(false)
	end
end)

RegisterNetEvent("vsx_dmvschool:addLicense")
AddEventHandler("vsx_dmvschool:addLicense", function(type)
	local _source = source
	TriggerEvent("vsx_license:addLicense", _source, type, function()
		TriggerEvent("vsx_license:getLicenses", _source, function(licenses)
			TriggerClientEvent("vsx_dmvschool:loadLicenses", _source, licenses)
		end)
	end)
end)