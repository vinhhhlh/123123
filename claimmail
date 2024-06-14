local claimAt = 2



local e
repeat
    task.wait(0.1)
    pcall(function() e = require(game:GetService("ReplicatedStorage").MultiboxFramework) end)
until game:IsLoaded() and #game:GetService("ReplicatedStorage"):GetDescendants() >= 26500 and e ~= nil and e.Network and e.Replicate
game:GetService("ReplicatedStorage"):WaitForChild("MultiboxFramework")

game:GetService("ReplicatedStorage"):WaitForChild("MultiboxFramework")
task.wait(1)
local TTD = require(game:GetService("ReplicatedStorage").MultiboxFramework)
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

while task.wait() do
    if #Invoke("PostOffice_GetInbox") >= claimAt then
        local tab = {}
        for i, v in pairs(Invoke("PostOffice_GetInbox")) do
            table.insert(tab, v._id)
        end
        Invoke("PostOffice_BulkClaimPackages", tab)
    end
    task.wait(5)
end
