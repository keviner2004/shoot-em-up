local Enemy = require("Enemy")
local Beam = require("Beam")
local Sprite = require("Sprite")
local Ufo = {}

Ufo.new = function(options)
    local ufo = Enemy.new(options)
    ufo.name = "ufo"
    ufo.allein = Sprite.new("shipGreen_manned")
    ufo:insert(ufo.allein)
    --ufo:addPhysic()

    function ufo:beam(duration)
        local beam = Beam.new({fireTo = "character"})
        print("compare parent")
        print(self.parent)
        print(self.x)
        self.parent:insert(beam)
        self:toFront()
        beam.x = ufo.x
        beam.y = ufo.y
        beam:shoot()
        if duration then
            self:addTimer(duration, function()
                beam:stop()
                beam:removeSelf()      
            end)
        end
    end

    return ufo
end

return Ufo