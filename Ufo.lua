local Enemy = require("Enemy")
local Beam = require("Beam")
local Ufo = {}

Ufo.new = function(options)
    local ufo = Enemy.new(options)
    ufo.name = "ufo"
    ufo.allein = ufo:newSprite("shipGreen_manned")
    ufo:insert(ufo.allein)
    ufo:addPhysic()
    function ufo:beam()
        local beam = Beam.new()
        self:toFront()
        beam.x = ufo.x
        beam.y = ufo.y
        beam:shoot()
    end

    return ufo
end

return Ufo