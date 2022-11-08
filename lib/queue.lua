local queue = {}

local function queueEvent(event, ...)
    table.insert({
        event,
        unpack(arg)
    })
end

local function pullEventRaw()
    local event = table.remove(queue, 1)
    if event ~= nil then
        os.queueEvent(unpack(event))
    end
    return os.pullEventRaw()
end

local function pullEvent()
    local event = table.remove(queue, 1)
    if event ~= nil then
        os.queueEvent(unpack(event))
    end
    return os.pullEvent()
end

return {
    queueEvent = queueEvent,
    pullEvent = pullEvent,
    pullEventRaw = pullEventRaw,
}