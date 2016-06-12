local Backpack = require("Backpack")
local Util = {}    

Util.new = function ()
    local _M = Backpack.new({maxItems = 3000})
    
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

    -- Call f next frame
    function _M:next(f)
        timer.performWithDelay(1, f)
    end
    -- For internal use
    function _M:enterFrame(event)  
        --print("call ========== start")
        for i, v in pairs(self:getItems()) do
            --print("call ", i, "th func with tag: ", v.tag )
            if v == nil then
                print("[Error] nil func in the table")
            end
            if type(v.f) == "table" then
                --print("Call table method")
                v.f:enterFrame(event)
            else
                v.f(event)
            end
        end
        --print("call ========== end")
    end

    -- Call f each frame
    function _M:each(f, tag)
        --print("add ", f)
        --remove at next frame
        if self.numOfItems == 0 then
            Runtime:addEventListener('enterFrame', self)
        end
        if not f then
            print("[Error] f cannot be nil ")
            return
        end
        _M:add({f = f, tag = tag})
    end

    -- Stop calling f
    function _M:cancel(f)
        if not f then 
            return 
        end
        if type(f) == "table" then
            --print("Cancel table")
        end
        local ind = self:remove(f)
        print("remove ", ind)
        if ind then
            if self.numOfItems == 0 then
                print("Set to nil, remove internal enterframe listener")
                Runtime:removeEventListener('enterFrame', self)
            end
        else
            print("[Error] f cannot be removed properly")
        end
    end

    -- Stop everything
    function _M:cancelAll()
        print("removeAll enterframe")
        Runtime:removeEventListener('enterFrame', self)
        self:clear()
    end

    return _M
end

return Util