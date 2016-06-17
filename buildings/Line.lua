local GameObject = require("GameObject")
local Line = {}

Line.new = function()
    local line = GameObject.new({
            frames = "Buildings/13"
        })
    return line
end

return Line