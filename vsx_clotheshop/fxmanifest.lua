fx_version "adamant"

game "gta5"

shared_script "@vsx_core/imports.lua"

server_scripts {"@vsx/lib/utils.lua", "@mysql-async/lib/MySQL.lua", "config.lua", "server/main.lua"}

client_scripts {"config.lua", "client/main.lua"}

dependencies {"vsx_core", "vsx_skin"}