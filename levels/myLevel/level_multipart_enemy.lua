local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local MyEnemy = require("levels.myLevel.MyMultipartEnemy")
local util = require("util")
local myLevel = Sublevel.new("9999999-061", "custom enemy", "author name")

function myLevel:show(options)
    local enemy = MyEnemy.new(self.view)
    --place the enemy out of the screen
    enemy.x = gameConfig.contentWidth/2
    enemy.y = -enemy.height
    enemy:setScaleLinearVelocity( 0, 100 )
    enemy:addTimer(1000, function()
        local count = 0
        enemy:setScaleLinearVelocity(-200, 0)
        self:moveMyEnemy(enemy, count)
        enemy:addTimer(1000, function()
            count = count + 1
            self:moveMyEnemy(enemy, count)
        end, -1)
    end)
    self.enemy = enemy

end

function myLevel:moveMyEnemy(enemy, count)
--  print("Timer is work!")
    if count%4 == 0 then
        
    elseif count%4 == 1 then
        enemy:setScaleLinearVelocity(200, 0)
    elseif count%4 == 2 then

    elseif count%4 == 3 then
        enemy:setScaleLinearVelocity(-200, 0)
    end
    count = count + 1
end

function myLevel:isFinish()
    --print("isFinish!??")
    if util.isExists(self.enemy) then
        return false
    else
        return true
    end
end

return myLevel
