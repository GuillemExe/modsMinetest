-- CESPED CORRUPTO
minetest.register_node("rot:dirt_with_grass_toxic", {
	description = "Grass toxic",
	tiles ={"original_grass.png^toxic_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_grass_side.png^toxic_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

-- CESPED CORRUPTO ABM
minetest.register_abm({
    label = 'Corruption in the grass',
    nodenames = {'default:dirt_with_grass'},
    neighbors = {'rot:dirt_with_grass_toxic'},
    interval = rot.data.intervalToxic,
    chance = rot.data.chanceToxic,
    action = function(pos)
        minetest.add_node(pos, {name = 'rot:dirt_with_grass_toxic'})
        -- pos.y = pos.y + 1 -- SOLO ELIMINA LA PARTE SUPERIOR
        -- minetest.remove_node(pos) -- SOLO ELIMINA LA PARTE SUPERIOR
    end,
})

-- CESPED SANTO
minetest.register_node("rot:dirt_with_grass_holy", {
	description = "Grass holy",
	tiles = {"original_grass.png^holy_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_grass_side.png^holy_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

-- CESPED SANTO ABM
minetest.register_abm({
    label = 'Holy in the Grass',
    nodenames = {'rot:dirt_with_grass_toxic'},
    neighbors = {'rot:dirt_with_grass_holy'},
    interval = rot.data.intervalHoly,
    chance = rot.data.changeHoly,
    action = function(pos)
        minetest.add_node(pos, {name = 'rot:dirt_with_grass_holy'})
    end,
})