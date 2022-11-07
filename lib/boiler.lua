local function getWaterFilledPercentage()
	local boiler = peripheral.find("boilerValve")
	return boiler.getWaterFilledPercentage()
end

local function getWaterCapacity()
	local boiler = peripheral.find("boilerValve")
	return boiler.getWaterCapacity()
end

local function getWater()
	local boiler = peripheral.find("boilerValve")
	return boiler.getWater()
end

local function getTemperature()
	local boiler = peripheral.find("boilerValve")
	return boiler.getTemperature()
end

local function getSteamFilledPercentage()
	local boiler = peripheral.find("boilerValve")
	return boiler.getSteamFilledPercentage()
end

local function getSteamCapacity()
	local boiler = peripheral.find("boilerValve")
	return boiler.getSteamCapacity()
end

local function getSteam()
	local boiler = peripheral.find("boilerValve")
	return boiler.getSteam()
end

local function getMaxBoilRate()
	local boiler = peripheral.find("boilerValve")
	return boiler.getMaxBoilRate()
end

local function getHeatedCoolantFilledPercentage()
	local boiler = peripheral.find("boilerValve")
	return boiler.getHeatedCoolantFilledPercentage()
end

local function getHeatedCoolantCapacity()
	local boiler = peripheral.find("boilerValve")
	return boiler.getHeatedCoolantCapacity()
end

local function getHeatedCoolant()
	local boiler = peripheral.find("boilerValve")
	return boiler.getHeatedCoolant()
end

local function getCooledCoolantFilledPercentage()
	local boiler = peripheral.find("boilerValve")
	return boiler.getCooledCoolantFilledPercentage()
end

local function getCooledCoolantCapacity()
	local boiler = peripheral.find("boilerValve")
	return boiler.getCooledCoolantCapacity()
end

local function getCooledCoolant()
	local boiler = peripheral.find("boilerValve")
	return boiler.getCooledCoolant()
end

local function getComparatorLevel()
	local boiler = peripheral.find("boilerValve")
	return boiler.getComparatorLevel()
end

local function getBoilRate()
	local boiler = peripheral.find("boilerValve")
	return boiler.getBoilRate()
end

local function getBoilCapacity()
	local boiler = peripheral.find("boilerValve")
	return boiler.getBoilCapacity()
end

return {
	getWaterFilledPercentage = getWaterFilledPercentage,
	getWaterCapacity = getWaterCapacity,
	getWater = getWater,
	getTemperature = getTemperature,
	getSteamFilledPercentage = getSteamFilledPercentage,
	getSteamCapacity = getSteamCapacity,
	getSteam = getSteam,
	getMaxBoilRate = getMaxBoilRate,
	getHeatedCoolantFilledPercentage = getHeatedCoolantFilledPercentage,
	getHeatedCoolantCapacity = getHeatedCoolantCapacity,
	getHeatedCoolant = getHeatedCoolant,
	getCooledCoolantFilledPercentage = getCooledCoolantFilledPercentage,
	getCooledCoolantCapacity = getCooledCoolantCapacity,
	getCooledCoolant = getCooledCoolant,
	getComparatorLevel = getComparatorLevel,
	getBoilRate = getBoilRate,
	getBoilCapacity = getBoilCapacity,
}