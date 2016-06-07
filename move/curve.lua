
-- Abstract: Curve Drawing
--
-- Version: 1.0
--
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2014 Corona Labs Inc. All Rights Reserved.
------------------------------------------------------------

local Curve = {}

--adjust this number to effect the "smoothness" of the curve (total number of segments)
print("require curve")
function Curve.getCurve( anchorPoints, segNum)
    print("render curve")
    local pathPoints = {}
    for j = 1,segNum do
        pathPoints[#pathPoints+1] = { x=0, y=0 }
    end

    for i = 1,#anchorPoints do
--        print("Anchor point "..i..": "..anchorPoints[i].x.." ,"..anchorPoints[i].y)
    end
    local inc = ( 1.0 / segNum )

    for i = 1,#anchorPoints,4 do
--        print("render cuve "..i)
        local t = 0
        local t1 = 0
        local i = 1

        for j = 1,segNum do 
            t1 = 1.0 - t
            local t1_3 = t1 * t1 * t1
            local t1_3a = (3*t) * (t1*t1)
            local t1_3b = (3*(t*t)) * t1
            local t1_3c = t * t * t
            local p1 = anchorPoints[i]
            local p2 = anchorPoints[i+1]
            local p3 = anchorPoints[i+2]
            local p4 = anchorPoints[i+3]
    
            local x = t1_3 * p1.x
            x = x + t1_3a * p2.x
            x = x + t1_3b * p3.x
            x = x + t1_3c * p4.x

            local y = t1_3 * p1.y
            y = y + t1_3a * p2.y
            y = y + t1_3b * p3.y
            y = y + t1_3c * p4.y

            pathPoints[j].x = x
            pathPoints[j].y = y
            t = t + inc
        end
    end

    return pathPoints
end

return Curve
