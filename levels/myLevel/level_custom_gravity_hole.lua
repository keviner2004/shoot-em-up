local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local GravityField = require("GravityField")
local EnemyPlane = require("enemies.EnemyPlane")
local util = require("util")
local myLevel = Sublevel.new("9999999-013", "level name", "author name")

function myLevel:show(options)
    local enemy = EnemyPlane.new()
    local field = GravityField.new({radius = 160 * gameConfig.scaleFactor})

    enemy.x = gameConfig.contentCenterX/2 * 3
    enemy.y = 0

    enemy.immuneGravityField = false

    enemy:setScaleLinearVelocity( -250, 250 )
    enemy:rotateByVelocity()
    enemy:autoDestroyWhenInTheScreen()

    field.x = gameConfig.contentCenterX
    field.y = gameConfig.contentCenterY

    self:insert(field)
    self:insert(enemy)
    self.enemy = enemy
    self.field = field
end

function myLevel:isFinish()
    --print("isFinish!??")
    if util.isExists(self.enemy) then
        return false
    else
        return true
    end
end

function myLevel:finish()
    self.field:clear()
end

return myLevel
