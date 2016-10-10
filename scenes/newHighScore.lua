local gameConfig = require("gameConfig")
local widget = require( "widget" )
local GlassTLCornersPanel = require("ui.GlassTLCornersPanel")
local GlassProjectionPanel = require("ui.GlassProjectionPanel")
local composer = require( "composer" )
local ScaleText = require( "ui.ScaleText" )
local BasicScene = require("scenes.templates.BasicScene")
--local scene = composer.newScene()
local scene = BasicScene.new()
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )

   local sceneGroup = self.view
   --self.superGroup = display.newGroup()
   --self.superGroup.x = gameConfig.contentX
   --self.superGroup.y = gameConfig.contentY
   local glassPanel = GlassTLCornersPanel.new(550, 500)

   glassPanel.x = gameConfig.contentWidth/2
   glassPanel.y = gameConfig.contentHeight/2
   local title = ScaleText.new({text = "New Record!", x = 0, y = 0, font = "kenvector_future_thin", fontSize = 20})
   title.x = glassPanel.x
   title.y = glassPanel.y - glassPanel.contentHeight / 2 + 70

   local score = (event.params and event.params.score) or 0
   local scoreText = ScaleText.new({text = score, x = 0, y = 0, font = "kenvector_future_thin", fontSize = 40})

   scoreText.x = glassPanel.x
   scoreText.y = title.y + 80

   local nameText = ScaleText.new({text = "Your Name", x = 0, y = 0, font = "kenvector_future_thin", fontSize = 40})
   nameText.x = glassPanel.x
   nameText.y = scoreText.y + 80

   self.nameTextField = native.newTextField(glassPanel.x, nameText.y + 80, glassPanel.contentWidth - 170, 50)

   self.superGroup:insert(glassPanel)
   self.superGroup:insert(title)
   self.superGroup:insert(scoreText)
   self.superGroup:insert(nameText)

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
   local okText = ScaleText.new({text = "OK", x = 0, y = 0, font = "kenvector_future_thin", fontSize = 35})
   okText.x = okButton.x
   okText.y = okButton.y

   self.nameTextField:addEventListener("userInput", self.nameTextField)

   self.nameTextField.align = "center"
   self.superGroup:insert(okButton)
   self.superGroup:insert(okText)
   self.superGroup:insert(self.nameTextField)
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

   elseif ( phase == "did" ) then

   end
end

-- "scene:hide()"
function scene:hide( event )
   self.nameTextField.isVisible = false
   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then

   elseif ( phase == "did" ) then
      print("high score window close")
      if self.params and self.params.onOk then
         print("call onok func")
         self.params.onOk(self.nameTextField.text)
      end
   end
end

function scene:destroy( event )
   local sceneGroup = self.view

end

return scene
