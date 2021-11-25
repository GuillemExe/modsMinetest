teleport = {}

dofile(minetest.get_modpath("teleport") .. "/data.lua")
dofile(minetest.get_modpath("teleport") .. "/utilities.lua")

teleport.data = teleport.loadData()
teleport.path = minetest.get_modpath("teleport")

dofile(teleport.path .. "/utilities.lua")

dofile(teleport.path .. "/teleport.lua")