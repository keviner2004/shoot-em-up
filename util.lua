local util = {}

function util.isExist(obj)
    if not obj then
        return false
    end
    if obj.x == nil then
        return false
    else
        return true
    end
end

function util.addTimerUtil(obj)
    
end

return util