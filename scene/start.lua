local GlassCornersPanel = require("ui.GlassCornersPanel")
local GlassProjectionPanel = require("ui.GlassProjectionPanel")
local composer = require( "composer" )
local scene = composer.newScene()

-- "scene:create()"
function scene:create( event )
   
   local sceneGroup = self.view
   local glassPanel = GlassCornersPanel.new(display.contentWidth/2, display.contentHeight/2)
   glassPanel.x = display.contentWidth/2
   glassPanel.y = display.contentHeight/2
   local startButton = GlassProjectionPanel.new(display.contentWidth/2 - 180, 70)
   startButton.x = glassPanel.x
   startButton.y = glassPanel.y
   restartText = display.newText("Start", 0, 0, "kenvector_future_thin", 35)
   restartText.x = startButton.x
   restartText.y = startButton.y
   sceneGroup:insert(glassPanel)
   sceneGroup:insert(startButton)
   sceneGroup:insert(restartText)
   function startButton:onTouch(event)
        --print("custom: "..event.phase.."/"..event.phase)
        if event.phase == "ended" then
            composer.gotoScene("scene.game")
        end
   end
   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end
 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase 
 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
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
 
---------------------------------------------------------------------------------
 
return scene