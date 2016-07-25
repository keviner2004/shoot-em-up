local Enemy = require Enemy()
local MyEnemy = {}

MyEnemy.new = function(options)
    local myEnemy = Enemy.new(options)
    return myEnemy
end

return MyEnemy