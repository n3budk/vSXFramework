fx_version "adamant"

game "gta5"

shared_scripts {"config.weapons.lua"}

server_scripts {"@mysql-async/lib/MySQL.lua", "server/common.lua", "server/functions.lua", "server/main.lua", "common/modules/math.lua", "common/modules/table.lua", "common/functions.lua"}

client_scripts {"client/common.lua", "client/entityiter.lua", "client/functions.lua", "client/wrapper.lua", "client/modules/streaming.lua", "common/modules/math.lua", "common/modules/table.lua", "common/functions.lua"}

files {"imports.lua", "html/js/wrapper.js"}

exports {"vSXreturnCore"}

server_exports {"vSXreturnCore"}