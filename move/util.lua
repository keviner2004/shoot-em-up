local PVector = require("move.PVector")
local enterFrame = require("enterFrame")
local util = {}
local logger = require("logger")
local TAG = "move.util"
--local count = 0
util.enterFrameContainer = {}
--then wrapped enter frame function will be the object is disapeared
util.addEnterFrameListener = function(obj, func, options)
    --count = count + 1
    if not util.enterFrameContainer[obj] then
        util.enterFrameContainer[obj] = {}
    end

    local m_enterFrame = nil

    m_enterFrame = function(event)
        --event.count = count
        --print("debug: "..obj.name)
        if obj.x == nil then
            logger:verbose(TAG, "The object is missing")
            if options and options.onDisapear then
                options.onDisapear(obj)
            end
            util.removeEnterFrameListener(obj, m_enterFrame)
            return
        end
        if obj.paused then
            --print("Game paused "..obj.name)
            return
        end

        if type(func) == "table" then
            if func:enterFrame(event) then
                --logger:verbose(TAG, "m_enterFrame is interrupted")
                util.removeEnterFrameListener(obj, m_enterFrame)
            end            
        else
            if func(event) then
                --logger:verbose(TAG, "m_enterFrame is interrupted")
                util.removeEnterFrameListener(obj, m_enterFrame)
            end
        end
    end
    --logger:verbose(TAG, "insert enterframe 1")
    table.insert(util.enterFrameContainer[obj], m_enterFrame)
    obj.__idep = options and options.idep
    --logger:debug(TAG, "insert enterframe 2", obj.__idep)
    if obj.__idep then
        Runtime:addEventListener( "enterFrame", m_enterFrame )
    else
        enterFrame:each(m_enterFrame, "movelib")
    end

    return m_enterFrame
end

util.removeEnterFrameListener = function(obj, f)
    if not util.enterFrameContainer[obj] then
        print("[Fetal error] enterFrameContainer is nil")
        return
    end
    if not f then
        --logger:verbose(TAG, "remove all enterFrame")
        for i, v in ipairs(util.enterFrameContainer[obj]) do
            if obj.__idep then
                Runtime:removeEventListener("enterFrame", v)
            else
                enterFrame:cancel(v)
            end
        end
        util.enterFrameContainer[obj] = nil
    else
        --logger:verbose(TAG, "remove specified enterFrame")
        local ind = table.indexOf(util.enterFrameContainer[obj], f)
        if ind and ind > 0 then
            table.remove(util.enterFrameContainer[obj], ind)
            if obj.__idep then
                Runtime:removeEventListener("enterFrame", f)
            else
                enterFrame:cancel(f)
            end
        else
            print("[Fetal error] remove nil func")
        end
        if #util.enterFrameContainer[obj] == 0 then
            util.enterFrameContainer[obj] = nil
        end
    end
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