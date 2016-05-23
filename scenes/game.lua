require("constant")
local Character = require("Character")
local Backgrounds = require("Background")
local physics = require( "physics" )
local move = require("move")
local Level = require("Level")
local Wall = require("Wall")
local GlassPanel = require("ui.GlassPanel")
local Square = require("ui.Square")
local Sprite = require("sprite")
local leaderBoardHelper = require("leaderBoardHelper")
local composer = require( "composer" )
local widge
local scene = composer.newScene()
local widget = require("widget")
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
    --physics.setDrawMode( "hybrid" ) 
    self.first = true
    self.level = Level.load()
    local backgrounds = Backgrounds.new()
    backgrounds:startMoveLoop()   
    
    --Create global screen boundaries
    local leftWall = Wall.new(0,display.contentHeight/2,1, display.contentHeight )
    local rightWall = Wall.new(display.contentWidth, display.contentHeight/2, 1, display.contentHeight)
    local topWall = Wall.new(display.contentWidth/2, 0, display.contentWidth, 1)
    local bottomWall = Wall.new(display.contentWidth/2, display.contentHeight, display.contentWidth, 1)


    --UI
    local playerLife = display.newGroup()
    playerLife.x = 65
    playerLife.y = display.contentHeight - 35
    local lifeIcon = Sprite.new("UI/playerLife3_red")
    self.playerLifeText = display.newText(0, 0, 0, "kenvector_future_thin", 40)
    local totalL = lifeIcon.width/2 + 50 + self.playerLifeText.width/2
    lifeIcon.x = - totalL/2 + lifeIcon.width/2
    lifeIcon.y = 0
    self.playerLifeText.x = totalL/2 - self.playerLifeText.width/2
    playerLife:insert(self.playerLifeText)
    playerLife:insert(lifeIcon)
    
    self.pauseButton = widget.newButton({
        sheet = myImageSheet,
        defaultFrame = sheetInfo:getFrameIndex("UI/pause"),
        overFrame = sheetInfo:getFrameIndex("UI/pause"),
        label = "",
        onEvent = function ( event )
            if ( "ended" == event.phase ) then
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
            end
        end
    })
    self.pauseButton.x = display.contentWidth - self.pauseButton.contentWidth - 10
    self.pauseButton.y = display.contentHeight - self.pauseButton.contentHeight
    Runtime:addEventListener("touch", self)

    --add to the scene
    sceneGroup:insert(backgrounds)
    sceneGroup:insert(leftWall)
    sceneGroup:insert(rightWall)
    sceneGroup:insert(topWall)
    sceneGroup:insert(bottomWall)
    sceneGroup:insert(playerLife)
    sceneGroup:insert(self.pauseButton)

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

function scene:fpsMesure()
    local runtime = 0
     
    local function getDeltaTime()
        local temp = system.getTimer()-- Get current game time in ms
        local dt = (temp-runtime) / (1000/display.fps)  -- 60 fps or 30 fps as base
        runtime = temp  -- Store game time
        return dt
    end

    -- Frame update function
    local function frameUpdate()
        -- Delta Time value
        local dt = getDeltaTime()
        --print("FPS mesure: "..dt)
    end
    Runtime:addEventListener("enterFrame", frameUpdate)
end

--scene:fpsMesure()

function scene:pauseGame()
    self.level:pause()
    physics.pause()
    for i = 1, self.view.numChildren do
        local v = self.view[i]
        print(v.name)
        if v.freeze then
            v:freeze()
        end
    end  
end

function scene:resumeGame()
    self.level:resume()
    physics.start()
    for i = 1, self.view.numChildren do
        local v = self.view[i]
        if v.unfreeze then
            v:unfreeze()
        end
    end  
end

function scene:startGame()
    local sceneGroup = self.view
    --main character
    self.mainCharacter = Character.new({lifes = 99, fingerSize = 50, fireRate = 500, controlType = "follow"})
    self.mainCharacter.onGameOver = function (obj)
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
            composer.showOverlay( "scene.gameover", options )  
        end)
    end
    self.mainCharacter.x = display.contentWidth / 2
    self.mainCharacter.y = display.contentHeight / 2
    sceneGroup:insert(self.mainCharacter)
    self.mainCharacter:startControl()
    self.mainCharacter:openShield(3000)
    --self.mainCharacter:openShield()
    self.mainCharacter:autoShoot()    
    self.mainCharacter.onLifeChanged = function (character, lifes)
        print("Update life bar "..lifes)
        self.playerLifeText.text = lifes
    end
    --leaderboard helper
    self.helper = leaderBoardHelper.new()
    self.helper:init()

    --start level
    --level.start()
    self.level:init(self, self.view, {self.mainCharacter})
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

    self.mainCharacter.onRespawned = function(obj, newCharacter)
        print("set boss player to new player")
        self.boss.player = newCharacter
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
    self.level:start()
end

function scene:checkScore(afterCheck)
    print("scene:checkScore")
    local localHeighScore = self.helper:getHighScore("local")
    if localHeighScore < self.mainCharacter.score then
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
        composer.showOverlay( "scene.newHighScore", options )
    else
        self.helper:syncHighScore()
        if afterCheck then
            afterCheck()
        end
    end
end

function scene:isWin()
    --callback
    --bruteforce
    local isAllDead = true
    for i, v in ipairs(self.view) do
        if v and v.type then
            if v.type == "boss" or v.type == "enemy" then
                isAllDead = false
            end
        end
    end
    return false
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
        else
            print("just start the game")
            self:startGame()
        end
    end
end

-- "scene:hide()"
function scene:hide( event )
    print("gamescene:hide()")
    local sceneGroup = self.view
    local phase = event.phase
    
    if ( phase == "will" ) then
       -- Called when the scene is on screen (but is about to go off screen).
       -- Insert code here to "pause" the scene.
       -- Example: stop timers, stop animation, stop audio, etc.
       --cleanup
       --print("total object in scene: "..sceneGroup.numChildren)
       local idx = 1
       while idx <= sceneGroup.numChildren do
            local v = sceneGroup[idx]
            print("total object in scene: "..sceneGroup.numChildren)
            if v and v.type then
                print("check "..idx..":"..v.type.."/"..v.name)
                if v.type == "bullet" or v.type == "character" or v.type == "boss" or v.type == "enemy" or v.type == "hpBar" then
                    --v:removeSelf()
                    sceneGroup:remove(idx)
                else
                    idx = idx + 1
                end
            else
                idx = idx + 1
            end
       end
       --self.mainCharacter:removeSelf()
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







