local NineBtn = require("ui.NineSliceButton")
local Panel = {}

Panel.new = function(w, h)
    local glassPanel = NineBtn.new("Panel-white", w, h, options)
    return glassPanel
end

return Panel
