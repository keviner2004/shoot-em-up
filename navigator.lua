local navigator = {}

navigator.queue = {}

function navigator:push(name)
    self.queue[#self.queue+1] = name    
end

function navigator:pop()
    local element = self.queue[#self.queue]
    self.queue[#self.queue] = nil
    return element
end

function navigator:peek()
    local element = self.queue[#self.queue]
    return element
end

function navigator:clear()
    self.queue = {}
end

return navigator