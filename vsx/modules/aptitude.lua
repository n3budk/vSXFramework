local cfg = module("cfg/aptitudes")

local exp_step = 5

local gaptitudes = {}

function vSX.defAptitudeGroup(group, title)
    gaptitudes[group] = {_title = title}
end
  
function vSX.defAptitude(group, aptitude, title, init_exp, max_exp)
    local vgroup = gaptitudes[group]
    if vgroup ~= nil then
        vgroup[aptitude] = {title, init_exp, max_exp}
    end
end
  
function vSX.getAptitudeDefinition(group, aptitude)
    local vgroup = gaptitudes[group]
    if vgroup ~= nil and aptitude ~= "_title" then
        return vgroup[aptitude]
    else
        return nil
    end
end
  
function vSX.getAptitudeGroupTitle(group)
    if gaptitudes[group] ~= nil then
        return gaptitudes[group]._title
    else
        return ""
    end
end

function vSX.getUserAptitudes(user_id)
    local data = vSX.getUserDataTable(user_id)
    if data ~= nil then
        if data.gaptitudes == nil then
            data.gaptitudes = {}
        end
        for k, v in pairs(gaptitudes) do
            if data.gaptitudes[k] == nil then
                data.gaptitudes[k] = {}
            end
            local group = data.gaptitudes[k]
            for l, w in pairs(v) do
                if l ~= "_title" and group[l] == nil then
                    group[l] = w[2]
                end
            end
        end
        return data.gaptitudes
    else
        return nil
    end
end

function vSX.varyExp(user_id, group, aptitude, amount)
    local def = vSX.getAptitudeDefinition(group, aptitude)
    local uaptitudes = vSX.getUserAptitudes(user_id)
    if def ~= nil and uaptitudes ~= nil then
        local exp = uaptitudes[group][aptitude]
        local level = math.floor(vSX.expToLevel(exp))
        exp = exp+amount
        if exp < 0 then
            exp = 0 
        elseif def[3] >= 0 and exp > def[3] then
            exp = def[3]
        end
        uaptitudes[group][aptitude] = exp
        local player = vSX.getUserSource(user_id)
        if player ~= nil then
            local group_title = vSX.getAptitudeGroupTitle(group)
            local aptitude_title = def[1]
            if amount < 0 then
                --vSXclient.notify(player,{lang.aptitude.lose_exp({group_title,aptitude_title,-1*amount})})
            elseif amount > 0 then
                --vSXclient.notify(player,{lang.aptitude.earn_exp({group_title,aptitude_title,amount})})
            end
            local new_level = math.floor(vSX.expToLevel(exp))
            local diff = new_level-level
            if diff < 0 then
                --vSXclient.notify(player,{lang.aptitude.level_down({group_title,aptitude_title,new_level})})
            elseif diff > 0 then
                --vSXclient.notify(player,{lang.aptitude.level_up({group_title,aptitude_title,new_level})})
            end
        end
    end
end

function vSX.levelUp(user_id, group, aptitude)
    local exp = vSX.getExp(user_id,group,aptitude)
    local next_level = math.floor(vSX.expToLevel(exp))+1
    local next_exp = vSX.levelToExp(next_level)
    local add_exp = next_exp-exp
    vSX.varyExp(user_id, group, aptitude, add_exp)
end
  
function vSX.levelDown(user_id, group, aptitude)
    local exp = vSX.getExp(user_id,group,aptitude)
    local prev_level = math.floor(vSX.expToLevel(exp))-1
    local prev_exp = vSX.levelToExp(prev_level)
    local add_exp = prev_exp-exp
    vSX.varyExp(user_id, group, aptitude, add_exp)
end

function vSX.getExp(user_id, group, aptitude)
    local uaptitudes = vSX.getUserAptitudes(user_id)
    if uaptitudes ~= nil then
        local vgroup = uaptitudes[group]
        if vgroup ~= nil then
            return vgroup[aptitude] or 0
        end
    end
    return 0
end

function vSX.setExp(user_id, group, aptitude, amount)
    local exp = vSX.getExp(user_id, group, aptitude)
    vSX.varyExp(user_id, group, aptitude, amount-exp)
end
  
function vSX.expToLevel(exp)
    return (math.sqrt(1+8*exp/exp_step)-1)/2
end
  
function vSX.levelToExp(lvl)
    return math.floor((exp_step*lvl*(lvl+1))/2)
end
  
for k, v in pairs(cfg.gaptitudes) do
    vSX.defAptitudeGroup(k, v._title or "")
    for l, w in pairs(v) do
        if l ~= "_title" then
            vSX.defAptitude(k, l, w[1], w[2], w[3])
        end
    end
end