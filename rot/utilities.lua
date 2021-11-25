-- minetest.log(dump(TABLE)) -- PARA EL DEBUG

-- Una utilidad que empezó a usar en otras prácticas añadida aquí y de mucha utilidad, nos sirvió para depurar los mods del juego.

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end