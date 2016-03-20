-- This is a line comment

--[[ This block show 
  how to block commenting some lines
]]--

local hello = require "hello_library"
print "hello, world"

function test1() 
    print(hello.hello_sin(9))
end

--[[
t = {}
t1 = {}
t2 = setmetatable(t, t1)
print(t == t2)
]]--

print(hello.hello_sin(1))
test1()


    

