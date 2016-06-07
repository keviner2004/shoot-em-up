local NineBtn = require("ui.NineSliceButton")
local GlassPanel = {}

GlassPanel.new = function(w, h)
    local glassPanel = NineBtn.new("GlassPanel", w, h, "")
    return glassPanel
end

return GlassPanel