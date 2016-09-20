local move = require("move")
local gameConfig = require("gameConfig")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("9999999-001", "1-st level", "keviner2004", {duration = 4000})

function sublevel:show(options)
    --New enemy
    local num = 5
    local pathPoints = move.getCurve({{x = -50, y = -50}, {x = -50, y = -50}, {x = -50, y = gameConfig.contentHeight*1.1}, {x = gameConfig.contentWidth*1.1, y = gameConfig.contentHeight*1.1}}, 100)
    local pathPoints2 = move.getCurve({{x = gameConfig.contentWidth*1.1, y = -50}, {x = gameConfig.contentWidth*1,1, y = -50}, {x = gameConfig.contentWidth*1.1, y = gameConfig.contentHeight*1.1}, {x = -50, y = gameConfig.contentHeight*1.1}}, 100)
    for i = 1, num do
        self:addTimer(300 * i, function()
            local enemy = EnemyPlane.new()
            enemy.x = pathPoints[1].x
            enemy.y = pathPoints[1].y
            --Move enemy, get path first
            move.followN(enemy, pathPoints, {
                showPoints = false,
                speed = 300 * gameConfig.scaleFactor,
                autoRotation = true,
                idep = false,
                onComplete = function()
                    enemy:clear()
                end
            })
            --set item drop by the enemy
            if i == num then
                enemy:addItem("items.PowerUp", {level = 1})
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
                speed = 400 * gameConfig.scaleFactor,
                autoRotation = true,
                idep = false,
                onComplete = function()
                    enemy:clear()
                end
            })
            --set item drop by the enemy
            if i == num then
                enemy:addItem("items.PowerUp", {level = 1})
            end
            self.view:insert(enemy)
        end)
    end
    ----]]

end

return sublevel
