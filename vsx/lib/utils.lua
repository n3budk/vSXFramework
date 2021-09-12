local modules = {}

function module(rsc, path)
    if path == nil then
        path = rsc
        rsc = "vsx"
    end
    local key = rsc..path
    if modules[key] then
        return table.unpack(modules[key])
    else
        local f, err = load(LoadResourceFile(rsc, path..".lua"))
        if f then
            local ar = {pcall(f)}
            if ar[1] then
                table.remove(ar, 1)
                modules[key] = ar
                return table.unpack(ar)
            else
                modules[key] = nil
                print("[vSX] error loading module "..rsc.."/"..path..":"..ar[2])
            end
        else
            print("[vSX] error parsing module "..rsc.."/"..path..":"..err)
        end
    end
end

function Task(callback, dparams, timeout) 
    if timeout == nil then
        timeout = 5000
    end
    local r = {}
    r.done = false
    local finish = function(params) 
        if not r.done then
            if params == nil then
                params = dparams or {}
            end
            r.done = true
            callback(table.unpack(params))
        end
    end
    setmetatable(r, {__call = function(t, params)
        finish(params)
    end})
    SetTimeout(timeout, function()
        finish(dparams)
    end)  
    return r
end

function parseInt(v)
    local n = tonumber(v)
    if n == nil then 
        return 0
    else
        return math.floor(n)
    end
end

function parseDouble(v)
    local n = tonumber(v)
    if n == nil then
        n = 0
    end
    return n
end
    
function parseFloat(v)
    return parseDouble(v)
end

local sanitize_tmp = {}

function sanitizeString(str, strchars, allow_policy)
    local r = ""
    local chars = sanitize_tmp[strchars]
    if chars == nil then
        chars = {}
        local size = string.len(strchars)
        for i = 1, size do
            local char = string.sub(strchars, i, i)
            chars[char] = true
        end
        sanitize_tmp[strchars] = chars
    end
    size = string.len(str)
    for i = 1, size do
        local char = string.sub(str, i, i)
        if (allow_policy and chars[char]) or (not allow_policy and not chars[char]) then
            r = r..char
        end
    end
    return r
end

function splitString(str, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    local i = 1
    for str in string.gmatch(str, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function joinStrings(list, sep)
    if sep == nil then
        sep = ""
    end
    local str = ""
    local count = 0
    local size = #list
    for k, v in pairs(list) do
        count = count+1
        str = str..v
        if count < size then
            str = str..sep
        end
    end
    return str
end