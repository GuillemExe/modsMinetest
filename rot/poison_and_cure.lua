-- POSION
minetest.register_node("rot:poison", {
	description = "Posion box",
    tiles = {"box_cover.png", "box_cover.png",
		{name = "poison_box.png",
		tileable_vertical = true}},
    stack_max = 1,
	groups = {crumbly=3, soil=1},

	on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timerBlockToBeConsumed)
    end,

    on_timer = function(pos)
        minetest.remove_node(pos)
    end,
})

-- CURE
minetest.register_node("rot:cure", {
	description = "Cure box",
    tiles = {"box_cover.png", "box_cover.png",
		{name = "cure_box.png",
		tileable_vertical = true}},
    stack_max = 1,
	groups = {crumbly=3, soil=1},

	on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timerDisappearAntidote)
    end,

    on_timer = function(pos)
        minetest.remove_node(pos)
    end,
})