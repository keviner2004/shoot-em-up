local GameObject = require("GameObject")
local Wall = {}

Wall.new = function(x, y, w, h)
    local wall = GameObject.new()
    local sprite = display.newRect (0, 0, w, h)
    sprite.alpha = 0
    wall:insert(sprite)
    wall.type = "wall"
    wall.name = "wall"
    wall.x = x
    wall.y = y
    wall:belongTo(PHYSIC_CATEGORY_WALL)
    wall:collideWith(PHYSIC_CATEGORY_ENEMY, PHYSIC_CATEGORY_CHARACTER, PHYSIC_CATEGORY_BULLET)
    wall:setBody({
        type = "static",
        bounce = 1
    })

    wall.preCollision = function(self, event)
        --print("wall before hit "..event.other.name)
    end

    wall.collision = function(self, event)
        --print("wall hit "..event.other.name)
    end

    wall:enablePhysics()

    return wall
end 

return Wall