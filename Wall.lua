local Wall = {}

Wall.new = function(x, y, w, h)
    local wall = display.newRect (x, y, w, h)
    wall.type = "wall"
    wall.name = "wall"
    physics.addBody (wall, "static", { bounce = 1, filter = {categoryBits=32, maskBits=6}})
    wall.preCollision = function(self, event)
        --print("wall before hit "..event.other.name)
    end

    wall.collision = function(self, event)
        --print("wall hit "..event.other.name)
    end
    wall:addEventListener("collision", wall)
    wall:addEventListener("preCollision", wall)
    return wall
end 

return Wall