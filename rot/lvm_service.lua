minetest.register_chatcommand("purification", {
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        local pos = player:get_pos()
        local firstPosition = {["y"] = pos.y - 50, ["x"] = pos.x - 50, ["z"] = pos.z - 50}
        local secondPosition = {["y"] = pos.y + 50, ["x"] = pos.x + 50, ["z"] = pos.z + 50} 
        grass_to_dirt(firstPosition, secondPosition)
    end,
})

function grass_to_dirt(pos1, pos2)
    local c_dirt  = minetest.get_content_id("default:dirt")
    local c_grass = minetest.get_content_id("default:dirt_with_grass")

    -- Read data into LVM
    local vm = minetest.get_voxel_manip()
    local emin, emax = vm:read_from_map(pos1, pos2)
    local a = VoxelArea:new{
        MinEdge = emin,
        MaxEdge = emax
    }
    local data = vm:get_data()

    -- Modify data
    for z = pos1.z, pos2.z do
        for y = pos1.y, pos2.y do
            for x = pos1.x, pos2.x do
                local block = a:index(x, y, z)

                for index, nodeName in ipairs(rot.data.cureNodenames) do
                    if data[block] == minetest.get_content_id(nodeName) then
                        data[block] = minetest.get_content_id(rot.data.poisonNodenames[index])
                    end
                end
            end
        end
    end

    -- Write data
    vm:set_data(data)
    vm:write_to_map(true)
end