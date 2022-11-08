local function getSteamFilledPercentage ()
    local cube = peripheral.find("turbineValve")
    return cube.getSteamFilledPercentage()
end

local function getSteamCapacity ()
    local cube = peripheral.find("turbineValve")
    return cube.getSteamCapacity()
end

local function getSteam ()
    local cube = peripheral.find("turbineValve")
    return cube.getSteam()
end

local function getProductionRate ()
    local cube = peripheral.find("turbineValve")
    return cube.getProductionRate()
end

local function getMaxProduction ()
    local cube = peripheral.find("turbineValve")
    return cube.getMaxProduction()
end

local function getEnergy ()
    local cube = peripheral.find("turbineValve")
    return cube.getEnergy()
end

local function getMaxEnergy ()
    local cube = peripheral.find("turbineValve")
    return cube.getMaxEnergy()
end

local function getBlades()
    return peripheral.find("turbineValve").getBlades()
end

return {
    getSteam = getSteam,
    getSteamCapacity = getSteamCapacity,
    getSteamFilledPercentage = getSteamFilledPercentage,
    getProductionRate = getProductionRate,
    getMaxProduction = getMaxProduction,
    getEnergy = getEnergy,
    getMaxEnergy = getMaxEnergy,
    getBlades = getBlades,
}