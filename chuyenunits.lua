local users = {
    "hJKgqvDPF",
    "jiswHzgoVCs",
    "oDTMTWzGluJ",
    "aNEdttwuvgJ",
    "uXSNbLdXvID",
    "jymiQIesOFJ",
    "fgDRvDHxuJX",
    "XHPkfsJquoU",
    "nkCwUaMZAHB",
    "AlUsYyWqqil",
    "tIzUHRMFLLa",
    "vgByDyLmVCm",
    "mOFcizoEBfX",
    "RjbsgRIRYAm",
    "mgkfFHaPTFb",
    "GQgaAPWKvsM",
    "VaHsotIUgcp",
    "yBPPQfJlbfw",
    "cuIgdpcYaRz",
    "AvKqMKSKZoQ",
    "WFCOSkRQhDE",
    "MqJLrTESVNg",
    "PLVvbUMnOxB",
    "XlXOoidsCje",
    "IMArNGzTkgg",
    "dIEHARNEBvm",
    "WpLydesmghm",
    "uYXJrFMyZhM",
    "SWMoxVjZmTc",
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
end)

-- Wait for TTD and Network initialization
repeat
    task.wait(0.1)
until Network and Invoke and Fire

if TTD.debug then
    print('Found Invoke/Fire')
end

-- Bypass
coroutine.wrap(function()
    local GetFunc = debug.getupvalue(Invoke, 1)
    if GetFunc then
        setidentity(2) -- Assuming setidentity is defined elsewhere
        hookfunc(debug.getupvalue(GetFunc, 1), function()
            return true
        end)
        setidentity(8)
    end
end)()

coroutine.wrap(function()
    local GetEvent = debug.getupvalue(Fire, 1)
    if GetEvent then
        setidentity(2) -- Assuming setidentity is defined elsewhere
        hookfunc(debug.getupvalue(GetEvent, 1), function()
            return true
        end)
        setidentity(8)
    end
end)()

local invTroops = {}

function getInventoryTroops()
    invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for name, v in pairs(save._data.Inventory.Troops) do
        for i, _ in pairs(v) do
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
    for i, v in pairs(troops) do
        if i == id then
            return true
        end
    end
    return false
end

local users = {"User1", "User2", "User3"}  -- Điền vào danh sách người dùng của bạn

local startAmt = getCoinAmt()

local amt = 0

for _, user in ipairs(users) do
    local sent = {}
    for i, v in pairs(getInventoryTroops()) do
        if table.find(troopsToSend, v) and not table.find(sent, v) then
            table.insert(sent, v)
            local oldC = getCoinAmt()
            local st = tick()
            repeat
                Invoke("PostOffice_SendGift", game.Players:GetUserIdFromNameAsync(user), "Troops", i, 0,
                    tostring(math.random(1, 10000)))
                task.wait(0.1)
            until getCoinAmt() < oldC and not hasTroop(i)
            print("sent", "time taken:", tick()-st)
        end
    end
    print('finished user:', user)
end

print('Should have sent:', amt)
