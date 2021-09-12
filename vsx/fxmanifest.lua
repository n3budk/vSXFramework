fx_version "adamant"

game "gta5"

server_scripts {"lib/utils.lua", "base.lua", "database.lua", "modules/group.lua", "modules/survival.lua", "modules/player_state.lua", "modules/money.lua", "modules/inventory.lua", "modules/identity.lua", "modules/aptitude.lua", "modules/basic_items.lua"}

client_scripts {"lib/utils.lua", "client/Tunnel.lua", "client/Proxy.lua", "client/base.lua", "client/player_state.lua",  "client/survival.lua", "client/identity.lua"}

shared_scripts {"shared/config.lua", "shared/config.weapons.lua", "@vsx_core/imports.lua"}

server_exports {"createConnection", "createCommand", "query", "checkTask"}

files {"cfg/client.lua"}

dependency "vsx_mysql"