local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local Sprite = require("Sprite")
local logger = require("logger")
local scene = MenuScene.new()
local gameConfig = require("gameConfig")
local sfx = require("sfx")
local TAG = "START MENU"

function scene:init()
    self.menuWidth = math.round(display.contentWidth*0.8)
    self.menuHeight = math.round(display.contentHeight*0.5)
end

function scene:construct()
    local logo = Sprite.new("Logo")
    local versionTxt = display.newText("Ver."..gameConfig.version, 0, 0, "kenvector_future_thin", 32)
    self.view:insert(logo)
    self.view:insert(versionTxt)
    logo.x = display.contentWidth/2
    logo.y = display.contentHeight/2 - self.menuHeight * 0.5
    versionTxt.x = logo.x
    versionTxt.y = logo.y + logo.height/2 + versionTxt.height/2
    self.glassPanel.alpha = 0
end

function scene:insertButtons()
    logger:debug(TAG, "insertButtons")
    local startButton = self:newButton("~Start~")
    startButton.buttonView.alpha = 0
    startButton.buttonText.size = 60
    startButton.pressSound = "start"
    startButton.buttonView.isHitTestable = true
    local function blink(show)
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
            scene:startGame()
        end
    end

    function scene:startGame()
        composer.gotoScene("scenes.game")
    end

    function scene:onWillShow( event )

    end

    function scene:onWillHide( event )
        
    end

    function scene:onConfirm(buttonSelectedIndex)
        sfx:play("start")
        self:startGame()
    end

end

return scene