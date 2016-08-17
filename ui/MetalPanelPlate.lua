local NineBtn = require("ui.NineSliceButton")
local Panel = {}

Panel.new = function(w, h)
    local panel = NineBtn.new("MetalPanel-plate", w, h, options)
    return panel
end

return Panel