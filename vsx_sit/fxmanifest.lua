fx_version "adamant"

game "gta5"

shared_script {"@vsx_core/imports.lua", "@vsx/shared/Lang.lua"}

server_scripts {"config.lua", "lists/seat.lua", "server.lua"}

client_scripts {"config.lua", "lists/seat.lua", "client.lua"}

dependencies {"vsx_polyzone", "vsx_target"}
