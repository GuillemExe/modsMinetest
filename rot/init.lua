rot = {}

dofile(minetest.get_modpath("rot") .. "/data.lua")
dofile(minetest.get_modpath("rot") .. "/utilities.lua")

rot.data = rot.loadData()
rot.path = minetest.get_modpath("rot")

dofile(rot.path .. "/utilities.lua")

if rot.data.canInfectDirt then dofile(rot.path .. "/dirt.lua") end
dofile(rot.path .. "/grass.lua")
dofile(rot.path .. "/snow.lua")
dofile(rot.path .. "/coniferous.lua")

dofile(rot.path .. "/poison_and_cure.lua")
dofile(rot.path .. "/abm_service.lua")
dofile(rot.path .. "/lvm_service.lua")