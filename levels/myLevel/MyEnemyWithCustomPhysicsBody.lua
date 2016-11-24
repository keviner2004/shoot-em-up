local Enemy = require("Enemy")
local Sprite = require("Sprite")
local gameConfig = require("gameConfig")
local MyEnemy = {}

MyEnemy.new = function()
    local enemy = Enemy.new()
    local sprite = Sprite["expansion-4"].new("Ships/22")
    enemy:insert(sprite)
    --Circular Body

    --enemy:setBody({radius = enemy.width/2*0.6})

    --Rectangular Body 
    --[[
    enemy:setBody({
        box = {
            halfWidth = enemy.width/5, 
            halfHeight = enemy.height/5,
            x = 0,
            y = enemy.height * 0.3,
            angle = 45,
        }
    })
    --]]

    --

    --Polygon Body:
    --The coordinates must be defined in clockwise order, and the resulting shape must be convex at all angle points.
    --[[
    local pentagonShape =  { 0,-37, 37,-10, 23,34, -23,34, -37,-10 }

    for i = 1, #pentagonShape do
        pentagonShape[i] = pentagonShape[i] * gameConfig.scaleFactor * 0.6
    end

    enemy:setBody({
        shape = pentagonShape
    })
    --]]

    --Edge Shape (Chain) Body: Edge shapes are not restricted to convex angles like polygonal bodies.
    --[[
    local chainPoints = { -120,-140, -100,-90, -80,-60, -40,-20, 0,0, 40,0, 70,-10, 110,-20, 140,-20, 180,-10 }
    for i = 1, #chainPoints do
        chainPoints[i] = chainPoints[i] * gameConfig.scaleFactor * 0.6
    end

    enemy:setBody({
        chain = chainPoints,
        connectFirstAndLastChainVertex = true
    })
    --]]

    --Outline Body
    --[[
    local outline = graphics.newOutline(50, Sprite["expansion-4"].getSheet(), Sprite["expansion-4"].getFrameIndex("Ships/22"))

    for i = 1, #outline do
        if i % 2 == 1 then
            outline[i] = outline[i] - enemy.width/2
        else
            outline[i] = outline[i] - enemy.height/2
        end
    end
    enemy:setBody({
        chain = outline,
        connectFirstAndLastChainVertex = true
    })
    --]]
    enemy:enablePhysics()
    --[[
    enemy:addTimer(2000, function ()
        enemy:scaleWithChangedBody()
    end)
    --]]
    function enemy:scaleWithChangedBody()
        transition.to(self, {
            xScale = 2,
            yScale = 2,
            onComplete = function()
                enemy:setBody({
                    box = {
                        halfWidth = enemy.width, 
                        halfHeight = enemy.height,
                        x = 0,
                        y = 0,
                        angle = 0,
                    }
                })
                local vx, vy = enemy:getLinearVelocity()
                enemy:reInitPhysics()
                enemy:setLinearVelocity(vx, vy)
            end
        })
    end

    return enemy
end

return MyEnemy