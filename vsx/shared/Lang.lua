Config = {}

function Lang(item)
    local lang = Config.Languages[Config.Language]
    if lang and lang[item] then
        return lang[item]
    end
    return item
end

Config.Language = "pt"

Config.Languages = {
    ["pt"] = {
        ["SERVER_NAME_NOTIFY"] = "VSX Framework",
        ["SERVER_NOTIFY"] = "Bem Vindo",
        ["BANNED"] = "[vSX Framework] BANIDO!!\nRazão: ",
        ["MISSING_IDENTIFIERS"] = "[vSX] Missing identifiers.",
        ["IDENTIFIER_ERROR"] = "[vSX] Identification error.",
        ["TELEPORTED"] = "Tu Foste Teleportado",
        ["NO_TELEPORTED"] = "Nenhuma Marcação no Mapa"
    },
    ["en"] = {
        ["SERVER_NAME_NOTIFY"] = "VSX Framework",
        ["SERVER_NOTIFY"] = "Welcome",
        ["BANNED"] = "[vSX Framework] BANNED!!\nReason: ",
        ["MISSING_IDENTIFIERS"] = "[vSX] Missing identifiers.",
        ["IDENTIFIER_ERROR"] = "[vSX] Identification error.",
        ["TELEPORTED"] = "You were Teleported",
        ["NO_TELEPORTED"] = "No Waypoint Set"
    }
}