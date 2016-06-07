local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("2-st level", "keviner2004")

function sublevel:show(options)
    local speed = 400
    --New enemy
    for i = 0, 4 do
        self:addTimer(300*i, function()
            local enemy = EnemyPlane.new()
            enemy.x = display.contentWidth - enemy.width
            enemy.y = - enemy.height
            --Move enemy
            enemy:setLinearVelocity(0, speed)
            --Remove enemy if out of bound
            enemy:addTimer(100 , function()
                enemy:enableAutoDestroy()
            end)
        end)
    end
end

return sublevel