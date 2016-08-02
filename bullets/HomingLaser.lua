local Bullet = require("Bullet")
local Laser = {}
local util = require("util")
local move = require("move")
Laser.new = function(options)
    local laser = Bullet.new(options)
    local sprite = display.newRect(0, 0, 15, 15)
    sprite.fill = {1}
    laser:insert(sprite)
    laser:enablePhysics()
    laser.damage = 1
    function laser:seek(target, options)
        move.seek(self, target, options)
    end

    function laser:footPrint()
        self:addTimer(300, 
            function()
                local seg = display.newRect(0, 0, 15, 15)
                seg.fill = {1}
                seg.x = self.x
                seg.y = self.y
                self.parent:insert(seg)
                transition.to(seg, {time = 100, alpha = 0, xScale = 0.1, yScale = 0.1, onComplete = 
                    function()
                        --if util.isExists(seg) then
                            seg:removeSelf()     
                        --end
                    end
                })
            end
        , -1)
    end

    laser:footPrint()

    return laser
end
return Laser