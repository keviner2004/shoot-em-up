local a = {}


for i = 0, 10000000 do
    a.new = function()
    end
    local function new()
    end
    a.new = new
end