-- The library can only use for GameObject
--require("move.seek")

local M = {}
local curve = require("move.curve")
local follow = require("move.follow")
local seek = require("move.seek")
local util = require("move.util")

M.angleBetween = util.angleBetween
M.distBetween = util.distBetween
M.follow = follow.follow
M.getCurve = curve.getCurve

local function radiusBetween( srcX, srcY, dstX, dstY , degree)
    local radius = math.atan2( dstY-srcY, dstX-srcX )
    return radius
end

local moveTag = 0

function M.isOut(obj)
    local x = obj.x
    local y = obj.y
    if not x or not y then
        return true
    end
    if obj.localToContent then
        x, y = obj:localToContent(0, 0)
    end
    if  x < -(obj.width or 0)/2 or
        x > display.contentWidth + (obj.width or 0)/2 or
        y < -(obj.height or 0)/2 or
        y > display.contentHeight + (obj.height or 0)/2 then
        return true
    end 
    return false
end

function M.isOut2(x, y)
    if x < 0 or x > display.contentWidth or y < 0 or y > display.contentHeight then
        return true
    end 
    return false
end

function M.move(obj, options)
    --option.type: straight, curve
    local function complete()
        if not options.onComplete then
            obj:removeSelf()
        else
            options.onComplete()
        end
    end
    local pathPoints = {}
    local followParams = {}
    if options.mode == "straight" then
        pathPoints = {options.startPos, options.endPos}
    elseif options.mode == "curve" then
        pathPoints = curve.getCurve(options.anchorPoints, options.samples)
    end
    if options.pointTo then
        M.pointTo(options.pointTo)
    end
    followParams = { speed=options.speed, showPoints=true, autoRotation = options.autoRotation, onComplete = complete}
    M.follow( obj, pathPoints, followParams)
end

function M.stick(obj, target, options)
    local offsetX = (options and options.offsetX) or 0
    local offsetY = (options and options.offsetY) or 0
    util.addEnterFrameListener(target, 
        function(event)
            if target.x and target.y then
                obj.x = target.x + offsetX
                obj.y = target.y + offsetY
            end
            --print("Set x y M:", event.time, obj.x)
        end
    )
end

function M.pointTo(obj, target)
    if not target or not target.x or not target.y then
        print("You need to pass a target when you use pointTo")
        return 
    end
    if not obj.dir then
        obj.dir = 0
    end
    util.addEnterFrameListener(obj,
        function(event)
            local srcX = obj.x
            local srcY = obj.y
            local dstX = target.x
            local dstY = target.y
            if obj.localToContent then
                srcX, srcY = obj:localToContent(0, 0)
            end
            if obj.localToContent then
                dstX, dstY = target:localToContent(0, 0)
            end
            
            obj.rotation = util.angleBetween( srcX, srcY, dstX, dstY) + obj.dir
            --print(obj.x, obj.y, target.x, target.y, obj.rotation)
        end
    )
end

function M.track(obj, pointTo)
    local moveTo = {x = 0, y = 0}
    if pointTo.x < obj.x then
        moveTo.x = pointTo.x + dx
    else
        moveTo.x = pointTo.x - dx
    end

    if pointTo.y < obj.y then
        moveTo.y = pointTo.y + dy
    else
        moveTo.y = pointTo.y - dy
    end

    if moveTo.x < 0 then
        moveTo.x = pointTo.x + dx
    end

    if moveTo.x > display.contentWidth then
        moveTo.x = display.contentWidth
    end

    if moveTo.y < 0 then
        moveTo.y = pointTo.y + dy
    end

    if moveTo.y > display.contentHeight then
        moveTo.y = display.contentHeight
    end

    transition.to(obj, {tag = obj.moveTag, delay = 1500, time = 500, x = moveTo.x, y = moveTo.y, 
        onComplete = function ()
            if obj.moveCanceled then
                return
            end 
            print("move to next point")
            obj:onMovePoint({pointTo = pointTo, rotation = obj.rotation})
            --wait
            obj.stopRotation = true
            timer.performWithDelay(1000, function()
                obj.stopRotation = false
                M.track(obj)
            end)
        end
    })
