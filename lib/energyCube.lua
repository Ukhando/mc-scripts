local function init(level)
    return {
        getMaxEnergy = function ()
            local cube = peripheral.find(level .. "EnergyCube")
            return cube.getMaxEnergy()
        end,
        getEnergyFilledPercentage = function ()
            local cube = peripheral.find(level .. "EnergyCube")
            return cube.getEnergyFilledPercentage()
        end,
        getEnergy = function ()
            local cube = peripheral.find(level .. "EnergyCube")
            return cube.getEnergy()
        end,
    }
end

return init