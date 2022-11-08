local reactor = require('lib.fissionReactor')
local monitor = require('lib.monitor')
local turbine = require('lib.turbine')
local induction = require('lib.induction')

local running = true
local timer = nil
monitor.setBackgroundColor(colors.black)
monitor.setTextColor(colors.white)
monitor.clear()
os.queueEvent('start:timer')

while running do
    local args = {os.pullEventRaw()}
    local type = table.remove(args)
    if type == 'terminate' then
        running = false
    elseif type == 'set:reactor' then
        local powerPerMb = turbine.getBlades()
        local powerTarget = induction.getLastOutput()
        local burnRateTarget = powerTarget / powerPerMb / 7.14 / 1000
        local maxBurnRate = reactor.getMaxBurnRate()
        local burnRate = math.min(burnRateTarget, maxBurnRate)
        reactor.setBurnRate(burnRate)
    elseif type == 'update:reactor' then
        local maxRate = reactor.getMaxBurnRate()
        local targetRate = reactor.getBurnRate()
        local actualRate = reactor.getActualBurnRate()
        local actualPer = actualRate / maxRate
        local targetPer = targetRate / maxRate
        monitor.setCursorPos(1, 1)
        monitor.write("Reactor")
        monitor.setCursorPos(1, 2)
        monitor.percentageBarAll(actualPer)
        monitor.setCursorPos(1, 3)
        monitor.percentageBarAll(targetPer)
    elseif type == 'update:induction' then
        local maxRate = reactor.getMaxBurnRate()
        local actualRate = reactor.getActualBurnRate()
        local usage = induction.getLastOutput()
        local maxUsage = induction.getTransferCap()
        local perUsageReactor = actualRate / maxRate
        local perUsageInduction = usage / maxUsage
        local filled = induction.getEnergyFilledPercentage()
        monitor.setCursorPos(1, 5)
        monitor.write("Induction")
        monitor.setCursorPos(1, 6)
        monitor.percentageBarAll(perUsageReactor)
        monitor.setCursorPos(1, 7)
        monitor.percentageBarAll(perUsageInduction)
        monitor.setCursorPos(1, 8)
        monitor.percentageBarAll(filled)
    elseif type == 'redstone' then
        os.queueEvent('set:reactor')
    elseif type == 'timer' and args[1] == timer then
        timer = nil
        os.queueEvent('set:reactor')
        os.queueEvent('update:reactor')
        os.queueEvent('update:induction')
        os.queueEvent('start:timer')
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