local Sublevel = require("Sublevel")
local GameObject = require("GameObject")
local Missile = require("bullets.Missile")
local sublevel = Sublevel.new("", "")
function sublevel:show(options)
    local missile = Missile.new({fireTo = "character"})
    missile.x = display.contentWidth/2
    missile.y = display.contentHeight/2
    self.view:insert(missile)
    missile:startSmoke()
    missile:seek(self.player)
end

return sublevel