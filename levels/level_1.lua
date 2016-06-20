local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("1-st level", "keviner2004", {duration = 4000})

function sublevel:show(options)
    --New enemy
    local num = 5
    local pathPoints = move.getCurve({{x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 1400}, {x = 1200, y = 1400}}, 100)
    for i = 1, num do
        self:addTimer(300 * i, function()
            local enemy = EnemyPlane.new()
            enemy.x = enemy.width + 400
            enemy.y = -50    
            --Move enemy, get path first
            move.followN(enemy, pathPoints, {
                showPoints = false,
                speed = 300,
                autoRotation = true,
                idep = false
            })
            --set item drop by the enemy
            if i == num then
                enemy:addItem("items.PowerUp", {level = 3})
            end
            self.view:insert(enemy)
        end)
    end
end

return sublevel