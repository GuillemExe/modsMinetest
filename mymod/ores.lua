-- MINERAL BLOQUE
minetest.register_node("mymod:orichalcum_ore", {
    description = "Mineral de Oricalco",
    tiles = {"default_stone.png^mineral_orichalcum.png"},
    stack_max = 64,
    groups = {cracky = 1},
    sounds = default.node_sound_stone_defaults(),
    drop = "mymod:orichalcum_lump",
})

-- REGISTRAMOS UNA POSICION DE APARICION DEL MINERAL BLOQUE
minetest.register_ore({
    ore_type       = "scatter",
	ore            = "mymod:orichalcum_ore",
	wherein        = "default:stone",
	clust_scarcity = 9 * 9 * 9,
	clust_num_ores = 14,
	clust_size     = 4,
	y_max          = 31000,
	y_min          = 1025,
})

-- REALIZAMOS LA CONVERSION DE LA MENA AL LINGOTE
minetest.register_craft({
    type = "cooking",
    cooktime = 4,
    output = "mymod:orichalcum_bar",
    recipe = "mymod:orichalcum_lump",
})