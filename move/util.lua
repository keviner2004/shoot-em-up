local util = {}

util.addEnterFrameListener = function(obj, func)
    obj.m_enterFrame = function()
        if obj.x == nil then
            print("The object is missing")
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

util.angleBetween = function(srcX, srcY, dstX, dstY)
    local angle = math.deg( math.atan2( dstY-srcY, dstX-srcX ) )
    return angle % 360
end

return util