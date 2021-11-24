local data = {}

rot.loadData = function ()
    
    data.nameMod = "rot"

    data.intervalPoison = 2
    data.chancePoison = 30

    data.intervalCure = 1
    data.changeCure = 5

    data.virusTolerance = 3
    data.cureTolerance = 6

    data.timerBlockToBeConsumed = (data.intervalPoison * data.chancePoison) * data.virusTolerance
    data.timerDisappearAntidote = (data.intervalCure * data.changeCure) * data.cureTolerance

    return data
end