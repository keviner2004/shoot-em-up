local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local Sprite = require("Sprite")
local logger = require("logger")
local gameConfig = require("gameConfig")
local sfx = require("sfx")
local TAG = "START MENU"
local navigator = require("navigator")
local dbHelper = require("dbHelper")
local facebook = require("facebook")
local ScaleText = require("ui.ScaleText")
local Title = require("ui.Title")
local scene = MenuScene.new()
local INDEX_START_1P = 1
local INDEX_START_2P = 2
local INDEX_LEADERBOARD = 3
local INDEX_WHO_ARE_YOU = 4
local INDEX_LOGIN = 5

local TEXT_LOGIN = "Sign in"
local TEXT_LOGOUT = "Logout"

function scene:init()
    logger:debug(TAG, "~~~~~~~~~~Init start scene~~~~~~~~~~")
    navigator:clear()
    self.menuWidth = math.round(gameConfig.contentWidth*0.8)
    self.menuHeight = math.round(gameConfig.contentHeight*0.5)
    if gameConfig.singlePlayerOnly then
      INDEX_START_1P = 1
      INDEX_START_2P = 999
      INDEX_LEADERBOARD = 2
      INDEX_WHO_ARE_YOU = 3
      INDEX_LOGIN = 4
    else
      INDEX_START_1P = 1
      INDEX_START_2P = 2
      INDEX_LEADERBOARD = 3
      INDEX_WHO_ARE_YOU = 4
      INDEX_LOGIN = 5
    end
end

function scene:construct()
    local logo = Sprite["expansion-9"].new("Logo")
    local versionTxt = ScaleText.new({
      text = "Ver."..gameConfig.version,
      x = 0, y = 0, font = gameConfig.defaultFont, fontSize = 17
    })
    self.superGroup:insert(logo)
    self.superGroup:insert(versionTxt)
    self.logo = logo
    self.versionTxt = versionTxt
    self.glassPanel.alpha = 0
end

function scene:insertButtons()
    logger:debug(TAG, "insertButtons")

    local function blink(btn, show)
        if not show then
            alpha = 0.65
        else
            alpha = 1
        end
        transition.to(btn, {time = 300, alpha = alpha, onComplete =
            function()
                return blink(btn, not show)
            end
        })
    end
    local startButtonText = "~Start~"
    if not gameConfig.singlePlayerOnly then
      startButtonText = "~1P~"
    end
    local startButton = self:newButton(startButtonText)
    startButton.buttonView.alpha = 0
    startButton.buttonText.size = 30  * gameConfig.scaleFactor
    startButton.pressSound = "start"
    startButton.buttonView.isHitTestable = true
    blink(startButton)
    self:insertButton(startButton)
    if not gameConfig.singlePlayerOnly then
      local secondButton = self:newButton("~2P~")
      secondButton.buttonView.alpha = 0
      secondButton.buttonText.size = 30 * gameConfig.scaleFactor
      secondButton.pressSound = "start"
      secondButton.buttonView.isHitTestable = true
      blink(secondButton)
      self:insertButton(secondButton)
    end
    local userButton = self:createUserButton()
    local leaderBoardButton = self:createLeaderBoardButton()
    local loginButton = self:createLoginButton()
    self:insertButton(leaderBoardButton)
    self:insertButton(userButton)
    self:insertButton(loginButton)
    self.userButton = userButton
    self.leaderBoardButton = leaderBoardButton
    self.loginButton = loginButton
    --[[
    function startButton:onTouch(event)
        --print("!!!!!!!!!!!!")
        --print("custom: "..event.phase.."/"..event.phase)
        if event.phase == "ended" then
            gameConfig.numOfPlayers = 1
            --scene:startGame()
            scene:selectLevel()
        end
    end

    function secondButton:onTouch(event)
        --print("!!!!!!!!!!!!")
        --print("custom: "..event.phase.."/"..event.phase)
        if event.phase == "ended" then
            gameConfig.numOfPlayers = 2
            --scene:startGame()
            scene:selectLevel()
        end
    end
    --]]

end

function scene:createUserButton()
    local button = display.newGroup()
    --add user icon
    local userIcon = Sprite["expansion-9"].new("UI/Icons/oneUser")
    --add user name
    local userText = ScaleText.new({
      text = "",
      x = 0,
      y = 0,
      font = gameConfig.defaultFont,
      fontSize = 17
    })
    local gap = 15
    userIcon.xScale = 0.5
    userIcon.yScale = 0.5
    button:insert(userText)
    button:insert(userIcon)

    function button:resize()
        local width = userText.width + userIcon.contentWidth
        userIcon.x = (userIcon.contentWidth - width)/2
        userText.x = userIcon.x + gap + (userIcon.contentWidth + userText.width)/2
    end

    function button:setUserName(text)
        userText.text = text
        self:resize()
    end

    button:setUserName("Who are you?")

    return button
