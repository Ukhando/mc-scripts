local function activate()
	peripheral.find("fissionReactorLogicAdapter").activate()
end

local function scram()
	peripheral.find("fissionReactorLogicAdapter").scram()
end

local function getBurnRate()
	return peripheral.find("fissionReactorLogicAdapter").getBurnRate()
end

local function setBurnRate(rate)
	peripheral.find("fissionReactorLogicAdapter").setBurnRate(rate)
end

local function getWasteFilledPercentage()
	return peripheral.find("fissionReactorLogicAdapter").getWasteFilledPercentage()
end

local function getWasteCapacity()
	return peripheral.find("fissionReactorLogicAdapter").getWasteCapacity()
end

local function getWaste()
	return peripheral.find("fissionReactorLogicAdapter").getWaste()
end

local function getTemperature()
	return peripheral.find("fissionReactorLogicAdapter").getTemperature()
end

local function getStatus()
	return peripheral.find("fissionReactorLogicAdapter").getStatus()
end

local function getMaxBurnRate()
	return peripheral.find("fissionReactorLogicAdapter").getMaxBurnRate()
end

local function getHeatingRate()
	return peripheral.find("fissionReactorLogicAdapter").getHeatingRate()
end

local function getHeatedCoolantFilledPercentage()
	return peripheral.find("fissionReactorLogicAdapter").getHeatedCoolantFilledPercentage()
end

local function getHeatedCollantCapacity()
	return peripheral.find("fissionReactorLogicAdapter").getHeatedCollantCapacity()
end

local function getHeatedCollant()
	return peripheral.find("fissionReactorLogicAdapter").getHeatedCollant()
end

local function getHeatCapacity()
	return peripheral.find("fissionReactorLogicAdapter").getHeatCapacity()
end

local function getFuelFilledPercentage()
	return peripheral.find("fissionReactorLogicAdapter").getFuelFilledPercentage()
end

local function getFuelCapacity()
	return peripheral.find("fissionReactorLogicAdapter").getFuelCapacity()
end

local function getFuel()
	return peripheral.find("fissionReactorLogicAdapter").getFuel()
end

local function getDamagePercent()
	return peripheral.find("fissionReactorLogicAdapter").getDamagePercent()
end

local function getCoolantFilledPercentage()
	return peripheral.find("fissionReactorLogicAdapter").getCoolantFilledPercentage()
end

local function getCoolantCapacity()
	return peripheral.find("fissionReactorLogicAdapter").getCoolantCapacity()
end


local function getActualBurnRate()
	return peripheral.find("fissionReactorLogicAdapter").getActualBurnRate()
end

return {
	activate = activate,
	setBurnRate = setBurnRate,
	scram = scram,
	getWasteFilledPercentage = getWasteFilledPercentage,
	getWasteCapacity = getWasteCapacity,
	getWaste = getWaste,
	getTemperature = getTemperature,
	getStatus = getStatus,
	getMaxBurnRate = getMaxBurnRate,
	getHeatingRate = getHeatingRate,
	getHeatedCoolantFilledPercentage = getHeatedCoolantFilledPercentage,
	getHeatedCollantCapacity = getHeatedCollantCapacity,
	getHeatedCollant = getHeatedCollant,
	getHeatCapacity = getHeatCapacity,
	getFuelFilledPercentage = getFuelFilledPercentage,
	getFuelCapacity = getFuelCapacity,
	getFuel = getFuel,
	getDamagePercent = getDamagePercent,
	getCoolantFilledPercentage = getCoolantFilledPercentage,
	getCoolantCapacity = getCoolantCapacity,
	getBurnRate = getBurnRate,
	getActualBurnRate = getActualBurnRate,
}