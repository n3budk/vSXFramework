local Proxy = module("vsx", "lib/Proxy")

local vSX = Proxy.getInterface("vSX")

RegisterServerEvent("vsx_barbershop:pay")
AddEventHandler("vsx_barbershop:pay", function()
	local _source = source
	local xPlayer = vSX.getUserId({_source})
	vSX.tryPayment({xPlayer, Config.Price})
	--TriggerClientEvent("esx:showNotification", source, _U("you_paid", ESX.Math.GroupDigits(Config.Price)))
end)

VSX.RegisterServerCallback("vsx_barbershop:checkMoney", function(source, cb)
	local xPlayer = vSX.getUserId({source})
	cb(vSX.getMoney({xPlayer}) >= Config.Price)
end)