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