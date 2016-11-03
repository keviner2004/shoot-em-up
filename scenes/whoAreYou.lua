local gameConfig = require("gameConfig")
local logger = require("logger")
local widget = require( "widget" )
local GlassCornersPanel = require("ui.GlassCornersPanel")
local GlassProjectionPanel = require("ui.GlassProjectionPanel")
local composer = require( "composer" )
local BasicScene = require("scenes.templates.BasicScene")
local navigator = require("navigator")
local Keyboard = require("ui.CustomKeyboard")
local ScaleText = require("ui.ScaleText")
local Sprite = require("Sprite")
local util = require("util")
local dbHelper = require("dbHelper")
local TAG = "WhoAreYou"
--local scene = composer.newScene()
local scene = BasicScene.new()
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------

function scene:disableSelect(disable)
   self._disableSelect = disable
   if disable then
      self.cursor.isVisible = false
   else
      self.cursor.isVisible = true
   end
end

-- "scene:create()"
function scene:create( event )
   self.window = display.newGroup()
   --self.superGroup = display.newGroup()
   --self.superGroup.x = gameConfig.contentX
   --self.superGroup.y = gameConfig.contentY
   local glassPanel = GlassCornersPanel.new(gameConfig.contentWidth * 0.9, gameConfig.contentWidth * 0.4)

   self.cursor = Sprite["expansion-9"].new(gameConfig.defaultCursor)
   local nameText = ScaleText.new({text = "Who Are You?", x = 0, y = 0, font = gameConfig.defaultFont, fontSize = 25})
   nameText.fill = {40/255, 73/255, 95/255}
   self.lenOfName = 10
   self.gapInName = 0
   self.nameTextField = display.newGroup()
   self.nameTextField.y = 0
   self.buttonIdx = 1
   self.buttonArray = {}
   for i = 1, self.lenOfName do
      local ch = ScaleText.new({text = "_", x = 0, y = 0, font = gameConfig.defaultFont, fontSize = 30})
      self.nameTextField:insert(ch)
   end

   self.nameTextField.maxSize = self.lenOfName

   function self.nameTextField:getSize(text)
      local result = 0
      for i = 1, self.numChildren do
         if self[i].text and self[i].text ~= "" and self[i].text ~= "_" then
            result = result + 1
         end
      end
      return result
   end

   function self.nameTextField:resize()
      local width = 0
      for i = 1, self.numChildren do
         width = width + self[i].width
      end
      local left = -width/2
      local pre = 0
      for i = 1, self.numChildren do
         left = left + pre + self[i].width/2
         pre = self[i].width/2
         self[i].x = left
      end
   end
   self.nameTextField.index = 1
   function self.nameTextField:setText(text)
      logger:debug(TAG, "Set text %s", text)
      local blinked = false
      for i = 1, self.numChildren do
         local ch = string.sub(text, i, i)
         if not ch or ch == "" then
            ch = "_"
            if not blinked then
               self:blink(i)
               blinked = true
            end
         end
         self[i].text = ch
      end
      self:resize()
   end

   function self.nameTextField:blink(index)
      if not index then
         index = 1
      end

      if self.blinkTransition then
         transition.cancel(self.blinkTransition)
      end

      self[self.index].alpha = 1

      self.blinkTransition = transition.blink(self[index], {
         time = 2000
      })

      self.index = index
   end

   function self.nameTextField:getText(text)
      local result = ""
      for i = 1, self.numChildren do
         if self[i].text ~= "_" then
            result = result..self[i].text
         end
      end
      return result
   end

   self.nameTextField:blink()
   self.nameTextField:resize()

   local okButton = GlassProjectionPanel.new(gameConfig.contentWidth*0.25, gameConfig.contentWidth*0.12)

   okButton:setText("OK")

   local cancelButton = GlassProjectionPanel.new(gameConfig.contentWidth*0.25, gameConfig.contentWidth*0.12)

   cancelButton:setText("Cancel")


   local buttons = display.newGroup()
   self:disableSelect(true)
   self.buttonArray[1] = okButton
   self.buttonArray[2] = cancelButton
   self.params = event.params

   function okButton:onTouch(event)
      if event.phase == "ended" then
         scene:onOK()
      end
   end

   function cancelButton:onTouch(event)
      if event.phase == "ended" then
         scene:onCancel()
      end
   end

   local keyboard = Keyboard.new(gameConfig.contentWidth, gameConfig.contentHeight/2)
   self.keyboard = keyboard
   keyboard:disable()

   --insert to group
   self.window:insert(glassPanel)
   self.window:insert(nameText)
   self.window:insert(self.nameTextField)
   self.window:insert(keyboard)
   buttons:insert(okButton)
   buttons:insert(cancelButton)
   buttons:insert(self.cursor)
   self.superGroup:insert(self.window)
   self.superGroup:insert(keyboard)
   self.superGroup:insert(buttons)

   --position
   local buttonsGap = gameConfig.contentWidth*0.05
   local gap = gameConfig.contentWidth*0.05
   local buttonsWidth = okButton.width + cancelButton.width + buttonsGap
   local top = gameConfig.contentHeight/2 - (gap*2 + self.window.height + keyboard.height + buttons.height)/2

   glassPanel.x = 0
   glassPanel.y = 0

   nameText.x = glassPanel.x
   nameText.y = glassPanel.y - glassPanel.contentHeight/4

   okButton.x = (okButton.width - buttonsWidth)/2
   cancelButton.x = okButton.x + buttonsGap + (cancelButton.width + okButton.width)/2

   --print("~~~~~~~~~~~~~~~~~~~~",self.window.height, keyboard.height, buttons.height)

   self.window.x = gameConfig.contentWidth * 0.5
   self.window.y = top + self.window.height/2

   keyboard.x = gameConfig.contentWidth * 0.5
   keyboard.y = top + self.window.height + gap + keyboard.height/2

   buttons.x = gameConfig.contentWidth * 0.5
   buttons.y = top + self.window.height + gap + keyboard.height + gap + buttons.height/2

   --local red = display.newCircle( self.superGroup, gameConfig.contentWidth*0.5, gameConfig.contentHeight*0.5, 8 )
   function keyboard:onKeyPressd(value)
      --logger:debug(TAG, "User type %s", value)
      local currentText = scene.nameTextField:getText()
      local size = scene.nameTextField:getSize()
      if value == "enter" then

      elseif value == "del" then
         --logger:debug(TAG, "del %s/%d", currentText, size)
         if size > 0 then
            local result = string.sub(currentText, 1, size - 1)
            scene.nameTextField:setText(result)
         end
      else
         if(size < scene.nameTextField.maxSize)then
            --logger:debug(TAG, "max")
            scene.nameTextField:setText(currentText..value)
            self.text=txt
         end
      end
   end

   function keyboard:outFromTop()
      return true
   end

   function keyboard:outFromBottom()
      --print("keyboad out!!!!")
      scene.keyboardOut = true
      scene:disableSelect(false)
      scene:selectButton()
      self:disable()
      return true
   end

