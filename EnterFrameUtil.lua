local Backpack = require("Backpack")
local Util = {}    

Util.new = function ()
    local _M = {}
    -- Call f next frame
    function _M.next(f)  
        timer.performWithDelay(1, f)
    end
    -- For internal use
    function _M.enterFrame(event)  
        --print("call ========== start")
        for i, v in pairs(_M.enterFrameFunctions:getItems()) do
            --print("call ", i, "th func")
            if v == nil then
                print("[Error] nil func in the table")
            end
            if type(v.f) == "table" then
                (v.f):enterFrame(event)
            else
                v.f(event)
            end
        end
        --print("call ========== end")
    end

    -- Call f each frame
    function _M.each(f)
        --remove at next frame
        if not f then
            print("[Error] f cannot be nil ")
            return
        end
        if not _M.enterFrameFunctions then
            print("re init enterFrameFunctions")
            _M.enterFrameFunctions = Backpack.new({maxItems = 3000})
            function _M.enterFrameFunctions:remove(f)
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
            Runtime:addEventListener('enterFrame', _M.enterFrame)
        end
        _M.enterFrameFunctions:add({f = f})
    end

    -- Stop calling f
    function _M.remove(f)
        if not f or not _M.enterFrameFunctions then 
            return 
        end
        local ind = _M.enterFrameFunctions:remove(f)
        --print("remove ", ind)
        if ind then
            if _M.enterFrameFunctions.numOfItems == 0 then
                print("Set to nil ")
                Runtime:removeEventListener('enterFrame', _M.enterFrame)
                _M.enterFrameFunctions = nil
            end
        else
            print("[Error] f cannot be removed properly")
        end
    end

    -- Stop everything
    function _M.removeAll()
        print("removeAll enterframe")
        Runtime:removeEventListener('enterFrame', _M.enterFrame)
        _M.enterFrameFunctions:clear()
        _M.enterFrameFunctions = nil
    end

    return _M
end

return Util