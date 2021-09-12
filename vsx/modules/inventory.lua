local cfg = module("cfg/inventory")

vSX.items = {}

function vSX.canCarry(user_id, item, count)
    local weight_atual = vSX.getInventoryWeight(user_id)
    local weight_max = vSX.getInventoryMaxWeight(user_id)
    local weight_item = vSX.getItemWeight(item)
    if ((weight_item * count) + weight_atual) <= weight_max then
        return true
    else
        return false
    end
end

function vSX.getItems()
    return vSX.items
end

function vSX.defInventoryItem(idname, name, description, choices, weight)
    if weight == nil then
        weight = 0
    end
    local item = {name = name, description = description, choices = choices, weight = weight}
    vSX.items[idname] = item
end

function vSX.computeItemName(item, args)
    if type(item.name) == "string" then
        return item.name
    else
        return item.name(args)
    end
end
  
function vSX.computeItemDescription(item, args)
    if type(item.description) == "string" then
        return item.description
    else
        return item.description(args)
    end
end
  
function vSX.computeItemChoices(item, args)
    if item.choices ~= nil then
        return item.choices(args)
    else
        return {}
    end
end
  
function vSX.computeItemWeight(item, args)
    if type(item.weight) == "number" then
        return item.weight
    else
        return item.weight(args)
    end
end
  
  
function vSX.parseItem(idname)
    return splitString(idname, "|")
end

function vSX.getItemDefinition(idname)
    local args = vSX.parseItem(idname)
    local item = vSX.items[args[1]]
    if item ~= nil then
        return vSX.computeItemName(item, args), vSX.computeItemDescription(item, args), vSX.computeItemWeight(item, args)
    end
    return nil, nil, nil
end
  
function vSX.getItemName(idname)
    local args = vSX.parseItem(idname)
    local item = vSX.items[args[1]]
    if item ~= nil then
        return vSX.computeItemName(item, args)
    end
    return args[1]
end
  
function vSX.getItemDescription(idname)
    local args = vSX.parseItem(idname)
    local item = vSX.items[args[1]]
    if item ~= nil then
        return vSX.computeItemDescription(item, args)
    end
    return ""
end
  
function vSX.getItemWeight(idname)
    local args = vSX.parseItem(idname)
    local item = vSX.items[args[1]]
    if item ~= nil then
        return vSX.computeItemWeight(item, args)
    end
    return 0
end
  
function vSX.computeItemsWeight(items)
    local weight = 0
    for k, v in pairs(items) do
        local iweight = vSX.getItemWeight(k)
        weight = weight+iweight*v.amount
    end
    return weight
end

function vSX.giveInventoryItem(user_id, idname, amount)
    local data = vSX.getUserDataTable(user_id)
    if data and amount > 0 then
        local entry = data.inventory[idname]
        if entry then
            entry.amount = entry.amount+amount
        else
            data.inventory[idname] = {amount=amount}
        end
    end
end

function vSX.tryGetInventoryItem(user_id, idname, amount)
    local data = vSX.getUserDataTable(user_id)
    if data and amount > 0 then
        local entry = data.inventory[idname]
        if entry and entry.amount >= amount then
            entry.amount = entry.amount-amount
            if entry.amount <= 0 then
                data.inventory[idname] = nil
            end
        end
    end
    return false
end

function vSX.getInventoryItemAmount(user_id, idname)
    local data = vSX.getUserDataTable(user_id)
    if data and data.inventory then
        local entry = data.inventory[idname]
        if entry then
            return entry.amount
        end
    end
    return 0
end

function vSX.getInventoryWeight(user_id)
    local data = vSX.getUserDataTable(user_id)
    if data and data.inventory then
        return vSX.computeItemsWeight(data.inventory)
    end
    return 0
end

function vSX.getInventoryMaxWeight(user_id)
    return math.floor(vSX.expToLevel(vSX.getExp(user_id, "physical", "strength")))*cfg.inventory_weight_per_strength
end

function vSX.clearInventory(user_id)
    local data = vSX.getUserDataTable(user_id)
    if data then
        data.inventory = {}
    end
end
  
AddEventHandler("vSX:playerJoin", function(user_id, source, name, last_login)
    local data = vSX.getUserDataTable(user_id)
    if data.inventory == nil then
        data.inventory = {}
    end
end)