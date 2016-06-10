local Backpack = {}

Backpack.new = function(options)
    local backpack = {}
    backpack.items = {}
    backpack.maxItems = options and options.maxItems or 300
    backpack.counter = 0
    backpack.numOfItems = 0

    function backpack:getItemId()    
        if self.numOfItems > self.maxItems then
            return nil
        end
        if self.counter < self.maxItems then
            self.counter = self.counter + 1
        end
        if self.items[self.counter] then
            self.counter = nil
            for i = 1, self.maxItems do
                if not self.items[i] then
                    self.counter = i 
                    break
                end
            end
        end
        return self.counter
    end

    function backpack:add(item)
        item._backpackid = self:getItemId()
        if not item._backpackid then
            return nil
        end
        self.items[item._backpackid] = item
        self.numOfItems = self.numOfItems + 1
        return item._backpackid
    end

    function backpack:remove(item)
        self.items[item._backpackid] = nil
        self.numOfItems = self.numOfItems - 1
    end

    function backpack:getItems()
        return self.items
    end

    function backpack:clear()
        self.items = {}
    end

    return backpack
end

return Backpack