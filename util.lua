local util = {}

function util.isExists(obj)
    if not obj then
        return false
    end
    if obj.x == nil or obj.parent == nil then
        return false
    else
        return true
    end
end

function util.away(obj)
    obj.x = -1000
    obj.y = -1000
end

function util.equalOrContain(obj1, obj2)
    if obj1 == obj2 then
        return true
    end
    if type(obj2) == "table" then
        for i = 1, #obj2 do
            if obj2[i] == obj1 then
                return true
            end
        end
    end
    return false
end

util.isExist = util.isExists

return util