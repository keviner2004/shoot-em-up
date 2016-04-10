local Level = {}
Level.load = function()
    local level = 
    {
        {
            kind = "enemy", 
            time = 1000, 
            moves = {
                {
                    mode = "straight",
                    startPos = {x = 100, y = 0}, 
                    endPos = {x = 100, y = display.contentHeight},
                    time = 4000
                }
            },

            items = {
                {
                    kind = "powerup"
                }
            }
        },

    }
    return level
end
return Level