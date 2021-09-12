local cfg = module("cfg/identity")

function vSX.getUserIdentity(user_id, cbr)
    local task = Task(cbr)
    MySQL.query("vSX/get_user_identity", {user_id = user_id}, function(rows, affected)
        task({rows[1]})
    end)
end

function vSX.getUserByPhone(phone, cbr)
    local task = Task(cbr)
    MySQL.query("vSX/get_userbyphone", {phone = phone or ""}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].user_id})
        else
            task()
        end
    end)
end

function vSX.generateStringNumber(format)
    local abyte = string.byte("A")
    local zbyte = string.byte("0")
    local number = ""
    for i = 1, #format do
        local char = string.sub(format, i,i)
        if char == "D" then
            number = number..string.char(zbyte+math.random(0, 9))
        elseif char == "L" then
            number = number..string.char(abyte+math.random(0, 25))
        else
            number = number..char
        end
    end
    return number
end

function vSX.generatePhoneNumber(cbr)
    local task = Task(cbr)
    local function search()
        local phone = vSX.generateStringNumber(cfg.phone_format)
        vSX.getUserByPhone(phone, function(user_id)
            if user_id ~= nil then
                search()
            else
                task({phone})
            end
        end)
    end  
    search()
end

AddEventHandler("vSX:playerJoin", function(user_id, source, name, last_login)
    vSX.getUserIdentity(user_id, function(identity)
        if identity == nil then
            vSX.generatePhoneNumber(function(phone)
                MySQL.query("vSX/init_user_identity", {user_id = user_id, phone = phone})
            end)
        end
    end)
end)