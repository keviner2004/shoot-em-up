local Item = require("Item")
local ScoreUp = {}
ScoreUp.new = function(options)
    local sprites = {"Ruby/1", "Ruby/2", "Ruby/3", "Ruby/4"}
    local level = 1
    if options and options.level then
        if options.level < 1 then
            level = 1
        elseif options.level > #sprites then
            level = #sprites
        else
            level = options.level
        end
    end
    local spriteName = sprites[level]
    print("Create item "..spriteName)
    local item = Item.new(spriteName)
    item.level = level
    item.name = "scoreup"
    item.score = level * 100

    return item
end
return ScoreUp