local gameConfig = require("gameConfig")
local Backgrounds = {}

Backgrounds.new = function(speed)
    local backgrounds = display.newGroup()
    local tile = display.newImage("imgs/backgrounds/purple.png")
    tile.alpha = 0
    backgrounds.speed = speed or 50
    backgrounds.offset = (1000 / display.fps) * (speed / 1000)
    --generate background
    local function generateBackground()
        
        local cols = math.ceil((gameConfig.contentWidth) / tile.contentWidth) + 1
        local rows = math.ceil((gameConfig.contentHeight) / tile.contentHeight) + 1
        local backgroundGroup = display.newGroup()
        local left = -math.ceil((tile.width * cols - gameConfig.contentWidth)/2)
        local top = -math.ceil((tile.height * rows - gameConfig.contentHeight)/2)
        print("Generate background left:", left, "top:", top, backgroundGroup.x, backgroundGroup.y)
        for row = 1, rows do
            for col = 1, cols do
                local background = display.newImage("imgs/backgrounds/purple.png")
                background.y = top + math.ceil((row - 0.5) * tile.height)
                background.x = left + math.ceil((col - 0.5) * tile.width)
                backgroundGroup:insert(background)
            end
        end    
        return backgroundGroup
    end
    --backgrounds.x = backgrounds.x + 100
    local background1 = generateBackground()
    local background2 = generateBackground()
    background1.y = background2.y - background2.height
    backgrounds.pageHeight = background2.height
    backgrounds:insert(background1)
    backgrounds:insert(background2)
    backgrounds:insert(tile)
    local backgroundMoves = 0

    function backgrounds:enterFrame(event)
        backgroundMoves = backgroundMoves + self.offset
        backgrounds.y = backgrounds.y + self.offset
        if backgrounds.y - backgrounds.pageHeight >= 0 then
            backgrounds.y = backgrounds.y - backgrounds.pageHeight
        end
        if backgrounds.onUpdate then
            backgrounds.onUpdate(math.floor(backgroundMoves / 10))
        end
    end

    function backgrounds:startMoveLoop(event)
        Runtime:addEventListener( "enterFrame", self )
    end

    function backgrounds:stopMoveLoop()
        Runtime:removeEventListener("enterFrame", self)
    end

    return backgrounds
end

return Backgrounds