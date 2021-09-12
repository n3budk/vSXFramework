fx_version "adamant"

game "gta5"

shared_script "@vsx_core/imports.lua"

server_scripts {"@vsx/lib/utils.lua", "@mysql-async/lib/MySQL.lua", "server/main.lua"}

client_scripts {"client/main.lua"}

ui_page "html/index.html"

files {"html/index.html", "html/script.js", "html/style.css"}