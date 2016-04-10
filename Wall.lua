local Wall = {}

Wall.new = function(x, y, w, h)
    local wall = display.newRect (x, y, w, h)
    wall.type = "wall"
    wall.name = "wall"
    physics.addBody (wall, "static", { bounce = 1, filter = {categoryBits=32, maskBits=6}})
    return wall
end 

return Wall