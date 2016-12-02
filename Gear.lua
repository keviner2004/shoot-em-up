local Enemy = require("Enemy")

local Gear = {}

Gear.new = function(options)
    if not options then
        options = {}
    end
    options.isFake = true
    local gear = Enemy.new(options)
    gear.defaultFireTo = "enemy"
    gear:resetCollideMask()

    return gear
end

return Gear

