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

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

function ClickButton(x, y)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(x, y, 0, true, game, 1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(x, y, 0, false, game, 1)
end

function DetectInvoke()
    local a = require(game:GetService("ReplicatedStorage").MultiboxFramework)
    for i,v in next,getupvalues(getupvalues(a.Network.Invoke)[1])[5] do 
        if i == "Marketplace_ListUnitOnSale" then 
            return v.SendBridge._identifier
        end
    end
end

function DetectMarketPlace()
    local b = {}
    local a = getsenv(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceHandler)
    for i,v in next,getupvalues(a.startSellUnitPrompt)[12]._data.MarketplaceUnitsSelling do 
        for i1,v1 in next,v do 
            if typeof(v1) == "table"  then
                table.insert(b,v1[2])
            end
        end
    end
    return b
end

function DetectUID(x)
    for i,v in next,getupvalues(getsenv(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.UnitFrame.UnitInvHandler).UpdateInventory)[1]._data.Inventory.Troops do 
        if i == x  then 
            for i1,v1 in next,v do 
                if not table.find(DetectMarketPlace(),i1) then 
                    return i1 
                end
            end
        end
    end
end

local UUIDSale = DetectInvoke()

function SendWebHook()
    local msg = {
        ['content'] = 'Check Gem',
        ["embeds"] = {{
            ["title"] = "Toilet Tower Defense",
            ["description"] = "TradingPlaza",
            ["type"] = "rich",
            ["color"] = tonumber(0xbdce44),
            ["fields"] = {
                {
                    ["name"] = "User:",
                    ["value"] = game.Players.LocalPlayer.Name,                                            
                    ["inline"] = false
                },
                {
                    ["name"] = " :gem: left:",
                    ["value"] = game:GetService("Players").LocalPlayer.leaderstats.Gems.Value,                                            
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

if game.GameId == 4778845442 then
    if game.PlaceId == 13775256536 then
        while wait() do 
            if not game:GetService("Players").LocalPlayer.PlayerGui.Lobby.TradingPlazaFrame.Visible then 
                plr.Character.HumanoidRootPart.CFrame = CFrame.new(-493.427948, 245.360794, 47.9400749)
            else 
                ClickButton(475,400)
            end 
        end
    elseif game.PlaceId == 14682939953 then 
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
ListRaritySell = {"Basic",
    "Uncommon" ,
    "Rare", "Epic",
 
    }
function CheckRarity(v)
    if table.find(ListRaritySell, GetRarity(ConvertGradientToRGB(v, 1), ConvertGradientToRGB(v, 2))) then
        return true
    end
    return false
end
if  game:GetService("Players").LocalPlayer.PlayerGui.MainFrames:FindFirstChild("NotificationFrame") then
game:GetService("Players").LocalPlayer.PlayerGui.MainFrames.NotificationFrame:Destroy() end
        spawn(function() 
            while _G.Notify do 
                wait() 
                SendWebHook() 
                wait(60*60) 
            end   
        end)      
        
        local function CheckCurrentSellSlot()
            local slot = string.split(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.TotalUnitsForSale.UnitsForSaleDisplay.DisplayFrame.UnitsAmount.Text,"/")
            if tonumber(slot[1]) < tonumber(slot[2]) then
                return true 
            end
            return false 
        end 

        
            unitlist= {}
            if #game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory:GetChildren() <= 2 then
                repeat wait()
                    pcall(function()
                        plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.BuyMenu.Visible = false 
                        plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible = true 
                        local d = getsenv(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceHandler)
                        d:OpenFrame()
                        game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory.UIGridLayout.SortOrder = "Name" 
                    end)   
                until #game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory:GetChildren() > 2
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory:GetChildren()) do 
                    if v:IsA("Frame") then 
                        table.insert(unitlist,v.Name)
                    end 
                end
                table.sort(unitlist)
            end
        

        countunitlist = 1
        
        wait(2)

        spawn(function()
            while wait() do 
                if plr.PlayerGui.Lobby.MarketplaceFrame.Visible then 
                    if plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible then 
                        if DetectInvoke() == nil then 
                            --print(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory[unitlist[countunitlist]])

if CheckRarity(game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory[unitlist[countunitlist]].TroopPicture.RarityGradient) ==  false or game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory[unitlist[countunitlist]].TroopPicture.CannotTrade.Visible ==true  then 
game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory[unitlist[countunitlist]].Visible =false
countunitlist = countunitlist + 1
                            else 
                                if not game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SaleUnits.SaleUnitsList.Row1.Row.Slot1.YourUnit.Visible then 
                                    if not game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.Visible then 
                                        repeat wait()
                                            ClickButton(190,190)
                                            wait(.1)
                                        until game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.Visible 
                                    end
                                    if not game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible then 
                                        repeat wait()
                                            if game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.RightMenu.LowestPrice.Visible then 
                                                ClickButton(627,307)
                                            else 
                                                ClickButton(627,200)
                                            end
                                            wait(.1)
                                        until game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible
                                    end 
                                    if game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible then 
                                        repeat wait()
                                            ClickButton(315,357)
                                            wait(.1)
                                        until not  game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible
                                    end 
                                    wait(.5)
                                    repeat wait()
                                            
                                        
                                    until game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.LoadingFrame.Visible == false
repeat wait()
plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.BuyMenu.Visible = false 
                                        plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible = true 
                                        local d = getsenv(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceHandler)
                                        d:OpenFrame()
until plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible and not plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.BuyMenu.Visible
                                       
                                    repeat wait()
                                  
                                        ClickButton(572,190) 
                                        
                                    until game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SaleUnits.SaleUnitsList.Row1.Row.Slot1.YourUnit.Visible == false and plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible
plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.BuyMenu.Visible = false 
                                        plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible = true 
                                        local d = getsenv(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceHandler)
                                        d:OpenFrame()
                                elseif game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SaleUnits.SaleUnitsList.Row1.Row.Slot1.YourUnit.Visible then
                                     repeat wait()
                                  
                                        ClickButton(572,190) 
                                    
                                    until  game:GetService("Players").LocalPlayer.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SaleUnits.SaleUnitsList.Row1.Row.Slot1.YourUnit.Visible == false
wait(1)
                                     plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.BuyMenu.Visible = false 
                                        plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible = true 
                                        local d = getsenv(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceHandler)
                                        d:OpenFrame()
                                
                                end 
                            end 
                        else 
                            if CheckCurrentSellSlot() == true then     
                                local args = {
                                    [1] = {
                                        [1] = {
                                            [1] = "4339383939333535463144383444414341413646344138353141313636383443",
                                            [2] = "Time Crate",
                                            [3] = DetectUID(getgenv().Name),
                                            [4] = 49
                                        },
                                        [2] = DetectInvoke()
                                    }
                                }
                                game:GetService("ReplicatedStorage").dataRemoteEvent:FireServer(unpack(args)) 
                                wait()
                            end     
                        end 
                    else 
                        plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.BuyMenu.Visible = false 
                        plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible = true 
                        local d = getsenv(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceHandler)
                        d:OpenFrame()
                    end
                else    
                    plr.PlayerGui.Lobby.MarketplaceFrame.Visible = true 
                end            
            end
        end)

        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
    end
end
