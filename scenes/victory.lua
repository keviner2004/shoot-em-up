local gameConfig = require("gameConfig")
local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local navigator = require("navigator")
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
    if self.params and self.params.showNextLevel then
        self.nextButton.isVisible = true
        self:resizeButtons()
        self.nextButton.y = self.nextButton.y - gameConfig.contentHeight*0.03
        --self.rankButton.y = self.rankButton.y + gameConfig.contentHeight*0.03
        self.restartButton.y = self.restartButton.y + gameConfig.contentHeight*0.03
        self.homeButton.y = self.homeButton.y + gameConfig.contentHeight*0.03
    else
        self.nextButton.isVisible = false
        --self.rankButton.y = self.rankButton.y - gameConfig.contentHeight*0.03
        self.restartButton.y = self.restartButton.y - gameConfig.contentHeight*0.03
        self.homeButton.y = self.homeButton.y - gameConfig.contentHeight*0.03
        self:resizeButtons()
    end
    self.score.text = score

    if event.params and event.params.newRecord then
        self.newIcon.isVisible = true
    else
        self.newIcon.isVisible = false    
    end

    --self.nextButton.xScale = 0.9
    --self.nextButton.yScale = 0.8
end

function scene:insertButtons()
    self.nextButton = self:newButton("CONTINUE")
    --self.rankButton = self:newButton("Rank")
    self.restartButton = self:newRestartButton()
    self.homeButton = self:newButton("BACK")

    self.homeButton.action = function()
        self.parent:clearGame()
        self:back()
    end

    self.nextButton.action = function()
        composer.gotoScene("scenes.game", {
            params = {
                mode = gameConfig.MODE_SINGLE_LEVEL,
                levels = self.params.levels,
                levelIdx = self.params.nextLevelIdx
            }
        })
    end

    self:insertButton(self.nextButton)
    self:insertButton(self.restartButton)
    self:insertButton(self.homeButton)
    --self:insertButton(self.rankButton)   
end

function scene:onDidHide()

end

function scene:construct()
    self.buttonGap = gameConfig.contentHeight * 0.015
    self.score = display.newText("0/0", gameConfig.contentWidth/2, gameConfig.contentHeight*0.28, gameConfig.defaultFont, 60)
    self.superGroup:insert(self.score)
    --self.buttons.y = gameConfig.contentHeight * 0.65

    self.newIcon = display.newText("New High Score!", gameConfig.contentWidth/2, gameConfig.contentHeight*0.22, gameConfig.defaultFont, 40)
    transition.blink( self.newIcon, {time = 1500} )
    self.superGroup:insert(self.newIcon)
end

return scene