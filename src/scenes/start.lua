local game = {}

local text
local render = require("render.main")
local ease = require("render.ease")

function game:load(args)
    local winSuccess = love.window.setMode( windowWidth, windowHeight, {borderless=false, resizable=false, x=screenSizeX / 2 - windowCenterX, y=screenSizeY / 2 - windowCenterY} )
    if winSuccess == false then
        gameLog.error("Failed to open the window!")
        love.event.quit(4)
        return
    end
    require("render.setup")
    render.winX = screenSizeX / 2 - windowCenterX
    render.winY = screenSizeY / 2 - windowCenterY
    if require("debug.skip_intro") == true then
        self.setScene("menu")
        return
    else
        self.setScene("intro")
    end
end

function game:draw()

end

function game:update(dt)

end

return game