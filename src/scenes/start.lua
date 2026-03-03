local game = {}

local text
local render = require("render.main")

local theCoolestDevEver, devWidth, devHeight
local centerX, centerY = screenSizeX / 2 - windowCenterX, screenSizeY / 2 - windowCenterY

local function ease(target, value, speed, dt)
    return value + (target - value) * (1 - math.exp(-speed * dt))
end

function game:load(args)
    local winSuccess = love.window.setMode( windowWidth, windowHeight, {borderless=true, resizable=false, x=screenSizeX / 2 - windowCenterX, y=screenSizeY / 3} )
    if winSuccess == false then
        gameLog.error("Failed to open the window!")
        love.event.quit(4)
        return
    end

    text = require("text.main")
    render.winX = screenSizeX / 2 - windowCenterX
    render.winY = screenSizeY / 3
    render.update()

    theCoolestDevEver = love.graphics.newImage(gameResourceDir .. "dev-logo.png")
    devWidth, devHeight = (theCoolestDevEver:getWidth() * 0.25) / 2, (theCoolestDevEver:getHeight() * 0.25) / 2
end
local alpha = 0
function game:draw()
    love.graphics.setColor(1,1,1,alpha)
    love.graphics.draw(theCoolestDevEver, -devWidth, -devHeight - 50, 0, 0.25)
    text.print("Made By TheMonHub", 0, 100, 2)
end

local oldAlpha
local endTimer = 0
function game:update(dt)
    oldAlpha = alpha
    if render.winY - centerY < 10 and screenSizeY / 2 - windowPositionY - 300 - translateY < 1 then
        if endTimer >= 1 then
            self.setScene("menu")
            return
        end
        endTimer = endTimer + dt
    end
    render.winX = ease(centerX, render.winX, 10, dt)
    render.winY = ease(centerY, render.winY, 10, dt)
    alpha = ease(1, oldAlpha, 20, dt)
end

return game