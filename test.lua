local Logger = require("Logger")

local logger = Logger.new("test")
logger:setMask({tags = {"physic"}})
logger:debug("physic", "1234 %d", 5678)