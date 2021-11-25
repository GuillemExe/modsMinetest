-- Dirt poison
minetest.register_node("rot:dirt_poison", {
	description = "Dirt poison",
	tiles = {"original_dirt.png^poison_inside.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
    drop = "rot:dirt_poison",
})

-- Dirt cure
minetest.register_node("rot:dirt_cure", {
	description = "Dirt cure",
	tiles = {"original_dirt.png^cure_base.png"},
	groups = {crumbly = 3, soil = 1},
	sounds = default.node_sound_dirt_defaults(),
    drop = "rot:dirt_cure",

	on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timerDisappearAntidote)
    end,

    on_timer = function(pos)
        minetest.add_node(pos, {name = 'default:dirt'})
    end,
})