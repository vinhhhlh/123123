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
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)

    repeat
        pcall(function()
            Network = TTD.Network
            Invoke = Network.Invoke
            Fire = Network.Fire
        end)
        task.wait(0.1)
    until Network ~= nil and Invoke ~= nil and Fire ~= nil

    local GetFunc = getupvalue(Invoke, 1)
    local GetEvent = getupvalue(Fire, 1)

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
end)

local function getInventoryTroops()
    local invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for name, troopList in pairs(save._data.Inventory.Troops) do
        for i, troopId in ipairs(troopList) do
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
        end
    end
    return coins
end

local function hasTroop(id)
    local troops = getInventoryTroops()
    for i, v in ipairs(troops) do
        if v == id then
            return true
        end
    end
    return false
end

local startAmt = getCoinAmt()

local amt = 0

for _, user in pairs(users) do
    local sent = {}
    for i, v in ipairs(getInventoryTroops()) do
        if table.find(troopsToSend, v) and not table.find(sent, v) then
            table.insert(sent, v)
            local oldC = getCoinAmt()
            local st = tick()
            repeat
                Invoke("PostOffice_SendGift", game.Players:GetUserIdFromNameAsync(user), "Troops", i, 0,
                    tostring(math.random(1, 10000)))
                task.wait(0.1)
            until getCoinAmt() < oldC and not hasTroop(i)
            print("sent", "time taken:", tick() - st)
        end
    end
    print('finished user:', user)
end

amt = getCoinAmt() - startAmt
print('Should have sent:', amt)
