TriggerEvent("vsx:vSXreturnCore", function(obj) 
	VSX = obj
end)

local hasAlreadyEnteredMarker, hasPaid, currentActionData = false, false, {}
local lastZone, currentAction

function OpenShopMenu()
	hasPaid = false
	TriggerEvent("vsx_skin:openRestrictedMenu", function(data, menu)
		menu.close()
		VSX.UI.Menu.Open("default", GetCurrentResourceName(), "shop_confirm", {
			title = "Desejas Validar a Compra?",
			align = "top-left",
			elements = {
				{label = "Não", value = "no"},
				{label = "Sim", value = "yes"}
			}
		}, function(data, menu)
			menu.close()
			if data.current.value == "yes" then
				VSX.TriggerServerCallback("vsx_clotheshop:buyClothes", function(bought)
					if bought then
						TriggerEvent("vsx_skinchanger:getSkin", function(skin)
							TriggerServerEvent("vsx_skin:save", skin)
						end)
						hasPaid = true
						VSX.TriggerServerCallback("vsx_clotheshop:checkPropertyDataStore", function(foundStore)
							if foundStore then
								VSX.UI.Menu.Open("default", GetCurrentResourceName(), "save_dressing", {
									title = "Desejas Salvar no Guarda Roupa?",
									align = "top-left",
									elements = {
										{label = "Não",  value = "no"},
										{label = "Sim", value = "yes"}
									}
								}, function(data2, menu2)
									menu2.close()
									if data2.current.value == "yes" then
										VSX.UI.Menu.Open("dialog", GetCurrentResourceName(), "outfit_name", {
											title = "Nome do OutFit"
										}, function(data3, menu3)
											menu3.close()
											TriggerEvent("vsx_skinchanger:getSkin", function(skin)
												TriggerServerEvent("vsx_clotheshop:saveOutfit", data3.value, skin)
												--ESX.ShowNotification(_U("saved_outfit"))
											end)
										end, function(data3, menu3)
											menu3.close()
										end)
									end
								end)
							end
						end)
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
			currentActionData = {}
		end, function(data, menu)
			menu.close()
			currentAction = "shop_menu"
			currentActionData = {}
		end)
	end, function(data, menu)
		menu.close()
		currentAction = "shop_menu"
		currentActionData = {}
	end, {"tshirt_1", "tshirt_2", "torso_1", "torso_2", "decals_1", "decals_2", "arms", "pants_1", "pants_2", "shoes_1", "shoes_2", "bags_1", "bags_2", "chain_1", "chain_2", "helmet_1", "helmet_2", "glasses_1", "glasses_2"})
end

AddEventHandler("vsx_clotheshop:hasEnteredMarker", function(zone)
	currentAction = "shop_menu"
	currentActionData = {}
end)

AddEventHandler("vsx_clotheshop:hasExitedMarker", function(zone)
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
		SetBlipSprite(blip, 73)
		SetBlipColour(blip, 47)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName("Lojas de Roupa")
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, nil, true
		for k, v in pairs(Config.Shops) do
			local distance = #(playerCoords - v)
			if distance < Config.DrawDistance then
				letSleep = false
				if distance < Config.MarkerSize.x then
					isInMarker, currentZone = true, k
				end
			end
		end
		if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
			hasAlreadyEnteredMarker, lastZone = true, currentZone
			TriggerEvent("vsx_clotheshop:hasEnteredMarker", currentZone)
		end
		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent("vsx_clotheshop:hasExitedMarker", lastZone)
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