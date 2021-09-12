local pedspawneado = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.ubicacion) do
			local cordenadasped = GetEntityCoords(PlayerPedId())	
			local dist = #(v.Cordenadas - cordenadasped)
			if dist < 11 and pedspawneado == false then
				TriggerEvent("vsx_jobcenter:npcenter", v.Cordenadas, v.h)
				pedspawneado = true
			end
			if dist >= 10  then
				pedspawneado = false
                SetEntityAlpha(tunpc, 1, false)
				DeletePed(tunpc)
			end
		end
	end
end)

RegisterNetEvent("vsx_jobcenter:npcenter")
AddEventHandler("vsx_jobcenter:npcenter",function(coords, heading)
	local hash = GetHashKey(Config.npc)
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end
    pedspawneado = true
	tunpc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(tunpc, true)
    SetBlockingOfNonTemporaryEvents(tunpc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b")
	while not TaskPlayAnim(tunpc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	    Wait(1000)
	end
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end


RegisterNetEvent("vsx_jobcenter:jobs", function()
    TriggerEvent("vsx_context:sendMenu", {
        {
            id = 1,
            header = "Centro de Emprego",
            txt = ""
        },
        {
            id = 2,
            header = "PSP - Recruta",
            txt = "PSP - Recruta",
            params = {
                event = "vsx_jobcenter:jobchoose",
                args = {
                    group = "PSP - Recruta",
                }
            }
        },
        {
            id = 3,
            header = "Unemployed",
            txt = "Unemployed",
            params = {
                event = "vsx_jobcenter:jobchoose",
                args = {
                    group = "Unemployed",
                }
            }
        },
    })
end)

Citizen.CreateThread(function()
    local biker = {`cs_nigel`}
    exports["vsx_target"]:AddTargetModel(biker, {
        options = {
            {event = "vsx_jobcenter:jobs", icon = "fas fa-university", label = "Centro de Emprego"}
        },
        distance = 1.5
    })
end)

RegisterNetEvent("vsx_jobcenter:jobchoose")
AddEventHandler("vsx_jobcenter:jobchoose", function(jobs)
	local group = jobs.group
	TriggerServerEvent("vsx_jobcenter:setjob", group)
    if group == "PSP - Recruta" then
        --exports["mythic_notify"]:SendAlert("inform", "you are hired as a police")
    elseif group == "Unemployed" then
        --exports["mythic_notify"]:SendAlert("inform", "you are hired as a burger")
    else
        --exports["mythic_notify"]:SendAlert("inform", "you are hired my friend!")
    end
end)