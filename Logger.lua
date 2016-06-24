--logging
local Logging = require("Logging")
local config = require("gameConfig")
local logger = Logging.new()
--logger:setLevel(Logging.VERBOSE)
logger:setLevel(config.logLevel)
return logger