Citizen.CreateThread(function()
	TriggerEvent("vsx:vSXreturnCore", function(obj)
		VSX = obj
	end)
	local Timeouts, OpenedMenus, MenuType = {}, {}, 'dialog'
	local openMenu = function(namespace, name, data)
		for i = 1, #Timeouts, 1 do
			VSX.ClearTimeout(Timeouts[i])
		end
		OpenedMenus[namespace .. '_' .. name] = true
		SendNUIMessage({action = 'openMenu', namespace = namespace, name = name, data = data})
		local timeoutId = VSX.SetTimeout(200, function()
			SetNuiFocus(true, true)
		end)
		table.insert(Timeouts, timeoutId)
	end
	local closeMenu = function(namespace, name)
		OpenedMenus[namespace .. '_' .. name] = nil
		SendNUIMessage({action = 'closeMenu', namespace = namespace, name = name, data = data})
		if VSX.Table.SizeOf(OpenedMenus) == 0 then
			SetNuiFocus(false)
		end
	end
	VSX.UI.Menu.RegisterType(MenuType, openMenu, closeMenu)
	AddEventHandler('vsx_menu_dialog:message:menu_submit', function(data)
		local menu = VSX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		local cancel = false
		if menu.submit then
			if tonumber(data.value) then
				data.value = VSX.Math.Round(tonumber(data.value))
				if tonumber(data.value) <= 0 then
					cancel = true
				end
			end
			data.value = VSX.Math.Trim(data.value)
			if cancel then
				--ESX.ShowNotification('That input is not allowed!')
			else
				menu.submit(data, menu)
			end
		end
	end)
	AddEventHandler('vsx_menu_dialog:message:menu_cancel', function(data)
		local menu = VSX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if menu.cancel ~= nil then
			menu.cancel(data, menu)
		end
	end)
	AddEventHandler('vsx_menu_dialog:message:menu_change', function(data)
		local menu = VSX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if menu.change ~= nil then
			menu.change(data, menu)
		end
	end)
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10)
			if VSX.Table.SizeOf(OpenedMenus) > 0 then
				DisableControlAction(0, 1,   true)
				DisableControlAction(0, 2,   true)
				DisableControlAction(0, 142, true)
				DisableControlAction(0, 106, true)
				DisableControlAction(0, 12, true)
				DisableControlAction(0, 14, true)
				DisableControlAction(0, 15, true)
				DisableControlAction(0, 16, true)
				DisableControlAction(0, 17, true)
			else
				Citizen.Wait(500)
			end
		end
	end)
end)