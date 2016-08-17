local NineBtn = require("ui.NineSliceButton")
local Bar = {}

Bar.new = function(w, h)
    local bar = NineBtn.new("Bars/3", w, h, options)
    return bar
end

return Bar