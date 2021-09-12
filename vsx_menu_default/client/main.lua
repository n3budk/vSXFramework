Citizen.CreateThread(function()
	TriggerEvent("vsx:vSXreturnCore", function(obj)
		VSX = obj
	end)
	local GUI, MenuType = {}, "default"
	GUI.Time = 0
	local openMenu = function(namespace, name, data)
		SendNUIMessage({action = "openMenu", namespace = namespace, name = name, data = data})
	end
	local closeMenu = function(namespace, name)
		SendNUIMessage({action = "closeMenu", namespace = namespace, name = name, data = data})
	end
	VSX.UI.Menu.RegisterType(MenuType, openMenu, closeMenu)
	RegisterNUICallback("menu_submit", function(data, cb)
		local menu = VSX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if menu.submit ~= nil then
			menu.submit(data, menu)
		end
		cb("OK")
	end)
	RegisterNUICallback("menu_cancel", function(data, cb)
		local menu = VSX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		if menu.cancel ~= nil then
			menu.cancel(data, menu)
		end
		cb("OK")
	end)
	RegisterNUICallback("menu_change", function(data, cb)
		local menu = VSX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)
		for i = 1, #data.elements, 1 do
			menu.setElement(i, "value", data.elements[i].value)
			if data.elements[i].selected then
				menu.setElement(i, "selected", true)
			else
				menu.setElement(i, "selected", false)
			end
		end
		if menu.change ~= nil then
			menu.change(data, menu)
		end
		cb("OK")
	end)
	AddEventHandler("onResourceStop", function(resource)
		if resource == GetCurrentResourceName() then
			VSX.UI.Menu.CloseAll()
		end
	end)
end)

RegisterCommand("ENTER1", function(source, args, rawCommand)
	SendNUIMessage({action = "controlPressed", control = "ENTER"})
end)

RegisterCommand("BACKSPACE1", function(source, args, rawCommand)
	SendNUIMessage({action = "controlPressed", control = "BACKSPACE"})
end)

RegisterCommand("TOP1", function(source, args, rawCommand)
	SendNUIMessage({action = "controlPressed", control = "TOP"})
end)

RegisterCommand("DOWN1", function(source, args, rawCommand)
	SendNUIMessage({action = "controlPressed", control = "DOWN"})
end)

RegisterCommand("LEFT1", function(source, args, rawCommand)
	SendNUIMessage({action = "controlPressed", control = "LEFT"})
end)

RegisterCommand("RIGHT1", function(source, args, rawCommand)
	SendNUIMessage({action = "controlPressed", control = "RIGHT"})
end)

RegisterKeyMapping("ENTER1", "(UI) Menu Enter", "keyboard", "RETURN")
RegisterKeyMapping("BACKSPACE1", "(UI) Back", "keyboard", "BACK")
RegisterKeyMapping("TOP1", "(UI) Up", "keyboard", "UP")
RegisterKeyMapping("DOWN1", "(UI) Down", "keyboard", "DOWN")
RegisterKeyMapping("LEFT1", "(UI) Left", "keyboard", "LEFT")
RegisterKeyMapping("RIGHT1", "(UI) Right", "keyboard", "RIGHT")