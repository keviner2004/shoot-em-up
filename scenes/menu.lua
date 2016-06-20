local MenuScene = require("scenes.templates.MenuScene")
local scene = MenuScene.new() 
local composer = require("composer")
function scene:getTitleText()
   return "Paused"
end

function scene:insertButtons()
   local restartButton = self:newButton("Restart")
   local giveupButton = self:newButton("Giveup")
   local resumeButton = self:newResumeButton()
   self.buttons:insert(resumeButton)
   self.buttons:insert(restartButton)
   self.buttons:insert(giveupButton)

   function restartButton:onTouch(event)
      --print("custom: "..event.phase.."/"..event.phase)
      if event.phase == "ended" then
         print("Restart game")
         composer.gotoScene("scenes.game")
      end
   end

   function giveupButton:onTouch(event)
      --print("custom: "..event.phase.."/"..event.phase)
      if event.phase == "ended" then
         print("Give up game")
         composer.gotoScene("scenes.game", {params = {giveup = true}})
      end
   end
end

return scene