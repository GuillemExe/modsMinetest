--[[
minetest.register_abm({
    nodenames = {"default:dirt_with_grass"},
    interval = 10.0,
    chance = 1,
    catch_up = false,
    action = function(pos, node, active_object_count, active_object_count_wider)
        local pos = {x = pos.x, y = pos.y + 1, z = pos.z}
        minetest.set_node(pos, {name = "flowers:rose"})
    end
})
]]

-- Get content IDs during load time, and store into a local

--[[
local c_dirt = minetest.get_content_id("default:dirt")
local c_grass = minetest.get_content_id("default:dirt_with_grass")
local function grass_to_dirt(pos1, pos2)
    -- Read data into LVM
    local vm = minetest.get_voxel_manip()
    local emin, emax = vm:read_from_map(pos1, pos2)
    local a = VoxelArea:new{ MinEdge = emin, MaxEdge = emax }
    local data = vm:get_data()
    -- Modify data
    for z = pos1.z, pos2.z do
        for y = pos1.y, pos2.y do
            for x = pos1.x, pos2.x do
                local vi = a:index(x, y, z)
                if data[vi] == c_grass then
                    data[vi] = c_dirt
                end
            end
        end
    end
    -- Write data
    vm:set_data(data)
    vm:write_to_map(true)
end
]]

--[[
minetest.register_node("rot:grass", {
    description = "Alien Grass",
    light_source = 3, -- The node radiates light. Min 0, max 14
    tiles = {"test.png"},
    groups = {choppy=1},
    on_use = minetest.item_eat(20)
})
]]

--[[
minetest.register_abm({
    nodenames = {"default:dirt_with_grass"},
    neighbors = {"default:water_source", "default:water_flowing"},
    interval = 10.0, -- Run every 10 seconds
    chance = 50, -- Select every 1 in 50 nodes
    action = function(pos, node, active_object_count,
            active_object_count_wider)
        local pos = {x = pos.x, y = pos.y + 1, z = pos.z}
        minetest.set_node(pos, {name = "rot:grass"})
    end
})
]]

-- CESPED
minetest.register_node("rot:dirt_with_grass_toxic", {
	description = "Grass toxic",
	tiles ={"original_grass.png^toxic_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_grass_side.png^toxic_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

minetest.register_abm({
    label = 'Corruption in the grass',
    nodenames = {'default:dirt_with_grass'},
    neighbors = {'rot:dirt_with_grass_toxic'},
    interval = 0.001,
    chance = 1,
    action = function(pos)
        minetest.add_node(pos, {name = 'rot:dirt_with_grass_toxic'})
        pos.y = pos.y + 1
        minetest.remove_node(pos)
    end,
})

-- NIEVE
minetest.register_node("rot:dirt_with_snow_toxic", {
	description = "Snow toxic",
	tiles ={"original_snow.png^toxic_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_snow_side.png^toxic_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

minetest.register_abm({
    label = 'Corruption in the snow',
    nodenames = {'default:dirt_with_snow'},
    neighbors = {'rot:dirt_with_snow_toxic'},
    interval = 0.001,
    chance = 1,
    action = function(pos)
        minetest.add_node(pos, {name = 'rot:dirt_with_snow_toxic'})
        pos.y = pos.y + 1
        minetest.remove_node(pos)
    end,
})

