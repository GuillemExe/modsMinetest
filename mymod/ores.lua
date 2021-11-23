minetest.register_node("mymod:orichalcum_ore", {
    description = "Mena de Oricalco",
    tiles = {{
        name = "orichalcumsword_ore.png",
        animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 1.0}
    }},
    light_source = 7,
    inventory_image = "orichalcum_lump.png",
    stack_max = 64,
    groups = {cracky = 11},
    on_blast = function() end,
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "mymod:orichalcum_ore",
    wherein        = "default:stone",
    clust_scarcity = 37 * 37 * 37,
    clust_num_ores = 2,
    clust_size     = 3,
    y_min          = -31000,
    y_max          = -15000,
})

minetest.register_craft({
    type = "cooking",
    cooktime = 145,
    output = "mymod:orichalcum_bar",
    recipe = "mymod:orichalcum_ore",
})