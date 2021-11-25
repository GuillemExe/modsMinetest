-- Dirt with grass poision
minetest.register_node("rot:dirt_with_grass_poison", {
	description = "Dirt with grass poison",
	tiles ={"original_grass.png^poison_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_grass_side.png^poison_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
    drop = "rot:dirt_with_grass_poison",

    on_construct = function(pos)
        pos.y = pos.y + 1
        minetest.remove_node(pos)
        --minetest.get_node_timer(pos):start(rot.data.timerBlockToBeConsumed)
    end,
    --[[
    on_timer = function(pos)
        minetest.remove_node(pos)
    end,
    ]]
})

-- Dirt with grass cure
minetest.register_node("rot:dirt_with_grass_cure", {
	description = "Dirt with grass cure",
	tiles = {"original_grass.png^cure_base.png", "default_dirt.png",
		{name = "default_dirt.png^original_grass_side.png^cure_side.png",
		tileable_vertical = false}},
	groups = {crumbly=3, soil=1},
    drop = "rot:dirt_with_grass_cure",

	on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timerDisappearAntidote)
    end,

    on_timer = function(pos)
        minetest.add_node(pos, {name = 'default:dirt_with_grass'})
    end,
})