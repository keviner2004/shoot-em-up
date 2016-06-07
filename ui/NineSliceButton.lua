local widget = require("widget")
local Sprite = require("Sprite")
--local pathOfThisFile = ...
--print("Path! "..pathOfThisFile)
local NineSliceButton = {}

NineSliceButton.new = function(name, w, h, l)
    local path = string.format("UI/%s/9-slices", name)
    local button = display.newGroup()
    button.createView = function(self, w, h)
        self.w = w
        self.h = h
        self.buttonView = widget.newButton({
            width = w,
            height = h,
            sheet = myImageSheet,
            topLeftFrame = Sprite.getFrameIndex(string.format("%s/1", path)),
            topMiddleFrame = Sprite.getFrameIndex(string.format("%s/2", path)),
            topRightFrame = Sprite.getFrameIndex(string.format("%s/3", path)),
            middleLeftFrame = Sprite.getFrameIndex(string.format("%s/4", path)),
            middleFrame = Sprite.getFrameIndex(string.format("%s/5", path)),
            middleRightFrame = Sprite.getFrameIndex(string.format("%s/6", path)),
            bottomLeftFrame = Sprite.getFrameIndex(string.format("%s/7", path)),
            bottomMiddleFrame = Sprite.getFrameIndex(string.format("%s/8", path)),
            bottomRightFrame = Sprite.getFrameIndex(string.format("%s/9", path)),
            topLeftOverFrame = Sprite.getFrameIndex(string.format("%s/1", path)),
            topMiddleOverFrame = Sprite.getFrameIndex(string.format("%s/2", path)),
            topRightOverFrame = Sprite.getFrameIndex(string.format("%s/3", path)),
            middleLeftOverFrame = Sprite.getFrameIndex(string.format("%s/4", path)),
            middleOverFrame = Sprite.getFrameIndex(string.format("%s/5", path)),
            middleRightOverFrame = Sprite.getFrameIndex(string.format("%s/6", path)),
            bottomLeftOverFrame = Sprite.getFrameIndex(string.format("%s/7", path)),
            bottomMiddleOverFrame = Sprite.getFrameIndex(string.format("%s/8", path)),
            bottomRightOverFrame = Sprite.getFrameIndex(string.format("%s/9", path)),
            --onEvent = onEvent,
            --isEnabled = false,

        })
        self:insert(self.buttonView)
        self.buttonView.x = 0
        self.buttonView.y = 0
        self.propagating = true
    end

    button:createView(w, h)

    function button:setText(text, font, fontSize)
        if not text then
            text = ""
        end
        if not font then
            font = "kenvector_future_thin"
        end
        if not fontSize then
            fontSize = 35
        end
        if not self.buttonText then
            self.buttonText = display.newText(text, 0, 0, font, fontSize)
            self.buttonText.x = 0
            self.buttonText.y = 0
            button:insert(self.buttonText)
        else
            self.buttonText.text = text
        end
    end

    function button.buttonView:touch(event)
        --print("touch: "..event.phase.."/"..event.phase.." on "..self.id)
        button:onTouch(event)
        --return false treat as background
        return self.propagating --false
    end
    
    --button:addEventListener("touch", self)
    
    function button:onTouch(func, propagating)
        
    end

    function button:setWidth(w)
        --print("set w ", w)
        self.w = w
        if button.buttonView.x then
            button.buttonView:removeSelf()
        end
        
        if w > 0 then
            self:createView(w, self.h)
        end
        --[[
        if w == 0 then
            self.xScale = 0.001
            self.isVisible = false
        else
            self.isVisible = true
            self.xScale = w/self.width
        end
        --]]
    end

    function button:setHeight(h)
        self.h = h
        if button.buttonView.x then
            button.buttonView:removeSelf()
        end
        
        if h > 0 then
            self:createView(self.w, h)
        end
        --[[if h == 0 then
            self.yScale = 0.001
            self.isVisible = false
        else
            self.yScale = h/self.height
            self.isVisible = true
        end--]]
    end
    return button
end

return NineSliceButton