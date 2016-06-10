local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("1-st level", "keviner2004", {duration = 4000})

function sublevel:show(options)
    --New enemy
    local pathPoints = move.getCurve({{x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 1400}, {x = 1200, y = 1400}}, 500)
    for i = 1, 5 do
        self:addTimer(300 * i, function()
            local enemy = EnemyPlane.new()
            enemy.x = enemy.width + 400
            enemy.y = -50    
            --Move enemy, get path first
            move.follow(enemy, pathPoints, {
                showPoints = false,
                speed = 100,
                autoRotation = true
            })
            --set item drop by the enemy
            enemy:addItem("items.PowerUp", {level = 3})
            self.view:insert(enemy)
        end)
    end
end

return sublevel