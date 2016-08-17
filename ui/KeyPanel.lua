local NineBtn = require("ui.NineSliceButton")
local GlassPanel = {}

GlassPanel.new = function(w, h, options)
    local glassPanel = NineBtn.new("KeyPanel", w, h, options)
    return glassPanel
end

return GlassPanel