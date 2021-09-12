local items = {}

local function play_eat(player)
    local seq = {
        {"mp_player_inteat@burger", "mp_player_int_eat_burger_enter", 1},
        {"mp_player_inteat@burger", "mp_player_int_eat_burger", 1},
        {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", 1},
        {"mp_player_inteat@burger", "mp_player_int_eat_exit_burger", 1}
    }
    vSXclient.playAnim(player, {true, seq, false})
end

local function play_drink(player)
    local seq = {
        {"mp_player_intdrink", "intro_bottle", 1},
        {"mp_player_intdrink", "loop_bottle", 1},
        {"mp_player_intdrink", "outro_bottle", 1}
    }
    vSXclient.playAnim(player, {true, seq, false})
end

local function gen(ftype, vary_hunger, vary_thirst)
    local fgen = function(args)
        local idname = args[1]
        local choices = {}
        local act = "Unknown"
        if ftype == "eat" then
            act = "Eat"
        elseif ftype == "drink" then
            act = "Drink"
        end
        local name = vRP.getItemName(idname)
        choices[act] = {function(player, choice)
            local user_id = vRP.getUserId(player)
            if user_id ~= nil then
                if vRP.tryGetInventoryItem(user_id, idname, 1, false) then
                    if vary_hunger ~= 0 then
                        vRP.varyHunger(user_id, vary_hunger)
                    end
                    if vary_thirst ~= 0 then
                        vRP.varyThirst(user_id,vary_thirst)
                    end
                    if ftype == "drink" then
                        --vRPclient.notify(player,{"~b~ Drinking "..name.."."})
                        play_drink(player)
                    elseif ftype == "eat" then
                        --vRPclient.notify(player,{"~o~ Eating "..name.."."})
                        play_eat(player)
                    end
                end
            end
        end}
        return choices
    end
    return fgen
end

items["water"] = {"Water bottle", "", gen("drink", 0, -25), 0.5}

items["bread"] = {"Bread", "", gen("eat", -10, 0), 0.5}

return items