getgenv().fps = 10

getgenv().completedWebhook = ""
getgenv().sendDiamondsWebhook = ""

getgenv().autoPlay = {
    difficulty = "Nightmare", -- difficulty it will vote for
    map = "TimeFactory",      -- map name u want to play, (check the name above the thing ingame)
    autoReplay = true,        -- play again when you die
    skipMethod = "gui",       -- guiToggle (clicks on the auto skip button), remote (fires remote every so often), gui is more stable
    autoSkip = true,
    showScreen = true,
}

getgenv().clockGift = {
    user = ""
}

-- updated for clock event
getgenv().autoEasterPass = {
    enabled = true,
    goToLobbyAfterReachedEggs = 3000, -- go back to lobby once you get this amt of eggs
    convertEggsToGems = true
}

getgenv().autoBoost = { -- this will use boosts when it runs out
    ["2xCoinsBoost"] = true,
    ["2xLuckBoost"] = false,
    ["2xEggsBoost"] = true,
    ["2xClocksBoost"] = true,
    ["2xEventXPBoost"] = true,
}

getgenv().autoMail = {
    enabled = true,          -- for gems
    sendTroopsEnabled = true,
    idToSendTo = 5456141384, -- for gems
    idToSendTo2 = 5456141595,         -- this is for troops
    sendGemsAfterReached = 50,
    sendOfRarity = {
        ["Legendary"] = true,
        ["Basic"] = false,
        ["Epic"] = false,
        ["Mythic"] = true,
        ["Uncommon"] = true,
        ["Rare"] = false,
        ["Exclusive"] = true,
        ["Godly"] = true
    }
}

getgenv().autoSummon = {
    enabled = false,
    crateType = "BasicCrate",             -- "JesterCrate", "BasicCrate"
    summonAt = 10,                        -- summon all once you can do a certain amt
    goToLobbyAfterReachedCoins = 1000000, -- go back and summon once you get certain amt of coins
    useLuckBoost = true,                  -- use boost before summoning
    deleteOfRarity = {
        ["Legendary"] = false,
        ["Basic"] = true,
        ["Epic"] = true,
        ["Mythic"] = false,
        ["Uncommon"] = true,
        ["Rare"] = true
    },
}

getgenv().macroTroops = { -- will equip these for your macro
    -- "MicrowaveMan",
}
local macro = '{}'
local HttpService = game:GetService("HttpService")
local decrpytMacro = HttpService:JSONDecode(macro)

local closestTroop
function convertPosToInstance(pos)
    local closestDistance = math.huge
    closestTroop = nil
    local split = pos:split(", ")
    local vector = Vector3.new(tonumber(split[1]), tonumber(split[2]), tonumber(split[3]))
    warn(vector)
    for i, v in pairs(workspace.Troops:GetChildren()) do
        local mag = (vector - v.HumanoidRootPart.CFrame.p).Magnitude
        if mag < closestDistance then
            closestTroop = v
            closestDistance = mag
        end
    end
    return closestTroop
end

local G2L = {};

