local users = {
    "ElaneSfIvor",
    "AinsleeDLGeorge",
    "LindseennCathy",
    "KerbycqElliot",
    "AdrinalIChase",
    "LakitaiVLane",
    "BoonexdIvan",
    "JaamalAWRufus",
    "ParadisePnMicaela",
    "BreonalColin",
    "NoorfZNoah",
    "VanishaveBrandon",
    "YanelisOQJace",
    "DominiguedOEzra",
    "CornishaSTGraham",
    "ClaribelHJJesse",
    "FionaguCharles",
    "HaywardkoMason",
    "LoraleezsHarold",
    "LamjbRoyce",
    "NorelleZbDarrell",
    "EsiVrShana",
    "BrinavKAlexander",
    "NakiarvCade",
    "DanrxHarley",
    "NeenahZNEvan",
    "FilbertoVhJanelle",
    "TericaqbCara",
    "BrittinJwAiden",
    "VickietTZane",
    "ZerOHGrady",
    "AeshadORowan",
    "RoseveltmEKane",
    "ShadimyConnor",
    "TimithybZBrett",
    "CristhianIVAbel",
    "TondraOKGerald",
    "DerrelxnEaston",
    "KorrixTKarim",
    "ArabellaEIClark",
    "JarrielHOBruce",
    "RaseanoGWyatt",
    "LagenaAYGideon",
    "BreeyHRonald",
    "GemmaaQCarla",
    "ChritopherzMRuben",
    "ParnellvNWarren",
    "LacieeWTheodore",
    "LorrenWjGavin",
    "SindiRoEthan",
    "LenellXqEllis",
    "JaelynnOVeronica",
    "DebiQiLeroy",
    "TaelorQlStephen",
    "PengmuFreddie",
    "CrystalannQYRory",
    "ElgindYLakisha",
    "PadenRsAlex",
    "JaunitaUzLee",
    "KristilynAKSpencer",
    "CorynneJXFinn",
    "AmilcarbNRonan",
    "SueannhCJoseph",
    "ShaqualabuKathleen",
    "RennRaLawson",
    "SannamLSimon",
    "BartholomewiEErick",
    "AmaryllisEGRoger",
    "JamelynaPMarie",
    "SuzzanneFICharles",
    "ElisabetswLandry",
    "RahcelzEPaul",
    "RamanFpEric",
    "NataneZHClark",
    "AlexanerKsColin",
    "DeleciaQXJefferson",
    "BreeanneQILanden",
    "CorbancNParker",
    "CharlanaBsEmmett",
    "KaitlanjtConnor",
    "AbimaelmCJaime",
    "TalarOzChristopher",
    "JostinCSTravis",
    "LynzyXZOwen",
    "CrawfordEIEdgar",
    "AvramXZRiver",
    "GabrielaasMarina",
    "SafiyajsCraig",
    "MaradrKieran",
    "GenishaVhNicholas",
    "KhaiUZEduardo",
    "KathrinjqCole",
    "TramvSColby",
    "ShenitaoKValerie",
    "SonalikPKent",
    "JohnpauluGNathan",
    "RomePxDouglas",
    "KathrinjqRodney",
    "ZulemaaLJake",
    "TinitaOiDouglas",
    "CleraJySamuel",
    "ColebyIEMaxwell",
    "LeightonMwDerek",
    "SharanOEChristopher",
    "CarmenwwOscar",
    "MaginUbJameson",
    "JohathanFyRoman",
    "OnazMMichael",
    "BryannThDennis",
    "YvanYCColin",
    "JorrellTSClayton",
    "KadLTyler",
    "JayceaTTrent",
    "TiandrawDMiles",
    "YoselynDVDarrell",
    "AmberleighQPRiley",
    "ShavannabiLyndsay",
    "TyeshiapCAna",
    "TravisMDPeter",
    "SolomonrUMax",
    "ZaklWChase",
    "AllikDChristian",
    "AvaniIXIsaac",
    "GeneveRcJared",
    "LeaannmoTimothy",
    "KelleeuRMaddox",
    "ZoerfColby",
    "JamarionCyRamon",
    "MelPnCasandra",
    "PhylliciaZtTasha",
    "LindeyGfThomas",
    "DanylBiMatthew",
    "SunshineuDClayton",
    "KhrystinaGJRandall",
    "DaquitabWHector",
    "DanyllelbThomas",
    "AlianaExTheodore",
    "SydnikgMarcus",
    "ShauntriceLcCedric",
    "OmarMyBenjamin",
    "DarcusJVHarvey",
    "KestonRFWalker",
    "CharnitaTHTerrence",
    "NithyaFWLiam",
    "HanibdCaleb",
    "TaylersNRaiden",
    "MikeyUKCristina",
    "KorrinaGyJarvis",
    "CaneshaSWOwen",
    "KaeokxLevi",
    "TyerraKPWilliam",
    "BrandonleeBQBlake",
    "NataliaeMFrancesca",
    "JorgeluisTECynthia",
    "EleenaVvTate",
    "TrevellOQLeo",
    "ChristiferEfZane",
    "CharltonpWPierce",
    "FotisHIGwendolyn",
    "DurelletQJake",
    "EdgarMnJoseph",
    "MandeebdLandon"
}
local troopsToSend = {
    "SantaTVMan",
    "LuckySpeakerman",
    "ClockSpider"
}
local TTD
local save
local handler
local Network
local Invoke
local Fire
task.spawn(function()
    TTD = require(game:GetService("ReplicatedStorage").MultiboxFramework)
    save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)

    repeat
        pcall(function()
            Network = TTD.Network
            Invoke = Network.Invoke
            Fire = Network.Fire
        end)
        task.wait(0.1)
    until Network ~= nil and Invoke ~= nil and Fire ~= nil
