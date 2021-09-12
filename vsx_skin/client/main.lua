local lastSkin, cam, isCameraActive
local firstSpawn, zoomOffset, camOffset, heading, skinLoaded = true, 0.0, 0.0, 90.0, false

function OpenMenu(submitCb, cancelCb, restrict)
    local playerPed = PlayerPedId()
    TriggerEvent("vsx_skinchanger:getSkin", function(skin)
        lastSkin = skin
    end)
    TriggerEvent("vsx_skinchanger:getData", function(components, maxVals)
        local elements = {}
        local _components = {}
        if restrict == nil then
            for i = 1, #components, 1 do
                _components[i] = components[i]
            end
        else
            for i = 1, #components, 1 do
                local found = false
                for j = 1, #restrict, 1 do
                    if components[i].name == restrict[j] then
                        found = true
                    end
                end
                if found then
                    table.insert(_components, components[i])
                end
            end
        end
        for i = 1, #_components, 1 do
            local value = _components[i].value
            local componentId = _components[i].componentId
            if componentId == 0 then
                value = GetPedPropIndex(playerPed, _components[i].componentId)
            end
            local data = {
                label = _components[i].label,
                name = _components[i].name,
                value = value,
                min = _components[i].min,
                textureof = _components[i].textureof,
                zoomOffset= _components[i].zoomOffset,
                camOffset = _components[i].camOffset,
                type = "slider"
            }
            for k, v in pairs(maxVals) do
                if k == _components[i].name then
                    data.max = v
                    break
                end
            end
            table.insert(elements, data)
        end
        CreateSkinCam()
        zoomOffset = _components[1].zoomOffset
        camOffset = _components[1].camOffset
        VSX.UI.Menu.Open("default", GetCurrentResourceName(), "skin", {
            title = "Menu de Skin",
            align = "top-left",
            elements = elements
        }, function(data, menu)
            TriggerEvent("vsx_skinchanger:getSkin", function(skin)
                lastSkin = skin
            end)
            submitCb(data, menu)
            DeleteSkinCam()
        end, function(data, menu)
            menu.close()
            DeleteSkinCam()
            TriggerEvent("vsx_skinchanger:loadSkin", lastSkin)
            if cancelCb ~= nil then
                cancelCb(data, menu)
            end
        end, function(data, menu)
            local skin, components, maxVals
            TriggerEvent("vsx_skinchanger:getSkin", function(getSkin)
                skin = getSkin
            end)
            zoomOffset = data.current.zoomOffset
            camOffset = data.current.camOffset
            if skin[data.current.name] ~= data.current.value then
                TriggerEvent("vsx_skinchanger:change", data.current.name, data.current.value)
                TriggerEvent("vsx_skinchanger:getData", function(comp, max)
                    components, maxVals = comp, max
                end)
                local newData = {}
                for i = 1, #elements, 1 do
                    newData = {}
                    newData.max = maxVals[elements[i].name]
                    if elements[i].textureof ~= nil and data.current.name == elements[i].textureof then
                        newData.value = 0
                    end
                    menu.update({name = elements[i].name}, newData)
                end
                menu.refresh()
            end
        end, function(data, menu)
            DeleteSkinCam()
        end)
    end)
end

function CreateSkinCam()
    if not DoesCamExist(cam) then
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    end
    local playerPed = PlayerPedId()
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    isCameraActive = true
    SetCamCoord(cam, GetEntityCoords(playerPed))
    SetCamRot(cam, 0.0, 0.0, 270.0, true)
    SetEntityHeading(playerPed, 0.0)
end

