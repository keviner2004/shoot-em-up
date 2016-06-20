local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("1-st level", "keviner2004", {duration = 4000})

function sublevel:show(options)
    --New enemy
    local num = 5
    local pathPoints = move.getCurve({{x = -50, y = -50}, {x = -50, y = -50}, {x = -50, y = display.contentHeight*1.1}, {x = display.contentWidth*1.1, y = display.contentHeight*1.1}}, 100)
    local pathPoints2 = move.getCurve({{x = display.contentWidth*1.1, y = -50}, {x = display.contentWidth*1,1, y = -50}, {x = display.contentWidth*1.1, y = display.contentHeight*1.1}, {x = -50, y = display.contentHeight*1.1}}, 100)
    for i = 1, num do
        self:addTimer(300 * i, function()
            local enemy = EnemyPlane.new()
            enemy.x = pathPoints[1].x
            enemy.y = pathPoints[1].y
            --Move enemy, get path first
            move.followN(enemy, pathPoints, {
                showPoints = false,
                speed = 300,
                autoRotation = true,
                idep = false, 
                onComplete = function()
                    enemy:clear()
                end
            })
            --set item drop by the enemy
            if i == num then
                enemy:addItem("items.PowerUp", {level = 3})
            end
            self.view:insert(enemy)
        end)
    end

    ----[[
    for i = 1, num do
        self:addTimer(300 * i, function()
            local enemy = EnemyPlane.new()
            enemy.x = pathPoints2[1].x
            enemy.y = pathPoints2[1].y 
            --Move enemy, get path first
            move.followN(enemy, pathPoints2, {
                showPoints = false,
                speed = 300,
                autoRotation = true,
                idep = false,
                onComplete = function()
                    enemy:clear()
                end
            })
            --set item drop by the enemy
            if i == num then
                enemy:addItem("items.PowerUp", {level = 3})
            end
            self.view:insert(enemy)
        end)
    end
    ----]]

end

return sublevel