task.spawn(function()
    local startTick = tick()

    G2L["1"] = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui);
    G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
    G2L['1']["IgnoreGuiInset"] = true
    G2L['1']["Enabled"] = not autoPlay.showScreen

    G2L["2"] = Instance.new("Frame", G2L["1"]);
    G2L["2"]["BorderSizePixel"] = 0;
    G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["2"]["Size"] = UDim2.new(1, 0, 1, 0);
    G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

    G2L["3"] = Instance.new("TextLabel", G2L["2"]);
    G2L["3"]["TextWrapped"] = true;
    G2L["3"]["BorderSizePixel"] = 0;
    G2L["3"]["TextScaled"] = true;
    G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    G2L["3"]["TextSize"] = 1;
    G2L["3"]["TextColor3"] = Color3.fromRGB(255, 0, 5);
    G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L["3"]["Size"] = UDim2.new(0.5, 0, 0, 50);
    G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L["3"]["Text"] = [[Time Elapsed: 0s | waiting to load]];
    G2L["3"]["BackgroundTransparency"] = 1;
    G2L["3"]["Position"] = UDim2.new(0.5, 0, 0.30000001192092896, 0);

    G2L['4'] = Instance.new("TextLabel", G2L["2"]);
    G2L['4']["TextWrapped"] = true;
    G2L['4']["BorderSizePixel"] = 0;
    G2L['4']["TextScaled"] = true;
    G2L['4']["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    G2L['4']["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular,
        Enum.FontStyle.Normal);
    G2L['4']["TextSize"] = 1;
    G2L['4']["TextColor3"] = Color3.fromRGB(0, 0, 255);
    G2L['4']["AnchorPoint"] = Vector2.new(0.5, 0.5);
    G2L['4']["Size"] = UDim2.new(0.5, 0, 0, 50);
    G2L['4']["BorderColor3"] = Color3.fromRGB(0, 0, 0);
    G2L['4']["Text"] = [[Time Elapsed: 0s | waiting to load]];
    G2L['4']["BackgroundTransparency"] = 1;
    G2L['4']["Position"] = UDim2.new(0.5, 0, 0.50000001192092896, 0);

    while task.wait(1) do
        G2L["3"].Text = "Time Elapsed: " .. tostring(math.floor(tick() - startTick))
    end
end)

local e
repeat
    task.wait(1)
    pcall(function() e = require(game:GetService("ReplicatedStorage").MultiboxFramework) end)
until game:IsLoaded() and #game:GetService("ReplicatedStorage"):GetDescendants() >= 26500 and e ~= nil and e.Network and e.Replicate
game:GetService("ReplicatedStorage"):WaitForChild("MultiboxFramework")

