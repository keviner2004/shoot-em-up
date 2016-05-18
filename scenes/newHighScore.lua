local widget = require( "widget" )
local GlassTLCornersPanel = require("ui.GlassTLCornersPanel")
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
   local glassPanel = GlassTLCornersPanel.new(550, 500)

   glassPanel.x = display.contentWidth/2
   glassPanel.y = display.contentHeight/2
   local title = display.newText("New Record!", 0, 0, "kenvector_future_thin", 40)
   title.x = glassPanel.x
   title.y = glassPanel.y - glassPanel.contentHeight / 2 + 70 

   local score = (event.params and event.params.score) or 0
   local scoreText = display.newText(score, 0, 0, "kenvector_future_thin", 40)
   
   scoreText.x = glassPanel.x
   scoreText.y = title.y + 80

   local nameText = display.newText("Your Name", 0, 0, "kenvector_future_thin", 40)
   nameText.x = glassPanel.x
   nameText.y = scoreText.y + 80

   self.nameTextField = native.newTextField(glassPanel.x, nameText.y + 80, glassPanel.contentWidth - 170, 50)

   sceneGroup:insert(glassPanel)
   sceneGroup:insert(title)
   sceneGroup:insert(scoreText)
   sceneGroup:insert(nameText)

   
   function self.nameTextField:userInput( event )
      if ( event.phase == "began" ) then
         -- user begins editing textField
         print( "Begin editing", event.target.text )
      elseif ( event.phase == "ended" or event.phase == "submitted" ) then
         -- do something with defaulField's text
         print( "Final Text: ", event.target.text )
         native.setKeyboardFocus( nil )
      elseif ( event.phase == "editing" ) then
            local txt = event.text 
            print("txt: "..txt)           
            if(string.len(txt)>10)then
               print("max")
               txt=string.sub(txt, 1, 10)
               self.text=txt
            end
      end
   end

   local okButton = GlassProjectionPanel.new(200, 70)
   okButton.x = glassPanel.x
   okButton.y = self.nameTextField.y + 100
   local okText = display.newText("OK", 0, 0, "kenvector_future_thin", 35)
   okText.x = okButton.x
   okText.y = okButton.y

   self.nameTextField:addEventListener("userInput", self.nameTextField)

   self.nameTextField.align = "center"
   sceneGroup:insert(okButton)
   sceneGroup:insert(okText)
   sceneGroup:insert(self.nameTextField)
   self.params = event.params 

   function okButton:onTouch(event)
      print("custom: "..event.phase.."/"..event.phase)
      if event.phase == "ended" then
         print("hide overlay")
         composer.hideOverlay( "fade", 400 )
      end
   end
end
 
-- "scene:show()"
function scene:show( event )
   if self.nameTextField then
      self.nameTextField.isVisible = true
   end
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
   self.nameTextField.isVisible = false
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
      print("high score window close")
      if self.params and self.params.onOk then
         print("call onok func")
         self.params.onOk(self.nameTextField.text)
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