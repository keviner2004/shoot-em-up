local NineBtn = require("ui.NineSliceButton")
local Square = {}

Square.new = function(w, h, color)
    local colorTable = {
        white = "Squares/5",
        shadow = "Squares/6",
        red = "Squares/1",
        green = "Squares/4",
        yellow = "Squares/3",
    }

    local value = (color and colorTable[color]) or "squareWhite"
    print(value.."squard")

    local square = NineBtn.new(colorTable[color], w, h)
    return square
end

return Square