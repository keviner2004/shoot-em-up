local Sprite = require("Sprite")
local BeamSeg = {}
BeamSeg.new = function ()
    local beamSeg = Sprite["expansion-6"].new("Lasers/Beam/1")
    beamSeg.type = "beamSeg"
    beamSeg.name = "beamSeg"
    return beamSeg
end
return BeamSeg 