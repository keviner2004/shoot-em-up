local gameConfig = require("gameConfig")
local composer = require( "composer" )
local BasicScene = require("scenes.templates.BasicScene")
local GlassPanel = require("ui.GlassPane")

local scene = BasicScene.new()

function scene:create( event )
   
    --print(pathOfThisFile)
    local sceneGroup = self.view
    self.gap = 10
    self.numOfRows = 5
    self.numOfCols = 6
    self.marginRight = 10
    self.marginLeft = 10
    self.marginTop = 20
    self.marginBottom = 20

    self.blockWidth = gameConfig.contentWidth / numOfCols 
    self.blockHeight = gameConfig.contentHeight / numOfRows 

    if self.blockWidth > 0 and self.blockHeight > 0 then
        for i = 1, self.numOfRows do
            
            local block = GlassPanel.new(w, h)
        end
    end

    sceneGroup:insert(self.superGroup)
end

function scene:show( event )
   local sceneGroup = self.view
   local phase = event.phase 
 
   if ( phase == "will" ) then
        
    
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end

-- "scene:hide()"
function scene:hide( event )
   
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.

   end
end
 
-- "scene:destroy()"
function scene:destroy( event )
 
   local sceneGroup = self.view
 
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end
 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene

