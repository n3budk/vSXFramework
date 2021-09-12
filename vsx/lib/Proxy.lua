local Debug = module("lib/Debug")

local Proxy = {}

local proxy_rdata = {}

local function proxy_callback(rvalues)
    proxy_rdata = rvalues
end

local function proxy_resolve(itable, key)
    local iname = getmetatable(itable).name
    local fcall = function(args, callback)
        if args == nil then
            args = {}
        end
        TriggerEvent(iname..":proxy", key, args, proxy_callback)
        return table.unpack(proxy_rdata)
    end
    itable[key] = fcall
    return fcall
end

function Proxy.addInterface(name, itable)
    AddEventHandler(name..":proxy", function(member, args, callback)
        if Debug.active then
            Debug.pbegin("proxy_"..name..":"..member.." "..json.encode(Debug.safeTableCopy(args)))
        end
        local f = itable[member]
        if type(f) == "function" then
            callback({f(table.unpack(args))})
        else
            print("error: proxy call "..name..":"..member.." not found")
        end
        if Debug.active then
            Debug.pend()
        end
    end)
end

function Proxy.getInterface(name)
    local r = setmetatable({}, {__index = proxy_resolve, name = name})
    return r
end
  
return Proxy