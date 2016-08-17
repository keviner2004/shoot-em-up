local composer = require("composer")
local MenuScene = require("scenes.templates.MenuScene")
local Sprite = require("Sprite")
local logger = require("logger")
local gameConfig = require("gameConfig")
local sfx = require("sfx")
local TAG = "START MENU"
local navigator = require("navigator")
local dbHelper = require("dbHelper")
local scene = MenuScene.new()

function scene:init()
    logger:info(TAG, "~~~~~~~~~~Init start scene~~~~~~~~~~")
    navigator:clear()
    self.menuWidth = math.round(gameConfig.contentWidth*0.8)
    self.menuHeight = math.round(gameConfig.contentHeight*0.5)
end

function scene:construct()
    local logo = Sprite.new("Logo")
    local versionTxt = display.newText("Ver."..gameConfig.version, 0, 0, gameConfig.defaultFont, 32)
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
                blink(btn, not show)
            end
        })
    end

    local startButton = self:newButton("~1P~")
    startButton.buttonView.alpha = 0
    startButton.buttonText.size = 60
    startButton.pressSound = "start"
    startButton.buttonView.isHitTestable = true
    blink(startButton)
    self:insertButton(startButton)

    local secondButton = self:newButton("~2P~")
    secondButton.buttonView.alpha = 0
    secondButton.buttonText.size = 60
    secondButton.pressSound = "start"
    secondButton.buttonView.isHitTestable = true
    blink(secondButton)
    self:insertButton(secondButton)

    local userButton = self:createUserButton()
    local leaderBoardButton = self:createLeaderBoardButton()
    self:insertButton(leaderBoardButton)
    self:insertButton(userButton)
    self.userButton = userButton
    self.leaderBoardButton = leaderBoardButton
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
    local userIcon = Sprite.new("UI/Icons/oneUser")
    --add user name
    local userText = display.newText("", 0, 0, gameConfig.defaultFont, 35)
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

function scene:createLeaderBoardButton()
    local button = display.newGroup()
    --add user icon
    local icon = Sprite.new("UI/Icons/leaderBoard")
    --add user name
    local text = display.newText("", 0, 0, gameConfig.defaultFont, 40)
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
    logger:info(TAG, "Start the game")
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
end

function scene:onWillHide( event )
    
end

function scene:onConfirm(buttonSelectedIndex)
    logger:info(TAG, "Select mode %d", buttonSelectedIndex)
    sfx:play("start")
    --if name is empty, fore user add it
    local userName = dbHelper:getUserName()
    if not userName or userName == "" then
        logger:warn(TAG, "No user name, force user to create it")
        self:go("scenes.start", "scenes.whoAreYou")
        return
    end

    if buttonSelectedIndex == 4 then
        self:go("scenes.start", "scenes.whoAreYou", {
            text = userName
        })
        return 
    end
    if buttonSelectedIndex == 3 then
        self:go("scenes.start", "scenes.leaderBoardSelection")
        return 
    end
    if buttonSelectedIndex == 2 then
        gameConfig.numOfPlayers = 2
    elseif buttonSelectedIndex == 1 then
        gameConfig.numOfPlayers = 1
    end
    self:selectLevel()
    --self:startGame()
end


return scene