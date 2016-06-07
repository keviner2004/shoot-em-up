local Asteroid =  require("Asteroid")
local Meteor = {}

Meteor.new = function()
    local asteroid = Asteroid.new("Meteors/Small/3")
    asteroid:addPhysic()
    return asteroid
end

return Meteor