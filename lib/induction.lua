local function getTransferCap ()
    return peripheral.find("inductionPort").getTransferCap()
end

local function getLastOutput ()
    return peripheral.find("inductionPort").getLastOutput()
end

local function getLastInput ()
    return peripheral.find("inductionPort").getLastInput()
end

local function getEnergy ()
    return peripheral.find("inductionPort").getEnergy()
end

local function getMaxEnergy ()
    return peripheral.find("inductionPort").getMaxEnergy()
end

local function getEnergyFilledPercentage ()
    return peripheral.find("inductionPort").getEnergyFilledPercentage()
end

return {
    getTransferCap = getTransferCap,
    getLastOutput = getLastOutput,
    getLastInput = getLastInput,
    getEnergy = getEnergy,
    getMaxEnergy = getMaxEnergy,
    getEnergyFilledPercentage = getEnergyFilledPercentage,
}