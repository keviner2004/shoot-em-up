local Enemy = require("Enemy")
local Sprite = require("Sprite")
local move = require("move")
local Astronaut = {}

Astronaut.new = function(options)
    local astronaut = Enemy.new(options)
    local sprite = Sprite.new("Astronauts/18")
    astronaut.dir = 0
    astronaut:insert(sprite)
    astronaut:setDefaultBullet("bullets.CircleBullet", {radius = astronaut.height/4})
    astronaut:enablePhysics()

    astronaut.shootDelay = options.shootDelay or 0
    astronaut.shootInterval = options.shootInterval or 1000

    if options and options.player then
        move.pointTo(astronaut, options.player)
    end

    function astronaut:startShootLoop()
        self:addTimer(self.shootDelay,
            function()
                self:shoot({degree = self.dir - self.rotation})
                self:addTimer(self.shootInterval,
                    function()
                        self:shoot({degree = self.dir - self.rotation})
                    end
                , -1)
            end
        )
    end

    return astronaut
end

return Astronaut