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
RarityColor = {}
function ConvertGradientToRGB(v, num)
    color = v.Color.Keypoints[num].Value
    local r = math.floor(color.R * 255)
    local g = math.floor(color.G * 255)
    local b = math.floor(color.B * 255)
    return Color3.fromRGB(r, g, b)
end
for _, v in pairs(
    game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.BuyMenu.FilterBar.Rarities:GetChildren(

    )
) do
    if v:IsA("Frame") then
        RarityColor[v.Name] = {
            ["1"] = ConvertGradientToRGB(v.FilterButton[v.Name], 1),
            ["2"] = ConvertGradientToRGB(v.FilterButton[v.Name], 2)
        }
    end
end
function GetRarity(color1, color2)
    for rarity, colors in pairs(RarityColor) do
        if (color1 == colors["1"] and color2 == colors["2"]) then
            return rarity
        end
    end
end

ListRaritySell = {}
for i, v in pairs(_G.SettingRaritySell) do
    if v == true then
        table.insert(ListRaritySell, i)
    end
end

function CheckRarity(v)
    if table.find(ListRaritySell, GetRarity(ConvertGradientToRGB(v, 1), ConvertGradientToRGB(v, 2))) then
        return true
    end
    return false
end
function GetUnitList()
    ClickButton(100, 55)
    wait(.5)
    if #game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList:GetChildren() <= 1 then
        repeat
            wait()
            ClickButton(26, 170)
            wait(.5)
        until #game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList:GetChildren() > 1
    end
    unitlist = {}
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList:GetChildren()) do
        if v:IsA("Frame") then
            if v.TroopsFrame.TroopIcon.Image == "rbxassetid://15798757056" then
                v:Destroy()
            else
                table.insert(unitlist, v.Name)
            end
        end
    end
    game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.Visible = false
    table.sort(unitlist)
end
wait(3)
GetUnitList()
function GetSellRandom()
    local a = require(game:GetService("ReplicatedStorage").MultiboxFramework)
    for i,v in next,getupvalues(getupvalues(a.Network.Fire)[1])[4] do 
        if i == 'SellTroops' then
            return v._identifier
        end
    end
end 
while wait() do
 
    if game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.Visible then
        game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList.UIGridLayout.SortOrder = "Name"
        wait(.5)

        for i, v in pairs(unitlist) do
            if GetSellRandom() == nil then 
                if
                    game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.Buttons.SellUnits.Button.Text ==
                        "Sell Units"
                then
                    print("bật chế độ bán")
                    repeat
                        wait()
                        ClickButton(616, 420)
                        wait(.1)
                    until game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.Buttons.SellUnits.Button.Text ==
                        "Cancel"
                end
                if
                    CheckRarity(
                        game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList[v].TroopsFrame.Background.RarityGradient
                    )
                then
                    print("chọn unit để bán")

                    if
                        not game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList[v].TroopsFrame.BulkSellIcon.Visible
                    then
                        repeat
                            wait()
                            ClickButton(290, 190)
                            wait(.5)
                        until game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList[v].TroopsFrame.BulkSellIcon.Visible
                    end
                    if not game:GetService("Players").LocalPlayer.PlayerGui.MainFrames.NotificationFrame.Visible then
                        repeat
                            wait()
                            ClickButton(616, 420)
                            wait(.5)
                        until game:GetService("Players").LocalPlayer.PlayerGui.MainFrames.NotificationFrame.Visible
                        ClickButton(400, 330)
                        wait(.5)
                    end
                    game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList[v].Visible = false
                else
                    print("ẩn unit")
                    game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList[v].Visible = false
                    wait(.3)
                end
            else 
                game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitList[v].Visible = false
                local args = {
                    [1] = {
                        [1] = {
                            [1] = {
                                [1] = v
                            }
                        },
                        [2] = GetSellRandom()
                    }
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
                
            end 
        end
    else
        print("mở gui unit")
        game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.Visible = true
    end
end
