local NineBtn = require("ui.NineSliceButton")
local Panel = {}

Panel.new = function(w, h, options)
    local panel = NineBtn.new("MetalPanel", w, h, options)
    return panel
end

return Panel