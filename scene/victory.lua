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
   local glassPanel = GlassCornersPanel.new(display.contentWidth/2, display.contentHeight/2)

   glassPanel.x = display.contentWidth/2
   glassPanel.y = display.contentHeight/2
   local gameOverTitleText = display.newText("Win", 0, 0, "kenvector_future_thin", 40)
   gameOverTitleText.x = glassPanel.x
   gameOverTitleText.y = glassPanel.y - glassPanel.contentWidth / 2

   local scoreTitleText = display.newText((event.params and event.params.score) or 0, 0, 0, "kenvector_future_thin", 40)
   scoreTitleText.x = glassPanel.x
   scoreTitleText.y = glassPanel.y - 150


   local rankButton = GlassProjectionPanel.new(display.contentWidth/2 - 180, 70)
   rankButton.x = glassPanel.x
   rankButton.y = glassPanel.y - 50
   rankText = display.newText("Rank", 0, 0, "kenvector_future_thin", 35)
   rankText.x = rankButton.x
   rankText.y = rankButton.y

   local restartButton = GlassProjectionPanel.new(display.contentWidth/2 - 180, 70)
   restartButton.x = glassPanel.x
   restartButton.y = glassPanel.y + 50
   restartText = display.newText("Restart", 0, 0, "kenvector_future_thin", 35)
   restartText.x = restartButton.x
   restartText.y = restartButton.y

   local giveupButton = GlassProjectionPanel.new(display.contentWidth/2 - 180, 70)
   giveupButton.x = glassPanel.x
   giveupButton.y = glassPanel.y + 150
   giveupText = display.newText("Exit", 0, 0, "kenvector_future_thin", 35)
   giveupText.x = giveupButton.x
   giveupText.y = giveupButton.y

   sceneGroup:insert(glassPanel)
   sceneGroup:insert(gameOverTitleText)
   sceneGroup:insert(scoreTitleText)
   sceneGroup:insert(restartButton)
   sceneGroup:insert(restartText)
   sceneGroup:insert(giveupButton)
   sceneGroup:insert(giveupText)
   sceneGroup:insert(rankButton)
   sceneGroup:insert(rankText)

   function restartButton:onTouch(event)
      --print("custom: "..event.phase.."/"..event.phase)
      if event.phase == "ended" then
         composer.gotoScene("gameScene")
      end
   end

   function giveupButton:onTouch(event)
      --print("custom: "..event.phase.."/"..event.phase)
      if event.phase == "ended" then
         composer.gotoScene("gameScene", {params = {giveup = true}})
      end
   end

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
      if event.params and event.params.onClose then
         event.params.onClose()
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