local api = "https://api.github.com/repos/Ukhando/mc-scripts/contents/"

local function downloadFolder(path)
    if not fs.exists("/"..path) then
        fs.makeDir(path)
    end
    local response = http.get(api..path)
    local parts = textutils.unserialiseJSON(response.readAll())

    for index, value in ipairs(parts) do
        local subPath = value["path"]
        if value["type"] == "dir" then
            if not fs.exists("/"..subPath) then
                fs.makeDir("/"..subPath)
            end
            downloadFolder(subPath)
        elseif value["type"] == "file" then
            local downloadUrl = value["download_url"]
            local rep = http.get(downloadUrl)
            if fs.exists(subPath) then
                fs.delete(subPath)
            end
            local file = fs.open(subPath, "w")
            file.write(rep.readAll())
            file.close()
        end
    end
end

downloadFolder("")