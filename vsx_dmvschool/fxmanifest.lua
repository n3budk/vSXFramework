fx_version "adamant"

game "gta5"

shared_script "@vsx_core/imports.lua"

server_scripts {"@vsx/lib/utils.lua", "config.lua", "server/main.lua"}

client_scripts {"lib/Tunnel.lua", "lib/Proxy.lua", "config.lua", "client/main.lua"}

ui_page "html/ui.html"

files {"html/ui.html", "html/logo.png", "html/dmv.png", "html/styles.css", "html/questions.js", "html/scripts.js", "html/debounce.min.js"}

dependencies {"vsx_core", "vsx_license"}