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
   
   restartButton.action = function(event)
         print("Restart game")
         composer.gotoScene("scenes.game")
   end

   rankButton.action = function(event)
         print("Restart game")
         composer.gotoScene("scenes.game")
   end

   giveupButton.action = function(event)
         print("Give up game")
         composer.gotoScene("scenes.game", {params = {giveup = true}})
   end
   
   self:insertButton(rankButton)
   self:insertButton(restartButton)
   self:insertButton(giveupButton)
end
 
return scene