end

function M.toward(obj, options)
    --print("M.toward")
    local dx = (options.offsetX or 5) * math.cos(options.radius or math.rad(options.degree))
    local dy = (options.offsetY or 5) * math.sin((options.radius or math.rad(options.degree) * -1))
    local rRad = math.atan2(-dy, -dx)
    obj.m_defaultX = obj.x
    obj.m_defaultY = obj.y
    
    util.addEnterFrameListener(obj, 
        function()
            --print("dx: "..dx..", dy: "..dy)
            obj.x = obj.x + dx
            obj.y = obj.y + dy
            if options.back and M.isOut(obj) then
                M.stop(obj)
                print("back mode enabled")
                local rx = math.cos(rRad)
                local ry = math.sin(rRad)
                local rxd = 0 
                local ryd = 0 
                local startX = 0
                local startY = 0
                print("rDegree "..math.deg(rRad), rx, ry)

                if rx < 0 then
                    rxd = obj.m_defaultX
                else
                    rxd = display.contentWidth - obj.m_defaultX
                end   
                if ry < 0 then
                    ryd = obj.m_defaultY
                else
                    ryd = display.contentHeight - obj.m_defaultY
                end

                startX = obj.m_defaultX + rx * math.abs(ryd / ry)
                startY = obj.m_defaultY + ry * math.abs(rxd / rx)

                if startX > display.contentWidth then
                    startX = display.contentWidth
                elseif startX < 0 then
                    startX = 0
                end

                if startY > display.contentHeight then
                    startY = display.contentHeight
                elseif startY < 0 then
                    startY = 0
                end

                print("back pos is "..startX, startY)
                M.move(obj, {
                        mode = "straight",
                        startPos = {x = startX, y = startY},
                        endPos = {x = obj.m_defaultX, y = obj.m_defaultY},
                        time = 2000,
                        autoRotation = options.autoRotation,
                        onComplete = function()
                            if options.onComplete then
                                options.onComplete()
                            end
                        end
                })
            end
        end
    )
end

function M.rotatAround(obj, options)
    local angle = options.startDegree or 0
    local function rotation()
        if options.target.x == nil or obj.x == nil then
            print("rotatAround failed because of object disapear")
            M.stop(obj)
            return
        end
        obj.rotation = 360 - ((angle + 90 - obj.dir )%360)
        obj.x = options.target.x + options.distance * math.cos(math.rad(angle))
        obj.y = options.target.y - options.distance * math.sin(math.rad(angle))
    end
    rotation()
    print("start at "..angle)
    util.addEnterFrameListener(obj, 
        function()
            rotation()
            angle = (angle + options.speed)%360
        end
    )
end

function M.stop(obj)
    obj.moveCanceled = true
    if obj then
        transition.cancel(obj)
    end
    
    if obj.m_enterFrame then
        --print("remove enter frame listener")
        util.removeEnterFrameListener(obj)
    end
end

function M.pause(obj)
    obj.paused = true
    if obj then
        transition.pause(obj)
    end
end

function M.resume(obj)
    obj.paused = false
    if obj then
        transition.resume(obj)
    end 
end

M.seek = seek.seek

--modified transition
function M._transition(obj, params)
    if not params then
        params = {}
    end
    if not params.time then
        params.time = 500
    end
    --get current time in ms
    obj.m_startTime = system.getTimer()
    obj.m_params = params
    obj.m_method = "to"
    obj.m_type = "transition"
    obj.m_slow = 1
    transition.to(obj, params)
end

function M.to(obj, params)
    M._transition(obj, params)
    obj.m_method = "to"
    transition.to(obj, params)
end

function M.slow(obj, slow)
    obj.m_slow = slow
    if obj.m_type == "transition" then
        local currentTime = system.getTimer()
        local deltaTime = currentTime - obj.m_startTime
        print(deltaTime)
        if deltaTime > 0 then
            obj.m_params.time = deltaTime * slow
            transition.cancel(obj)
            transition[obj.m_method](obj, obj.m_params)
        end
    end
end

return M
