local Sprite = require("Sprite")
local Number = {}

local numberDict = {}
numberDict[0] = "UI/Numeral/0"
numberDict[1] = "UI/Numeral/1"
numberDict[2] = "UI/Numeral/2"
numberDict[3] = "UI/Numeral/3"
numberDict[4] = "UI/Numeral/4"
numberDict[5] = "UI/Numeral/5"
numberDict[6] = "UI/Numeral/6"
numberDict[7] = "UI/Numeral/7"
numberDict[8] = "UI/Numeral/8"
numberDict[9] = "UI/Numeral/9"
numberDict["x"] = "UI/Numeral/x"


Number.new = function(value)
    local number = display.newGroup()
    local width = 0
    while true do
        local lastValue = value % 10
        local lastNumber = Sprite["expansion-9"].new(numberDict[lastValue])
        value = math.floor(value / 10)
        width = width + lastNumber.width
        number:insert(lastNumber)
        if value == 0 then
            break
        end
    end
    local sum = 0
    for i = 1, number.numChildren do
        local target = number[i]
        target.x = (width - target.width)/2 - sum
        target.y = 0
        sum = sum + target.width
    end

    return number
end

return Number