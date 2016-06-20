local util = require("move.util")
local logger = require("logger")
local PVector = require("move.PVector")
local M = {}
local TAG = "follow"

M.smoothTransition = function(target, options)
    --target.x = target.x + ((options and options.dampX) or 0)
    --target.y = target.y + ((options and options.dampY) or 0)
    local duration = (options and options.time) or 500
    local desired = PVector.new({x = options.x - target.x, y = options.y - target.y})
    local d = desired:meg()
    local offset = d / duration * (1000 / display.fps)
    desired:normalize()
    desired:multi(offset)
    local offsetX = desired.x
    local offsetY = desired.y
    target.x = target.x
    target.y = target.y
    options.x = options.x
    options.y = options.y
    --print("OffsetX: "..offsetX..", OffsetY:"..offsetY..", distance: "..d..", duration: "..duration)
    local isDoneX = false
    local isDoneY = false
    local remainX = 0
    local remainY = 0
    --[[
    if options.remain then
        local remainVector = PVector.new({x = options.x - target.x, y = options.y - target.y})
        remainVector:normalize()
        remainVector:multi(options.remain)
        target.x = target.x + remainVector.x
        target.y = target.y + remainVector.y
        print("move remaining distance from last transition: "..options.remain..", x: "..remainVector.x..",y: "..remainVector.y)
        if target.x > options.x or target.y > options.y then
            print("Hahaha")
        end

    end
    --]]
    function trans()
        --print("d: "..d.."target.x: "..target.x..", target.y: "..target.y..", options.x: "..options.x..", options.y: "..options.y)
        if target.x ~= options.x then
            if target.x < options.x and target.x + offsetX > options.x then
                remainX = target.x + offsetX - options.x
                target.x = options.x
                isDoneX = true
            elseif target.x > options.x and target.x + offsetX < options.x then
                remainX = target.x + offsetX - options.x
                target.x = options.x
                isDoneX = true
            else
                target.x = target.x + offsetX
            end
        else
            isDoneX = true
        end
        
        if target.y ~= options.y then
            if target.y < options.y and target.y + offsetY > options.y then
                remainY = target.y + offsetY - options.y
                target.y = options.y
                isDoneY = true
            elseif target.y > options.y and target.y + offsetY < options.y then
                remainY = target.y + offsetY - options.y
                target.y = options.y
                isDoneY = true
            else
                target.y = target.y + offsetY   
            end
        else
            isDoneY = true
        end

        if isDoneX and isDoneY then
            logger:verbose(TAG, "Complete, return true for finish smooth move")
            --util.removeEnterFrameListener(target)
            options.onComplete((remainX^2 + remainY^2)^0.5)
            return true
        end
    end
    logger:verbose(TAG, "Add enterframe listener for smooth move")
    util.addEnterFrameListener(target, trans, options)
end

