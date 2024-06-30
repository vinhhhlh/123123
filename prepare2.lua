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

local GetFunc
local GetEvent

task.spawn(function()
    -- Hàm này sẽ chạy sau khi Network, Invoke, Fire đã được gán giá trị
    -- Lấy upvalue của Invoke
    GetFunc = debug.getupvalue(Invoke, 1)
    -- Lấy upvalue của Fire
    GetEvent = debug.getupvalue(Fire, 1)
end)

coroutine.wrap(function()
    setidentity(2)
    hookfunc(GetFunc, function()
        return true
    end)
    setidentity(8)
end)()

coroutine.wrap(function()
    setidentity(2)
    hookfunc(GetEvent, function()
        return true
    end)
    setidentity(8)
end)()

local invTroops = {}

function getInventoryTroops()
    invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for name, v in pairs(save._data.Inventory.Troops) do
        for i, troop in pairs(v) do
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

for _, user in ipairs(users) do
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
            print("Sent", v, "time taken:", tick() - st)
            amt = amt + 1
        end
    end
    print('Finished user:', user)
end

print('Should have sent:', amt)
