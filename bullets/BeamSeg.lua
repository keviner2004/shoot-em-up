local BeamSeg = {}
BeamSeg.new = function ()
    local frames = {sheetInfo:getFrameIndex("Lasers/laserGreen1")}
    local beamSeg = display.newSprite( myImageSheet , {frames=frames} )

    beamSeg.type = "beamSeg"
    beamSeg.name = "beamSeg"

    return beamSeg
end
return BeamSeg 