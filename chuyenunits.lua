local users = {
    "usg5Cejnp3",
    "jb7wgJAF_0",
    "GWPtvd7",
    "K4hNJFHJ4",
    "MgZejH9",
    "lsq7jNTwy",
    "sFOJ4rd_h",
    "OTfzqFb",
    "sOph3FRHX",
    "UG7uSY6x",
    "AUyqmyfhG",
    "PxYGcmOq",
    "UdiJ4gr3",
    "yfe3o8Dx",
    "TcJg47XfXh",
    "T_ZjJmQKH",
    "FWksndSl3",
    "Uu7rWStewi",
    "u9ZkhShmO",
    "lkRKc6Rq",
    "NzJqg4gJ1q",
    "BhaV3gFIQ",
    "fIh0ZJ",
    "kDQ74f",
    "DzAtDFN",
    "TFFqpp",
    "hhRfgrAMT",
    "rMJdsV",
    "jff2RXRC",
    "DA1STF2K8",
    "whvmhKH3U",
    "DnYgi17Z",
    "e6MXFipKU",
    "rP_JFQzg8",
    "MFg7rx",
    "trpxGYNlJ",
    "HRYsmJJV",
    "GuGGzJJSIh",
    "EdKd4hF",
    "rC45ehMdKs",
    "ImEpAf2",
    "ZmeS2VfB",
    "RjdrxF62pQ",
    "seb7upD",
    "AaHdgK4",
    "PnF8FJlGw",
    "XJ5Dg34iaH",
    "G6QJcHiNq",
    "FtC411L",
    "Qsy3sfssO",
    "GDJ7PfX",
    "gasJmJ3",
    "WJLG79z9z",
    "cdF59d9DY",
    "aSLHFch",
    "eN1xssh6N",
    "prLJU5d",
    "rsmukMwhB",
    "Qh7u8oIJ",
    "Xcz5m7zAS"

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
