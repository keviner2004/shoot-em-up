local GlassCornersPanel = require("ui.GlassCornersPanel")
local GlassProjectionPanel = require("ui.GlassProjectionPanel")
local composer = require( "composer" )

local scene = composer.newScene()
 
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )
   
   local sceneGroup = self.view
   local panelHeight = 0
   local panelWidth = 0
   local titleValue = event.params and event.params.title
   local glassPanel = GlassCornersPanel.new(display.contentWidth/2, display.contentHeight/2)
   
   glassPanel.x = display.contentWidth/2
   glassPanel.y = display.contentHeight/2

   local titleText = display.newText(titleValue, 0, 0, "kenvector_future_thin", 40)

   titleText.x = glassPanel.x
   titleText.y = glassPanel.y - glassPanel.contentWidth / 2

   local resumeButton = self:newResumeButton(glassPanel.x, glassPanel.y)

   sceneGroup:insert(glassPanel)
   sceneGroup:insert(titleText)
   sceneGroup:insert(resumeButton)

   self.onClose = event.params and event.params.onClose
end
 
function scene:newResumeButton(x, y)
   local button = GlassProjectionPanel.new(display.contentWidth/2 - 180, 70)
   button.x = x
   button.y = y
   button:setText("Resume")
   button.onTouch = function(button, event)
      composer.hideOverlay( "fade", 400 )
   end
   return button
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
      if self.onClose then
         self.onClose()
      end
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