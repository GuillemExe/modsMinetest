mymod = {}

mymod.path = minetest.get_modpath("mymod")

dofile(mymod.path .. "/ores.lua")
dofile(mymod.path .. "/items.lua")
dofile(mymod.path .. "/tools.lua")