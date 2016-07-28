local Backpack = require("Backpack")
local logger = require("logger")
local Util = {}    

Util.new = function (options)
    local _M = Backpack.new({maxItems = 3000})
    local tags = {}

    local cancelMarkList = {}
    local cancelList = {}

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
        logger:verbose(TAG, "call ========== start, %d items", self.numOfItems)
        for i, v in pairs(self:getItems()) do
            --logger:verbose(TAG, "call %dth func with tag: %s", i, v.tag )
            logger:verbose(TAG, "call %dth func with tag: %s", i, tags[v] )
            --logger:verbose(TAG, "call %dth func", i)
            local doit = true
            if v == nil then
                logger:error(TAG, "nil func in the table")
                doit = false
            end
            if cancelMarkList[v] then
                logger:verbose(TAG, "%d th func Cancel flag set, cancel it latter", i)
                doit = false
            end
            if doit then
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
                if result then
                    --auto cancel
                    self:cancel(v)
                end
            end
        end
        --recyle
        for i = 1, #cancelList do
            --set back
            local f = cancelList[i]
            if type(f) == "table" then
                logger:verbose(TAG, "Cancel table")
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
            cancelMarkList[f] = nil
        end
        --clear list
        cancelList = {}
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
            logger:error(TAG, "You can't cancel a nil func")
            return 
        end
        cancelMarkList[f] = true
        cancelList[#cancelList+1] = f
    end

    -- Stop everything
    function _M:cancelAll()
        logger:verbose(TAG, "removeAll enterframe")
        Runtime:removeEventListener('enterFrame', self)
        self:clear()
    end

    return _M
end

return Util