local Enemy = require("Enemy")

local Gear = {}

Gear.new = function(options)
    local gear = Enemy.new()
    gear.defaultFireTo = "enemy"
    gear:resetCollideMask()

    return gear
end

return Gear

