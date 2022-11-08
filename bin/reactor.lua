local reactor = require('/lib/fissionReactor')
local monitor = require('/lib/monitor')
local turbine = require('/lib/turbine')
local induction = require('/lib/induction')
local queue = require('/lib/queue')

local running = true
local timer = nil
monitor.setBackgroundColor(colors.black)
monitor.setTextColor(colors.white)
monitor.clear()
queue.queueEvent('start:timer')
local modifier = 1

while running do
    local args = {queue.pullEventRaw()}
    local type = table.remove(args, 1)
    print(type)
    if type == 'terminate' then
        running = false
    elseif type == 'set:reactor' then
        local powerPerMb = turbine.getBlades() * 7.14
        local powerTarget = induction.getLastOutput()
        local powerFilled = induction.getEnergyFilledPercentage()
        if powerFilled > 0.6 then
            modifier = 0.5
        elseif powerFilled < 0.5 then
            modifier = 2
        else
            modifier = 1
        end
        local burnRateTarget = powerTarget * modifier / powerPerMb / 1000
        local maxBurnRate = reactor.getMaxBurnRate()
        local burnRate = math.min(burnRateTarget, maxBurnRate)
        reactor.setBurnRate(burnRate)
        queue.queueEvent('update:reactor')
    elseif type == 'update:reactor' then
        local maxRate = reactor.getMaxBurnRate()
        local temp = reactor.getTemperature()
        local tempPer = temp / reactor.getMaxGreenTemperature()
        local targetRate = reactor.getBurnRate()
        local targetPer = targetRate / maxRate
        local color = reactor.getTemperatureColor()
        local modifierColor = colors.white
        local modifierChar = ''
        if modifier > 1 then
            modifierColor = colors.red
            modifierChar = '+'
        elseif modifier < 1 then
            modifierColor = colors.green
            modifierChar = '-'
        end
        if reactor.getStatus() then
            monitor.setTextColor(colors.green)
        else
            monitor.setTextColor(colors.red)
        end
        monitor.setCursorPos(1, 1)
        monitor.write("Reactor ")
        monitor.setTextColor(modifierColor)
        monitor.write(modifierChar)
        monitor.setTextColor(colors.white)
        monitor.setCursorPos(1, 2)
        monitor.write("Temperature: ")
        monitor.setTextColor(color)
        monitor.write(monitor.formatNumber(monitor.round(temp - 273.15, 1)) .. " c      ")
        monitor.setCursorPos(1, 3)
        monitor.percentageBarAll(tempPer)
        monitor.setTextColor(colors.white)
        monitor.setCursorPos(1, 4)
        monitor.write("Burnrate:    " .. monitor.formatNumber(targetRate) .. " mB/t      ")
        monitor.setCursorPos(1, 5)
        monitor.percentageBarAll(targetPer)
    elseif type == 'update:induction' then
        local output = induction.getLastOutput()
        local input = induction.getLastInput()
        local maxUsage = induction.getTransferCap()
        local perOutputUsage = output / maxUsage
        local precision = math.min(input, output) / math.max(input, output)
        local filled = induction.getEnergyFilledPercentage()
        monitor.setCursorPos(1, 7)
        monitor.write("Induction")
        monitor.setCursorPos(1, 8)
        monitor.write("Input:       ")
        monitor.writeUnit(input, 'FE/t')
        monitor.write("      ")
        monitor.setCursorPos(1, 9)
        monitor.percentageBarAll(precision)
        monitor.setCursorPos(1, 10)
        monitor.write("Output:      ")
        monitor.writeUnit(output, 'FE/t')
        monitor.write("      ")
        monitor.setCursorPos(1, 11)
        monitor.percentageBarAll(perOutputUsage)
        monitor.setCursorPos(1, 12)
        monitor.write("Filled:      " .. monitor.formatNumber(filled * 100) .. "%      ")
        monitor.setCursorPos(1, 13)
        monitor.percentageBarAll(filled)
    elseif type == 'redstone' then
        queue.queueEvent('set:reactor')
    elseif type == 'timer' and args[1] == timer then
        timer = nil
        queue.queueEvent('update:induction')
        queue.queueEvent('set:reactor')
        queue.queueEvent('start:timer')
    elseif type == 'start:timer' then
        if timer ~= nil then
            os.cancelTimer(timer)
        end
        timer = os.startTimer(1)
    end
end

if timer ~= nil then
    os.cancelTimer(timer)
end

redstone.setBundledOutput("back", 0)