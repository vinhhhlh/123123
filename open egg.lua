
repeat
    wait()
until game:IsLoaded()
repeat
    wait()
until game.Players.LocalPlayer
local plr = game.Players.LocalPlayer

repeat
    wait()
until plr.Character
repeat
    wait()
until plr.Character:FindFirstChild("HumanoidRootPart")
repeat
    wait()
until plr.Character:FindFirstChild("Humanoid")
spawn(
    function()
        while wait() do
            game:GetService("Players").LocalPlayer.PlayerGui.Lobby.RejoinMatch.Visible = false
            game:GetService("Players").LocalPlayer.PlayerGui.MainFrames.NotificationFrame.Visible = false
        end
    end
)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
function ClickButton(x, y)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(x, y, 0, true, game, 1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(x, y, 0, false, game, 1)
end
function CloseAllUi()
    game:GetService("Players").LocalPlayer.PlayerGui.Lobby.ShopFrame.Visible = false
    game.Players.LocalPlayer.PlayerGui.Lobby.SummonShopFrame.Visible = false
end
function FindBoost()
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.ShopFrame.ShopList.ShopList:GetChildren()) do
        if not string.find(v.Name, "UI") and v.Name ~= "Barrier" then
            if v:FindFirstChild("2xLuckBoost") then
                return v
            end
        end
    end
end

function HideShopList()
    CloseAllUi()
    wait(.1)
    game:GetService("Players").LocalPlayer.PlayerGui.Lobby.ShopFrame.Visible = true
    wait(.1)
    local boost = FindBoost()
    print(boost)
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.ShopFrame.ShopList.ShopList:GetChildren()) do
        if not string.find(v.Name, "UI") and v.Name ~= "Barrier" then
            if v ~= boost then
                print(v.Name)
                v:Destroy()
            end
        end
    end
    wait(.1)
    game:GetService("Players").LocalPlayer.PlayerGui.Lobby.ShopFrame.Visible = false
end
HideShopList()
function UseBoost()
    CloseAllUi()
    local boost = FindBoost()
    if tonumber(boost["2xLuckBoost"].BoostInfo.BoostOwnAmount.Text:match("%d+")) > 0 then
        repeat wait()
        game:GetService("Players").LocalPlayer.PlayerGui.Lobby.ShopFrame.Visible = true
         ClickButton(412, 225)
        wait(.5)
        until   game:GetService("Players").LocalPlayer.PlayerGui.MainFrames.Boosts:FindFirstChild("2xLuckBoost")     
 game:GetService("Players").LocalPlayer.PlayerGui.Lobby.ShopFrame.Visible = false 
    end
end
local RarityCheck = {}
for i,v in pairs(_G.SettingRarityNotify) do 
    if v then 
        table.insert(RarityCheck,i)
    end 
end
function CheckRarity(v)
    if table.find(RarityCheck,v) then 
        return true 
    end
    return false 
end
_G.PosClick = {
    ["1xSummon"] = {590,330},
    ["10xSummon"] = {590, 400},
    ["BasicCrate"] = {588,170},
    ["MythicCrate"] = {588,250},
    ["JesterCrate"] = {588,170},
    ["Basic"] = {843, 180},
    ["Uncommon"] = {843, 230},
    ["Rare"] = {843, 270},
    ["Epic"] = {844, 310},
    ["Legendary"] = {844, 350}
}
function SendWebHook(v)
    local msg = {
        ['content'] = '@everyone',
        ["embeds"] = {{
            ["title"] = "Toilet Tower Defense",
            ["description"] = "Egg Opened",
            ["type"] = "rich",
            ["color"] = tonumber(0xbdce44),
            ["fields"] = {
                {
                    ["name"] = "User",
                    ["value"] = game.Players.LocalPlayer.Name,                                            
                    ["inline"] = false
                },
                {
                    ["name"] = "Name",
                    ["value"] = v.UnitName.Text,                                            
                    ["inline"] = true
                },
                {
                    ["name"] = "Rarity",
                    ["value"] = v.RarityFrame.Rarity.Text,                                            
                    ["inline"] = true
                },
                {
                    ["name"] = "Coin left",
                    ["value"] = game:GetService("Players").LocalPlayer.leaderstats.Coins.Value,                                            
                    ["inline"] = false
                },
            }
        }}
    }
    request({
        Url = _G.Webhook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(msg)
    }) 
