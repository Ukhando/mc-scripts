local remote = "https://github.com/Ukhando/mc-scripts/blob/main/"

local response = http.get(remote.."bin/install.lua")

if not fs.exists("/bin") then
    fs.makeDir("/bin")
end

if fs.exists("/bin/install.lua") then
    fs.delete("/bin/install.lua")
end

local file = fs.open("/bin/install.lua", "w")

file.write(response.readAll())

file.close()


if not fs.exists("/lib") then
    fs.makeDir("/lib")
end

local api = "https://api.github.com/repos/Ukhando/mc-scripts/contents/"

response = http.get(api.."lib")
parts = textutils.unserialiseJSON(response.readAll())

for index, value in ipairs(parts) do
    local path = value["path"]
    local rep = http.get(remote..path)
    if fs.exists(path) then
        fs.delete(path)
    end
    local f = fs.open(path, "w")
    f.write(rep.readAll())
    f.close()
end