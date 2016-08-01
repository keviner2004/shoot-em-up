local Item = require("Item")
local ScoreUp = {}
ScoreUp.new = function(options)
    local item = Item.new()
    item.name = "scoreup"
    item.score = level * 100

    function item:needKeep(receiver)
        return false
    end

    return item
end
return ScoreUp