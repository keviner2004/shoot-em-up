local util = {}

function util.isExist(obj)
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

return util