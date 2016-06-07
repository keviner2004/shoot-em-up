local PVector = {}

PVector.new = function(x, y)
    local vector = {}
    if type(x) == "table" then
        vector.x = x.x
        vector.y = x.y
    else
        vector.x = x
        vector.y = y
    end
    
    function vector:meg()
        return (self.x ^ 2 + self.y ^ 2) ^ 0.5
    end

    function vector:multi(len)
        self.x = self.x * len
        self.y = self.y * len
    end

    function vector:normalize()
        local r = (self.x ^ 2 + self.y ^ 2) ^ 0.5
        --print("normalize: "..r..", "..vector.x..", "..vector.y)
        self.x = self.x / r
        self.y = self.y / r
        return self
    end

    function vector:limit(min, max)
        local r = (self.x ^ 2 + self.y ^ 2) ^ 0.5
        if r > max then
            self:normalize()
            self.x = self.x * max
            self.y = self.y * max
        end
        return self
    end

    return vector
end

return PVector