task.spawn(function()
    local Workspace = game:GetService("Workspace")
    local Terrain = Workspace:WaitForChild("Terrain")
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 1
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0

    local Lighting = game:GetService("Lighting")
    Lighting.Brightness = 0
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e100
    Lighting.FogStart = 0

    sethiddenproperty(Lighting, "Technology", 2)
    sethiddenproperty(Terrain, "Decoration", false)

    local function clearTextures(v)
        if v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        elseif (v:IsA("Decal") or v:IsA("Texture")) then
            v.Transparency = 1
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        elseif v:IsA("MeshPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
            v.TextureID = 10385902758728957
        elseif v:IsA("SpecialMesh") then
            v.TextureId = 0
        elseif v:IsA("ShirtGraphic") then
            v.Graphic = 1
        elseif (v:IsA("Shirt") or v:IsA("Pants")) then
            v[v.ClassName .. "Template"] = 1
        elseif v.Name == "Foilage" and v:IsA("Folder") then
            v:Destroy()
        elseif string.find(v.Name, "Tree") or string.find(v.Name, "Water") or string.find(v.Name, "Bush") or string.find(v.Name, "grass") then
            task.wait()
            v:Destroy()
        end
    end

    game:GetService("Lighting"):ClearAllChildren()

    for _, v in pairs(Workspace:GetDescendants()) do
        clearTextures(v)
    end

    Workspace.DescendantAdded:Connect(function(v)
        clearTextures(v)
    end)
end)

task.spawn(function()
    task.wait(2)
    setthreadidentity(8)
    setfpscap(fps)
    setfflag("TaskSchedulerTargetFps", fps)
    game:GetService("RunService"):Set3dRenderingEnabled(autoPlay.showScreen)
end)

print "loaded"
G2L["4"]["Text"] = [[Status: Loaded]];
local remoteIds = {}

local TTD = require(game:GetService("ReplicatedStorage").MultiboxFramework)
local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
local handler
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

function importEvent(remoteName)
    pcall(function()
        local remoteId = GetEvent(remoteName)._identifier
        remoteIds[remoteName] = remoteId
    end)
end

function importFunc(remoteName)
    local remoteId = GetFunc(remoteName)._identifier
    remoteIds[remoteName] = remoteId
end

local invTroops = {}
function getInventoryTroops()
    invTroops = {}
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for name, v in pairs(save._data.Inventory.Troops) do
        for i, v in pairs(v) do
            invTroops[name] = i
        end
    end
    return invTroops
end

function webhook(url, data)
    pcall(function()
        local newdata = game:GetService("HttpService"):JSONEncode(data)

        local headers = {
            ["content-type"] = "application/json"
        }

        request = http_request or request or HttpPost or syn.request
        local a = { Url = url, Body = newdata, Method = "POST", Headers = headers }

        request(a)
    end)
end

local troops = {}

function findTroopIdByName(name)
    return troops[name] or nil
end

local eggs
function getEggAmt()
    eggs = nil
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for i, v in pairs(save._data) do
        if i == "Currencies" then
            eggs = v.Clocks_ClockEvent
        end
    end
    return eggs
end

function ownsBoost(name)
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for i, v in pairs(save._data.BoostInv) do
        if i == name then
            return v
        end
    end
    return 0
end

function getBoostTime(name)
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for i, v in pairs(save._data.Boosts) do
        if i == name then
            return v
        end
    end
    return nil
end

function getClaimedEaster()
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for i, v in pairs(save:GetData()) do
        if i == "ClockEvent_BattlePassClaimedRewards" then
            return v
        end
    end
end

local xp = 0

function getMaxLevel()
    xp = 0
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for i, v in pairs(save:GetData()) do
        if i == "ClockEvent_BattlePassXP" then
            xp = v
        end
    end

    for i, v in pairs(getupvalues(handler.PlrDataChanged)) do
        if i == 2 then
            for i, v in pairs(getupvalues(v)) do
                return tostring(v.calculateLevel(xp)):split(" ")[1]
            end
        end
    end
end

function hasEnoughForTier(n)
    for i, v in pairs(getupvalues(handler.PlrDataChanged)) do
        if i == 3 then
            for i, v in pairs(v) do
                if i == n then
                    return v.CurrencyAmount
                end
            end
        end
    end
end

function buyMaxGemsWithEggs()
    if getgenv().autoEasterPass.convertEggsToGems and getEggAmt() >= 400 then
        print("BUYING GEMS")
        importEvent("ClockEvent_ExchangeClocksForGemPackage")
        local maxBuyAmt = math.floor(getEggAmt() / 400)
        print("TOTAL GEMS TO BUY: " .. tostring(maxBuyAmt))
        if maxBuyAmt > 0 then
            for i = 1, maxBuyAmt do
                task.spawn(function()
                    game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                        [1] = {
                            [1] = 1
                        },
                        [2] = remoteIds["ClockEvent_ExchangeClocksForGemPackage"]
                    })
                end)
                task.wait(0.5)
            end
        end
    end
end

function tryClaimEasterPass()
    if getgenv().autoEasterPass.enabled then
        print("AUTO CLAIM EASTER PASS | BEGIN")
        importEvent("ClockEvent_ClaimEventPassReward")
        print("Max level: " .. tostring(getMaxLevel()))
        for i = 1, getMaxLevel() do
            local claimed = getClaimedEaster()
            print("Checking if claimed: " .. tostring(i))

            if claimed["T" .. tostring(i)] and claimed["T" .. tostring(i)] == true then
                print("was claimed: " .. tostring(i) .. ", skipping")
                continue
            else
                print("Claiming item: " .. tostring(i))
                game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                    [1] = {
                        [1] = i
                    },
                    [2] = remoteIds['ClockEvent_ClaimEventPassReward']
                })
            end
        end


        writefile(game.Players.LocalPlayer.Name.."level.txt",tostring(getMaxLevel()))

    end
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

local gems
function getGemAmt()
    gems = nil
    local save = TTD.Replicate:WaitForReplica("PlayerData-" .. game:GetService("Players").LocalPlayer.UserId)
    for i, v in pairs(save._data) do
        if i == "Currencies" then
            gems = v.Gems
        end
    end
    return gems
end

