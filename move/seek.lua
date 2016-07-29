local PVector = require("move.PVector")
local moveUtil = require("move.util")
local util = require("util")
local M = {}

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
    local magnitude = (options and options.magnitude) or 450
    local degree = (options and options.degree) or obj.dir
        --print("["..os.time().."]seek "..options.degree.." "..maxForce.." "..maxSpeed)
    local tvx, tvy = obj:getLinearVelocity()
    if tvx ==0 and tvy == 0 then
        obj:setLinearVelocity(
            magnitude * math.sin(math.rad(degree)), 
            - magnitude * math.cos(math.rad(degree)))
    end
    --self:applyForce(-1000, 1000, self.x , self.y)

    moveUtil.addEnterFrameListener(obj, function()
        if not obj.getLinearVelocity then
            return true
        end
        local vx, vy = obj:getLinearVelocity()
        if vx == 0 and vy == 0 then
            --print("seek to the end")
            if options and options.onComplete then
                options.onComplete()
                return true
            end
            --util.removeEnterFrameListener(obj)
        end
        if not util.isExists(target) then
            return true
        end
        M.steer(obj, target, maxSpeed, minForce, maxForce)
    end)
end

function M.steer(obj, target, maxSpeed, minForce, maxForce)
    local vx, vy = obj:getLinearVelocity()
    local rotation = moveUtil.angleBetween(0, 0, vx, vy)
    --print("velocity: x: "..vx..",y: "..vy)
    if vx ~= 0 and vy ~= 0 then 
        obj.rotation = rotation + (obj.dir or 0)
    end
    --obj.rotation = 45
    local desired = PVector.new({ x = target.x - obj.x, y = target.y - obj.y })
    local d = desired:meg()
    --limit(desired, maxSpeed)
    --print("d: "..d)
    desired:normalize()
    if d <= 100 then
        --desiredSpeed = map(d, 0, 100, 0, maxSpeed)
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
    local steering = PVector.new({ x = (desired.x - vx), y = (desired.y - vy)})
    --print("steering 1: x: "..steering.x..",y: "..steering.y)
    steering:limit(minForce, maxForce)
    --print("steering 2: x: "..steering.x..",y: "..steering.y)
    obj.steering = steering
    --obj:applyForce(obj.steering.x, obj.steering.y, obj.x , obj.y)
    obj:setLinearVelocity(vx + obj.steering.x, vy + obj.steering.y)
end

return M