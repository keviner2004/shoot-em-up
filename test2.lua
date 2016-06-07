local A = require("test")

A:init("name")

local a = A.new()
a:init("name")
local b = A.new()
local c = A.new()

--b:init("bbbb")
--c:init("cccc")
print(A.name)
print(a.name)
print(b.name)
print(c.name)