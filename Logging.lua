local Logging = {}

Logging.VERBOSE = 2
Logging.DEBUG = 3
Logging.INFO = 4
Logging.WARN = 5
Logging.ERROR = 6
Logging.FATAL = 7
Logging.level = {}
Logging.level[Logging.VERBOSE] = "VERBOSE"
Logging.level[Logging.DEBUG] = "DEBUG"
Logging.level[Logging.INFO] = "INFO"
Logging.level[Logging.WARN] = "WARN"
Logging.level[Logging.ERROR] = "ERROR"
Logging.level[Logging.FATAL] = "FATAL"

Logging.new = function(name)
    local logger = {}

    logger.level = DEBUG

    logger.mask = ".*"

    function logger:setLevel(level)
        self.level = level
    end

    function logger:out(level, tag, msg, ...)
        if self:filter(level, tag) then
            return 
        end
        local message = string.format("["..Logging.level[level].."]["..tag.."] "..msg, ...)
        print(message)        
    end

    function logger:verbose(tag, msg, ...)
        self:out(Logging.VERBOSE, tag, msg, ...)
    end

    function logger:debug(tag, msg, ...)
        self:out(Logging.DEBUG, tag, msg, ...)
    end

    function logger:info(tag, msg, ...)
        self:out(Logging.INFO, tag, msg, ...)
    end

    function logger:warn(tag, msg, ...)
        self:out(Logging.WARN, tag, msg, ...)
    end

    function logger:error(tag, msg, ...)
        self:out(Logging.ERROR, tag, msg, ...)
    end

    function logger:fatal(tag, msg, ...)
        self:out(Logging.FATAL, tag, msg, ...)
    end

    function logger:setMask(mask)
        self.mask = mask
    end

    function logger:filter(level, tag)
        if level < self.level then
            return true
        end
        
        if not string.match(tag, self.mask) then
            return true
        end

        return false
    end

    return logger
end

return Logging