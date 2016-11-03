require("constant")
local sfx = require("sfx")
local RedPlane = require("characters.RedPlane")
local BluePlane = require("characters.BluePlane")
local Backgrounds = require("Background")
local physics = require( "physics" )
local move = require("move")
local Level = require("Level")
local Wall = require("Wall")
local GlassPanel = require("ui.GlassPanel")
local ScaleText = require("ui.ScaleText")
local Square = require("ui.Square")
local Sprite = require("Sprite")
local dbHelper = require("dbHelper")
local composer = require( "composer" )
local Score = require("ui.Score")
local widget = require("widget")
local Character = require("Character")
local logger = require("logger")
local gameConfig = require("gameConfig")
local util = require("util")
local BasicScene = require("scenes.templates.BasicScene")
local Pool = require("Pool")
local LinearGroup = require("ui.LinearGroup")
local PooledItemExplosion = require("effects.PooledItemExplosion")
local PooledStarExplosion = require("effects.PooledStarExplosion")
local STATUS_STOPPED = "stopped"
local STATUS_PAUSED = "paused"
local STATUS_WAIT = "wait"
local STATUS_STARTED = "started"
local TAG = "gamescene"

system.setIdleTimer( false )
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------

-- local forward references should go here

---------------------------------------------------------------------------------

local scene = BasicScene.new()

-- "scene:create()"
function scene:create( event )
    logger:debug(TAG, "scene:create")
    local sceneGroup = self.view
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
    --enable pyhsic
    physics.start()
    physics.setGravity(0, 0)
    physics.setReportCollisionsInContentCoordinates( true )
    if gameConfig.debugPhysics then
        physics.setDrawMode( "hybrid" )
    end

    self.first = true
    self.status = STATUS_WAIT
    self.stageSpeed = gameConfig.stageSpeed
    self.level = Level.load()
    self.globalScore = 0
    self.gameOptions = {}
    local backgrounds = Backgrounds.new(self.stageSpeed)
    backgrounds:startMoveLoop()
    if gameConfig.debugFPS then
        self:fpsMesure()
    end
    --UI

    self.superGroup.x = gameConfig.contentX
    self.superGroup.y = gameConfig.contentY
    --add to the scene
    --sceneGroup:insert(backgrounds)
    self.superGroup:insert(backgrounds)
end

function scene:createPauseBtn()
    self.pauseButton = widget.newButton({
        sheet = Sprite["expansion-9"].getSheet(),
        defaultFrame = Sprite["expansion-9"].getFrameIndex("UI/Icons/pause"),
        overFrame = Sprite["expansion-9"].getFrameIndex("UI/Icons/pause"),
        label = "",
        onEvent = function ( event )
            if ( "ended" == event.phase ) then
                self:toggleGame()
            end
        end
    })
    self.pauseButton.xScale = 0.5
    self.pauseButton.yScale = 0.5
    self.pauseButton.x = gameConfig.contentWidth - self.pauseButton.contentWidth - 10
    self.pauseButton.y = gameConfig.contentHeight - self.pauseButton.contentHeight
    self.hudGroup:insert(self.pauseButton)
    Runtime:addEventListener("touch", self)
end

function scene:createPlayerLifeUI()
    local playerLife = LinearGroup.new({
      gap = display.contentWidth*0.01
    })
    local lifeIcon = Sprite["expansion-9"].new("UI/Player-lifes/2")
    self.playerLifeText = ScaleText.new({
      text = 0,
      x = 0,
      y = 0,
      font = "kenvector_future_thin",
      fontSize = 20
    })
    --local totalL = lifeIcon.width/2 + 50 + self.playerLifeText.width/2
    --lifeIcon.x = - totalL/2 + lifeIcon.width/2
    --lifeIcon.y = 0
    --self.playerLifeText.x = totalL/2 - self.playerLifeText.width/2

    playerLife:insert(lifeIcon)
    playerLife:insert(self.playerLifeText)
    playerLife:resize()
    playerLife.x = playerLife.width/2
    playerLife.y = gameConfig.contentHeight - playerLife.height/2
    self.hudGroup:insert(playerLife)
end

function scene:toggleGame()
    logger:debug(TAG, "toggleGame")
    if self.status == STATUS_STARTED then
        if self.lockToggleGame then
            logger:debug(TAG, "Toggle game locked")
            return
        end
        self.lockToggleGame = true
        composer.showOverlay( "scenes.menu", {
            effect = "fade",
            time = 500,
            isModal = true,
            params = {
                title = "Pause",
                onClose = function()
                    self.lockToggleGame = false
                end
            }
        })
        self:pauseGame()
    elseif self.status == STATUS_PAUSED then
        composer.hideOverlay( "fade", 400 )
        self:resumeGame()
    end
