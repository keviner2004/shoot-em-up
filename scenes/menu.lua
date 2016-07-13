local MenuScene = require("scenes.templates.MenuScene")
local scene = MenuScene.new() 
local composer = require("composer")
local logger = require("logger")
local TAG = "MENU"

function scene:getTitleText()
   return "Paused"
end

function scene:insertButtons()
   local restartButton = self:newButton("Restart")
   local giveupButton = self:newButton("Giveup")
   local resumeButton = self:newResumeButton()

   restartButton.action = function(event)
      composer.gotoScene("scenes.game")
   end

   giveupButton.action = function(event)
      logger:info(TAG, "Give up game")
      composer.gotoScene("scenes.game", {params = {giveup = true}})  
   end

   self:insertButton(resumeButton)
   self:insertButton(restartButton)
   self:insertButton(giveupButton)
end

return scene