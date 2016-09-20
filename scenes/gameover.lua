local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local scene = MenuScene.new()
local gameConfig = require("gameConfig")
local ScaleText = require("ui.ScaleText")
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------

function scene:construct()
    self.newIcon = ScaleText.new({
      text = "New High Score!",
      x = gameConfig.contentWidth/2,
      y = gameConfig.contentHeight*0.22,
      font = gameConfig.defaultFont,
      fontSize = 40
    })
    transition.blink( self.newIcon, {time = 1500} )
    self.score = ScaleText.new({
      text = "0",
      x = gameConfig.contentWidth/2,
      y = gameConfig.contentHeight*0.28,
      font = gameConfig.defaultFont,
      fontSize = 60
    })
    self.superGroup:insert(self.score)
    self.superGroup:insert(self.newIcon)
end

function scene:onWillShow(event)
    local score = (event.params and event.params.score) or 1200
    self.score.text = score
    if event.params and event.params.newRecord then
        self.newIcon.isVisible = true
    else
        self.newIcon.isVisible = false
    end
end

function scene:getTitleText()
   return "Game Over"
end

function scene:insertButtons()
   --local rankButton = self:newButton("Rank")
   local restartButton = self:newRestartButton()
   local giveupButton = self:newGiveupButton()

   --self:insertButton(rankButton)
   self:insertButton(restartButton)
   self:insertButton(giveupButton)
end

return scene