end

function scene:setButtonIndex(offset)
   self.buttonIdx = util.getRotateIndex(self.buttonIdx + offset, #self.buttonArray)
end

function scene:selectButton(offset)
   self.selectedButton = self.buttonArray[self.buttonIdx]
   self.cursor.x = self.selectedButton.x + self.selectedButton.width/4
   self.cursor.y = self.selectedButton.y + self.selectedButton.height/4
end

function scene:onCancel()
   self:back()
end

function scene:onKeyCancel()
   self:back()
end

function scene:onOK()
   local userName = self.nameTextField:getText()
   dbHelper:updateInfo("userName", userName)
   self:back()
end

function scene:onKeyRight()
   if self._disableSelect then
      return
   end
   --print("Select right")
   self:setButtonIndex(1)
   self:selectButton()
end

function scene:onKeyLeft()
   if self._disableSelect then
      return
   end
   --print("Select left")
   self:setButtonIndex(-1)
   self:selectButton()
end

function scene:onKeyUp()
   --print("disable select!!!!!!!!!!!!!!!!!!!!!!!!!")
   self:disableSelect(true)
   if self.keyboardOut then
      self.keyboardOut = false
      self.keyboard:enable()
      self.keyboard.posY = 5
   end
end

function scene:onKeyConfirm()
   if self._disableSelect then
      return
   end

   if self.selectedButton then
      print("Confirm at button ", self.buttonIdx)
      self.selectedButton:playSound()
   end
   if self.buttonIdx == 1 then
      self:onOK()
   elseif self.buttonIdx == 2 then
      self:onCancel()
   end
end

-- "scene:show()"
function scene:show( event )
   if self.nameTextField then
      self.nameTextField.isVisible = true
   end
   local phase = event.phase

   if ( phase == "will" ) then
      if self.params and self.params.text then
         self.nameTextField:setText(self.params.text)
      end
   elseif ( phase == "did" ) then
      self.keyboard:enable()
   end
end

-- "scene:hide()"
function scene:hide( event )
   self.nameTextField.isVisible = false
   local phase = event.phase

   if ( phase == "will" ) then
      self.keyboard:disable()
   elseif ( phase == "did" ) then
      --print("high score window close")
      if self.params and self.params.onOk then
         --print("call onok func")
         self.params.onOk(self.nameTextField.text)
      end
   end
end

function scene:destroy( event )

end

return scene