end

function scene:touch(event)
    if event.phase == "began" then
        transition.cancel(self.pauseButton)
        transition.to(self.pauseButton, {time = 300, alpha = 0})
    elseif event.phase == "moved" then

    elseif event.phase == "ended" then
        transition.cancel(self.pauseButton)
        transition.to(self.pauseButton, {time = 300, alpha = 1})
    end
end

function scene:onKeyCancel(event)
    if self.status == STATUS_STOPPED then
        return
    end
    logger:debug(TAG, "toggle game status")
    self:toggleGame()
end

function scene:fpsMesure()
    self.debugBar = LinearGroup.new({gap = gameConfig.contentWidth * 0.03})
    local runtime = 0
    self.fpsText = ScaleText.new({
      text = 0,
      x = 0,
      y = 0,
      font = "kenvector_future_thin",
      fontSize = 20
    })
    self.numOfObjectsText = ScaleText.new({
      text = 0,
      x = 0,
      y = 0,
      font = "kenvector_future_thin",
      fontSize = 20
    })
    self.debugBar:insert(self.fpsText)
    self.debugBar:insert(self.numOfObjectsText)
    self.debugBar:resize()
    self.debugBar.x = self.debugBar.width * 0.8
    self.debugBar.y = self.debugBar.height/2

    local count = 0

    local function getFPS()
        local temp = system.getTimer()-- Get current game time in ms
        local fps = math.floor(1000 / (temp-runtime)) -- 60 fps or 30 fps as `e
        runtime = temp  -- Store game time
        return fps
    end

    -- Frame update function
    local function frameUpdate()
        -- Delta Time value
        count = count + 1
        if count == 20 then
            getFPS()
        elseif count == 21 then
            local fps = getFPS()
            self.fpsText.text = fps
            if self.mainGroup then
                self.numOfObjectsText.text = self.mainGroup.numChildren
            end
            if fps < display.fps / 2 then
                logger:warn(TAG, "FPS: "..fps)
            end
            count = 0
        end
    end
    Runtime:addEventListener("enterFrame", frameUpdate)
end



function scene:pauseGame()
    logger:debug(TAG, "Pause game")
    if self.status == STATUS_PAUSED then
        --print("The game is paused")
        return
    end
    self.level:pause()
    physics.pause()
    --pause objets in main group
    if self.mainGroup and self.mainGroup.numChildren then
        for i = 1, self.mainGroup.numChildren do
            local v = self.mainGroup[i]
            if v.name then
                --print("pause obj: "..v.name)
            end
            if v.freeze then
                v:freeze()
            end
        end
    end
    sfx:pause()
    self.status = STATUS_PAUSED
end

function scene:hideHUD()
    if self.hudGroup then
        self.hudGroup.isVisible = false
    end
end

function scene:showHUD()
    if self.hudGroup then
        self.hudGroup.isVisible = true
    end
end

function scene:clearGame()
    logger:debug(TAG, "clear pools")
    Pool.clear()
    logger:debug(TAG, "Clear game objects")
    if self.mainGroup and self.mainGroup.numChildren then
        local i = 1
        while i <= self.mainGroup.numChildren do
            local v = self.mainGroup[i]
            if v.clear then
                if v.name then
                    logger:debug(TAG, "clear %dth obj: %s", i, v.name)
                end
                v:clear()
                logger:debug(TAG, "Objects after clear: %d", self.mainGroup.numChildren)
            else
                i = i + 1
            end
        end
        self.mainGroup:removeSelf()
    end
    if self.hudGroup then
        logger:debug(TAG, "Clear hud")
        self.hudGroup:removeSelf()
    end
    sfx:stop()
    self.level:stop()
    logger:debug(TAG, "Clear listeners")
    Runtime:addEventListener("touch", self)
    self.status = STATUS_STOPPED
end

function scene:resumeGame()
    logger:debug(TAG, "Resume game")
    if self.status ~= STATUS_PAUSED then
        --print("The game work fine")
    end
    self.level:resume()
    physics.start()
    if self.mainGroup  and self.mainGroup.numChildren then
        for i = 1, self.mainGroup.numChildren do
            local v = self.mainGroup[i]
            if v.unfreeze then
                --print("~~~~~~~~~~~~unfreeze "..v.name)
                v:unfreeze()
            end
        end
    end
    sfx:resume()
    self.status = STATUS_STARTED
end

function scene:showScore(show)
    if not self.score then
        --print("Score bar not set")
        return
    end
    if show then
        transition.to(self.score, {alpha = 1})
    else
        transition.to(self.score, {alpha = 0})
    end
end

function scene:setScore()
    self.globalScore = 0
    for i = 1, #self.players do
        if self.players[i].score then
            self.globalScore = self.globalScore + self.players[i].score
        end
    end
    self.score:setScore(self.globalScore)
end

function scene:createPlayer(PlaneClass, options)
    local character = PlaneClass.new({lifes = 0, fingerSize = 50, fireRate = 300, controlType = options.controlType or gameConfig.controlType[1]})
    character.x = (options.pos and options.pos.x) or gameConfig.contentWidth / 2
    character.y = (options.pos and options.pos.y) or gameConfig.contentHeight + character.height / 2
    character:startControl()
    character:autoShoot()
    --[[character.onScoreChanged = function(obj, score, offset)
        --print("Set score "..score)
        self:setScore()
    end--]]

    --[[
    character.getLifes = function (obj)
        return self.totalLifes
    end
    --]]
    --[[
    character.onLoseLifes = function (obj)
        self.totalLifes = self.totalLifes - 1
        if self.totalLifes < 0 then
            self:gameOver()
        else
            self.playerLifeText.text = self.totalLifes
        end
    end
    --]]
    transition.to(character, {
        x = (options.to and options.to.x) or character.x,
        y = (options.to and options.to.y) or gameConfig.contentHeight / 5 * 4
    })

    return character
end

function scene:startGame(options)
    logger:debug(TAG, "Start game, players: "..gameConfig.numOfPlayers)
    self.globalScore = 0
    local sceneGroup = self.view
    self.hudGroup = display.newGroup()
    self.mainGroup = display.newGroup()
    Character.totalLifes = gameConfig.playerLifes
    self.score = Score.new()
    self.score.x = gameConfig.contentWidth/2
    self.score.y = self.score.height * 1.1
    --main character
    self.players = {}
    local p1x = gameConfig.contentWidth / 2
    if gameConfig.numOfPlayers == 2 then
        p1x = gameConfig.contentWidth / 4
    end
    self.mainCharacter = self:createPlayer(RedPlane, {
        pos = {x = p1x},
        controlType = gameConfig.controlType[1]

    })

    --createHUD
    self:createPauseBtn()
    self:createPlayerLifeUI()

    --Create global screen boundaries
    local leftWall = Wall.new(0, gameConfig.contentHeight/2,1, gameConfig.contentHeight )
    local rightWall = Wall.new(gameConfig.contentWidth, gameConfig.contentHeight/2, 1, gameConfig.contentHeight)
    local topWall = Wall.new(gameConfig.contentWidth/2, 0, gameConfig.contentWidth, 1)
    local bottomWall = Wall.new(gameConfig.contentWidth/2, gameConfig.contentHeight, gameConfig.contentWidth, 1)

    self.mainGroup:insert(leftWall)
    self.mainGroup:insert(rightWall)
    self.mainGroup:insert(topWall)
    self.mainGroup:insert(bottomWall)

    self.mainGroup:insert(self.mainCharacter)
    self.players[#self.players + 1] = self.mainCharacter
    if gameConfig.numOfPlayers == 2 then
        self.secondCharacter = self:createPlayer(BluePlane, {
            pos = {x = gameConfig.contentWidth / 4 * 3},
            controlType = gameConfig.controlType[2]
        })
        self.mainGroup:insert(self.secondCharacter)
        self.players[#self.players + 1] = self.secondCharacter
    end

    for i = 1, #self.players do
        local character = self.players[i]
        --shield must be opened after the character is added to the main scene
        if gameConfig.playerUnstoppable then
            character:openShield()
        else
            character:openShield(3000)
        end
    end

    self.level:init({
        game = self,
        view = self.mainGroup,
        players = self.players,
        stageSpeed = self.stageSpeed,
        scene = self
    })
    --update ui according the player
    --associate character event
    Character.onScoreChanged = function(event)
        self:setScore()
    end

    Character.onLoseLifes = function (event)
        if Character.totalLifes < 0  then
          self.playerLifeText.text = 0
        else
          self.playerLifeText.text = Character.totalLifes
        end
    end

    self.playerLifeText.text = Character.totalLifes
    --add to group
    self.superGroup:insert(self.mainGroup)
    self.superGroup:insert(self.hudGroup)
    timer.performWithDelay(1000 ,
        function()
            self.level:start(options)
        end
    )
    self.hudGroup:insert(self.score)
    self.status = STATUS_STARTED
end

function scene:gameOver()
    for i = 1, #self.players do
        if not self.players[i].isDead then
            return
        end
    end
    self:hideHUD()
    logger:debug(TAG, "Gameover")
    local userName = dbHelper:getUserName()

    local levelId = gameConfig.ID_LEVEL_INFINITE

    if self.gameMode ==  gameConfig.MODE_INFINITE_LEVEL then
        levelId = gameConfig.ID_LEVEL_INFINITE
    else
        local currentLevel = require("levels."..self.levels[self.currentLevelIdx])
        levelId = currentLevel.id
    end

    logger:debug(TAG, "~~~~~~~~~~~~!!!!GameOver in Level %s!!!!!!!!!~~~~~~~~~", levelId)

    local newRecord = dbHelper:updateRecord(userName, levelId, self.globalScore)
    logger:debug(TAG, "Show gamover overlay")
    self:popUp("scenes.gameover", {
        score = self.globalScore,
        newRecord = newRecord,
    })
end

function scene:victory(options)
    for i = 1, #self.players do
        if not self.players[i].isDead then
            self.players[i]:openShield()
        end
    end
    self:hideHUD()
    logger:debug(TAG, "Victory")
    local userName = dbHelper:getUserName()
    local newRecord = dbHelper:updateRecord(userName, (options and options.levelId) or gameConfig.ID_LEVEL_INFINITE, self.globalScore)
    logger:debug(TAG, "Show victory overlay")
    local showNextLevel = true
    local nextLevelIdx = 1
    if self.currentLevelIdx >= #self.levels then
        showNextLevel = false
        nextLevelIdx = self.currentLevelIdx
    else
        nextLevelIdx = self.currentLevelIdx + 1
    end
    self:popUp("scenes.victory", {
        score = self.globalScore,
        newRecord = newRecord,
        nextLevelIdx = nextLevelIdx,
        showNextLevel = showNextLevel,
        levels = self.levels
    })
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        PooledItemExplosion.pooling(10)
        PooledStarExplosion.pooling(10)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        if event.params and event.params.giveup then
           self.first = true
        end
        if self.first then
            self:hideHUD()
            local options = {
               effect = "fade",
               time = 500,
               isModal = true,
               params = {
                  someKey = "someValue",
                  someOtherKey = 10
               }
            }
            composer.showOverlay( "scenes.start", options )
            self.first = false
            self.status = STATUS_WAIT
            sfx:play("title", {loops = -1})
        else
            self:showHUD()
            self:resumeGame()
            sfx:play("bg", {loops = -1})
            if event.params and event.params.action == "restart" then
                logger:debug(TAG, "Restart the game with previous game options")
                self:startGame(self.gameOptions)
            else
                local options = {}
                options.mode = (event.params and event.params.mode) or gameConfig.MODE_INFINITE_LEVEL
                self.currentLevelIdx = (event.params and event.params.levelIdx) or 1
                self.levels = (event.params and event.params.levels) or gameConfig.gameLevels
                if self.levels and self.currentLevelIdx then
                    options.levelName = self.levels[self.currentLevelIdx]
                end
                options.onComplete = function(event)
                    logger:debug(TAG, "!!!!!!!!!!!Level %s completed!!!!!!!!!!!", event.id)
                    self:victory({levelId = event.id})
                end
                options.onFail = function(event)
                    logger:debug(TAG, "!!!!!!!!!!!Level %s failed!!!!!!!!!!!", event.id)
                    self:gameOver({levelId = event.id})
                end
                self.gameOptions = options
                logger:debug(TAG, "Just start the game, mode: %s", options.mode)
                self:startGame(options)
                self.gameMode = options.mode
            end
        end
    end
end

-- "scene:hide()"
function scene:hide( event )
    --local sceneGroup = self.mainGroup
    local phase = event.phase

    if ( phase == "will" ) then
        --print("gamescene:hide() will")
        --self:pauseGame()
        self:clearGame()
        --self:resumeGame()
    elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function scene:destroy( event )
   local sceneGroup = self.view
   self.superGroup:removeSelf()
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

local function onSystemEvent( event )

end

Runtime:addEventListener( "system", onSystemEvent )

---------------------------------------------------------------------------------

return scene
