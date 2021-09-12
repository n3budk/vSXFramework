
fx_version "adamant"

game "gta5"

client_scripts {"config.lua", "client/main.lua"}

server_scripts {"@vsx/lib/utils.lua", "config.lua", "@mysql-async/lib/MySQL.lua", "server/main.lua"}

shared_script "@vsx_core/imports.lua"

ui_page "html/form.html"

files {"html/form.html", "html/css.css", "html/logo.png", "html/script.js", "html/jquery-3.4.1.min.js"}