local gameConfig = require("gameConfig")
local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local navigator = require("navigator")
local Sprite = require("Sprite")
local Title = require("ui.Title")
local ScaleText = require("ui.ScaleText")
local LikeButton = require("ui.LikeButton")
local LinearGroup = require("ui.LinearGroup")
local sfx = require("sfx")
local Level = require("Level")
local dbHelper = require("dbHelper")
local logger = require("logger")
local TAG = "scenes.victory"
local scene = MenuScene.new()


function scene:getTitleText()
   return "Defeat!"
end

function scene:onWillShow(event)
    local score = (event.params and event.params.score) or 1200
    local count = 1
    local ticket = 10
    --[[
    self.scoreTimer = timer.performWithDelay( 1,
        function(event)
            if count > score then
                timer.cancel(event.source)
                count = score
            end
            self.score.text = count
            count = count + ticket
        end
    ,-1)
    --]]
    self:resizeButtons()
    if self.params and self.params.showNextLevel then
        self.nextButton.isVisible = true
        self.nextButton.y = self.nextButton.y + gameConfig.contentHeight*0.06
        --self.rankButton.y = self.rankButton.y + gameConfig.contentHeight*0.03
        self.restartButton.y = self.restartButton.y + gameConfig.contentHeight*0.06
        self.homeButton.y = self.homeButton.y + gameConfig.contentHeight*0.06
        self.likeButton.y = self.likeButton.y + gameConfig.contentHeight*0.08
    else
        self.nextButton.isVisible = false
        --self.rankButton.y = self.rankButton.y - gameConfig.contentHeight*0.03
        self.restartButton.y = self.restartButton.y - gameConfig.contentHeight*0.03
        self.homeButton.y = self.homeButton.y - gameConfig.contentHeight*0.03
        self.likeButton.y = self.likeButton.y + gameConfig.contentHeight*0.03
        --self:resizeButtons()
    end
    self.score.text = score

    if event.params and event.params.newRecord then
        self.newIcon.isVisible = true
    else
        self.newIcon.isVisible = false
    end
    --self.likeButton:poke()
    --self.nextButton.xScale = 0.9
    --self.nextButton.yScale = 0.8
end

function scene:insertButtons()
    self.nextButton = self:newButton("CONTINUE")
    --self.rankButton = self:newButton("Rank")
    self.restartButton = self:newRestartButton()
    self.homeButton = self:newButton("BACK")
    self.likeButton = LikeButton.new({
      auth = function()
        self:go("scenes.victory", "scenes.login")
      end
    })

    self.homeButton.action = function()
        if self.parent then
          self.parent:clearGame()
          sfx:play("title", {loops = -1})
        end
        self:back()
    end

    self.nextButton.action = function()
        composer.gotoScene("scenes.game", {
            params = {
                mode = gameConfig.MODE_SINGLE_LEVEL,
                _isRandom = Level._isRandom,
                levels = self.params.levels,
                levelIdx = self.params.nextLevelIdx
            }
        })
    end

    self:insertButton(self.nextButton)
    self:insertButton(self.restartButton)
    self:insertButton(self.homeButton)
    self:insertButton(self.likeButton)
    --self:insertButton(self.rankButton)
end

function scene:onDidHide()

end

function scene:construct()
    self.buttonGap = gameConfig.contentHeight * 0.015
    self.score = ScaleText.new({text = "0/0", x = gameConfig.contentWidth/2, y = gameConfig.contentHeight*0.28, font = gameConfig.defaultFont, fontSize = 30})
    self.superGroup:insert(self.score)
    --self.buttons.y = gameConfig.contentHeight * 0.65

    self.newIcon = ScaleText.new({text = "New High Score!", x = gameConfig.contentWidth/2, y = gameConfig.contentHeight*0.22, font = gameConfig.defaultFont, fontSize = 30})
    transition.blink( self.newIcon, {time = 1500} )
    self.superGroup:insert(self.newIcon)
end

return scene
