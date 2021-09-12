local cfg = {}

cfg.items = {
    ["benzoilmetilecgonina"] = {"Benzoilmetilecgonina", "Some Benzoic acid ester.", nil, 0.01},
}

local function load_item_pack(name)
    local items = module("cfg/item/"..name)
    if items then
        for k, v in pairs(items) do
            cfg.items[k] = v
        end
    else
        print("[vSX] item pack ["..name.."] not found")
    end
end

load_item_pack("required")
load_item_pack("food")

return cfg