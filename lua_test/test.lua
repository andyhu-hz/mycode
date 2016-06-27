package.cpath = "./?.so;" .. package.path

-- This is a line comment

--[[ This block show 
  how to block commenting some lines
]]--

local lib = require "test_library"
print "hello, lua"

function test1() 
    print(lib._sin(9))
end

--[[
t = {}
t1 = {}
t2 = setmetatable(t, t1)
print(t == t2)
]]--

print(lib._sin(1))
test1()


    

