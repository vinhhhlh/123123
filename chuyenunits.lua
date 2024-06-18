local users = {
    "blJPS2Am", "vFNqO2NSrQ", "yYflQDg6", "XpSdglnC", "zwQKiJiG", 
    "TP_kjD", "hjvm_dwG1", "FH9JYqmpfn", "jpUqgidW", "UJgO2yG0G", 
    "GABtb6x", "il4yt3vs", "OwcEdDEv", "yNbFFMUN", "ZDFuVNJZgZ", 
    "iNf9464D", "W7Ql3E0CV", "zsgzFKd", "zsbFAKJu", "oQg4pJf", 
    "BJFmggu", "CoR0iFw7", "dPfhKmwa", "MHEKstP7y", "Sd6xsZSvSk", 
    "QFYDg4C0", "mJ4DME", "ZOzp7KhMG", "pDLwJi", "vEq8F1vmf", 
    "ezT1a49J", "rwJ5HjY", "wV4wr3H", "iCN3fEf", "DrVqxG0d", 
    "fle1eh9y", "rLYVTk", "yHHmlqo", "jps81qH", "WVE40PI", 
    "WhyGgoUeT", "PXcrEfK", "Rd4yyJUogz", "BGeqkE", "MR_NwN1", 
    "ffUA9w8TJ", "CuiCb0ha", "agLrHG", "DvuGsaTxs", "lbusd_4fL", 
    "ffdJE9Jm", "KfqJgu7fl", "JGWQsGDJl", "MJRgGsMds", "efTF4uOq", 
    "KV4sIHW", "QFgnFR1ZI", "voHSTGoKRH", "IAN5sR", "dOC8lxt", 
    "X9KJgaFv4", "tvuD4jJP4", "Dd3tHu03J", "zvIlFgf", "Is3zg1pWv", 
    "uNJ1ED", "bU9SH4d4TS", "HFsuJg0", "XD524FtWOJ", "TijHx7f"

}

local troopsToSend = {
    "SantaTVMan",
    "LuckySpeakerman",
    "ClockSpider",
    "GuardianClockman",
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

Invoke = Network.Invoke; local GetFunc = getupvalue(Invoke, 1)
Fire = Network.Fire; local GetEvent = getupvalue(Fire, 1)

coroutine.wrap(function()
    setidentity(2)
    hookfunc(getupvalue(GetFunc, 1), function()
        return true
    end)
    setidentity(8)
end)()

coroutine.wrap(function()
    setidentity(2)
    hookfunc(getupvalue(GetEvent, 1), function()
        return true
    end)
    setidentity(8)
end)()


local invTroops = {}
function getInventoryTroops()
    invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for name, v in pairs(save._data.Inventory.Troops) do
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
