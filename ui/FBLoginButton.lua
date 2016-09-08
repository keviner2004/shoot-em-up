local Sprite = require("Sprite")
local Text = require("ui.ScaleText")
local Button = require("ui.Button")
local logger = require("logger")
local facebook = require("facebook")
local dbHelper = require("dbHelper")
local TAG = "FBLoginButton"
local FBLoginButton = {}

FBLoginButton.new = function(width, height)
  local fbLoginBtn = Button.new()
  local fbIcon = Sprite.new("UI/Icons/1")
  local background = display.newRect( 0, 0, width, height )
  background.fill = {51/255, 137/255, 205/255}
  local paddingLeft = 10
  local paddingRight = 10
  --position
  local iconWidth = width * 0.25
  local iconHeight = height
  local iconBackground = display.newRect( 0, 0, iconWidth, iconHeight )
  iconBackground.fill = {122/255, 178/255, 221/255}
  local textFieldWidth = width - iconWidth
  local textFieldHeight = height
  local text = Text.new({
    text = "Sign in with facebook",
    font = native.systemFont,
    fontSize = 15
  })
  local left = -width/2
  local top = -height/2
  fbIcon.x = left + iconWidth/2
  fbIcon.y = 0
  iconBackground.x = fbIcon.x
  iconBackground.y = fbIcon.y
  text.x = left + iconWidth + textFieldWidth/2
  text.y = 0

  fbLoginBtn:insert(background)
  fbLoginBtn:insert(iconBackground)
  fbLoginBtn:insert(text)
  fbLoginBtn:insert(fbIcon)

  logger:warn(TAG, "Display fb login")

  --facebook.setFBConnectListener( facebookListener )

  fbLoginBtn.click = function(event)
    logger:info(TAG, "fb login request")
    facebook.login(function(status)
      logger:info(TAG, "login result")
      if status == facebook.STATUS_LOGIN then
        dbHelper:enableAutoSignIn()
        if fbLoginBtn.onLogined then
          fbLoginBtn.onLogined()
        end
      end
    end)
  end

  return fbLoginBtn
end
return FBLoginButton
