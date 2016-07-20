require("constant")
local sfx = require("sfx")
local Character = require("Character")
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
    print("scene:create()")
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
    local backgrounds = Backgrounds.new(self.stageSpeed)
    backgrounds:startMoveLoop()   
    if gameConfig.debugFPS then
        self:fpsMesure()
    end
    --Create global screen boundaries
    local leftWall = Wall.new(0,display.contentHeight/2,1, display.contentHeight )
    local rightWall = Wall.new(display.contentWidth, display.contentHeight/2, 1, display.contentHeight)
    local topWall = Wall.new(display.contentWidth/2, 0, display.contentWidth, 1)
    local bottomWall = Wall.new(display.contentWidth/2, display.contentHeight, display.contentWidth, 1)
    --UI
    local playerLife = display.newGroup()
    playerLife.x = 65
    playerLife.y = display.contentHeight - 35
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
    self.pauseButton.x = display.contentWidth - self.pauseButton.contentWidth - 10
    self.pauseButton.y = display.contentHeight - self.pauseButton.contentHeight
    Runtime:addEventListener("touch", self)
    Runtime:addEventListener("key", self)

    --add to the scene
    sceneGroup:insert(backgrounds)
    sceneGroup:insert(leftWall)
    sceneGroup:insert(rightWall)
    sceneGroup:insert(topWall)
    sceneGroup:insert(bottomWall)
    sceneGroup:insert(playerLife)
    sceneGroup:insert(self.pauseButton)
end

function scene:toggleGame()
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
        if event.keyName == gameConfig.keyCancel then
            logger:info(TAG, "toggle game status")
            self:toggleGame()
        end
    end
end

function scene:fpsMesure()
    local runtime = 0
    self.fpsText = display.newText(0, 0, 0, "kenvector_future_thin", 40)
    self.fpsText.x = 50
    self.fpsText.y = 50
    local count = 0
    local function getDeltaTime()
        local temp = system.getTimer()-- Get current game time in ms
        local dt = (temp-runtime) / (1000/display.fps)  -- 60 fps or 30 fps as base
        runtime = temp  -- Store game time
        return dt
    end

    -- Frame update function
    local function frameUpdate()
        -- Delta Time value
        count = count + 1

        local dt = getDeltaTime()
        if count == 10 then
            --print("FPS mesure: "..dt)
            self.fpsText.text = math.round(dt * 100)

            count = 0
        end
        if dt * 100 > 150 then
            logger:warn(TAG, "FPS: "..dt* 150)
        end
    end
    Runtime:addEventListener("enterFrame", frameUpdate)
end



function scene:pauseGame()
    print("Pause game")
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
    self.status = "paused"
end

function scene:clearGame()
    print("clearGame")
    if self.mainGroup and self.mainGroup.numChildren then
        local i = 1
        while i <= self.mainGroup.numChildren do
            local v = self.mainGroup[i]
            if v.name then
                print("clear obj: "..v.name)
            end
            if v.clear then
                v:clear()
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
    self.level:stop()
end

function scene:resumeGame()
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

function scene:startGame()

    local sceneGroup = self.view
    self.hudGroup = display.newGroup()
    self.mainGroup = display.newGroup()

    self.score = Score.new()
    self.score.x = display.contentWidth/2
    self.score.y = 50
    --main character
    self.mainCharacter = Character.new({lifes = gameConfig.playerLifes, fingerSize = 50, fireRate = 500, controlType = gameConfig.controlType})
    self.mainCharacter.x = display.contentWidth / 2
    self.mainCharacter.y = display.contentHeight + self.mainCharacter.height / 2
    self.mainCharacter:startControl()
    self.mainCharacter:autoShoot()

    self.mainCharacter.onScoreChanged = function(character, score)
        --print("Set score "..score)
        self.score:setScore(score)
    end

    self.mainCharacter.onLifeChanged = function (character, lifes)
        --print("Update life bar "..lifes)
        self.playerLifeText.text = lifes
    end

    self.mainCharacter.onGameOver = function (obj)
        print("on gameover")
        self:checkScore(function()
            --show gameover overlay
            local options = {
               effect = "fade",
               time = 500,
               isModal = true,
               params = {
                    score = self.mainCharacter.score,
                    onClose = function()

                    end
               }
            }
            print("show gamover overlay")
            composer.showOverlay( "scenes.gameover", options )  
        end)
    end

    --leaderboard helper
    self.helper = leaderBoardHelper.new()
    self.helper:init()
    --start level
    --level.start()
    self.level:init(self, self.mainGroup, {self.mainCharacter}, self.stageSpeed, self)
    --boss
    --[[
    self.boss = Boss.new(self.mainCharacter)
    sceneGroup:insert(self.boss)
    self.boss.x = display.contentWidth/2
    self.boss.y = 300
    local hpBar = self.boss:initHPBar()
    sceneGroup:insert(hpBar)
    self.boss:act()
    self.boss.onDefeated = function()
        print("Boss is defeated, show victory window")
        self:checkScore(function()
            local options = {
                effect = "fade",
                time = 500,
                isModal = true,
                params = {
                    score = self.mainCharacter.score,
                    onClose = function()
                        
                    end
                }
            }
            composer.showOverlay( "scene.victory", options )
        end)
    end
    --]]
    --[[
    self.mainCharacter.onRespawned = function(obj, newCharacter)
        print("set new player to level")
        self.level:setPlayer({newCharacter})
    end
    --]]

    --update ui according the player

    self.playerLifeText.text = self.mainCharacter.lifes
    -- Called when the scene is still off screen (but is about to come on screen).
    --[[print("total object in scene: "..sceneGroup.numChildren)
    for i = 1, sceneGroup.numChildren do
        local v = sceneGroup[i]
        if v and v.type then
            print("check "..v.type.."/"..v.name)
        end
    end 
    --]] 

    transition.to(self.mainCharacter, {
        y = display.contentHeight / 5 * 4,
        onComplete = function()
            self.level:start({delay = 800})
        end
    })

    
    --add to group

    sceneGroup:insert(self.mainGroup)
    sceneGroup:insert(self.hudGroup)
    self.mainGroup:insert(self.mainCharacter)
    self.hudGroup:insert(self.score)
    self.status = "started"
    --shield must be opened after the character is added to the main scene
    if gameConfig.playerUnstoppable then
        self.mainCharacter:openShield()
    else
        self.mainCharacter:openShield(3000)
    end
end

function scene:checkScore(afterCheck)
    print("scene:checkScore")
    local localHeighScore = self.helper:getHighScore("local")
    if localHeighScore and localHeighScore < self.mainCharacter.score then
        local options = {
            effect = "fade",
            time = 500,
            isModal = true,
            params = {
                score = self.mainCharacter.score,
                onOk = function(name)
                    print("Check windows close")
                    self.helper:addRecord(name, self.mainCharacter.score, "local")
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
            print("just start the game")
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