function trySendAllGems()
    if getGemAmt() >= getgenv().autoMail.sendGemsAfterReached and getgenv().autoMail.enabled and getCoinAmt() >= 100 then

        local oldGem = getGemAmt()

        Network.Invoke("PostOffice_SendGift", getgenv().autoMail.idToSendTo, nil, nil, getGemAmt(),
            tostring(math.random(1, 10000)))
            webhook(
                sendDiamondsWebhook,
                {
                    ["content"] = "",
                    ["username"] = "ttd",
                    ["embeds"] = {
                        {
                            ["title"] = game.Players.LocalPlayer.Name .. " sent mail\n\nSent" .. tostring(oldGem) .. " gems to " .. tostring(getgenv().autoMail.idToSendTo) ,
                            ["type"] = "rich",
                            ["color"] = 8388736,
                        }
                    }
                })

    end
end

local function ClickButton(btn)
    local events = { "MouseButton1Up", "MouseButton1Down", "MouseButton1Click", "Activated" }
    for _, event in pairs(events) do
        for _, evnt in pairs(getconnections(btn[event])) do
            evnt:Fire()
        end
    end
end

function trySummon()
    task.spawn(function()
        if getgenv().autoSummon.enabled then
            print("AUTO SUMMON | BEGIN")
            importEvent("Summon1")
            importEvent("Summon10")
            importEvent("UseTimedBoost")
            print("AUTO SUMMON | GOT REMOTES: ", remoteIds["Summon1"], remoteIds["Summon10"])
            print("AUTO SUMMON | BEGIN CHECKS")

            if getCoinAmt() >= (autoSummon.summonAt >= 10 and 900 or autoSummon.summonAt <= 9 and autoSummon.summonAt * 100) then
                if getgenv().autoSummon.useLuckBoost then
                    if not getBoostTime("2xLuckBoost") then
                        task.spawn(function()
                            game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                                [1] = {
                                    [1] = "2xLuckBoost"
                                },
                                [2] = remoteIds["UseTimedBoost"]
                            })
                        end)
                    end
                end
                if getgenv().autoSummon.summonAt == 10 then
                    local summonAmt = getgenv().autoSummon.crateType == "JesterCrate" and math.floor(getCoinAmt() / 1800) or
                        getgenv().autoSummon.crateType == "BasicCrate" and math.floor(getCoinAmt() / 900)
                    for i = 1, summonAmt do
                        game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                            [1] = {
                                [1] = getgenv().autoSummon.crateType,
                                [2] = autoSummon.deleteOfRarity
                            },
                            [2] = remoteIds["Summon10"]
                        })
                    end
                elseif getgenv().autoSummon.summonAt < 10 then
                    local summonAmt = getgenv().autoSummon.crateType == "JesterCrate" and math.floor(getCoinAmt() / 200) or
                        getgenv().autoSummon.crateType == "BasicCrate" and math.floor(getCoinAmt() / 100)
                    for i = 1, summonAmt do
                        game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                            [1] = {
                                [1] = getgenv().autoSummon.crateType,
                                [2] = autoSummon.deleteOfRarity
                            },
                            [2] = remoteIds["Summon1"]
                        })
                    end
                end
            end
            task.wait(5)
        end
    end)
end

function gift10Clocks()
    local clocks = getEggAmt()
    if clocks >= 3000 then
       Network.Fire("Gift10Crates","ClockCrate",clockGift.user) 
    end
end

