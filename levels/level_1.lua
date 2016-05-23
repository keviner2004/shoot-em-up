local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("1-st level", "keviner2004")

function sublevel:show(options)
    --New enemy
    local enemy = EnemyPlane.new()
    enemy.x = enemy.width
    enemy.y = -50    
    --Move enemy
    enemy:setLinearVelocity(0, 400)
    enemy:addTimer((display.contentHeight / 2)/300*1000, function ()
        move.seek(enemy, {y = 100, x = display.contentWidth-100}, {
            maxForce = 15,
            maxSpeed = 400,
            onComplete = function()
               enemy:setLinearVelocity(0,0)
            end
        })
    end)

    --set item drop by the enemy
    enemy:addItem("items.PowerUp", {level = 5})

    --New enemy
    local enemy = EnemyPlane.new()
    enemy.x = enemy.width + 400
    enemy.y = -50    
    --Move enemy
    enemy:setLinearVelocity(0, 300)
    move.seek(enemy, {y = display.contentHeight/2, x = enemy.x}, {
        onComplete = function()
           enemy:setLinearVelocity(0,0)
        end
    })
    --set item drop by the enemy
    enemy:addItem("items.PowerUp", {level = 3})
    --enemy:applyForce(0, 20, enemy.x, enemy.y)
    --[[local first = true
    Runtime:addEventListener("enterFrame", function ()
        if first then
            enemy:applyForce(0, 10, enemy.x, enemy.y)
            first = false        
        end
        local x,y = enemy:getLinearVelocity()     
        print(x, y, enemy.mass, (10/enemy.mass)/2)
    end)
    --]]
    --[[enemy:addTimer((display.contentHeight - 150 - enemy.y)/speed * 1000 , function()
        print("seeking and left")
        move.seek(enemy, {x = display.contentWidth - 100, y = 150}, {onComplete = function()
            print("Enemy reach the target, remove")
            enemy:removeSelf()
        end})
    end)--]]
end

return sublevel