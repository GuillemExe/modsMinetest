-- El "remove_top_block" Era una función que pusimos para eliminar la nieve
-- o los objetos superiores en el cubo contagiado, para hacer algo adicional.
-- Pero al modificar el formato y pasar las variables a un data
-- descartamos la opción temporalmente.

function remove_top_block(pos)
    pos.y = pos.y + 1
    minetest.remove_node(pos)
end

function apply_poison(pos)
    local node = minetest.get_node(pos)

    -- Tuvimos muchos problemas generando mundo y nos acabábamos volviendo locos generando mundos para probarlo con un solo bloque,
    -- así que como la lógica es funcionar para todos los bloques de tierra con pasto, decidimos agregar los bloques de pasto de los demás biomas.

    -- Como existe un bloque que contagia al resto y un sanador es necesario sumarle uno.
    -- Para no modificar la lista y que quede desordenado ordenamos bien las tablas de la data.

    for index, nodeName in ipairs(rot.data.poisonNodenames) do
        if node.name == nodeName then
            minetest.set_node(pos, {name = rot.data.poisonNeighbors[index+1]})
        end
    end
end

-- ABM POISON GENERATOR - 1
minetest.register_abm({
    label = 'ABM poison generator',
    nodenames = rot.data.poisonNodenames,
    -- Aquí tendría que ir el “neighbors”, pero si lo quitamos la acción se activa 
    -- solamente en los nodos añadidos por su nombre lo que nos ahorra trabajo.
    interval = rot.data.intervalPoisonGenerate,
    chance = rot.data.chancePoisonGenerate,
    action = function(pos)
        apply_poison(pos)
    end,
})

-- ABM POISON - 2
minetest.register_abm({
    label = 'ABM poison',
    nodenames = rot.data.poisonNodenames,
    neighbors = rot.data.poisonNeighbors,
    interval = rot.data.intervalPoison,
    chance = rot.data.chancePoison,
    action = function(pos)
        apply_poison(pos)
    end,
})

-- ABM POISON DESTROY - 3
minetest.register_abm({
    label = 'ABM poison',
    nodenames = rot.data.cureNodenames,
    -- Aquí tendría que ir el “neighbors”, pero si lo quitamos la acción se activa 
    -- solamente en los nodos añadidos por su nombre lo que nos ahorra trabajo.
    interval = rot.data.intervalPoisonDestroy,
    chance = rot.data.chancePoisonDestroy,
    action = function(pos)
        minetest.remove_node(pos)
    end,
})


-- Lo quisimos poner como un añadido, para darle un poco mas de juego
-- ABM CURE - TEMPORAL
minetest.register_abm({
    label = 'ABM cure',
    nodenames = rot.data.cureNodenames,
    neighbors = rot.data.cureNeighbors,
    interval = rot.data.intervalCure,
    chance = rot.data.changeCure,
    action = function(pos)
        local node = minetest.get_node(pos)

        for index, nodeName in ipairs(rot.data.cureNodenames) do
            if node.name == nodeName then
                minetest.set_node(pos, {name = rot.data.cureNeighbors[index+1]})
            end
        end
    end,
})