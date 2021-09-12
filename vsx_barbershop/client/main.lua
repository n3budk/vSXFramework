local hasAlreadyEnteredMarker, lastZone, currentAction, hasPaid

function OpenShopMenu()
	hasPaid = false
	TriggerEvent("vsx_skin:openRestrictedMenu", function(data, menu)
		menu.close()
		VSX.UI.Menu.Open("default", GetCurrentResourceName(), "shop_confirm", {
			title = "Desejas Validar Esta Compra?",
			align = "top-left",
			elements = {
				{label = "Não",  value = "no"},
				{label = "Sim", value = "yes"}
			}
		}, function(data, menu)
			menu.close()
			if data.current.value == "yes" then
				VSX.TriggerServerCallback("vsx_barbershop:checkMoney", function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerEvent("vsx_skinchanger:getSkin", function(skin)
							TriggerServerEvent("vsx_skin:save", skin)
						end)
						TriggerServerEvent("vsx_barbershop:pay")
						hasPaid = true
					else
						VSX.TriggerServerCallback("vsx_skin:getPlayerSkin", function(skin)
							TriggerEvent("vsx_skinchanger:loadSkin", skin) 
						end)
						--ESX.ShowNotification(_U("not_enough_money"))
					end
				end)
			elseif data.current.value == "no" then
				VSX.TriggerServerCallback("vsx_skin:getPlayerSkin", function(skin)
					TriggerEvent("vsx_skinchanger:loadSkin", skin) 
				end)
			end
			currentAction = "shop_menu"
		end, function(data, menu)
			menu.close()
			currentAction = "shop_menu"
		end)
	end, function(data, menu)
		menu.close()
		currentAction = "shop_menu"
	end, {"beard_1","beard_2","beard_3","beard_4","hair_1","hair_2","hair_color_1","hair_color_2","eyebrows_1","eyebrows_2","eyebrows_3","eyebrows_4","makeup_1","makeup_2","makeup_3","makeup_4","lipstick_1","lipstick_2","lipstick_3","lipstick_4","ears_1","ears_2"})
end

AddEventHandler("vsx_barbershop:hasEnteredMarker", function(zone)
	currentAction = "shop_menu"
end)

AddEventHandler("vsx_barbershop:hasExitedMarker", function(zone)
	VSX.UI.Menu.CloseAll()
	currentAction = nil
	if not hasPaid then
		VSX.TriggerServerCallback("vsx_skin:getPlayerSkin", function(skin)
			TriggerEvent("vsx_skinchanger:loadSkin", skin)
		end)
	end
end)

Citizen.CreateThread(function()
	for k, v in ipairs(Config.Shops) do
		local blip = AddBlipForCoord(v)
		SetBlipSprite(blip, 71)
		SetBlipColour(blip, 51)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName("Barbeiro")
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), nil, nil, true
		for k, v in ipairs(Config.Shops) do
			local distance = #(playerCoords - v)
			if distance < Config.DrawDistance then
				letSleep = false
				if distance < 1.5 then
					isInMarker, currentZone = true, k
				end
			end
		end
		if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
			hasAlreadyEnteredMarker, lastZone = true, currentZone
			TriggerEvent("vsx_barbershop:hasEnteredMarker", currentZone)
		end
		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent("vsx_barbershop:hasExitedMarker", lastZone)
		end
		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if currentAction then
			if IsControlJustReleased(0, 38) then
				if currentAction == "shop_menu" then
					OpenShopMenu()
				end
				currentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)