M.followN = function(target, points, options)
    local moveObj = {}
    moveObj.points = points
    moveObj.target = target
    moveObj.autoRotation = options.autoRotation
    moveObj.pIdx = 0
    moveObj.lastTimestamp = 0
    moveObj.speed = (options and options.speed) or 200
    if ( options.showPoints == true ) then
        local pathPointsGroup = display.newGroup()
        for p = 1,#points do
            local dot = display.newCircle( pathPointsGroup, 0, 0, 8 )
            dot:setFillColor( 1, 1, 1, 0.4 )
            dot.x = points[p].x
            dot.y = points[p].y
        end
        target.parent:insert(pathPointsGroup)
        moveObj.pathPointsGroup = pathPointsGroup
    end

    options.onDisapear = function ()
        if moveObj.pathPointsGroup then
            moveObj.pathPointsGroup:removeSelf()
        end
    end

    function moveObj:init()
        --print("move init 2 ")
        self.x = self.points[self.pIdx].x
        self.y = self.points[self.pIdx].y
        self.desired = PVector.new({x = self.x - target.x, y = self.y - target.y})
        local d = self.desired:meg()
        local offset = self.speed * (1 / display.fps)
        self.desired:normalize()
        --self.desired:multi(offset)
        self.offsetX = self.desired.x * offset
        self.offsetY = self.desired.y * offset
        self.first = true
        --print("OffsetX: "..self.offsetX..", OffsetY:"..self.offsetY..", distance: "..d..", duration: "..duration)
        self.isDoneX = false
        self.isDoneY = false
        self.remainX = 0
        self.remainY = 0
    end

    function moveObj:getNextPoint()
        return self.points[self.nextPIdx]
    end

    function moveObj:inc()
        self.pIdx = self.pIdx + 1
        --print("self.pIdx", self.pIdx)
        self.nextPIdx = self.pIdx + 1
        --print("self.nextPIdx", self.nextPIdx)
    end

    function moveObj:rotate()
        if not self.autoRotation then
            return
        end
        self.target.rotation = util.angleBetween(self.target.x, self.target.y, self.x, self.y) + self.target.dir
    end

    function moveObj:enterFrame(event)
        if self.first then
            self:rotate()
            if options.onPoint then
                options.onPoint()
            end
            self.first = false
        end
        if self.target.x ~= self.x then
            if self.target.x < self.x and self.target.x + self.offsetX > self.x then
                self.remainX = self.target.x + self.offsetX - self.x
                self.target.x = self.x
                self.isDoneX = true
            elseif self.target.x > self.x and self.target.x + self.offsetX < self.x then
                self.remainX = self.target.x + self.offsetX - self.x
                self.target.x = self.x
                self.isDoneX = true
            else
                self.target.x = self.target.x + self.offsetX
            end
        else
            self.isDoneX = true
        end
        
        if self.target.y ~= self.y then
            if self.target.y < self.y and self.target.y + self.offsetY > self.y then
                self.remainY = self.target.y + self.offsetY - self.y
                self.target.y = self.y
                self.isDoneY = true
            elseif self.target.y > self.y and self.target.y + self.offsetY < self.y then
                self.remainY = self.target.y + self.offsetY - self.y
                self.target.y = self.y
                self.isDoneY = true
            else
                self.target.y = self.target.y + self.offsetY   
            end
        else
            self.isDoneY = true
        end
        --print("target.x: "..self.target.x..", target.y: "..self.target.y..", x: "..self.x..", y: "..self.y, self.isDoneX, self.isDoneY, self.pIdx)
        if self.isDoneX and self.isDoneY then
            self.remain = (self.remainX^2 + self.remainY^2)^0.5
            self:skipPoints()
            self:inc()
            if self:isComplete() then
                logger:debug(TAG, "Complete, return true for finish smooth move")
                if self.pathPointsGroup then
                    display.remove(self.pathPointsGroup)
                end
                if options.onComplete then
                    options.onComplete()
                end
                --exit moving loop
                return true
            end
            --print("move init 1 ")
            self:init()
        end
    end

    function moveObj:isComplete()
        return self.pIdx > #points
    end

    function moveObj:skipPoints()
        --the loop will skip points
        local nextPoint = self:getNextPoint()
        if not nextPoint then
            return
        end
        local dist = util.distBetween( self.target.x, self.target.y, nextPoint.x, nextPoint.y )
        if self.remain then
            if self.remain > dist then
                --print("Skip pint "..self.nextPIdx)
                self.target.x = nextPoint.x
                self.target.y = nextPoint.y
                self:inc()
                self.remain = self.remain - dist
                return self:skipPoints()
            end
            --print("kerker "..self.remain.." < "..dist)
            local remainVector = PVector.new({x = nextPoint.x - self.target.x, y = nextPoint.y - self.target.y})
            remainVector:normalize()
            remainVector:multi(self.remain)
            self.target.x = self.target.x + remainVector.x
            self.target.y = self.target.y + remainVector.y
            --print("move remaining distance from last transition: "..options.remain..", x: "..remainVector.x..",y: "..remainVector.y)
        end
    end

    moveObj:inc()
    moveObj:init()
    logger:verbose(TAG, "Add enterframe listener for smooth move")
    util.addEnterFrameListener(target, moveObj, options)
end


