-- The library can only use for GameObject
--require("move.seek")

local M = {}
local curve = require("move.curve")


function M.addEnterFrameListener(obj, func)
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

function M.removeEnterFrameListener(obj)
    Runtime:removeEventListener("enterFrame", obj.m_enterFrame)
end

local function angleBetween( srcX, srcY, dstX, dstY)
    local angle = math.deg( math.atan2( dstY-srcY, dstX-srcX ) )
    return angle % 360
end

local function radiusBetween( srcX, srcY, dstX, dstY , degree)
    local radius = math.atan2( dstY-srcY, dstX-srcX )
    return radius
end

local function distBetween( x1, y1, x2, y2 )
    local xFactor = x2 - x1
    local yFactor = y2 - y1
    local dist = math.sqrt( (xFactor*xFactor) + (yFactor*yFactor) )
    return dist
end

local moveTag = 0

M.angleBetween = angleBetween

M.distBetween = distBetween

function M.isOut(obj)
    if obj.x < 0 or obj.x > display.contentWidth or obj.y < 0 or obj.y > display.contentHeight then
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

function M.follow( obj, params, pathPoints, pathPrecision, onComplete)
    if not obj.dir then
        obj.dir = 0
    end
    moveTag = moveTag + 1
    obj.moveTag = ""..moveTag
    print("num of path points "..#pathPoints)
    obj.x = pathPoints[1].x
    obj.y = pathPoints[1].y
    local pathPointsGroup = display.newGroup();
    local count = 0
    if params.pointTo then
        obj.rotation = angleBetween( pathPoints[1].x, pathPoints[1].y, params.pointTo.x, params.pointTo.y ) + 90
    elseif autoRotation then
        obj.rotation = angleBetween( pathPoints[1].x, pathPoints[1].y, pathPoints[2].x, pathPoints[2].y ) + 90
    end
    if ( pathPrecision == 0 ) then
        pathPrecision = distBetween( pathPoints[1].x, pathPoints[1].y, pathPoints[2].x, pathPoints[2].y )
    end
    
    --if "showPoints" is true, plot points along path
    if ( params.showPoints == true ) then
        for p = 1,#pathPoints do
            local dot = display.newCircle( pathPointsGroup, 0, 0, 8 )
            dot:setFillColor( 1, 1, 1, 0.4 )
            dot.x = pathPoints[p].x
            dot.y = pathPoints[p].y
        end
    end
    local start_time = system.getTimer()
    local ts_time = system.getTimer()
    local te_time = system.getTimer()
    local function onCancel()
        print("onCancel moves")
        pathPointsGroup:removeSelf()
    end
    local function nextTransition()
        te_time = system.getTimer()
        --print("transTime: "..te_time - ts_time)
        if ( obj.nextPoint > #pathPoints ) then
            print( "FINISHED "..(system.getTimer()-start_time)) 
            if ( params.showPoints == true ) then
                (pathPointsGroup):removeSelf()
            end
            if onComplete then
                onComplete(obj)
            end
        else
            --set variable for time of transition on this segment
            local transTime = params.segmentTime
            --if "params.constantRate" is true, adjust time according to segment distance
            if ( params.constantRate == true ) then
                local dist = distBetween( obj.x, obj.y, pathPoints[obj.nextPoint].x, pathPoints[obj.nextPoint].y )
                transTime = (dist/pathPrecision) * params.segmentTime
            end
            
            --transition along segment
            local rotation = obj.lastRotation
            if params.pointTo then
                obj.enterFrame = function()
                    --print("t")
                    if not obj.stopRotation then
                        obj.rotation = angleBetween( obj.x, obj.y, params.pointTo.x, params.pointTo.y ) + 90
                        --print("rotation not locked: "..obj.rotation)
                    else
                        --print("rotation locked: "..obj.rotation)
                    end
                end
                Runtime:addEventListener( "enterFrame", obj )
            elseif obj.nextPoint <= #pathPoints then
                --rotation = angleBetween( pathPoints[obj.nextPoint].x, pathPoints[obj.nextPoint].y, pathPoints[obj.next2Point].x, pathPoints[obj.next2Point].y )
                rotation = angleBetween(obj.x, obj.y, pathPoints[obj.nextPoint].x, pathPoints[obj.nextPoint].y) - obj.dir + 90
                obj.lastRotation = rotation
            end
            
            ts_time = system.getTimer()
            if params.pointTo then
                transition.to( obj, {
                    tag = obj.moveTag,
                    time = transTime,
                    x = pathPoints[obj.nextPoint].x,
                    y = pathPoints[obj.nextPoint].y,
                    onComplete = nextTransition
                })
            else
                if params.autoRotation then
                    obj.rotation = rotation
                end
                transition.to( obj, {
                    tag = obj.moveTag,
                    time = transTime,
                    x = pathPoints[obj.nextPoint].x,
                    y = pathPoints[obj.nextPoint].y,
                    --rotation = rotation,
                    onComplete = nextTransition,
                    onCancel = onCancel
                })
            end
            obj.nextPoint = obj.nextPoint+1
            obj.next2Point = obj.nextPoint+1
            count = count + 1
        end
    end
    
    obj.nextPoint = 2
    obj.next2Point = 3
    obj.lastRotation = obj.rotation
    nextTransition()
end

function M.move(obj, options)
    --option.type: straight, curve
    local pathPoints = {}
    local followParams = {}
    if options.mode == "straight" then
        pathPoints = {options.startPos, options.endPos}
        followParams = { segmentTime=options.time, constantRate=true, showPoints=true, pointTo = options.pointTo, autoRotation = options.autoRotation}
    elseif options.mode == "curve" then
        pathPoints = curve.getCurve(options.anchorPoints, options.samples)
        followParams = { segmentTime=options.time, constantRate=true, showPoints=true, pointTo = options.pointTo, autoRotation = options.autoRotation}
    end
    M.follow( obj, followParams, pathPoints, 0,
        function()
            if not options.onComplete then
                obj:removeSelf()
            else
                options.onComplete()
            end
        end
    )
end

function M.goStraightAndFollow(obj, startPos, endPos, pointTo, dx, dy)
    M.move(obj, {
            mode = "straight",
            pointTo = pointTo,
            startPos = startPos,
            endPos = endPos,
            time = 500,
            onComplete = function()
                -- body
                --M.stop(obj)
                print("stop follow me!")
                
            end
    })

    local function _follow()
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
                    _follow()
                end)
            end
        })
    end
    _follow()
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

