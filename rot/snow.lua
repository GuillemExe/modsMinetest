-- NIEVE CORRUPTA
minetest.register_node("rot:dirt_with_snow_toxic", {
	description = "Snow toxic",
	tiles = {"original_snow.png^toxic_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_snow_side.png^toxic_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

-- NIEVE CORRUPTA ABM
minetest.register_abm({
    label = 'Corruption in the snow',
    nodenames = {'default:dirt_with_snow'},
    neighbors = {'rot:dirt_with_snow_toxic'},
    interval = rot.data.intervalToxic,
    chance = rot.data.chanceToxic,
    action = function(pos)
        minetest.add_node(pos, {name = 'rot:dirt_with_snow_toxic'})
        -- pos.y = pos.y + 1 -- SOLO ELIMINA LA PARTE SUPERIOR
        -- minetest.remove_node(pos) -- SOLO ELIMINA LA PARTE SUPERIOR
    end,
})

-- NIEVE SANTA
minetest.register_node("rot:dirt_with_snow_holy", {
	description = "Snow holy",
	tiles = {"original_snow.png^holy_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_snow_side.png^holy_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

-- NIEVE SANTA ABM
minetest.register_abm({
    label = 'Holy in the snow',
    nodenames = {'rot:dirt_with_snow_toxic'},
    neighbors = {'rot:dirt_with_snow_holy'},
    interval = rot.data.intervalHoly,
    chance = rot.data.changeHoly,
    action = function(pos)
        minetest.add_node(pos, {name = 'rot:dirt_with_snow_holy'})
    end,
})