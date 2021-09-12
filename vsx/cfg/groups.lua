local cfg = {}

cfg.groups = {
    ["superadmin"] = {
        "permission.permission",
    },
    ["vSX User"] = {
        "permission.permission",
    },
    ["Unemployed"] = {
        _config = {gtype = "job"},
        "permission.permission",
    },
    ["PSP - Recruta"] = {
        _config = {gtype = "job"},
        "police.pc",
    },
    ["PSP - DIRETOR NACIONAL"] = {
        _config = {gtype = "job"},
        "police.pc",
    },
}

cfg.users = {
    [1] = {"superadmin"}
}

return cfg