function trySendAllTroopsAndCrates()
    if not autoMail.sendTroopsEnabled then return end
    local data = TTD:WaitForModule("SharedSettings").TroopDatas
    local data2 = TTD:WaitForModule("SharedSettings").CrateDatas
    local troopDatas = {}
    local crateDatas = {}
    for k, l in next, data do
        for i, v in pairs(l) do
            if i == "Rarity" then
                troopDatas[k] = v
            end
        end
    end

    for k, l in next, data2 do
        for i, v in pairs(l) do
            if i == "Rarity" then
                crateDatas[k] = v
            end
        end
    end


    local user = autoMail.idToSendTo2
    for i, v in pairs(save:GetData().Inventory.Troops) do
        if autoMail.sendOfRarity[troopDatas[i]] then
            for i, v in pairs(v) do
                if getCoinAmt() >= 100 then
                    print("Sending troop")
                    task.spawn(function()
                        Invoke("PostOffice_SendGift", user, "Troops", i, 0,
                            tostring(math.random(1, 10000)))
                    end)
                    task.wait(3)
                else
                    return
                end
            end
        end
    end

    for i, v in pairs(save:GetData().Inventory.Crates) do
        if autoMail.sendOfRarity[crateDatas[i]] then
            for i, v in pairs(v) do
                if getCoinAmt() >= 100 then
                    print("Sending crate")
                    task.spawn(function()
                        Invoke("PostOffice_SendGift", user, "Crates", i, 0,
                            tostring(math.random(1, 10000)))
                    end)
                    task.wait(3)
                else
                    return
                end
            end
        end
    end
end

local PFS = game:GetService("PathfindingService")
local function getPath(destination)
    local path = PFS:CreatePath({
        ["AgentRadius"] = 1,

        ["AgentCanJump"] = true,

    })
    path:ComputeAsync(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, destination)

    return path
end

local function pathFindTo(destination)
    local path = getPath(destination)

    for i, waypoint in pairs(path:GetWaypoints()) do
        local newPart = Instance.new("Part", workspace)
        newPart.Size = Vector3.new(1, 1, 1)
        newPart.Anchored = true
        newPart.Color = Color3.fromRGB(90, 40, 237)
        newPart.CanCollide = false
        newPart.Position = waypoint.Position
        game.Players.LocalPlayer.Character.Humanoid:MoveTo(waypoint.Position)
        game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:Wait()
    end
end

if game.PlaceId == 13775256536 then
    G2L["4"]["Text"] = [[Status: Teleporting to OG Lobby]];
    Network.Fire("TeleportToOGLobby")

    task.spawn(function()
        task.wait(70)
        G2L["4"]["Text"] = [[Status: Rejoning | timer expired]];
        game:GetService("TeleportService"):Teleport(13775256536, game:GetService("Players").LocalPlayer)
    end)

    repeat
        pcall(function()
    handler = game:GetService("Players").LocalPlayer.PlayerGui.ClockEventGui.ClockEventPass.EventPassFrame.EventPassHandler
    end)
        task.wait()
    until handler ~= nil

    handler = getsenv(handler)

    local Player = game.Players.LocalPlayer
    local Hrp = Player.Character.HumanoidRootPart

    G2L["4"]["Text"] = [[Status: Equipping macro troops]];
    troops = getInventoryTroops()

    task.spawn(function()
        Fire("UnequipAllTroops")
    end)

    for i, v in pairs(macroTroops) do
        Fire("ToggleEquipTroop", findTroopIdByName(v))
    end

    G2L["4"]["Text"] = [[Status: Using boosts (if found)]];
    importEvent("UseTimedBoost")

    for i, v in pairs(getgenv().autoBoost) do
        if v and not getBoostTime(i) and ownsBoost(i) > 0 then
            task.spawn(function()
                game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                    [1] = {
                        [1] = i
                    },
                    [2] = remoteIds["UseTimedBoost"]
                })
            end)
            task.wait(0.5)
        end
    end

    G2L["4"]["Text"] = [[Status: Claiming easter pass and converting gems]];

    tryClaimEasterPass()
    task.wait(1)
    buyMaxGemsWithEggs()
    task.wait(1)
    --gift10Clocks()
    task.spawn(function()
            trySendAllGems()
        end)

    if readfile(game.Players.LocalPlayer.Name.."level.txt") == "40" then
        task.wait(1)
        task.spawn(function()
            trySendAllTroopsAndCrates()
        end)

        task.wait(4)
    end

    G2L["4"]["Text"] = [[Status: trying to send mail]];

    --[[task.spawn(function()
        trySummon()
    end)]]
    task.wait(1)

    G2L["4"]["Text"] = [[Status: Turning off trading]];

    importEvent("PlayerSettingChanged")

    game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
        [1] = {
            [1] = "Trading",
            [2] = 3
        },
        [2] = remoteIds['PlayerSettingChanged']
    })

    function startGame(areaName, maxPlayers)
        local QueueFrame = game.Players.LocalPlayer.PlayerGui.Lobby.QueueFrame
        for _,Area in(workspace.Lifts:GetChildren()) do
            if Area.Name == areaName then
                local PlayersCount = string.split(Area.BasePart.StatusGui.PlayersCount.Text, "/")
                if tonumber(PlayersCount[1]) <= maxPlayers then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Area.BasePart.CFrame + Vector3.new(0,5,0)
                    repeat task.wait() until QueueFrame.Visible
                    local PlayersAmount = string.split(QueueFrame.PlayerAmount.PlayerAmount.Text, "/")
                    repeat task.wait() until tonumber(PlayersAmount[1]) >= maxPlayers
                    if tonumber(PlayersAmount[1]) == maxPlayers then
                        ClickButton(QueueFrame.Start)
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.SoundBase.CFrame
                    end
                    break
                end
            end
            task.wait(.1)
        end
    
        if not QueueFrame.Visible then
            startGame(areaName, maxPlayers)
        end
    end

    G2L["4"]["Text"] = [[Status: Joining map: ]] .. getgenv().autoPlay.map;
    print("Lobby | Joining map: " .. getgenv().autoPlay.map)
    startGame(getgenv().autoPlay.map,1)
