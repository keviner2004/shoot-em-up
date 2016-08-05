local logger = require("logger")
local TAG = "Pool"
local Pool = {}

local pools = {}

Pool.markAsFree = function(obj)
    obj.isVisible = false
    obj:cancel()
end

Pool.markAsUsing = function(obj)
    obj.isVisible = true
    obj:unCancel()
end


Pool.addToPool = function(tag, obj)
    if not pools[tag] then
        pools[tag] = {}
    end
    local _pool = pools[tag]

    Pool.markAsFree(obj)

    _pool[#_pool+1] = obj
end

Pool.getFromPool = function(tag)
    local _pool = pools[tag]
    if not _pool then
        return nil
    end
    for i = 1, #_pool do
        if not _pool[i].isVisible then
            Pool.markAsUsing(_pool[i])
            return _pool[i]
        end
    end
    return nil
end

Pool.clear = function()
    for poolName, _pool in pairs(pools) do
        logger:info(TAG, "clear pool %s", poolName)
        for i = 1, #_pool do
            Pool.markAsFree(_pool[i])
            _pool[i]:destroy()
        end
    end
    pools = {}
end

return Pool