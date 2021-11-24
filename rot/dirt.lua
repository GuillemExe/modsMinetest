-- Dirt poison
minetest.register_node("rot:dirt_poison", {
	description = "Dirt poison",
	tiles = {"original_dirt.png^poison_inside.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
    on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timerBlockToBeConsumed)
    end,

    on_timer = function(pos)
        minetest.remove_node(pos)
    end,
})

-- Dirt cure
minetest.register_node("rot:dirt_cure", {
	description = "Dirt cure",
	tiles = {"original_dirt.png^cure_base.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),

	on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timerDisappearAntidote)
    end,

    on_timer = function(pos)
        minetest.add_node(pos, {name = 'default:dirt'})
    end,
})