local game = {}

local game = {}

local text
local ease = require("render.ease")

function game:load(args)
    text = require("text.main")
end

local frame = 0
local ending = false
function game:draw()
    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle("fill", -400, -300, 800, 600)
    love.graphics.setColor(1,1,1,(frame - 0.9) * 10)
    if frame < 0.9 then
        return
    end
    if ending == true then
        text.print("Made By", 0, -40, 2)
        text.print("TheMonHub", 0, 30, 5)
    else
        text.print("Made By", 0, -40, 2 * frame)
        text.print("TheMonHub", 0, 30, 5 * frame)
    end
end

local endTimer = 0
local oldFrame
function game:update(dt)
    oldFrame = frame
    if ending == true then
        frame = ease.circleEaseOut(0, oldFrame, 1, dt)
        if frame <= 0.1 then
            self.setScene("menu")
            return
        end
        return
    end
    if endTimer >= 3 and frame >= 0.9 then
        ending = true
        frame = 1
    end
    endTimer = endTimer + dt
    frame = ease.circleEaseOut(1, oldFrame, 2, dt)
end

return game