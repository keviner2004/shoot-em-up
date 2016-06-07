local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local scene = MenuScene.new()
 
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:getTitleText()
   return "Game Over"
end

function scene:insertButtons()
   local rankButton = self:newButton("Rank")
   local restartButton = self:newButton("Restart")
   local giveupButton = self:newButton("Giveup")

   self.buttons:insert(rankButton)
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