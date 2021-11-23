-- BLOQUE
--[[
minetest.register_node("rot:orichalcum_ore", {
    description = "Mineral de Oricalco",
    tiles = {"default_stone.png^mineral_orichalcum.png"},
    stack_max = 64,
    groups = {cracky = 1},
    sounds = default.node_sound_stone_defaults(),
    drop = "mymod:orichalcum_lump",
})
]]