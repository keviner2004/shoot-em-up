local Logging = {}

DEBUG = 3
INFO = 4
WARN = 5
ERROR = 6
FATAL = 7

Logging.new = function(name)
    local logger = {}

    logger.level = DEBUG

    logger.mask = {
        tags = {}
    }

    function logger:setLevel(level)
        self.level = level
    end

    function logger:getMessage(tag, message, format)
        return string.format("["..tag.."] "..message, format)
    end

    function logger:debug(tag, msg, format)
        if self:filter(DEBUG, tag) then
            return 
        end
        local message = self:getMessage(tag, msg, format)
        print(message)
    end

    function logger:setMask(mask)
        self.mask = mask
    end

    function logger:filter(level, tag)
        if level < self.level then
            return true
        end
        
        for i, v in ipairs(self.mask.tags) do
            if v == tag then
                return true
            end 
        end

        return false
    end

    return logger
end

return Logging