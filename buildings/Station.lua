local GameObject = require("GameObject")
local Station = {}

Station.new = function()
    local station = GameObject.new({
            frames = "Stations/3"
        })
    return station
end

return Station