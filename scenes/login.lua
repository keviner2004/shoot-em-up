local BasicScene = require("scenes.templates.BasicScene")
local Text = require("ui.ScaleText")
local Panel = require("ui.GlassPanel")
local gameConfig = require("gameConfig")
local FBLoginButton = require("ui.FBLoginButton")
local PanelButton = require("ui.GlassProjectionPanel")
local logger = require("logger")
local dbHelper = require("dbHelper")
local TAG = "login"
local SharePointer = require("ui.SharePointer")
local util = require("util")
local scene = BasicScene.new()

function scene:create( event )
  local panelWidth = gameConfig.contentWidth*0.95
  local panelHeight = gameConfig.contentHeight*0.5
  local textBlockWidth = panelWidth * 0.9
  local textBlockHeight = panelHeight * 0.5
  local buttonBlockWidth = panelWidth
  local buttonBlockHeight = panelHeight*0.4
  local closeButtonFieldHeight = panelHeight*0.1
  local closeButtonFieldWidth = panelWidth
  local left = -panelWidth/2
  local top = -panelHeight/2

  self.window = display.newGroup()
  self.tipText = Text.new({
    text = "Sign in and have more fun! Enjoiy new mods and help us to rating levels.",
    font = native.systemFont,
    width = textBlockWidth,
    fontSize = 15
  })
  self.panel = Panel.new(panelWidth, panelHeight)
  self.closeButton = PanelButton.new(closeButtonFieldWidth, closeButtonFieldHeight)
  self.closeButton:setText("Close")
  --create facebook login button
  self.fbLoginBtn = FBLoginButton.new(gameConfig.contentWidth*0.6, gameConfig.contentHeight * 0.07)
  --position
  self.window.x = gameConfig.contentWidth/2
  self.window.y = gameConfig.contentHeight/2
  self.tipText.x = 0
  self.tipText.y = top + textBlockHeight/2
  self.fbLoginBtn.x = 0
  self.fbLoginBtn.y = top + textBlockHeight + buttonBlockHeight/2
  self.closeButton.x = 0
  self.closeButton.y = top + textBlockHeight + buttonBlockHeight + closeButtonFieldHeight/2
  self.closeButton.click = function()
    logger:debug(TAG, "Close login page")
    self:back()
  end
  --insert to group
  self.window:insert(self.panel)
  self.window:insert(self.tipText)
  self.window:insert(self.closeButton)
  self.window:insert(self.fbLoginBtn)
  self.superGroup:insert(self.window)
  self.groupIdx = 1
  self.group = {
    {
      instance = self.fbLoginBtn,
      action = self.fbLoginBtn.click
    }, 
    {
      instance = self.closeButton,
      action = self.closeButton.click
    }
  }
  self.fbLoginBtn.onLogined = function()
    self:back({
      params = {
        action = "disableLogin"
      }
    })
  end

end

function scene:show( event )
    local phase = event.phase
    if ( phase == "will" ) then
      self.pointer = SharePointer.new()
      self.pointer.x = 9999
      self.view:insert(self.pointer)
    elseif ( phase == "did" ) then

    end
end

-- "scene:hide()"
function scene:hide( event )
   local phase = event.phase
   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
      self.pointer:removeSelf()
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function scene:destroy( event )
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

function scene:select(offset)
  self.groupIdx = util.getRotateIndex(self.groupIdx + offset, #self.group)
  self.pointer.x, self.pointer.y = self.group[self.groupIdx].instance:localToContent( 0, 0 )
  self.pointer.x = self.pointer.x + self.group[self.groupIdx].instance.height/2
  self.pointer.y = self.pointer.y + self.group[self.groupIdx].instance.height/2
end

function scene:onKeyUp(event)
  self:select(-1)
end

function scene:onKeyDown(event)
  self:select(1)
end

function scene:onKeyLeft(event)

end

function scene:onKeyRight(event)

end

function scene:onKeyConfirm(event)
  self.group[self.groupIdx].action()
end

function scene:onKeyCancel(event)
  self:back()
end
return scene
