local widget = require("widget")
local Sprite = require("Sprite")
local logger = require("logger")
local sfx = require("sfx")
local gameConfig = require("gameConfig")
local ScaleText = require("ui.ScaleText")
local TAG = "9-slice"
--local pathOfThisFile = ...
--print("Path! "..pathOfThisFile)
local NineSliceButton = {}

NineSliceButton.new = function(name, w, h, options)
    local path = string.format("UI/%s/9-slices", name)
    local button = display.newGroup()
    button.pressSound = gameConfig.buttonSound

    local _w = math.floor(w)
    local _h = math.floor(h)

    --logger:debug(TAG, "New 9-slice %s with w:%d, h:%d ", name, _w, _h)

    button.disableClickSound = (options and options.disableClickSound) or false
    --[[
    local function onEvent(event)
        button.buttonView:onTouch(event)
    end
    --]]

    button.createView = function(self, w, h)
        --print("!!!!!!!!!", Sprite.myImageSheet)
        local targetSprite = Sprite["expansion-9"]
        self.w = w
        self.h = h
        self.buttonView = widget.newButton({
            width = w,
            height = h,
            sheet = targetSprite.getSheet(),
            topLeftFrame = targetSprite.getFrameIndex(string.format("%s/1", path)),
            topMiddleFrame = targetSprite.getFrameIndex(string.format("%s/2", path)),
            topRightFrame = targetSprite.getFrameIndex(string.format("%s/3", path)),
            middleLeftFrame = targetSprite.getFrameIndex(string.format("%s/4", path)),
            middleFrame = targetSprite.getFrameIndex(string.format("%s/5", path)),
            middleRightFrame = targetSprite.getFrameIndex(string.format("%s/6", path)),
            bottomLeftFrame = targetSprite.getFrameIndex(string.format("%s/7", path)),
            bottomMiddleFrame = targetSprite.getFrameIndex(string.format("%s/8", path)),
            bottomRightFrame = targetSprite.getFrameIndex(string.format("%s/9", path)),
            topLeftOverFrame = targetSprite.getFrameIndex(string.format("%s/1", path)),
            topMiddleOverFrame = targetSprite.getFrameIndex(string.format("%s/2", path)),
            topRightOverFrame = targetSprite.getFrameIndex(string.format("%s/3", path)),
            middleLeftOverFrame = targetSprite.getFrameIndex(string.format("%s/4", path)),
            middleOverFrame = targetSprite.getFrameIndex(string.format("%s/5", path)),
            middleRightOverFrame = targetSprite.getFrameIndex(string.format("%s/6", path)),
            bottomLeftOverFrame = targetSprite.getFrameIndex(string.format("%s/7", path)),
            bottomMiddleOverFrame = targetSprite.getFrameIndex(string.format("%s/8", path)),
            bottomRightOverFrame = targetSprite.getFrameIndex(string.format("%s/9", path)),
            --onEvent = onEvent,
            --isEnabled = false,

        })
        self:insert(self.buttonView)
        self.buttonView.x = 0
        self.buttonView.y = 0
        self.propagating = true
    end

    button:createView(_w, _h)

    function button:setText(text, font, fontSize)
        if not text then
            text = ""
        end
        if not font then
            font = "kenvector_future_thin"
        end
        if not fontSize then
            fontSize = 17
        end

        if self.buttonText then
          self.buttonText:removeSelf()
          self.buttonText = nil
        end
        self.buttonText = ScaleText.new({
          text = text,
          x = 0,
          y = 0,
          font = font,
          fontSize = fontSize
        })
        self.buttonText.x = 0
        self.buttonText.y = 0
        button:insert(self.buttonText)
    end

    function button.buttonView:touch(event)
    --function button.buttonView:onTouch(event)
        --logger:debug(TAG, "touch: "..event.phase.."/"..event.phase.." on "..self.id)
        if event.phase == "ended" then
            button:playSound()
            if button.click then
              button.click(event)
            end
        end
        button:onTouch(event)
        --return false treat as background
        return self.propagating --false
    end

    --button:addEventListener("touch", self)

    function button:playSound()
        if not button.disableClickSound then
            sfx:play(self.pressSound)
        end
    end

    function button:onTouch(event)
      --logger:debug(TAG, "button:onTouch")
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
