local MySQL = {}
local dpaths = {}
local tasks = {}

MySQL.debug = false

AddEventHandler("vSX:MySQL_task", function(task_id, data)
    local cb = tasks[task_id]
    if cb then
        if data.status == 1 then
            cb(data.rows or {}, data.affected or 0)
        elseif r.status == -1 then
            print("[vSX] task "..id.." failed.")
        end
        tasks[task_id] = nil
    end
    if MySQL.debug and dpaths[task_id] then
        print("[vSX] MySQL end query "..dpaths[task_id].." ("..task_id..")")
        dpaths[task_id] = nil
    end
end)

local task_id = -1

AddEventHandler("vSX:MySQL_taskid", function(_task_id)
    task_id = _task_id
end)

function MySQL.createConnection(name, host, user, password, db, debug)
    local host_parts = splitString(host, ":")
    if #host_parts >= 2 then
        host = host_parts[1]..";port="..host_parts[2]
    end
    local config = "server="..host..";uid="..user..";pwd="..password..";database="..db..";"
    exports.vsx_mysql:createConnection(name, config)
end

function MySQL.createCommand(path, query)
    exports.vsx_mysql:createCommand(path, query)
end

function MySQL.query(path, args, cb)
    if not (type(args) == "table") then
        args = {}
    end
    args._none = " "
    TriggerEvent("vSX:MySQL_query", path, args)
    if MySQL.debug then
        print("[vSX] MySQL begin query "..path.." ("..task_id..")")
        dpaths[task_id] = path
    end
    tasks[task_id] = cb
end

return MySQL