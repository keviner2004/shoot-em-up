local Backpack = require("Backpack")
local logger = require("logger")
local Util = {}    

Util.new = function (options)
    local _M = Backpack.new({maxItems = 3000})
    _M.owner = (options and options.owner) or ""
    local TAG = "EnterFrame.".._M.owner
    function _M:remove(f)
        local idx = nil
        for i, v in pairs(self.items) do
            if v.f == f then
                idx = i
                self.items[idx] = nil
                self.numOfItems = self.numOfItems - 1
                break
            end
        end
        return idx
    end

    function _M:setOwner(name)
        self.owner = name
        TAG = "EnterFrame.".._M.owner
    end

    -- Call f next frame
    function _M:next(f)
        timer.performWithDelay(1, f)
    end
    -- For internal use
    function _M:enterFrame(event)  
        logger:verbose(TAG, "call ========== start")
        for i, v in pairs(self:getItems()) do
            logger:verbose(TAG, "call %dth func with tag: %s", i, v.tag )
            if v == nil then
                logger:error("nil func in the table")
            end
            if type(v.f) == "table" then
                --print("Call table method ", v.tag)
                v.f:enterFrame(event)
            else
                v.f(event)
            end
        end
        logger:verbose(TAG, "call ========== end")
    end

    -- Call f each frame
    function _M:each(f, tag)
        --print("add ", f)
        --remove at next frame
        if self.numOfItems == 0 then
            Runtime:addEventListener('enterFrame', self)
        end
        if not f then
            logger:error("f cannot be nil ")
            return
        end
        _M:add({f = f, tag = tag or ""})
    end

    -- Stop calling f
    function _M:cancel(f)
        if not f then 
            return 
        end
        if type(f) == "table" then
            logger:verbose(TAG, "Cancel table")
        end
        local ind = self:remove(f)
        if ind then
            logger:verbose(TAG, "Remove enterFrame %dth listener", ind)
            if self.numOfItems == 0 then
                --print("Set to nil, remove internal enterframe listener")
                Runtime:removeEventListener('enterFrame', self)
            end
        else
            logger:error("%s f cannot be removed properly in %d items. ", type(f), self.numOfItems)
        end
    end

    -- Stop everything
    function _M:cancelAll()
        --print("removeAll enterframe")
        Runtime:removeEventListener('enterFrame', self)
        self:clear()
    end

    return _M
end

return Util