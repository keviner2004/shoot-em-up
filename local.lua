local spriteInfo = require("tile.lua")


local frameIndex = spriteInfo.frameIndex

local indexFrame = {}

for i, v in ipairs(table) do
    indexFrame[v] = i
end

print(indexFrame[7])