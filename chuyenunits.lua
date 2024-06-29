local users = {
    "KLGGsob32i",
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
    until Network and Invoke and Fire
end)

local invTroops = {}

function getInventoryTroops()
    invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for name, data in pairs(save._data.Inventory.Troops) do
        for i, v in pairs(data) do
            invTroops[i] = name
        end
    end
    return invTroops
end

local coins = 0

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
    local troops = getInventoryTroops()
    for i, v in pairs(troops) do
        if i == id then
            return true
        end
    end
    return false
end

local startAmt = getCoinAmt()
local amt = 0

for _, user in ipairs(users) do
    local sent = {}
    for i, troopName in pairs(getInventoryTroops()) do
        if table.find(troopsToSend, troopName) and not table.find(sent, troopName) then
            table.insert(sent, troopName)
            local oldC = getCoinAmt()
            local st = tick()
            repeat
                Invoke("PostOffice_SendGift", game.Players:GetUserIdFromNameAsync(user), "Troops", i, 0, tostring(math.random(1, 10000)))
                task.wait(0.1)
            until getCoinAmt() < oldC and not hasTroop(i)
            print("Sent", "time taken:", tick()-st)
            amt = amt + 1
        end
    end
    print('Finished user:', user)
end

print('Should have sent:', amt)
