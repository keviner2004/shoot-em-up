local Sprite = require("Sprite")
local gameConfig = require("gameConfig")

Sprite.removeSheet("default")

local defaultSpriteName = "sprites/spaceshooter.png"

if gameConfig.contentWidth < 1024 then
    defaultSpriteName = "sprites/spaceshooter@0.5.png"
end

Sprite.addSheet("default", defaultSpriteName, "sprites.spaceshooterHelper_0.5x")