function M.goStrait(obj, startPos, endPos, time, onComplete)
    M.move(obj, {
            mode = "straight",
            startPos = startPos,
            endPos = endPos,
            time = time,
            onComplete = onComplete
        })
end

function M.goCurve(obj)
    M.move(obj, {
            mode = "curve",
            anchorPoints = {{x = 0, y = 0}, {x = 0, y = 0}, {x = 0, y = 1400}, {x = 1200, y = 1400}},
            samples = 20, 
            time = 50
        })
end

function M.toward(obj, options)
    --print("M.toward")
    local dx = (options.offsetX or 5) * math.cos(options.radius or math.rad(options.degree))
    local dy = (options.offsetY or 5) * math.sin(options.radius or math.rad(options.degree))
    local rRad = math.atan2(-dy, -dx)
    obj.m_defaultX = obj.x
    obj.m_defaultY = obj.y
    --print("dx: "..dx..", dy: "..dy)
    obj.m_enterFrame = function()
        if obj.paused then
            return
        end
        if obj.x == nil then
            --object is removed, stop moving
            Runtime:removeEventListener("enterFrame", obj.m_enterFrame)
            return
        end
        obj.x = obj.x + dx
        obj.y = obj.y + dy
        if M.isOut(obj) then
            M.stop(obj)
            if options.back then
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

            elseif options.onComplete then
                print("toward complete")
                options.onComplete()
            else
                --print("toward obj remove")
                --physics.removeBody(obj)
                obj:removeSelf()
            end
        end
    end
    Runtime:addEventListener("enterFrame", obj.m_enterFrame)
end

function M.goLoop(obj, pointTo, moves, idx)
    if idx > #moves then
        obj:removeSelf()
        return
    end
    local move  = moves[idx]
    local pointToObj = nil
    if move.pointTo then
        pointToObj = pointTo
    end
    if move.mode == "straight" then
        M.move(obj, {
                mode = "straight",
                startPos = move.startPos,
                endPos = move.endPos,
                time = move.time,
                pointTo = pointToObj,
                onComplete = function()
                    M.goLoop(obj, pointTo, moves, idx + 1)
                end
            })
    elseif move.mode == "track" then
        if not M.pointTo then
            print("You must specific an object you want to track when you use track method")
        end
        M.track(obj, pointTo)
    end

end

function M.go(obj, pointTo, moves)
    M.goLoop(obj, pointTo, moves, 1)
end

function M.rotatAround(obj, options)
    local angle = options.startDegree or 0
    local function rotation()
        if options.target.x == nil or obj.x == nil then
            print("rotatAround failed because of object disapear")
            Runtime:removeEventListener("enterFrame", obj.m_enterFrame)
            return
        end
        obj.rotation = 360 - ((angle + 90 )%360)
        obj.x = options.target.x + options.distance * math.cos(math.rad(angle))
        obj.y = options.target.y - options.distance * math.sin(math.rad(angle))
    end
    rotation()
    print("start at "..angle)
    obj.m_enterFrame = function()
        if obj.paused then
            return
        end
        rotation()
        angle = (angle + options.speed)%360
    end

    Runtime:addEventListener("enterFrame", obj.m_enterFrame)