elseif game.PlaceId == 14082129854 then
    local startTick = tick()
    print "in game"

    task.spawn(function()
        if not remoteIds['VoteMap'] then
            importEvent("VoteMap")
        end

        G2L["4"]["Text"] = [[Status: Voting for map]];

        task.wait(0.5) -- add delay to prevent issues

        game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
            [1] = {
                [1] = getgenv().autoPlay.difficulty
            },
            [2] = remoteIds['VoteMap']

        })

        print("FARMING | Difficulty selected: " .. getgenv().autoPlay.difficulty)
    end)


    -- turn on auto skip
    task.spawn(function()
        if autoPlay.autoSkip then
            G2L["4"]["Text"] = [[Status: Turning on auto skip]];
            if getgenv().autoPlay.skipMethod == "gui" then
                if game:GetService("Players").LocalPlayer.PlayerGui.Match.WaveInfo.AutoSkip.OnAndOff.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
                    ClickButton(game:GetService("Players").LocalPlayer.PlayerGui.Match.WaveInfo.AutoSkip.OnAndOff)
                    print("FARMING | Auto skip turned on")
                end
            end
        end
    end)

    task.spawn(function()
        if getgenv().autoPlay.autoReplay then
            while task.wait(1) do
                if game:GetService("Players").LocalPlayer.PlayerGui.Match.MatchFinish.Visible then
                    G2L["4"]["Text"] = [[Status: Replaying game]];
                    Network.Fire("PlayMatchAgain")
                end
            end
        end
    end)


    task.spawn(function()
        local placeTroopId, sellId, upgradeId, skipWaveId, changeTargetId = GetEvent("PlaceTroop")._identifier,
            GetEvent("SellTroop")._identifier, GetEvent("UpgradeTroop")._identifier, GetEvent("VoteSkipWave")
            ._identifier, GetEvent("ChangeTargetting")._identifier
        repeat task.wait(0.1) until game.ReplicatedStorage.MatchData:FindFirstChild("MatchTimer")
        game.ReplicatedStorage.MatchData.MatchTimer:GetPropertyChangedSignal("Value"):Connect(function()
            print(game.ReplicatedStorage.MatchData.MatchTimer.Value)
            for i, v in pairs(decrpytMacro) do
                if v.Time == game.ReplicatedStorage.MatchData.MatchTimer.Value then
                    if v.Type == "PlaceTroop" then
                        G2L["4"]["Text"] = [[Status: Placing troop]];
                        local split = v.Pos:split(", ")
                        print(tonumber(split[1]),
                            tonumber(split[2]),
                            tonumber(split[3]), v.Rotation)
                        game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                            [1] = {
                                [1] = v.Troop,
                                [2] = Vector3.new(tonumber(split[1]),
                                    tonumber(split[2]),
                                    tonumber(split[3])),
                                [3] = tonumber(v.Rotation)
                            },
                            [2] = placeTroopId
                        })
                    elseif v.Type == "SellTroop" and v.Pos then
                        G2L["4"]["Text"] = [[Status: Selling troop]];

                        print("sell troop")
                        game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                            [1] = {
                                [1] = convertPosToInstance(v.Pos)
                            },
                            [2] = sellId
                        })
                    elseif v.Type == "UpgradeTroop" and v.Pos then
                        G2L["4"]["Text"] = [[Status: Upgrading troop]];
                        print("upgrade")
                        game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                            [1] = {
                                [1] = convertPosToInstance(v.Pos)
                            },
                            [2] = upgradeId
                        })
                    elseif v.Type == "VoteSkipWave" then
                        G2L["4"]["Text"] = [[Status: Skipping wave with macro]];
                        if game:GetService("Players").LocalPlayer.PlayerGui.Match.WaveInfo.AutoSkip.OnAndOff.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
                            ClickButton(game:GetService("Players").LocalPlayer.PlayerGui.Match.WaveInfo.AutoSkip
                                .OnAndOff)
                            print("FARMING | Auto skip turned on")
                        end
                        game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                            [1] = {},
                            [2] = skipWaveId
                        })
                    elseif v.Type == "ChangeTargetting" and v.Pos then
                        G2L["4"]["Text"] = [[Status: Changing targetting]];
                        print("change target")
                        game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                            [1] = {
                                [1] = convertPosToInstance(v.Pos)
                            },
                            [2] = changeTargetId
                        })
                    end
                end
            end
        end)
    end)

    function roundToOneDecimal(num)
        return math.floor(num * 10 + 0.5) / 10
    end    

    game:GetService("Players").LocalPlayer.PlayerGui.Match.MatchFinish:GetPropertyChangedSignal("Visible"):Connect(function()
        webhook(
            completedWebhook,
            {
                ["content"] = "",
                ["username"] = "ttd",
                ["embeds"] = {
                    {
                        ["title"] = game.Players.LocalPlayer.Name .." finished match\n\nCurrent event coins: " .. tostring(getEggAmt()) .. "\nCurrent gems: " .. tostring(getGemAmt()).."\nTime taken: " .. tostring(roundToOneDecimal(tick() - startTick)) .. " seconds",
                        ["type"] = "rich",
                        ["color"] = 8388736,
                    }
                }
            })


        if getEggAmt() >= getgenv().autoEasterPass.goToLobbyAfterReachedEggs then
            G2L["4"]["Text"] = [[Status: Clocks reached, going to lobby]];
            game:GetService("TeleportService"):Teleport(13775256536, game:GetService("Players").LocalPlayer)
        elseif getCoinAmt() >= getgenv().autoSummon.goToLobbyAfterReachedCoins then
            G2L["4"]["Text"] = [[Status: Coins Reached, going to lobby]];
            --game:GetService("TeleportService"):Teleport(13775256536, game:GetService("Players").LocalPlayer)
        elseif getGemAmt() >= getgenv().autoMail.sendGemsAfterReached then
            G2L["4"]["Text"] = [[Status: Gems reached, going to lobby]];
            game:GetService("TeleportService"):Teleport(13775256536, game:GetService("Players").LocalPlayer)
        end

        if getgenv().autoPlay.autoReplay then
            if game:GetService("Players").LocalPlayer.PlayerGui.Match.MatchFinish.Visible then
                if not remoteIds['PlayMatchAgain'] then
                    importEvent("PlayMatchAgain")
                end

                game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer({
                    [1] = {},
                    [2] = remoteIds['PlayMatchAgain']
                })
            end
        end
    end)
end
