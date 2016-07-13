local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local scene = MenuScene.new()
 
function scene:getTitleText()
   return "Win"
end

function scene:insertButtons()
   local rankButton = self:newButton("Rank")
   local restartButton = self:newButton("Restart")
   local giveupButton = self:newButton("Exit")

   restartButton.action = function(event)
      --print("custom: "..event.phase.."/"..event.phase)
         composer.gotoScene("scenes.game")
   end

   giveupButton.action = function(event)
         composer.gotoScene("scenes.game", {params = {giveup = true}})
   end

   self:insertButton(restartButton)
   self:insertButton(giveupButton)
   self:insertButton(rankButton)

end
 
return scene