end



wait(.5)

summonamount = "1xSummon"
if _G.SummonAmount == "1" then
    summonamount = "1xSummon"
elseif _G.SummonAmount == "10" then
    summonamount = "10xSummon"
else
    game.Players.LocalPlayer:Kick("Chọn sai số lượng")
end
function Summon()
    local b = "Summon1"
    if _G.SummonAmount == "10" then 
        b = "Summon10"
    end
    local a = require(game:GetService("ReplicatedStorage").MultiboxFramework)
    for i,v in next,getupvalues(getupvalues(a.Network.Fire)[1])[4] do 
        if i == b then
            return v._identifier
        end
    end
end
if _G.Notify then 
    if summonamount == "1xSummon" then 
        game.Players.LocalPlayer.PlayerGui.Lobby.SummonedFrame["1xSummon"]:GetPropertyChangedSignal("Visible"):Connect(function()
            if game.Players.LocalPlayer.PlayerGui.Lobby.SummonedFrame["1xSummon"].Visible  then
                if CheckRarity(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.SummonedFrame["1xSummon"].RarityFrame.Rarity.Text) then 
                    SendWebHook(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.SummonedFrame["1xSummon"])
                end
            end
        end)
    elseif summonamount == "10xSummon" then 
        game.Players.LocalPlayer.PlayerGui.Lobby.SummonedFrame["10xSummon"]:GetPropertyChangedSignal("Visible"):Connect(function()
            if game.Players.LocalPlayer.PlayerGui.Lobby.SummonedFrame["10xSummon"].Visible  then
                for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Lobby.SummonedFrame["10xSummon"]:GetChildren()) do 
                    if v:IsA("Frame") then 
                        if CheckRarity(v.RarityFrame.Rarity.Text) then 
                            SendWebHook(v)
                        end 
                    end 
                end 
            end 
        end)
    end
end
local UUIDSummon = Summon()

while _G.Toggle do
    task.wait()
    if  UUIDSummon == nil then 
        if game.Players.LocalPlayer.PlayerGui.Lobby.SummonShopFrame.Visible then 
            if _G.Crate ~= "JesterCrate" then 
                game:GetService("Players").LocalPlayer.PlayerGui.Lobby.SummonShopFrame.SummonMenu.RightMenu.Crates.Crates.JesterCrate.Visible = false
            end
            if not game:GetService("Players").LocalPlayer.PlayerGui.Lobby.SummonShopFrame.SummonMenu.RightMenu.Crates.Crates[_G.Crate].CrateButton.SelectedStroke.Enabled then 
                repeat wait()
                    ClickButton(_G.PosClick[_G.Crate][1],_G.PosClick[_G.Crate][2])
                    wait(.1)
                until  game:GetService("Players").LocalPlayer.PlayerGui.Lobby.SummonShopFrame.SummonMenu.RightMenu.Crates.Crates[_G.Crate].CrateButton.SelectedStroke.Enabled
            end
            wait(.1)
            ClickButton(_G.PosClick[summonamount][1], _G.PosClick[summonamount][2])
            UUIDSummon = Summon()
            wait(1)
        else  
            game.Players.LocalPlayer.PlayerGui.Lobby.SummonShopFrame.Visible = true
        end
    else 
        if _G.Boost then
            if not game:GetService("Players").LocalPlayer.PlayerGui.MainFrames.Boosts:FindFirstChild("2xLuckBoost") then
                UseBoost()
    
                wait(1)
            end
        end
        local args = {
            [1] = {
                [1] = {_G.Crate,_G.SettingSell},
                [2] = UUIDSummon
            }
        }
        game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer(unpack(args))  
    end  
end
