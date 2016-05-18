local move = require("move")
local Sublevel = require("Sublevel")
local EnemyPlane = require("enemies.EnemyPlane")
local sublevel = Sublevel.new("1-st level", "keviner2004")

function sublevel:show(options)
    local enemy = EnemyPlane.new()
    enemy.x = enemy.width
    enemy.y = -50    

    --enemy.linearDamping = 100

    enemy:setLinearVelocity(0, 300)
    move.seek(enemy, {y = display.contentHeight - 100, x = enemy.width}, {
        onComplete = function()
           enemy:removeSelf() 
        end
    })
    local speed = 600
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