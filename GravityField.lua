local GameObject = require("GameObject")
local GravityField = {}
local move = require("move")
local util = require("util")
GravityField.new = function (options)
    local field = GameObject.new(options)
    local radius = (options and options.radius) or 320
    field:addTag("field")
    field:belongTo(PHYSIC_CATEGORY_FIELD)
    field:collideWith(PHYSIC_CATEGORY_ENEMY)
    field:setBody({
        type = "static",
        isSensor = true,
        radius = radius,
    })

    field.joints = {}

    field.collision = function (self, event)
        local victim = event.other
        if ( event.phase == "began" and not victim.immuneGravityField ) then
            print("field "..event.other.mass.."/"..self.mass)
            timer.performWithDelay( 10,
                function()
                    if not util.isExists(victim) then
                        return
                    end
                    victim.touchJoint = physics.newJoint( "touch", victim, victim.x, victim.y )
                    victim.touchJoint.frequency = 0.2
                    victim.touchJoint.dampingRatio = 0.0
                    victim.touchJoint:setTarget( self.x, self.y )
                    victim:enableAutoRotation()
                    field.joints[victim] = victim.touchJoint
                end
            )
        elseif (event.phase == "ended") then
            if victim.touchJoint then
                victim.touchJoint:removeSelf()
                victim.touchJoint = nil
                victim:disableAutoRotation()
                field.joints[victim] = nil
            end
        end
    end

    field:enablePhysics()

    function field:onClear()
        for i, v in ipairs(self.joints) do
            v:removeSelf()
        end
    end

    return field
end

return GravityField
