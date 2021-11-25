-- Existe un bloque que contagia al resto, lo creamos por los “memes” y “porque nos parecía guay” 
-- por si en un futuro podíamos hacer una forma de “crafteo” de este.

-- POSION
minetest.register_node("rot:poison", {
	description = "Posion box",
    tiles = {"box_cover.png", "box_cover.png",
		{name = "poison_box.png",
		tileable_vertical = true}},
    stack_max = 1,
	groups = {crumbly=3, soil=1},
    drop = "rot:poison",
})

-- CURE
minetest.register_node("rot:cure", {
	description = "Cure box",
    tiles = {"box_cover.png", "box_cover.png",
		{name = "cure_box.png",
		tileable_vertical = true}},
    stack_max = 1,
	groups = {crumbly=3, soil=1},
    drop = "rot:cure",
})

-- JESUS BLOCK
minetest.register_node("rot:jesus", {
	description = "Jesus box",
    tiles = {"box_cover.png", "box_cover.png",
		{name = "power_jesus.png",
		tileable_vertical = true}},
    stack_max = 1,
	groups = {crumbly=3, soil=1},
    drop = "rot:jesus",

	on_construct = function(pos)
        minetest.get_node_timer(pos):start(rot.data.timeToWololo)
    end,

    on_timer = function(pos)
		local distanceEffect = rot.data.distanceWololo
		local firstPosition = {["y"] = pos.y - distanceEffect, ["x"] = pos.x - distanceEffect, ["z"] = pos.z - distanceEffect}
        local secondPosition = {["y"] = pos.y + distanceEffect, ["x"] = pos.x + distanceEffect, ["z"] = pos.z + distanceEffect}
        grass_to_dirt(firstPosition, secondPosition)
    end,
})