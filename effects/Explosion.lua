local Sprite = require(Sprite)
local Explosion = {}
Explosion.new = function ()
    local explosion = Sprite.new({
        "",
        ""
    })
    return explosion
end

return Explosion