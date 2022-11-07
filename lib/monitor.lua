local function setTextScale(scale)
    peripheral.find("monitor").setTextScale(scale)
end

local function getTextScale()
    return peripheral.find("monitor").getTextScale()
end

local function write(text)
    peripheral.find("monitor").write(text)
end

local function setCursorPos(x, y)
    peripheral.find("monitor").setCursorPos(x, y)
end

local function getSize()
    return peripheral.find("monitor").getSize()
end

local function clear()
    peripheral.find("monitor").clear()
end

local function clearLine()
    peripheral.find("monitor").clearLine()
end

local function setTextColor(color)
    peripheral.find("monitor").setTextColour(color)
end

local function setBackgroundColor(color)
    peripheral.find("monitor").setBackgroundColor(color)
end

return {
    setTextScale = setTextScale,
    getTextScale = getTextScale,
    write = write,
    setCursorPos = setCursorPos,
    getSize = getSize,
    clear = clear,
    clearLine = clearLine,
    setTextColor = setTextColor,
    setBackgroundColor = setBackgroundColor,
}