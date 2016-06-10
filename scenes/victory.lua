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

   self.buttons:insert(restartButton)
   self.buttons:insert(giveupButton)
   self.buttons:insert(rankButton)

   function restartButton:onTouch(event)
      --print("custom: "..event.phase.."/"..event.phase)
      if event.phase == "ended" then
         composer.gotoScene("scenes.game")
      end
   end

   function giveupButton:onTouch(event)
      --print("custom: "..event.phase.."/"..event.phase)
      if event.phase == "ended" then
         composer.gotoScene("scenes.game", {params = {giveup = true}})
      end
   end

end
 
return scene