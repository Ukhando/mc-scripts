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

local function percentageBar(x, y, w, per)
    setCursorPos(x, y)
    if per > 1 then
        per = 1
    elseif per < 0 then
        per = 0
    end
    local filled = math.ceil((w - 2) * per)
    local text = "[" .. string.rep("=", filled) .. string.rep(" ", w - filled - 2) .. "]"
    write(text)
end

local function percentageBarAll(per)
    local width, height = getSize()
    if per > 1 then
        per = 1
    elseif per < 0 then
        per = 0
    end
    local filled = math.ceil((width - 2) * per)
    local text = "[" .. string.rep("=", filled) .. string.rep(" ", width - filled - 2) .. "]"
    write(text)
end

local function round(amount, div)
    local a = amount * 100 / div
    return math.floor(a + 0.5) / 100
end

local function formatNumber(number)
    return string.format('%6.2f', number)
end

local function writeUnit(amount, unit)
    if amount < 1000 then
        return write(formatNumber(round(amount, 1)) .. " " .. unit)
    elseif amount < 1000000 then
        return write(formatNumber(round(amount, 1000)) .. " k" .. unit)
    elseif amount < 1000000000 then
        return write(formatNumber(round(amount, 1000000)) .. " M" .. unit)
    else
        return write(formatNumber(round(amount, 1000000000)) .. " G" .. unit)
    end
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
    percentageBar = percentageBar,
    percentageBarAll = percentageBarAll,
    writeUnit = writeUnit,
    round = round,
    formatNumber = formatNumber,
}