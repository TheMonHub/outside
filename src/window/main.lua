local module = {}
local screenX, screenY = love.window.getDesktopDimensions()
local translateX, translateY = screenX / 2, screenY / 2
module.positionX = 0
module.positionY = 0

function module.setPosition(x, y, centered)
    if centered == true then
        module.positionX = x - 400 + translateX
        module.positionY = y - 300 + translateY
        return
    end
    module.positionX = x + translateX
    module.positionY = y + translateY
end

module.setPosition(0, 0, true)
love.window.setPosition(module.positionX, module.positionY)

return module