function DeleteSkinCam()
    isCameraActive = false
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 500, true, true)
    cam = nil
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isCameraActive then
            DisableControlAction(2, 30, true)
            DisableControlAction(2, 31, true)
            DisableControlAction(2, 32, true)
            DisableControlAction(2, 33, true)
            DisableControlAction(2, 34, true)
            DisableControlAction(2, 35, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 24, true)
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local angle = heading * math.pi / 180.0
            local theta = {
                x = math.cos(angle),
                y = math.sin(angle)
            }
            local pos = {
                x = coords.x + (zoomOffset * theta.x),
                y = coords.y + (zoomOffset * theta.y)
            }
            local angleToLook = heading - 140.0
            if angleToLook > 360 then
                angleToLook = angleToLook - 360
            elseif angleToLook < 0 then
                angleToLook = angleToLook + 360
            end
            angleToLook = angleToLook * math.pi / 180.0
            local thetaToLook = {
                x = math.cos(angleToLook),
                y = math.sin(angleToLook)
            }
            local posToLook = {
                x = coords.x + (zoomOffset * thetaToLook.x),
                y = coords.y + (zoomOffset * thetaToLook.y)
            }
            SetCamCoord(cam, pos.x, pos.y, coords.z + camOffset)
            PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)
            --ESX.ShowHelpNotification(_U("use_rotate_view"))
        else
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    local angle = 90
    while true do
        Citizen.Wait(0)
        if isCameraActive then
            if IsControlPressed(0, 108) then
                angle = angle - 1
            elseif IsControlPressed(0, 109) then
                angle = angle + 1
            end
            if angle > 360 then
                angle = angle - 360
            elseif angle < 0 then
                angle = angle + 360
            end
            heading = angle + 0.0
        else
            Citizen.Wait(500)
        end
    end
end)

function OpenSaveableMenu(submitCb, cancelCb, restrict)
    TriggerEvent("vsx_skinchanger:getSkin", function(skin)
        lastSkin = skin
    end)
    OpenMenu(function(data, menu)
        menu.close()
        DeleteSkinCam()
        TriggerEvent("vsx_skinchanger:getSkin", function(skin)
            TriggerServerEvent("vsx_skin:save", skin)
            if submitCb ~= nil then
                submitCb(data, menu)
            end
        end)
    end, cancelCb, restrict)
end

AddEventHandler("vsx_skin:resetFirstSpawn", function()
    firstSpawn = true
    skinLoaded = false
end)

AddEventHandler("vsx_skin:playerRegistered", function()
    Citizen.CreateThread(function()
        if firstSpawn then
            VSX.TriggerServerCallback("vsx_skin:getPlayerSkin", function(skin, jobSkin)
                if skin == nil then
                    TriggerEvent("vsx_skinchanger:loadSkin", {sex = 0}, OpenSaveableMenu)
                    Citizen.Wait(100)
                    skinLoaded = true
                else
                    TriggerEvent("vsx_skinchanger:loadSkin", skin)
                    Citizen.Wait(100)
                    skinLoaded = true
                end
            end)
            firstSpawn = false
        end
    end)
end)

AddEventHandler("vsx_skin:getLastSkin", function(cb)
    cb(lastSkin)
end)

AddEventHandler("vsx_skin:setLastSkin", function(skin)
    lastSkin = skin
end)

RegisterNetEvent("vsx_skin:openMenu")
AddEventHandler("vsx_skin:openMenu", function(submitCb, cancelCb)
    OpenMenu(submitCb, cancelCb, nil)
end)

RegisterNetEvent("vsx_skin:openRestrictedMenu")
AddEventHandler("vsx_skin:openRestrictedMenu", function(submitCb, cancelCb, restrict)
    OpenMenu(submitCb, cancelCb, restrict)
end)

RegisterNetEvent("vsx_skin:openSaveableMenu")
AddEventHandler("vsx_skin:openSaveableMenu", function(submitCb, cancelCb)
    OpenSaveableMenu(submitCb, cancelCb, nil)
end)

RegisterNetEvent("vsx_skin:openSaveableRestrictedMenu")
AddEventHandler("vsx_skin:openSaveableRestrictedMenu", function(submitCb, cancelCb, restrict)
    OpenSaveableMenu(submitCb, cancelCb, restrict)
end)

RegisterNetEvent("vsx_skin:requestSaveSkin")
AddEventHandler("vsx_skin:requestSaveSkin", function()
    TriggerEvent("vsx_skinchanger:getSkin", function(skin)
        TriggerServerEvent("vsx_skin:responseSaveSkin", skin)
    end)
end)