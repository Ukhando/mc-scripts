local remote = "https://raw.githubusercontent.com/Ukhando/mc-scripts/main/bin/install.lua"
local response = http.get(remote)
local file = fs.open("/bin/install.lua", "w")
file.write(response.readAll())
file.close()