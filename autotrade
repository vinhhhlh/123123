local TTD = require(game:GetService("ReplicatedStorage").MultiboxFramework)
local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
local Network = TTD.Network

local Invoke = Network.Invoke; local GetFunc = getupvalue(Invoke, 1)
local Fire = Network.Fire; local GetEvent = getupvalue(Fire, 1)
if TTD.debug then print('Found Invoke/Fire') end
-- $ -- Bypass
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


local amt = 68
local troopsToSend = {
    --"SantaTVMan",
    "LuckySpeakerman"
}

local cratesToSend = {
    --"ClockCrate"
}



local n = 0
for i, v in pairs(save:GetData().Inventory.Troops) do
    if table.find(troopsToSend, i) then
        for i, v in pairs(v) do
            n = n + 1
             if n <= amt then
            Fire("AddItemToTrade", "Troops", i)

            end
        end
    end
end

for i, v in pairs(save:GetData().Inventory.Crates) do
    if table.find(cratesToSend, i) then
        for i, v in pairs(v) do
            n = n + 1
             if n <= amt then
            Fire("AddItemToTrade", "Crates", i)

            end
        end
    end
end
