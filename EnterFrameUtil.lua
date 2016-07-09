local Backpack = require("Backpack")
local logger = require("logger")
local Util = {}    

Util.new = function (options)
    local _M = Backpack.new({maxItems = 3000})
    local tags = {}

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

    -- For internal use
    function _M:enterFrame(event)
        logger:verbose(TAG, "call ========== start")
        for i, v in pairs(self:getItems()) do
            --logger:verbose(TAG, "call %dth func with tag: %s", i, v.tag )
            logger:verbose(TAG, "call %dth func with tag: %s", i, tags[v] )
            --logger:verbose(TAG, "call %dth func", i)
            if v == nil then
                logger:error("nil func in the table")
            end
            local result = false
            --if type(v.f) == "table" then
            --    result = v.f:enterFrame(event)
            --else
            --    result = v.f(event)
            --end
            if type(v) == "table" then
                result = v:enterFrame(event)
            else
                result = v(event)
            end
        end
        logger:verbose(TAG, "call ========== end")
    end

    -- Call f each frame
    function _M:each(f, tag)
        --remove at next frame
        if self.numOfItems == 0 then
            Runtime:addEventListener('enterFrame', self)
        end
        if not f then
            logger:error(TAG, "f cannot be nil ")
            return
        end
        tags[f] = tag or ""
        --_M:add({f = f, tag = tag or ""})
        _M:add2(f)
    end

    -- Stop calling f
    function _M:cancel(f)
        if not f then 
            return 
        end
        if type(f) == "table" then
            logger:info(TAG, "Cancel table")
        end
        --local ind = self:remove(f)
        local ind = self:remove2(f)
        tags[f] = nil
        if ind then
            logger:verbose(TAG, "Remove enterFrame %dth listener", ind)
            if self.numOfItems == 0 then
                --print("Set to nil, remove internal enterframe listener")
                Runtime:removeEventListener('enterFrame', self)
            end
        else
            logger:error(TAG, "%s f cannot be removed properly in %d items. ", type(f), self.numOfItems)
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