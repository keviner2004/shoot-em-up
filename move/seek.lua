local function normalize(vector)
    local r = (vector.x ^ 2 + vector.y ^ 2) ^ 0.5
    --print("normalize: "..r..", "..vector.x..", "..vector.y)
    vector.x = vector.x / r
    vector.y = vector.y / r
    return vector
end

local function limit(vector, limitValue)
    local r = (vector.x ^ 2 + vector.y ^ 2) ^ 0.5
    if r > limitValue then
        normalize(vector)
        vector.x = vector.x * limitValue
        vector.y = vector.y * limitValue
    end
    return vector
end

local function steer(obj, target, maxSpeed, maxForce)
    if not target.x then
        return
    end
    local vx, vy = obj:getLinearVelocity()
    local rotation = M.angleBetween(0, 0, vx, vy)
    --print("velocity: x: "..vx..",y: "..vy)
    obj.rotation = rotation + (obj.dir or 0)
    obj.rotation = 45
    local desired = normalize({ x = target.x - obj.x, y = target.y - obj.y })
    --print("desired 1: x: "..desired.x..",y: "..desired.y..", maxSpeed:"..maxSpeed)
    desired.x = desired.x * maxSpeed
    desired.y = desired.y * maxSpeed
    --print("desired 2: x: "..desired.x..",y: "..desired.y..", maxSpeed:"..maxSpeed)

    local steering = { x = (desired.x - vx), y = (desired.y - vy)}
    --print("steering 1: x: "..steering.x..",y: "..steering.y)
    limit(steering, maxForce)
    --print("steering 2: x: "..steering.x..",y: "..steering.y)
    obj.steering = steering
    obj:applyForce(obj.steering.x, obj.steering.y, obj.x , obj.y)
end

function seek(obj, target, options)
    if obj.x == nil or not obj.setLinearVelocity then
        print("The object is missing")
        return
    end

    math.randomseed(os.time())
    local maxForce = options.maxForce or 5
    local maxSpeed = options.maxSpeed or 600
    
    if options and options.degree then
        --print("["..os.time().."]seek "..options.degree.." "..maxForce.." "..maxSpeed)
        obj:setLinearVelocity(
            options.magnitude * math.sin(math.rad(options.degree)), 
            - options.magnitude * math.cos(math.rad(options.degree)))
    end
    --self:applyForce(-1000, 1000, self.x , self.y)
    
    obj.m_enterFrame = function()
        if obj.x == target.x and obj.y == target.y then
            if options.onComplete then
                options.onComplete()
                Runtime:removeEventListener("enterFrame", obj.m_enterFrame)
                return
            end
        end
        if obj.paused then
            return
        end
        if obj.x == nil then
            --print("missile is destroyed, remove enterFrame listeners")
            Runtime:removeEventListener("enterFrame", obj.m_enterFrame)
            return
        end
        print("steer")
        M.steer(obj, target, maxSpeed, maxForce)
    end

    Runtime:addEventListener( "enterFrame", obj.m_enterFrame )
end

return 