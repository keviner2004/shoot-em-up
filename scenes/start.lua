local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")

local scene = MenuScene.new()

function scene:insertButtons()
   local startButton = self:newButton("Start")
   self.buttons:insert(startButton)
   function startButton:onTouch(event)
        --print("custom: "..event.phase.."/"..event.phase)
        if event.phase == "ended" then
            composer.gotoScene("scenes.game")
        end
   end
end

return scene