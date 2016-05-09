local widget = require("widget")
local Sprite = require("Sprite")
local NineSlice = {}

NineSlice.new = function(name, w, h, l)

    local topLeftFrame = Sprite.new(string.format("%s_0_0", name))
    local topMiddleFrame = Sprite.new(string.format("%s_0_1", name))
    local topRightFrame = Sprite.new(string.format("%s_0_2", name))
    local middleLeftFrame = Sprite.new(string.format("%s_1_0", name))
    local middleFrame = Sprite.new(string.format("%s_1_1", name))
    local middleRightFrame = Sprite.new(string.format("%s_1_2", name))
    local bottomLeftFrame = Sprite.new(string.format("%s_2_0", name))
    local bottomMiddleFrame = Sprite.new(string.format("%s_2_1", name))
    local bottomRightFrame = Sprite.new(string.format("%s_2_2", name))
    local topLeftOverFrame = Sprite.new(string.format("%s_0_0", name))
    local topMiddleOverFrame = Sprite.new(string.format("%s_0_1", name))
    local topRightOverFrame = Sprite.new(string.format("%s_0_2", name))
    local middleLeftOverFrame = Sprite.new(string.format("%s_1_0", name))
    local middleOverFrame = Sprite.new(string.format("%s_1_1", name))
    local middleRightOverFrame = Sprite.new(string.format("%s_1_2", name))
    local bottomLeftOverFrame = Sprite.new(string.format("%s_2_0", name))
    local bottomMiddleOverFrame = Sprite.new(string.format("%s_2_1", name))
    local bottomRightOverFrame = Sprite.new(string.format("%s_2_2", name))

    local background = display.newGroup()
    background:insert(topLeftFrame)
    background:insert(topMiddleFrame)
    background:insert(topRightFrame)
    background:insert(middleLeftFrame)
    background:insert(middleFrame)
    background:insert(middleRightFrame)
    background:insert(bottomLeftFrame)
    background:insert(bottomMiddleFrame)
    background:insert(bottomRightFrame)
    background:insert(topLeftOverFrame)
    background:insert(topMiddleOverFrame)
    background:insert(topRightOverFrame)
    background:insert(middleLeftOverFrame)
    background:insert(middleOverFrame)
    background:insert(middleRightOverFrame)
    background:insert(bottomLeftOverFrame)
    background:insert(bottomMiddleOverFrame)
    background:insert(bottomRightOverFrame)

    topLeftFrame.x = (- w + topLeftFrame.width) /2
    topMiddleFrame.y = (- h + topMiddleFrame.height) /2

    function button:setWidth(w)
        if w == 0 then
            self.xScale = 0.001
            self.isVisible = false
        else
            self.isVisible = true
            self.xScale = w/self.width
        end
    end

    function button:setHeight(h)
        if h == 0 then
            self.yScale = 0.001
            self.isVisible = false
        else
            self.yScale = h/self.height
            self.isVisible = true
        end
    end
    return button
end

return NineSliceButton