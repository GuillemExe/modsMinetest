-- Dirt with coniferous poison
minetest.register_node("rot:dirt_with_coniferous_litter_poison", {
	description = "Dirt with coniferous litter poison",
	tiles = {"original_coniferous_litter.png^poison_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_coniferous_litter_side.png^poison_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},

    on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timerBlockToBeConsumed)
    end,

    on_timer = function(pos)
        minetest.remove_node(pos)
    end,
})

-- Dirt with coniferous litter cure
minetest.register_node("rot:dirt_with_coniferous_litter_cure", {
	description = "Dirt with coniferous litter cure",
	tiles = {"original_coniferous_litter.png^cure_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_coniferous_litter_side.png^cure_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},

	on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timerDisappearAntidote)
    end,

    on_timer = function(pos)
        minetest.add_node(pos, {name = 'default:dirt_with_coniferous_litter'})
    end,
})