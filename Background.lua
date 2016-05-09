local Backgrounds = {}

Backgrounds.new = function()
    local tileWidth = 256
    local tileHeight = 256
    local backgrounds = display.newGroup()
    --generate background
    local function generateBackground()
        local cols = math.ceil((display.contentWidth + tileWidth) / tileWidth)
        local rows = math.ceil((display.contentHeight + tileHeight) / tileHeight)
        local backgroundGroup = display.newGroup()
        for row = 0, rows - 1 do
            for col = 0, cols - 1 do
                local background = display.newImage("imgs/backgrounds/purple.png")
                background.x = col * tileWidth
                background.y = row * tileHeight
                backgroundGroup:insert(background)
            end
        end    
        return backgroundGroup
    end

    local background1 = generateBackground()
    local background2 = generateBackground()
    background1.y = background2.y - background2.height
    backgrounds.pageHeight = background2.height
    backgrounds:insert(background1)
    backgrounds:insert(background2)
    local backgroundMoves = 0

    function backgrounds:enterFrame(event)
        backgroundMoves = backgroundMoves + 5
        backgrounds.y = backgrounds.y + 5
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