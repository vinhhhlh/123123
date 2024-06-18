local users = {
    "rzuw3g6dr",
    "XxQga7e9",
    "BfruJxrsP",
    "IcUfp65",
    "QO7lcz",
    "c7eabN7",
    "mTjU_7G",
    "yQfdjSF6rl",
    "sXw9EJGdu",
    "fr9ybp4gRs",
    "ErJ6bDJ",
    "fa_fmBJ",
    "xLSkH7",
    "uV00DhSBS",
    "HoJIkoUJ",
    "CfB8Fq4",
    "C7Sy7VxrD",
    "fH6wWgHVCt",
    "GdaSfaJJb",
    "yEAwG5e",
    "hliSs_ja",
    "noSvbFdg",
    "IxA09sF",
    "d_bLH4NJg",
    "mgJrOf9",
    "esFjHFNCB",
    "r3eZOsGy",
    "BEdNFU",
    "HVFF4DQ",
    "SdFuTHTZ3",
    "ygwsFdJJF",
    "AV7520XFEJ",
    "IJJgfzOIB",
    "HRMr3dN",
    "wg_MSHJGg",
    "rvIse3g",
    "rcGm0OF",
    "ZyihbU_E",
    "eL73_his",
    "AwL4TTN0",
    "FfyseHfsh",
    "bG4DPjeIH",
    "ZJg3D2rMy",
    "opCJPmE",
    "GiMviJy",
    "BmCsI4l",
    "sjb0eFO",
    "mIV_Jp",
    "xVREDBz",
    "uk3g3g95",
    "nlywhZ3Cd",
    "NhGaJH9MJ",
    "JNfG4QKRTJ",
    "HKb9hLvg",
    "sbgJtfro",
    "PaFg0qF",
    "BnufTFN32",
    "Q3W4idhJ",
    "TsPJodhD",
    "WBH3ggSfJA",
    "kJhcpJFA8",
    "xls4PJ3HH",
    "Bad7syoL",
    "CyhkFrJA",
    "GUiDH2hd",
    "GZTsmSEp",
    "Xxh1gJgq41",
    "MSVR4Em",
    "KjNxMf9",
    "dAHkh5O",
    "sqLnJITP",
    "ta434Xt",

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
    until Network ~= nil and Invoke ~= nil and Fire ~= nil
end)

Invoke = Network.Invoke; local GetFunc = getupvalue(Invoke, 1)
Fire = Network.Fire; local GetEvent = getupvalue(Fire, 1)

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
