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
local Square = require("ui.Square")
local Sprite = require("Sprite")
local leaderBoardHelper = require("leaderBoardHelper")
local composer = require( "composer" )
local scene = composer.newScene()
local Score = require("ui.Score")
local widget = require("widget")
local logger = require("logger")
local gameConfig = require("gameConfig")
local util = require("util")

local Pool = require("Pool")
local PooledItemExplosion = require("effects.PooledItemExplosion")
local PooledStarExplosion = require("effects.PooledStarExplosion")

local TAG = "gamescene"

system.setIdleTimer( false )
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------

-- "scene:create()"
function scene:create( event )
    logger:info(TAG, "scene:create")
    self.superGroup = display.newGroup()
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
    self.status = "wait"
    self.stageSpeed = gameConfig.stageSpeed
    self.level = Level.load()
    self.globalScore = 0
    local backgrounds = Backgrounds.new(self.stageSpeed)
    backgrounds:startMoveLoop()   
    if gameConfig.debugFPS then
        self:fpsMesure()
    end
    --UI
    local playerLife = display.newGroup()
    playerLife.x = 65
    playerLife.y = gameConfig.contentHeight - 35
    local lifeIcon = Sprite.new("UI/Player-lifes/2")
    self.playerLifeText = display.newText(0, 0, 0, "kenvector_future_thin", 40)
    local totalL = lifeIcon.width/2 + 50 + self.playerLifeText.width/2
    lifeIcon.x = - totalL/2 + lifeIcon.width/2
    lifeIcon.y = 0
    self.playerLifeText.x = totalL/2 - self.playerLifeText.width/2
    playerLife:insert(self.playerLifeText)
    playerLife:insert(lifeIcon)
    
    self.pauseButton = widget.newButton({
        sheet = Sprite.myImageSheet,
        defaultFrame = Sprite.getFrameIndex("UI/Icons/pause"),
        overFrame = Sprite.getFrameIndex("UI/Icons/pause"),
        label = "",
        onEvent = function ( event )
            if ( "ended" == event.phase ) then
                self:toggleGame()
            end
        end
    })
    self.pauseButton.x = gameConfig.contentWidth - self.pauseButton.contentWidth - 10
    self.pauseButton.y = gameConfig.contentHeight - self.pauseButton.contentHeight
    Runtime:addEventListener("touch", self)
    Runtime:addEventListener("key", self)

    self.superGroup.x = gameConfig.contentX
    self.superGroup.y = gameConfig.contentY
    --add to the scene
    --sceneGroup:insert(backgrounds)
    self.superGroup:insert(backgrounds)
    self.superGroup:insert(playerLife)
    self.superGroup:insert(self.pauseButton)
    sceneGroup:insert(self.superGroup)
end

function scene:toggleGame()
    logger:info(TAG, "toggleGame")
    if self.status == "started" then
        self:pauseGame()
        composer.showOverlay( "scenes.menu", {
            effect = "fade",
            time = 500,
            isModal = true,
            params = {
                title = "Pause",
                onClose = function()
                    self:resumeGame()
                end
            }
        })
    elseif self.status == "paused" then
        self:resumeGame()
        composer.hideOverlay( "fade", 400 )
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

function scene:key(event)
    if event.phase == "up" then
        --logger:info(TAG, "hahaha "..event.keyName.."/"..gameConfig.keyCancel)
        if util.equalOrContain(event.keyName, gameConfig.keyCancel) then
            logger:info(TAG, "toggle game status")
            self:toggleGame()
        end
    end
end

function scene:fpsMesure()
    local runtime = 0
    self.fpsText = display.newText(0, 0, 0, "kenvector_future_thin", 40)
    self.numOfObjectsText = display.newText(0, 0, 0, "kenvector_future_thin", 40)
    self.fpsText.x = 50
    self.fpsText.y = 50
    self.numOfObjectsText.x = 150
    self.numOfObjectsText.y = 50
    local count = 0

    local function getFPS()
        local temp = system.getTimer()-- Get current game time in ms
        local fps = math.floor(1000 / (temp-runtime)) -- 60 fps or 30 fps as base
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
    logger:info(TAG, "Pause game")
    if self.status == "paused" then
        print("The game is paused")
        return 
    end
    self.level:pause()
    physics.pause()
    --pause objets in main group
    if self.mainGroup and self.mainGroup.numChildren then
        for i = 1, self.mainGroup.numChildren do
            local v = self.mainGroup[i]
            if v.name then
                print("pause obj: "..v.name)
            end
            if v.freeze then
                v:freeze()
            end
        end
    end
    sfx:pause()
    self.status = "paused"
end

function scene:clearGame()
    logger:info(TAG, "clear pools")
    Pool.clear()
    logger:info(TAG, "Clear game objects")
    if self.mainGroup and self.mainGroup.numChildren then
        local i = 1
        while i <= self.mainGroup.numChildren do
            local v = self.mainGroup[i]
            if v.clear then
                if v.name then
                    logger:info(TAG, "clear %dth obj: %s", i, v.name)
                end
                v:clear()
                logger:info(TAG, "Objects after clear: %d", self.mainGroup.numChildren)
            else
                i = i + 1
            end
        end
        self.mainGroup:removeSelf()
    end
    if self.hudGroup then
        print("gamescene:hide() did")
        self.hudGroup:removeSelf()
    end
    sfx:stop()
    self.level:stop()
