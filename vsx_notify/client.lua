function Alert(title, message, time, type)
	SendNUIMessage({action = "open", title = title, type = type, message = message, time = time})
end

RegisterNetEvent("vsx_notify:Alert")
AddEventHandler("vsx_notify:Alert", function(title, message, time, type)
	Alert(title, message, time, type)
end)

--exports["vsx_notify"]:Alert("SUCCESS", "<span style='color:#c7c7c7'>You have widthdrawn <span style='color:#069a19'><b>100$</b></span>!", 5000, "success")
--exports["vsx_notify"]:Alert("INFORMATION", "<span style='color:#c7c7c7'>Server restart in <span style='color:#fff'>5 minutes</span>!", 5000, "info")
--exports["vsx_notify"]:Alert("ERROR", "<span style='color:#c7c7c7'>You have no <span style='color:#ff0000'>permissions</span>!", 5000, "error")
--exports["vsx_notify"]:Alert("NEW SMS", "<span style='color:#ffc107'>695-2713: </span><span style='color:#c7c7c7'> How are you?", 5000, "warning")
--exports["vsx_notify"]:Alert("TWITTER", "<span style='color:#01a2dc'>@USER69: </span><span style='color:#c7c7c7'> Hello everyone!", 5000, "sms")
--exports["vsx_notify"]:Alert("SAVED", "<span style='color:#c7c7c7'>Clothes saved successfully!", 5000, "long")