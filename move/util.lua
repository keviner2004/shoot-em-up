local PVector = require("move.PVector")
local util = {}

--then wrapped enter frame function will be the object is disapeared
util.addEnterFrameListener = function(obj, func, options)
    obj.m_enterFrame = function()
        --print("debug")
        if obj.x == nil then
--            print("The object is missing")
            if options and options.onDisapear then
                options.onDisapear(obj)
            end
            Runtime:removeEventListener("enterFrame", obj.m_enterFrame)
            return
        end
        if obj.paused then
            return
        end
        func()
    end
    Runtime:addEventListener("enterFrame", obj.m_enterFrame)
end

util.removeEnterFrameListener = function(obj)
    Runtime:removeEventListener("enterFrame", obj.m_enterFrame)
end

util.angleBetween = function(srcX, srcY, dstX, dstY)
    local angle = math.deg( math.atan2( dstY-srcY, dstX-srcX ) )
    return angle % 360
end

util.distBetween = function( x1, y1, x2, y2 )
    local xFactor = x2 - x1
    local yFactor = y2 - y1
    local dist = math.sqrt( (xFactor*xFactor) + (yFactor*yFactor) )
    return dist
end

return util