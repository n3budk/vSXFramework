fx_version "adamant"

game "gta5"

shared_script {"@vsx_core/imports.lua", "@vsx/shared/Lang.lua"}

server_scripts {"@vsx/lib/utils.lua", "config.lua", "server/main.lua"}

client_scripts {"config.lua", "client/main.lua"}

dependencies {"vsx_core", "vsx_skin"}
