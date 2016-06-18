--logging
local Logging = require("Logging")
local logger = Logging.new()
--logger:setLevel(Logging.VERBOSE)
logger:setLevel(Logging.DEBUG)
return logger 