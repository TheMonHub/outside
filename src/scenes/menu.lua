local game = {}

local shakeTranIntense = 100 * love.window.getDPIScale()
local render = require("render.main")

local function ease(target, value, speed, dt)
    return value + (target - value) * (1 - math.exp(-speed * dt))
end

function game:load(args)
    render.winX = screenSizeX / 2 - windowCenterX
    render.winY = screenSizeY / 2 - windowCenterY
    local winSuccess = love.window.updateMode(windowWidth, windowHeight, {borderless=false})
    if winSuccess == false then
        gameLog.error("Failed to open the window!")
        love.event.quit(4)
        return
    end
end

function game:draw()
end

function game:update(dt)
    shakeTranIntense = ease(0, shakeTranIntense, 15, dt)
    render.shakeWin(shakeTranIntense, shakeTranIntense)
end

return game