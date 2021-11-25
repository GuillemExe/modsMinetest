-- Teleport command
minetest.register_tool("teleport:command", {
    description = "Teleport command",
    inventory_image = "command.png",
    stack_max = 1,
    on_use = function(item)
        minetest.log(dump(item))
        local meta = item:get_meta()
        local pos = {["y"] = meta:get_int("y")+1, ["x"] = meta:get_int("x"), ["z"] = meta:get_int("z")}
        local player = minetest.get_player_by_name("singleplayer")
        player:set_pos(pos)
    end,
})

-- Teleport pad
minetest.register_node("teleport:pad", {
    description = "Teleport pad",
    tiles = {"teleport_magic_cover.png", "teleport_magic_cover.png",
		{name = "teleport_side.png",
		tileable_vertical = true}},
    stack_max = 1,
    groups = {cracky = 1},
    drop = "teleport:pad",
    on_construct = function(pos)
        minetest.log(dump(pos))
    end,
    on_punch = function(pos, node, player, pointed_thing)
        local player = minetest.get_player_by_name("singleplayer")
        local inventory = player:get_inventory()
        local stack = ItemStack("teleport:command 1")
        local meta = stack:get_meta()
        meta:set_int("x", pos.x)
        meta:set_int("y", pos.y)
        meta:set_int("z", pos.z)
        inventory:add_item("main", stack)
    end
})