end)
repeat wait() until Invoke and Network and Fire

local SInd = debug.info(Invoke,"s")
local old =  getrenv().debug.info
setreadonly(getrenv().debug,false)

getrenv().debug.info = function(...) 
    local lv,st = ...
    if lv == 2 and st == "s" then 
        return SInd
    end
    error("hi")
    return nil
end
setreadonly(getrenv().debug,true)

local old = getrenv().getfenv
getrenv().getfenv = function(...) 
    error("hi")
    return nil
end
-- Invoke = Network.Invoke; local GetFunc = getupvalue(Invoke, 1)
-- Fire = Network.Fire; local GetEvent = getupvalue(Fire, 1)

-- coroutine.wrap(function()
--     setidentity(2)
--     hookfunc(getupvalue(GetFunc, 1), function()
--         return true
--     end)
--     setidentity(8)
-- end)()

-- coroutine.wrap(function()
--     setidentity(2)
--     hookfunc(getupvalue(GetEvent, 1), function()
--         return true
--     end)
--     setidentity(8)
-- end)()


local invTroops = {}
function getInventoryTroops()
    invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
   -- for k,v in save._data.InventoryItems.Troops do print(k,v) end
    for name, v in pairs(save._data.InventoryItems.Troops) do
        for i, v in pairs(v) do
            invTroops[i] = name
        end
    end
    return invTroops
end

local coins
function getCoinAmt()
    coins = 0
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for i, v in pairs(save._data) do
        if i == "Currencies" then
            coins = v.Coins
        end
    end
    return coins
end

function hasTroop(id)
    troops = getInventoryTroops()
    for i, v in troops do
        if i == id then
            return true
        end
    end
    return false
end

startAmt = getCoinAmt()

local amt = 0

for i, user in users do
    local sent = {}
    for i, v in getInventoryTroops() do
        if table.find(troopsToSend, v) and not table.find(sent, v) then
            table.insert(sent, v)
            local oldC = getCoinAmt()
            local st = tick()
            repeat
                Invoke("PostOffice_SendGift", game.Players:GetUserIdFromNameAsync(user), "Troops", i, 0,
                    tostring(math.random(1, 10000)))
                task.wait(0.1)
            until getCoinAmt() < oldC and not hasTroop(i)
            print("sent","time taken:",tick()-st)
        end
    end
    print('finished user:',user)
end

print('Should have sent:', amt)
