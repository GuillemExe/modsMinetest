function remove_top_block(pos)
    pos.y = pos.y + 1
    minetest.remove_node(pos)
end

-- POISON ABM
minetest.register_abm({
    label = 'ABM poison',
    nodenames = {'default:dirt',
                'default:dirt_with_snow',
                'default:dirt_with_grass',
                'default:dirt_with_coniferous_litter'},
    neighbors = {'rot:poison',
                'rot:dirt_poison',
                'rot:dirt_with_grass_poison',
                'rot:dirt_with_snow_poison',
                'rot:dirt_with_coniferous_poison'},
    interval = rot.data.intervalPoison,
    chance = rot.data.chancePoison,
    action = function(pos)
        local node = minetest.get_node(pos)

        if node.name == "default:dirt" then
            minetest.add_node(pos, {name = 'rot:dirt_poison'})
        end

        if node.name == "default:dirt_with_grass" then
            minetest.add_node(pos, {name = 'rot:dirt_with_grass_poison'})
            remove_top_block(pos)
        end

        if node.name == "default:dirt_with_snow" then
            minetest.add_node(pos, {name = 'rot:dirt_with_snow_poison'})
            remove_top_block(pos)
        end

        if node.name == "default:dirt_with_coniferous_litter" then
            minetest.add_node(pos, {name = 'rot:dirt_with_coniferous_litter_poison'})
            remove_top_block(pos)
        end
    end,
})

-- CURE ABM
minetest.register_abm({
    label = 'ABM cure',
    nodenames = {'rot:dirt_poison',
                'rot:dirt_with_grass_poison',
                'rot:dirt_with_snow_poison',
                'rot:dirt_with_coniferous_litter_poison'},
    neighbors = {'rot:cure',
                'rot:dirt_cure',
                'rot:dirt_with_grass_cure',
                'rot:dirt_with_snow_cure',
                'rot:dirt_with_coniferous_litter_cure'},
    interval = rot.data.intervalCure,
    chance = rot.data.changeCure,
    action = function(pos)
        local node = minetest.get_node(pos)

        if node.name == "rot:dirt_poison" then
            minetest.add_node(pos, {name = 'rot:dirt_cure'})
        end

        if node.name == "rot:dirt_with_grass_poison" then
            minetest.add_node(pos, {name = 'rot:dirt_with_grass_cure'})
        end

        if node.name == "rot:dirt_with_snow_poison" then
            minetest.add_node(pos, {name = 'rot:dirt_with_snow_cure'})
        end

        if node.name == "rot:dirt_with_coniferous_litter_poison" then
            minetest.add_node(pos, {name = 'rot:dirt_with_coniferous_litter_cure'})
        end
    end,
})