-- CONIFERA CORRUPTA
minetest.register_node("rot:dirt_with_coniferous_toxic", {
	description = "Snow toxic",
	tiles = {"original_coniferous_litter.png^toxic_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_coniferous_litter_side.png^toxic_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},

    on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timerBlockToBeConsumed)
    end,

    on_timer = function(pos)
        minetest.remove_node(pos)
    end,
})

-- CONIFERA CORRUPTA ABM
minetest.register_abm({
    label = 'Corruption in the coniferous',
    nodenames = {'default:dirt_with_coniferous_litter'},
    neighbors = {'rot:dirt_with_coniferous_toxic'},
    interval = rot.data.intervalToxic,
    chance = rot.data.chanceToxic,
    action = function(pos)
        minetest.add_node(pos, {name = 'rot:dirt_with_coniferous_toxic'})
        pos.y = pos.y + 1 -- SOLO ELIMINA LA PARTE SUPERIOR
        minetest.remove_node(pos) -- SOLO ELIMINA LA PARTE SUPERIOR
    end,
})

-- CONIFERA SANTA
minetest.register_node("rot:dirt_with_coniferous_holy", {
	description = "Coniferous holy",
	tiles = {"original_coniferous_litter.png^holy_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_coniferous_litter_side.png^holy_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
})

-- CONIFERA SANTA ABM
minetest.register_abm({
    label = 'Holy in the coniferous',
    nodenames = {'rot:dirt_with_coniferous_toxic'},
    neighbors = {'rot:dirt_with_coniferous_holy'},
    interval = rot.data.intervalHoly,
    chance = rot.data.changeHoly,
    action = function(pos)
        minetest.add_node(pos, {name = 'rot:dirt_with_coniferous_holy'})
    end,
})