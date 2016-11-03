local GameObject = require("GameObject")
local Sprite = require("Sprite")
local Station = {}

Station.new = function()
    local station = GameObject.new()
    local sprite = Sprite["expansion-5"].new("Stations/3")
    station:insert(sprite)
    return station
end

return Station