function M.follow( obj, pathPoints, params)
    local speed = params.speed or 100
    --print("follow with speed "..speed)
    if not obj.dir then
        obj.dir = 0
    end
    --print("num of path points "..#pathPoints)
    obj.x = pathPoints[1].x
    obj.y = pathPoints[1].y
    local pathPointsGroup = display.newGroup();
    local count = 0
    
    if params.autoRotation then
        obj.rotation = util.angleBetween( pathPoints[1].x, pathPoints[1].y, pathPoints[2].x, pathPoints[2].y )
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

    local function onDisapear()
        (pathPointsGroup):removeSelf()
    end

    local function rotation()
        if params.autoRotation then
            local rotation = obj.lastRotation
            if obj.nextPoint <= #pathPoints then
                --rotation = angleBetween( pathPoints[obj.nextPoint].x, pathPoints[obj.nextPoint].y, pathPoints[obj.next2Point].x, pathPoints[obj.next2Point].y )
                rotation = util.angleBetween(obj.x, obj.y, pathPoints[obj.nextPoint].x, pathPoints[obj.nextPoint].y) + obj.dir
                obj.lastRotation = rotation
                obj.rotation = rotation
                --print("rotation: "..rotation)
            end
        end
    end

    local function inc()
        obj.nextPoint = obj.nextPoint+1
        obj.next2Point = obj.nextPoint+1
        count = count + 1
    end

    local ideaOffset = speed / 1000 *  (1000 / display.fps)
--    print("ideaOffset: "..ideaOffset)
    local function nextTransition(remain)
        te_time = system.getTimer()
        --print("transTime: "..te_time - ts_time)
        if ( obj.nextPoint > #pathPoints ) then
            --print( "FINISHED "..(system.getTimer()-start_time)) 
            if params.showPoints == true then
                onDisapear()
            end
            if params.onComplete then
                params.onComplete(obj)
            end
        else            
            ts_time = system.getTimer()
            local dist = util.distBetween( obj.x, obj.y, pathPoints[obj.nextPoint].x, pathPoints[obj.nextPoint].y )
            local transTime = (dist/ speed*1000)
            if remain then
                --if transTime >= (1000 / display.fps) then
                if remain > dist then
                    obj.x = pathPoints[obj.nextPoint].x
                    obj.y = pathPoints[obj.nextPoint].y
                    inc()
                    --print("kerker "..remain.." > "..dist)
                    return nextTransition(remain - dist)
                end
                --print("kerker "..remain.." < "..dist)
                local remainVector = PVector.new({x = pathPoints[obj.nextPoint].x - obj.x, y = pathPoints[obj.nextPoint].y - obj.y})
                remainVector:normalize()
                remainVector:multi(remain)
                obj.x = obj.x + remainVector.x
                obj.y = obj.y + remainVector.y
                --[[
                else
                    obj.nextPoint = obj.nextPoint+1
                    obj.next2Point = obj.nextPoint+1
                    count = count + 1
                    --print("kerker "..remain.." > "..dist)
                    return nextTransition(remain)
                end
                --]]
                --print("move remaining distance from last transition: "..options.remain..", x: "..remainVector.x..",y: "..remainVector.y)
            end
            dist = util.distBetween( obj.x, obj.y, pathPoints[obj.nextPoint].x, pathPoints[obj.nextPoint].y )
            transTime = (dist/ speed*1000)
            --print("dist: "..dist..", t: "..transTime)
            if transTime >= (1000 / display.fps) then
                rotation()
                logger:verbose(TAG, "smooth transition with time: "..transTime.. ", point: "..obj.nextPoint)
                M.smoothTransition( obj, {
                --transition.to( obj, {
                    time = transTime,
                    x = pathPoints[obj.nextPoint].x,
                    y = pathPoints[obj.nextPoint].y,
                    --rotation = rotation,
                    onComplete = nextTransition,
                    onDisapear = onDisapear,
                    onCancel = onDisapear, 
                    remain = remain,
                    idep = true
                })
                inc()
            else
                --print("merge")
                if obj.nextPoint == #pathPoints  then
                    rotation()
                    --print("end")
                    obj.x = pathPoints[obj.nextPoint].x
                    obj.y = pathPoints[obj.nextPoint].y
                end
                inc()
                nextTransition()
            end
        end
    end
    
    obj.nextPoint = 2
    obj.next2Point = 3
    obj.lastRotation = obj.rotation
    nextTransition()
end

return M
