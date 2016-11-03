local Sprite = require("Sprite")
local BeamSeg = {}
BeamSeg.new = function ()
    local beamSeg = Sprite.new("Lasers/Beam/2")
    beamSeg.type = "beamSeg"
    beamSeg.name = "beamSeg"
    return beamSeg
end
return BeamSeg 