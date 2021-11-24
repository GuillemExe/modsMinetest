-- HOLY INPURE
minetest.register_node("rot:holy_inpure", {
	description = "Holy inpure toxic",
    tiles = {"tap.png", "tap.png",
		{name = "holy_inpure.png",
		tileable_vertical = true}},
    stack_max = 1,
	groups = {crumbly=3, soil=1},
})

-- HOLY INPURE AMB PLUS
minetest.register_abm({
    label = 'Holy in the snow',
    nodenames = {'default:dirt_with_snow', 'default:dirt_with_grass', 'default:dirt_with_coniferous_litter'},
    neighbors = {'rot:holy_inpure'},
    interval = rot.data.intervalHoly,
    chance = rot.data.changeHoly,
    action = function(pos)
        local node = minetest.get_node(pos)
        -- minetest.log(dump(node)) -- PARA EL DEBUG

        if node.name == "default:dirt_with_snow" then
            minetest.add_node(pos, {name = 'rot:dirt_with_snow_toxic'})
            pos.y = pos.y + 1 -- SOLO ELIMINA LA PARTE SUPERIOR
            minetest.remove_node(pos) -- SOLO ELIMINA LA PARTE SUPERIOR
        end

        if node.name == "default:dirt_with_grass" then
            minetest.add_node(pos, {name = 'rot:dirt_with_grass_toxic'})
            pos.y = pos.y + 1 -- SOLO ELIMINA LA PARTE SUPERIOR
            minetest.remove_node(pos) -- SOLO ELIMINA LA PARTE SUPERIOR
        end

        if node.name == "default:dirt_with_coniferous_litter" then
            minetest.add_node(pos, {name = 'rot:dirt_with_coniferous_toxic'})
            pos.y = pos.y + 1 -- SOLO ELIMINA LA PARTE SUPERIOR
            minetest.remove_node(pos) -- SOLO ELIMINA LA PARTE SUPERIOR
        end
    end,
})