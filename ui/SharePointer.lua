local Sprite = require("Sprite")
local gameConfig = require("gameConfig")

local P = {}

P.new = function()
    local pointer = Sprite["expansion-9"].new(gameConfig.defaultCursor)
    return pointer
end

return P