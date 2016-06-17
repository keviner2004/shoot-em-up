local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local Sprite = require("Sprite")

local scene = MenuScene.new()

function scene:init()
    self.menuWidth = math.round(display.contentWidth*0.8)
    self.menuHeight = math.round(display.contentHeight*0.5)
end

function scene:construct()
    local logo = Sprite.new("Logo")
    self.view:insert(logo)
    logo.x = display.contentWidth/2
    logo.y = display.contentHeight/2 - self.menuHeight * 0.5
    self.glassPanel.alpha = 0
end

function scene:insertButtons()
    local startButton = self:newButton("~Start~")
    startButton.buttonView.alpha = 0
    startButton.buttonText.size = 60
    startButton.pressSound = "start"
    startButton.buttonView.isHitTestable = true
    function blink(show)
        if not show then
            alpha = 0.65
        else
            alpha = 1
        end
        transition.to(startButton, {time = 300, alpha = alpha, onComplete = 
            function()
                blink(not show)
            end
        })
    end
    blink()
    self.buttons:insert(startButton)
    function startButton:onTouch(event)
        --print("custom: "..event.phase.."/"..event.phase)
        if event.phase == "ended" then
            composer.gotoScene("scenes.game")
        end
    end
end

return scene