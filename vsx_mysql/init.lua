local function tick()
    TriggerEvent("vSX:MySQL_tick")
    SetTimeout(10, tick)
end
tick()