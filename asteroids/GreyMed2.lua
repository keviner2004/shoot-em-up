local Asteroid =  require("Asteroid")
local Meteor = {}

Meteor.new = function()
    local asteroid = Asteroid.new("Meteors/Med/4")
    asteroid:addPhysic()
    return asteroid
end

return Meteor