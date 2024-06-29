local claimAt = 2

local e
repeat
    task.wait(0.1)
    pcall(function()
        e = require(game:GetService("ReplicatedStorage").MultiboxFramework)
    end)
until game:IsLoaded() and #game:GetService("ReplicatedStorage"):GetDescendants() >= 26500 and e ~= nil and e.Network and e.Replicate

task.wait(1)

local TTD = require(game:GetService("ReplicatedStorage").MultiboxFramework)
local Network = TTD.Network

local Invoke = Network.Invoke
local Fire = Network.Fire

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

while true do
    if Invoke("PostOffice_GetInbox") and #Invoke("PostOffice_GetInbox") >= claimAt then
        local tab = {}
        for i, v in pairs(Invoke("PostOffice_GetInbox")) do
            table.insert(tab, v._id)
        end
        Invoke("PostOffice_BulkClaimPackages", tab)
    end
    task.wait(5)
end
