
local M = {}
local curve = require("curve")
local function angleBetween( srcX, srcY, dstX, dstY )
    local angle = ( math.deg( math.atan2( dstY-srcY, dstX-srcX ) )+90 )
    return angle % 360
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
    moveTag = moveTag + 1
    obj.moveTag = ""..moveTag
    print("num of path points "..#pathPoints)
    obj.x = pathPoints[1].x
    obj.y = pathPoints[1].y
    local pathPointsGroup = display.newGroup();
    local count = 0
    if params.pointTo then
        obj.rotation = angleBetween( pathPoints[1].x, pathPoints[1].y, params.pointTo.x, params.pointTo.y )
    else
        obj.rotation = angleBetween( pathPoints[1].x, pathPoints[1].y, pathPoints[2].x, pathPoints[2].y )
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
                        obj.rotation = angleBetween( obj.x, obj.y, params.pointTo.x, params.pointTo.y )
                        --print("rotation not locked: "..obj.rotation)
                    else
                        --print("rotation locked: "..obj.rotation)
                    end
                end
                Runtime:addEventListener( "enterFrame", obj )
            elseif obj.nextPoint <= #pathPoints then
                --rotation = angleBetween( pathPoints[obj.nextPoint].x, pathPoints[obj.nextPoint].y, pathPoints[obj.next2Point].x, pathPoints[obj.next2Point].y )
                rotation = angleBetween(obj.x, obj.y, pathPoints[obj.nextPoint].x, pathPoints[obj.nextPoint].y)
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
                obj.rotation = rotation
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
        followParams = { segmentTime=options.time, constantRate=true, showPoints=true, pointTo = options.pointTo}
    elseif options.mode == "curve" then
        pathPoints = curve.getCurve(options.anchorPoints, options.samples)
        followParams = { segmentTime=options.time, constantRate=true, showPoints=true, pointTo = options.pointTo}
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

    local function follow()
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
                    follow()
                end)
            end
        })
    end
    follow()
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
    local dx = (options.offsetX or 5) * math.sin(math.rad(options.degree))
    local dy = (options.offsetY or 5) * math.cos(math.rad(options.degree))
    --print("dx: "..dx..", dy: "..dy)
    obj.enterFrame = function()
        --print("!!!!!")
        obj.x = obj.x + dx
        obj.y = obj.y + dy
        if obj.x > display.contentWidth or obj.y > display.contentHeight or obj.x < 0 or obj.y < 0 then
            M.stop(obj)
            if options.onComplete then
                options.onComplete()
            else
                --print("toward obj remove")
                --physics.removeBody(obj)
                obj:removeSelf()
            end
        end
    end
    Runtime:addEventListener("enterFrame", obj)
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


function M.stop(obj)
    obj.moveCanceled = true
    if obj.moveTag then
        --print("Cancel move tag: " ..obj.moveTag)
        transition.cancel(obj.moveTag)
    end
    --print("remove enter frame listener")
    Runtime:removeEventListener("enterFrame", obj)
end

return M
