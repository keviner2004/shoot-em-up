local GravityField = require("GravityField")
local BlackHole = {}

BlackHole.new = function(options)
    local hole = GravityField.new(options)
    
    local circle = display.newCircle(0, 0, 200 )
    circle.fill = {0,0,0, 0.5}
    circle.alpha = 0.8
    hole:insert(circle)

    local function scaleFx(scale, flag)
        if flag then
            scale = 1
        else
            scale = 0.8
        end
        transition.to(circle, {xScale = scale, yScale = scale, onComplete = 
            function()
                scaleFx(scale, not flag)
            end
        })
    end

    scaleFx()

    return hole
end

return BlackHole