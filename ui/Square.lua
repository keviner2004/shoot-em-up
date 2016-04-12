local NineBtn = require("ui.NineSliceButton")
local Square = {}

Square.new = function(w, h, color)
    local colorTable = {
        white = "squareWhite",
        shadow = "squareShadow",
        red = "squareRed",
        green = "squareGreen",
        yellow = "squareYellow",
    }

    local value = (color and colorTable[color]) or "squareWhite"
    print(value.."squard")

    local square = NineBtn.new(string.format("UI/Parts/%s", colorTable[color]), w, h, "")
    return square
end

return Square