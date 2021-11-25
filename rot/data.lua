local data = {}

rot.loadData = function ()

    data.nameMod = "rot"

    data.canInfectDirt = true

    if data.canInfectDirt then
        -- ABM POISON
        data.poisonNodenames = {'default:dirt',
                                'default:dirt_with_grass',
                                'default:dirt_with_snow',
                                'default:dirt_with_coniferous_litter'}
        data.poisonNeighbors = {'rot:poison',
                                'rot:dirt_poison',
                                'rot:dirt_with_grass_poison',
                                'rot:dirt_with_snow_poison',
                                'rot:dirt_with_coniferous_litter_poison'}
        -- ABM CURE
        data.cureNodenames = {'rot:dirt_poison',
                                'rot:dirt_with_grass_poison',
                                'rot:dirt_with_snow_poison',
                                'rot:dirt_with_coniferous_litter_poison'}
        data.cureNeighbors = {'rot:cure',
                                'rot:dirt_cure',
                                'rot:dirt_with_grass_cure',
                                'rot:dirt_with_snow_cure',
                                'rot:dirt_with_coniferous_litter_cure'}
    else
        -- ABM POISON
        data.poisonNodenames = {'default:dirt_with_grass',
                                'default:dirt_with_snow',
                                'default:dirt_with_coniferous_litter'}
        data.poisonNeighbors = {'rot:poison',
                                'rot:dirt_with_grass_poison',
                                'rot:dirt_with_snow_poison',
                                'rot:dirt_with_coniferous_poison'}
        -- ABM CURE
        data.cureNodenames = {'rot:dirt_with_grass_poison',
                                'rot:dirt_with_snow_poison',
                                'rot:dirt_with_coniferous_litter_poison'}
        data.cureNeighbors = {'rot:cure',
                                'rot:dirt_with_grass_cure',
                                'rot:dirt_with_snow_cure',
                                'rot:dirt_with_coniferous_litter_cure'}
    end

    data.intervalPoisonGenerate = 15 -- 15
    data.chancePoisonGenerate = 200 -- 200

    data.intervalPoison = 5 -- 5
    data.chancePoison = 35 -- 35

    data.intervalPoisonDestroy = 5 -- 5
    data.chancePoisonDestroy = 50 -- 50

    data.intervalCure = 1
    data.changeCure = 20

    data.virusTolerance = 3
    data.cureTolerance = 6

    data.timeToWololo = 3

    data.distanceWololo = 100

    -- Anteriormente pusimos una función timer del propio minetest de la wiki, 
    -- tenia un efecto bastante impresionante dentro del juego. 
    -- No tenia el efecto tan aleatorio de los ABM y parecía mas organizado, 
    -- pero para evitar salirnos del guion de la actividad terminamos quitando este sistema.

    data.timerBlockToBeConsumed = (data.intervalPoison * data.chancePoison) * data.virusTolerance
    data.timerDisappearAntidote = (data.intervalCure * data.changeCure) * data.cureTolerance

    return data
end