local o = require("test2")
o.a = o.a + 1
o = require("test2")
print("obj:"..o.a)
o = require("test2")