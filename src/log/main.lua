local module = {}

local logFilePath = "log.txt"
local logFile, logErrorStr = love.filesystem.newFile(logFilePath, "w")
if logFile == nil then
    print("Unable to access the log file:".. logErrorStr)
    love.event.quit(3)
    return
end
print("Log will be saved to: " .. love.filesystem.getSaveDirectory() .. "/" .. logFilePath)

function module.info(content)
    local s, e = logFile:write("[INFO] " .. content .. "\r\n")
    if s == false then
        print("Failed to log:".. e)
    end
end

function module.warn(content)
    local s, e = logFile:write("[!WARN] " .. content .. "\r\n")
    if s == false then
        print("Failed to log:".. e)
    end
end

function module.error(content)
    local s, e = logFile:write("[!!ERROR] " .. content .. "\r\n")
    if s == false then
        print("Failed to log:".. e)
    end
end

return module