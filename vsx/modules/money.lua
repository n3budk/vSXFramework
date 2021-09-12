local cfg = module("cfg/money")

function vSX.getMoney(user_id)
    local tmp = vSX.getUserTmpTable(user_id)
    if tmp then
        return tmp.wallet or 0
    else
        return 0
    end
end

function vSX.setMoney(user_id, value)
    local tmp = vSX.getUserTmpTable(user_id)
    if tmp then
        tmp.wallet = value
    end
    local source = vSX.getUserSource(user_id)
end

function vSX.tryPayment(user_id, amount)
    local money = vSX.getMoney(user_id)
    if amount < 0 then
        vSX.ban(user_id, "BANIDO POR TENTAR INJECTAR DINHEIRO\nBAN -> PERMANENTE")
        return false
    else
        if money >= amount then
            vSX.setMoney(user_id, money-amount)
            return true
        else
            return false
        end
    end
end

function vSX.tryBankPayment(user_id, amount)
    local bank = vSX.getBankMoney(user_id)
    if amount < 0 then
        vSX.ban(user_id, "BANIDO POR TENTAR INJECTAR DINHEIRO\nBAN -> PERMANENTE")
        return false
    else
        if bank >= amount then
            vSX.setBankMoney(user_id, bank-amount)
            return true
        else
            return false
        end
    end
end

function vSX.giveMoney(user_id, amount)
    local money = vSX.getMoney(user_id)
    vSX.setMoney(user_id, money+amount)
end

function vSX.getBankMoney(user_id)
    local tmp = vSX.getUserTmpTable(user_id)
    if tmp then
        return tmp.bank or 0
    else
        return 0
    end
end

function vSX.setBankMoney(user_id, value)
    local tmp = vSX.getUserTmpTable(user_id)
    if tmp then
        tmp.bank = value
    end
end

function vSX.giveBankMoney(user_id, amount)
    local money = vSX.getBankMoney(user_id)
    vSX.setBankMoney(user_id, money+amount)
end

function vSX.tryWithdraw(user_id, amount)
    local money = vSX.getBankMoney(user_id)
    if amount > 0 and money >= amount then
        vSX.setBankMoney(user_id, money-amount)
        vSX.giveMoney(user_id, amount)
        return true
    else
        return false
    end
end

function vSX.tryDeposit(user_id, amount)
    if amount > 0 and vSX.tryPayment(user_id, amount) then
        vSX.giveBankMoney(user_id, amount)
        return true
    else
        return false
    end
end

function vSX.tryFullPayment(user_id, amount)
    if amount < 0 then
        vSX.ban(user_id, "BANIDO POR TENTAR INJECTAR DINHEIRO\nBAN -> PERMANENTE")
        return false
    else
        local money = vSX.getMoney(user_id)
        if money >= amount then
            return vSX.tryPayment(user_id, amount)
        else
            if vSX.tryWithdraw(user_id, amount-money) then
                return vSX.tryPayment(user_id, amount)
            end
        end
        return false
    end
end

AddEventHandler("vSX:playerJoin", function(user_id, source, name, last_login)
    MySQL.query("vSX/money_init_user", {user_id = user_id, wallet = cfg.open_wallet, bank = cfg.open_bank}, function(rows, affected)
        local tmp = vSX.getUserTmpTable(user_id)
        if tmp then
            MySQL.query("vSX/get_money", {user_id = user_id}, function(rows, affected)
                if #rows > 0 then
                    tmp.bank = rows[1].bank
                    tmp.wallet = rows[1].wallet
                end
            end)
        end
    end)
end)

AddEventHandler("vSX:playerLeave", function(user_id, source)
    local tmp = vSX.getUserTmpTable(user_id)
    if tmp and tmp.wallet ~= nil and tmp.bank ~= nil then
        MySQL.query("vSX/set_money", {user_id = user_id, wallet = tmp.wallet, bank = tmp.bank})
    end
end)

AddEventHandler("vSX:save", function()
    for k, v in pairs(vSX.user_tmp_tables) do
        if v.wallet ~= nil and v.bank ~= nil then
            MySQL.query("vSX/set_money", {user_id = k, wallet = v.wallet, bank = v.bank})
        end
    end
end)