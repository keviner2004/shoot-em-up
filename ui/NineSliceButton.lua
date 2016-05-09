local widget = require("widget")
--local pathOfThisFile = ...
--print("Path! "..pathOfThisFile)
local NineSliceButton = {}

NineSliceButton.new = function(name, w, h, l)

    function onEvent(event)
        --print("onEvent: "..event.phase.."/"..event.phase)
    end

    local button = display.newGroup()

    button.buttonView = widget.newButton({
        width = w,
        height = h,
        sheet = myImageSheet,
        topLeftFrame = sheetInfo:getFrameIndex(string.format("%s_0_0", name)),
        topMiddleFrame = sheetInfo:getFrameIndex(string.format("%s_0_1", name)),
        topRightFrame = sheetInfo:getFrameIndex(string.format("%s_0_2", name)),
        middleLeftFrame = sheetInfo:getFrameIndex(string.format("%s_1_0", name)),
        middleFrame = sheetInfo:getFrameIndex(string.format("%s_1_1", name)),
        middleRightFrame = sheetInfo:getFrameIndex(string.format("%s_1_2", name)),
        bottomLeftFrame = sheetInfo:getFrameIndex(string.format("%s_2_0", name)),
        bottomMiddleFrame = sheetInfo:getFrameIndex(string.format("%s_2_1", name)),
        bottomRightFrame = sheetInfo:getFrameIndex(string.format("%s_2_2", name)),
        topLeftOverFrame = sheetInfo:getFrameIndex(string.format("%s_0_0", name)),
        topMiddleOverFrame = sheetInfo:getFrameIndex(string.format("%s_0_1", name)),
        topRightOverFrame = sheetInfo:getFrameIndex(string.format("%s_0_2", name)),
        middleLeftOverFrame = sheetInfo:getFrameIndex(string.format("%s_1_0", name)),
        middleOverFrame = sheetInfo:getFrameIndex(string.format("%s_1_1", name)),
        middleRightOverFrame = sheetInfo:getFrameIndex(string.format("%s_1_2", name)),
        bottomLeftOverFrame = sheetInfo:getFrameIndex(string.format("%s_2_0", name)),
        bottomMiddleOverFrame = sheetInfo:getFrameIndex(string.format("%s_2_1", name)),
        bottomRightOverFrame = sheetInfo:getFrameIndex(string.format("%s_2_2", name)),
        --onEvent = onEvent,
        --isEnabled = false,
        label = l or ""

    })
    button:insert(button.buttonView)
    button.buttonView.x = 0
    button.buttonView.y = 0

    function button:setText(text, font, fontSize)
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
        return true
    end
    
    --button:addEventListener("touch", self)
    
    function button:onTouch()
    end

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