end

function M.stop(obj)
    obj.moveCanceled = true
    if obj then
        transition.cancel(obj)
    end
    --print("remove enter frame listener")
    if obj.m_enterFrame then
        Runtime:removeEventListener("enterFrame", obj.m_enterFrame)
    end
    Runtime:removeEventListener("enterFrame", obj)
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

--PVector
local function meg(vector)
    return (vector.x ^ 2 + vector.y ^ 2) ^ 0.5
end

local function normalize(vector)
    local r = (vector.x ^ 2 + vector.y ^ 2) ^ 0.5
    --print("normalize: "..r..", "..vector.x..", "..vector.y)
    vector.x = vector.x / r
    vector.y = vector.y / r
    return vector
end

local function limit(vector, min, max)
    local r = (vector.x ^ 2 + vector.y ^ 2) ^ 0.5
    if r > max then
        normalize(vector)
        vector.x = vector.x * max
        vector.y = vector.y * max
    end
    return vector
end

local function map(distance, rangeStart, rangeEnd, minSpeed, maxSpeed)
    if distance < 1 then
        return 0
    end
    return minSpeed + (distance / (rangeEnd - rangeStart) * (maxSpeed - minSpeed))
end

function M.seek(obj, target, options)
    if obj.x == nil or not obj.setLinearVelocity then
        print("The object is missing")
        return
    end

    math.randomseed(os.time())
    local maxForce = (options and options.maxForce) or 50
    local minForce = (options and options.minForce) or 1
    local maxSpeed = (options and options.maxSpeed) or 400
    
    if options and options.degree then
        --print("["..os.time().."]seek "..options.degree.." "..maxForce.." "..maxSpeed)
        obj:setLinearVelocity(
            options.magnitude * math.sin(math.rad(options.degree)), 
            - options.magnitude * math.cos(math.rad(options.degree)))
    end
    --self:applyForce(-1000, 1000, self.x , self.y)

    M.addEnterFrameListener(obj, function()
        local vx, vy = obj:getLinearVelocity()
        if vx == 0 and vy == 0 then
            print("seek to the end")
            if options and options.onComplete then
                options.onComplete()
                return
            end
            M.removeEnterFrameListener(obj)
        end
        M.steer(obj, target, maxSpeed, minForce, maxForce)
    end)
end

function M.steer(obj, target, maxSpeed, minForce, maxForce)
    if not target.x then
        return
    end
    local vx, vy = obj:getLinearVelocity()
    local rotation = M.angleBetween(0, 0, vx, vy)
    --print("velocity: x: "..vx..",y: "..vy)
    if vx ~= 0 and vy ~= 0 then 
        obj.rotation = rotation + (obj.dir or 0)
    end
    --obj.rotation = 45
    local desired = { x = target.x - obj.x, y = target.y - obj.y }
    local d = meg(desired)
    --limit(desired, maxSpeed)
    --print("d: "..d)
    desired = normalize({ x = target.x - obj.x, y = target.y - obj.y })
    if d <= 100 then
        desiredSpeed = map(d, 0, 100, 0, maxSpeed)
        --print("distance: "..d..", desiredSpeed: "..desiredSpeed)
    else
        desiredSpeed = maxSpeed
        --print("desired 1: x: "..desired.x..",y: "..desired.y..", maxSpeed:"..maxSpeed)
    end

    --print("desired 1: x: "..desired.x..",y: "..desired.y..", maxSpeed:"..maxSpeed)
    desired.x = desired.x * desiredSpeed
    desired.y = desired.y * desiredSpeed
    --print("desired 2: x: "..desired.x..",y: "..desired.y..", maxSpeed:"..maxSpeed)       
    --v = f/m*t
    local steering = { x = (desired.x - vx), y = (desired.y - vy)}
    --print("steering 1: x: "..steering.x..",y: "..steering.y)
    limit(steering, minForce, maxForce)
    --print("steering 2: x: "..steering.x..",y: "..steering.y)
    obj.steering = steering
    --obj:applyForce(obj.steering.x, obj.steering.y, obj.x , obj.y)
    obj:setLinearVelocity(vx + obj.steering.x, vy + obj.steering.y)
end

function M.to(obj, params)
    if not params.time then
        params.time = 500
    end
    --get current time in ms
    obj.m_startTime = system.getTimer()
    obj.m_params = params
    obj.m_method = "to"
    obj.m_type = "transition"
    transition.to(obj, params)
end

function M.slow(obj, slow)
    if obj.m_type == "transition" then
        local currentTime = system.getTimer()
        local deltaTime = currentTime - obj.m_startTime
        if deltaTime > 0 then
            obj.m_params.time = deltaTime * slow
            transition.cancel(obj)
            transition[obj.m_method](obj, obj.m_params)
        end
    end
end

return M
