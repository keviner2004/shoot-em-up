local PVector = require("move.PVector")
local enterFrame = require("enterFrame")
local util = {}

--then wrapped enter frame function will be the object is disapeared
util.addEnterFrameListener = function(obj, func, options)
    obj.m_enterFrame = function(event)
        --print("debug")
        if obj.x == nil then
--            print("The object is missing")
            if options and options.onDisapear then
                options.onDisapear(obj)
            end
            enterFrame:cancel(obj.m_enterFrame)
            return
        end
        if obj.paused then
            --print("Game paused "..obj.name)
            return
        end
        --print("obj.m_enterFrame ", obj.m_enterFrame)
        func(event)
    end
    enterFrame:each(obj.m_enterFrame, "movelib")
end

util.removeEnterFrameListener = function(obj)
    enterFrame:cancel(obj.m_enterFrame)
end

util.angleBetween = function(p1, p2, p3, p4)
    local srcX = 0
    local srcY = 0
    local dstX = 0
    local dstY = 0

    if type(p1) == "table" and type(p2) == "table" then
        srcX = p1.x
        srcY = p1.y
        dstX = p2.x
        dstY = p2.y
    else
        srcX = p1
        srcY = p2
        dstX = p3
        dstY = p4
    end

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