end

function scene:createLoginButton()
  local button = display.newGroup()
  local title = Title.new({
    text = {
        font = native.systemFont,
        fontSize = 20,
        value = TEXT_LOGIN
    }
  })

  button:insert(title)
  --button:insert(text)
  self.loginTitle = title
  return button
end

function scene:createLeaderBoardButton()
    local button = display.newGroup()
    --add user icon
    local icon = Sprite["expansion-9"].new("UI/Icons/leaderBoard")
    --add user name
    local text = ScaleText.new({text = "", x = 0, y = 0, font = gameConfig.defaultFont, fontSize = 20})
    local gap = 15

    button:insert(text)
    button:insert(icon)

    function button:resize()
        local width = text.width + icon.width
        icon.x = (icon.width - width)/2
        text.x = icon.x + gap + (icon.width + text.width)/2
    end

    function button:setText(value)
        text.text = value
        self:resize()
    end

    button:setText("")

    return button
end

function scene:startGame()
    logger:debug(TAG, "Start the game")
    composer.gotoScene("scenes.game")
end

function scene:selectLevel()
    navigator:push("scenes.start")
    composer.showOverlay( "scenes.chapterSelection", {
        isModal = true,
        effect = "fromRight",
        time = 400
    })
end

function scene:onWillShow( event )
    local userName = dbHelper:getInfo("userName")
    if not userName or userName == "" then
        userName = "Who are you?"
    end
    self.userButton:setUserName(userName)
    self.logo.x = gameConfig.contentWidth/2
    self.logo.y = self.buttons.y - (self.buttons.height + self.logo.height) * 0.5 - gameConfig.contentHeight * 0.05
    self.versionTxt.x = self.logo.x
    self.versionTxt.y = self.logo.y + self.logo.height/2 + self.versionTxt.height/2

    self.leaderBoardButton.y = self.leaderBoardButton.y + gameConfig.contentHeight * 0.05
    self.userButton.y = self.leaderBoardButton.y + (self.leaderBoardButton.height + self.userButton.height)/2 + gameConfig.contentHeight * 0.05
    self.loginButton.y = self.userButton.y + (self.userButton.height + self.loginButton.height)/2 + gameConfig.contentHeight * 0.05
end

function scene:updateLoginStatus()
  if facebook.getCurrentAccessToken() then
    self.loginTitle:setText(TEXT_LOGOUT)
  else
    self.loginTitle:setText(TEXT_LOGIN)
  end
end

function scene:onDidShow( event )
  --self:alert("Welcome")
  --auto login
  local autoLogin = dbHelper:getAutoSignIn()
  logger:debug(TAG, "check need login to facebook, autoLogin: %s, disable: %s", tostring(autoLogin), tostring((event.params and event.params.action == "disableLogin") or 0))
  if autoLogin and not (event.params and event.params.action == "disableLogin") then
    logger:debug(TAG, "login with facebook")
    facebook.login(function(status)
      logger:debug(TAG, "login with status %s", status)
        if status == facebook.STATUS_LOGIN then
          self:updateLoginStatus()
          facebook.getUserInfo(function(info)
            dbHelper:setLoginType("FB")
            dbHelper:setUser(info.id or "")
          end)
      end
    end)
  else
    self:updateLoginStatus()
  end
end

function scene:onWillHide( event )

end

function scene:onConfirm(buttonSelectedIndex)
    logger:debug(TAG, "Select mode %d", buttonSelectedIndex)
    sfx:play("start")
    --if name is empty, fore user add it
    local userName = dbHelper:getUserName()
    if not userName or userName == "" then
        logger:warn(TAG, "No user name, force user to create it")
        self:go("scenes.start", "scenes.whoAreYou")
        return
    end

    if buttonSelectedIndex == INDEX_LOGIN then
        --sfx:play("start")
        --LOGIN OR LOGOUT
        if facebook.getCurrentAccessToken() then
            --logout
            facebook.logout(function(status)
              dbHelper:enableAutoSignIn(false)
              self:updateLoginStatus()
            end)
        else
          self:go("scenes.start", "scenes.login", {
              text = userName
          })
        end
        return
    end

    if buttonSelectedIndex == INDEX_WHO_ARE_YOU then
        --sfx:play("start")
        self:go("scenes.start", "scenes.whoAreYou", {
            text = userName
        })
        return
    end
    if buttonSelectedIndex == INDEX_LEADERBOARD then
        --sfx:play("start")
        self:go("scenes.start", "scenes.leaderBoardSelection")
        return
    end
    if buttonSelectedIndex == INDEX_START_2P then
        gameConfig.numOfPlayers = 2
    elseif buttonSelectedIndex == INDEX_START_1P then
        gameConfig.numOfPlayers = 1
    end
    self:selectLevel()
    --self:startGame()
end


return scene
