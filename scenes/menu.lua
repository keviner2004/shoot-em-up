local MenuScene = require("scenes.templates.MenuScene")
local scene = MenuScene.new() 
local composer = require("composer")
local logger = require("logger")
local TAG = "MENU"

function scene:getTitleText()
   return "Paused"
end

function scene:insertButtons()
   local restartButton = self:newRestartButton()
   local giveupButton = self:newGiveupButton()
   local resumeButton = self:newResumeButton()

   self:insertButton(resumeButton)
   self:insertButton(restartButton)
   self:insertButton(giveupButton)
end

return scene