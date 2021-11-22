minetest.register_node("mymod:mynode", {
    description = "My node",
    tiles = {"mymod_mynode.png"},
    groups = {cracky=3}
})

minetest.register_craftitem("mymod:orichalcum_lump", {
    description = "Mena de oricalco",
    inventory_image = "mymod_myitem.png"
})

minetest.register_craftitem("mymod:orichalcum_ingot", {
    description = "Lingote de oricalco",
    inventory_image = "mymod_myitem.png"
})

minetest.register_node(modname .. ":mineral_" .. mineral_name, {
    description = S("@1 Ore", S(description)),
    tiles = {"default_stone.png^" .. modname .. "_mineral_" .. mineral_name .. ".png"},
    groups = {cracky = 2},
    sounds = default_stone_sounds,
    drop = lump_item,
})