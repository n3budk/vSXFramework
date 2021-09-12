fx_version "adamant"

game "gta5"

server_scripts {"@vsx/lib/utils.lua", "init.lua", "mysql.net.dll"}

server_exports{"createConnection", "createCommand", "query", "checkTask"}