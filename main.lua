--[[
|                   |                  |  1  |  2  |  4  |  8  |  16  |  32  |  64  |  SUM   |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| Player            | category         | O   |     |     |     |      |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   |     | x   |     |     | x    |      |      | 18     |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| Enemy / FIRSTBOSS | category         |     | O/O |     |     |      |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   | x/x | n/x | x/x |     |      | n/x  |      | 5 / 39 |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| bullet            | category         |     |     | O/O |     |      |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   | n/x | x/n |     |     |      |      |      | 2/1    |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| asteroid          | category         |     |     |     | O   |      |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   | x   | x   | x   | x   |      |      |      |        |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| item              | category         |     |     |     |     | O    |      |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   | x   |     |     |     |      |      |      |        |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
| wall              | category         |     |     |     |     |      | o    |      |        |
|                   | ---------------- | --- | --- | --- | --- | ---- | ---- | ---- | -----  |
|                   | collision with   |     | x   |     |     |      |      |      | 2      |
|-------------------|------------------|-----|-----|-----|-----|------|------|------|--------|
--]]

local Enemy = require("EnemyPlane")
local Boss = require("Boss")
local Missile = require("Missile")
local Bullet = require("Bullet")
local Character = require("Character")
local Backgrounds = require("Background")
local physics = require( "physics" )
local backgrounds = Backgrounds.new()
local move = require("move")
local Level = require("Level")
local Ufo = require("Ufo")
local Wall = require("Wall")

--backgrounds.isVisible = false
print ("group w: "..backgrounds.width..", h: "..backgrounds.height..", x: "..backgrounds.x..", y: "..backgrounds.y)

local level = Level.load()




backgrounds:startMoveLoop()

--local bullet = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("Lasers/laserGreen09")}} )
--enable pyhsic
physics.start()
physics.setGravity(0, 0)
physics.setDrawMode( "hybrid" ) 

--Create global screen boundaries
local leftWall = Wall.new(0,display.contentHeight/2,1, display.contentHeight )
local rightWall = Wall.new(display.contentWidth, display.contentHeight/2, 1, display.contentHeight)
local topWall = Wall.new(display.contentWidth/2, 0, display.contentWidth, 1)
local bottomWall = Wall.new(display.contentWidth/2, display.contentHeight, display.contentWidth, 1)

--main character
--[[
local mainCharacter = Character.new({speed = 1000, fingerSize = 50, fireRate = 500})
mainCharacter.x = display.contentWidth / 2
mainCharacter.y = display.contentWidth / 2
mainCharacter:startControl()
mainCharacter:openShield()
mainCharacter:autoShoot()
--]]
--use perform with delay method to generate level
--[[
for i = 1, #level do 
    local info = level[i]
    timer.performWithDelay(info.time, function()
        local enemy = Enemy.new({hp = 1, items = {info.items}})
        enemy.x = 100
        enemy.y = 100
        move.go(enemy, mainCharacter, info.moves)
    end)
end
--]]

--ufo

local ufo = Ufo.new()
ufo.x = display.contentWidth/2
ufo.y = 300
ufo:beam()
--[[
local missle = Missile.new()
missle:seek(mainCharacter)
missle.x = 300
missle.y = 50
--]]

--BOSS
--[[
local boss = Boss.new(mainCharacter)
boss.x = 300
boss.y = 300
--boss:mode1()
boss:mode4()
--]]

local distanceText = display.newText("0", display.contentWidth/2, 100, "kenvector_future_thin", 64)
backgrounds.onUpdate = function(distance)
    distanceText.text = distance
end

local runtime = 0
 
local function getDeltaTime()
    local temp = system.getTimer()  -- Get current game time in ms
    local dt = (temp-runtime) / (1000/display.fps)  -- 60 fps or 30 fps as base
    runtime = temp  -- Store game time
    return dt
end

-- Frame update function
local function frameUpdate()
    -- Delta Time value
    local dt = getDeltaTime()
    --print(dt)
end
--[[
timer.performWithDelay(1000, function()
    --enemy
    local enemy = Enemy.new()
    enemy.x = display.contentWidth * 0.5
    enemy.y = 250
    enemy:goStraightAndFollow({x = 0, y = 0}, {x = 200, y = 200}, mainCharacter)
end)
--]]

--load level
--[[
timer.performWithDelay(500, function()
    --enemy
    local enemy = Enemy.new({hp = 1, items = {kind = "powerup"}})
    enemy.x = display.contentWidth * 0.5
    enemy.y = 250
    move.goStrait(enemy, {x=100, y = 0}, {x=100, y=1400}, 6000, function()
        enemy:removeSelf()
    end)
end, 3)
--]]





