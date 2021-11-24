-- HOLY PURE
minetest.register_node("rot:holy_pure", {
	description = "Holy pure",
    tiles = {"tap.png", "tap.png",
		{name = "holy_pure.png",
		tileable_vertical = true}},
    stack_max = 1,
	groups = {crumbly=3, soil=1},
})

-- HOLY PURE AMB PLUS
minetest.register_abm({
    label = 'Holy in the snow',
    nodenames = {'rot:dirt_with_snow_toxic', 'rot:dirt_with_grass_toxic', 'rot:dirt_with_coniferous_toxic'},
    neighbors = {'rot:holy_pure'},
    interval = rot.data.intervalHoly,
    chance = rot.data.changeHoly,
    action = function(pos)
        local node = minetest.get_node(pos)
        -- minetest.log(dump(node)) -- PARA EL DEBUG

        if node.name == "rot:dirt_with_snow_toxic" then
            minetest.add_node(pos, {name = 'rot:dirt_with_snow_holy'})
        end

        if node.name == "rot:dirt_with_grass_toxic" then
            minetest.add_node(pos, {name = 'rot:dirt_with_grass_holy'})
        end

        if node.name == "rot:dirt_with_coniferous_toxic" then
            minetest.add_node(pos, {name = 'rot:dirt_with_coniferous_holy'})
        end
    end,
})