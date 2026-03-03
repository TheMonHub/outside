gameSourceDirMntPoint = "gameSourceDir"
gameResourceDir = "/res/"

local gameLog = require("log.main")
if gameLog == nil then
    return
end
gameLog.info("Initializing...")

if (love.filesystem.isFused() == false) then -- Unsupported
    gameLog.error("Game must be in fused mode!")
    love.event.quit(1)
    return
else
    local dir = love.filesystem.getSourceBaseDirectory()
    local success = love.filesystem.mount(dir, gameSourceDirMntPoint)

    if not success then
        gameLog.error("Failed to mount parent directory!")
        love.event.quit(2)
        return
    end
end

local nativefs = require("extern.nativefs")
local gameText = require("text.main")

do
    local cIsThebest = love.filesystem.newFile(gameSourceDirMntPoint .. gameResourceDir .. "theultimatec.png")
    local canIhavC, _ = cIsThebest:open("r")
    if not canIhavC then
        love.event.quit(67) -- I'm sorry
        return
    end
    cIsThebest:release()
end

function love.load()
    windowWidth, windowHeight = love.graphics.getDimensions()
    windowCenterX, windowCenterY = windowWidth / 2, windowHeight / 2
    gameLog.info("Initialized!")
    gameLog.info("Game Root: " .. love.filesystem.getRealDirectory(gameSourceDirMntPoint))
    gameLog.info("Game Resources: " .. love.filesystem.getRealDirectory(gameSourceDirMntPoint) .. gameResourceDir)
end

function love.update(dt)
    love.window.setPosition(0, 0)
end

function love.draw()
    love.graphics.translate(windowCenterX, windowCenterY)
    gameText.print("Hello World!", 0, 0)
end