end

function scene:resumeGame()
    logger:info(TAG, "Resume game")
    if self.status ~= "paused" then
        print("The game work fine")
    end
    self.level:resume()
    physics.start()
    if self.mainGroup  and self.mainGroup.numChildren then
        for i = 1, self.mainGroup.numChildren do
            local v = self.mainGroup[i]
            if v.unfreeze then
                v:unfreeze()
            end
        end
    end
    sfx:resume()
    self.status = "started"
end

function scene:showScore(show)
    if not self.score then
        print("Score bar not set")
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
    local character = PlaneClass.new({lifes = gameConfig.playerLifes, fingerSize = 50, fireRate = 300, controlType = options.controlType or gameConfig.controlType[1]})
    character.x = (options.pos and options.pos.x) or gameConfig.contentWidth / 2
    character.y = (options.pos and options.pos.y) or gameConfig.contentHeight + character.height / 2
    character:startControl()
    character:autoShoot()

    character.onScoreChanged = function(obj, score, offset)
        --print("Set score "..score)
        self:setScore()
    end

    character.getLifes = function (obj)
        return self.totalLifes
    end

    character.onLoseLifes = function (obj)
        self.totalLifes = self.totalLifes - 1
        if self.totalLifes < 0 then
            self:gameOver()
        else
            self.playerLifeText.text = self.totalLifes    
        end
        
    end

    transition.to(character, {
        x = (options.to and options.to.x) or character.x,
        y = (options.to and options.to.y) or gameConfig.contentHeight / 5 * 4
    })

    return character
end

function scene:startGame()
    logger:info(TAG, "Start game")
    local sceneGroup = self.view
    self.hudGroup = display.newGroup()
    self.mainGroup = display.newGroup()
    self.totalLifes = gameConfig.playerLifes
    self.score = Score.new()
    self.score.x = gameConfig.contentWidth/2
    self.score.y = 50
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

    --leaderboard helper
    self.helper = leaderBoardHelper.new()
    self.helper:init()
    --init level
    --self.level:init(self, self.mainGroup, self.players, self.stageSpeed, self)
    print("Init!!!!!! ", self.mainGroup)
    self.level:init(self, self.mainGroup, self.players, self.stageSpeed, self)
    --update ui according the player
    self.playerLifeText.text = self.totalLifes
    --add to group
    self.superGroup:insert(self.mainGroup)
    self.superGroup:insert(self.hudGroup)
    timer.performWithDelay(1000 , 
        function()
            self.level:start()
        end
    )
    self.hudGroup:insert(self.score)
    self.status = "started"
end

function scene:gameOver()
    for i = 1, #self.players do
        if not self.players[i].isDead then
            return
        end
    end
    logger:info(TAG, "Gameover")
    self:checkScore(function()
        --show gameover overlay
        local options = {
           effect = "fade",
           time = 500,
           isModal = true,
           params = {
                score = self.globalScore,
                onClose = function()

                end
           }
        }
        logger:info(TAG, "Show gamover overlay")
        composer.showOverlay( "scenes.gameover", options )  
    end)
end

function scene:checkScore(afterCheck)
    print("scene:checkScore")
    local localHeighScore = self.helper:getHighScore("local")
    if localHeighScore and localHeighScore < self.globalScore then
        local options = {
            effect = "fade",
            time = 500,
            isModal = true,
            params = {
                score = self.globalScore,
                onOk = function(name)
                    print("Check windows close")
                    self.helper:addRecord(name, self.globalScore, "local")
                    self.helper:delLastRecords(10, "local")
                    self.helper:syncHighScore()
                    if afterCheck then
                        afterCheck()
                    end
                end
            }
        }
        composer.showOverlay( "scenes.newHighScore", options )
    else
        self.helper:syncHighScore()
        if afterCheck then
            afterCheck()
        end
    end
end

-- "scene:show()"
function scene:show( event )
    
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        print("gamescene:show() will")
        PooledItemExplosion.pooling(10)
        PooledStarExplosion.pooling(10)
    elseif ( phase == "did" ) then
        print("gamescene:show() did")
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        if event.params and event.params.giveup then
           self.first = true
        end 
        if self.first then
            print("Game start first, show start Screen")
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
            self.status = "wait"
            sfx:play("title", {loops = -1})
        else
            logger:info(TAG, "Just start the game")
            sfx:play("bg", {loops = -1})
            self:startGame()
        end
    end
end

-- "scene:hide()"
function scene:hide( event )
    --local sceneGroup = self.mainGroup
    local phase = event.phase
    
    if ( phase == "will" ) then
        print("gamescene:hide() will")
        --self:pauseGame()
        self:clearGame()
        --self:resumeGame()
    elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end
 
-- "scene:destroy()"
function scene:destroy( event )
    print("scene:destroy()")
   local sceneGroup = self.view
   self.superGroup:removeSelf()
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
 
local function onSystemEvent( event )
    print("onSystemEvent: "..event.type)
end

Runtime:addEventListener( "system", onSystemEvent )

---------------------------------------------------------------------------------
 
return scene







