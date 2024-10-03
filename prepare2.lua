if not getupvalue then getupvalue = debug.getupvalue end

local users = {"ezTSJyNKktB"}
local troopsToSend = {
    "SantaTVMan", 
    "LuckySpeakerman", 
    "ClockSpider"
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

-- Xử lý cho Invoke và Fire
task.spawn(function()
    repeat task.wait(0.1) until Invoke and Fire -- Đảm bảo Invoke và Fire không phải nil
    if type(Invoke) == "function" and type(Fire) == "function" then
        local successGetFunc, GetFunc = pcall(getupvalue, Invoke, 1)
        local successGetEvent, GetEvent = pcall(getupvalue, Fire, 1)

        if successGetFunc and successGetEvent then
            coroutine.wrap(function()
                setidentity(2)
                local successHookFunc, errHookFunc = pcall(function()
                    if type(GetFunc) == "function" then
                        hookfunc(GetFunc, function()
                            return true
                        end)
                    else
                        warn("GetFunc is not a function, it's a:", typeof(GetFunc))
                    end
                end)
                if not successHookFunc then
                    warn("Error in hookfunc for GetFunc: ", errHookFunc)
                end
                setidentity(8)
            end)()

            coroutine.wrap(function()
                setidentity(2)
                local successHookEvent, errHookEvent = pcall(function()
                    if type(GetEvent) == "function" then
                        hookfunc(GetEvent, function()
                            return true
                        end)
                    else
                        warn("GetEvent is not a function, it's a:", typeof(GetEvent))
                    end
                end)
                if not successHookEvent then
                    warn("Error in hookfunc for GetEvent: ", errHookEvent)
                end
                setidentity(8)
            end)()
        else
            warn("Failed to get upvalues for Invoke or Fire.")
        end
    else
        warn("Invoke or Fire is not a function or is nil.")
    end
end)

-- Lấy danh sách quân trong kho
local invTroops = {}
function getInventoryTroops()
    invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    
    -- Kiểm tra nếu dữ liệu tồn tại trước khi truy cập
    if save and save._data and save._data.Inventory and save._data.Inventory.Troops then
        for name, v in pairs(save._data.Inventory.Troops) do
            for i, v in pairs(v) do
                invTroops[i] = name
            end
        end
    else
        warn("Could not retrieve Troops from save data. Data is nil or invalid.")
        print("Data found in save:", save and save._data and save._data.Inventory and save._data.Inventory.Troops)
    end
    return invTroops
end

-- Lấy số lượng coins
local coins
function getCoinAmt()
    coins = 0
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    if save and save._data and save._data.Currencies then
        coins = save._data.Currencies.Coins
    else
        warn("Could not retrieve Coins from save data. Data is nil or invalid.")
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
