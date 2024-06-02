-- Tat trade

shared.AutoSell = {
    Webhook = "https://discord.com/api/webhooks/1206907429703516170/ddncvZHSj9h5mDp1BoqdzVVAobj2yVo4eKI9ozZg7HZXOg0Zx2K3vmol_dldF7l7KhjV",
    HopSetting = {
        EverySecond = 60,
        MinPlayer = 60, --Max 65
    },
    ChatSetting = {
        Active = false,
        Delay = 15,
        List = {"Sell Mewing TV Man 100 gem in market place"}
    },
    Unit = {
        ["Upgraded Titan Cameraman"] = 99,
        ["Upgraded Titan Cinemaman"] = 2222,
        ["Glitch Cameraman"] = 55,
        ["Mewing TV Man"] = 89,
        ["Titan Bunny Cameraman"] = 299,
        ["Bunny Crate"] = 35,
        ["Titan Sigma Man"] = 2345,
        ["Dual Blade Bunnyman"] = 5,
    }
}

local plr = game.Players.LocalPlayer
local guiservice = game:GetService("GuiService")
local vim = game:GetService("VirtualInputManager")
local tps = game:GetService('TeleportService')
local vu = game:GetService("VirtualUser")

repeat wait() until game:IsLoaded()

if game.PlaceId == 13775256536 then
    while wait() do
        tps:Teleport(14682939953)
    end
end

wait(2)

plr.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)


function ableToSellUnit()
    for i, v in pairs(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SaleUnits.SaleUnitsList:GetChildren()) do
        if string.find(v.Name, "Row") and v.RowLocked.Visible == false then
            for e, g in pairs(v.Row:GetChildren()) do
                if string.find(g.Name, "Slot") and string.find(g.GemsFrame.BestPrice.Text, "n/a", 1, true)  then
                    return true
                end
            end
        end
    end
    return false
end

function ableToSellUnit2()
    local a, b = string.match(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.TotalUnitsForSale.UnitsForSaleDisplay.DisplayFrame.UnitsAmount.Text, "([^/]+)/([^/]+)")
    return tonumber(a) < tonumber(b)
end

function canSellThisUnit(name)
    for i, v in pairs(shared.AutoSell.Unit) do
        if string.find(i, name, 1, true) then
            return shared.AutoSell.Unit[i]
        end
    end
end

local dl = false
function clickGui(path)
    if dl == false then
        dl = true
        print(path:GetFullName())
        guiservice.SelectedObject = path
        wait(.2)
        vim:SendKeyEvent(true, 13, false, game)
        wait(.1)
        vim:SendKeyEvent(false, 13, false, game)
        wait(.2)
        guiservice.SelectedObject = nil
        wait(.2)
        dl = false
    end
end

function writeGui(path, text)
    if dl == false then
        guiservice.SelectedObject = path
        wait(.2)
        path.Text = text
        wait(.2)
        vim:SendKeyEvent(true, 13, false, game)
        wait(.1)
        vim:SendKeyEvent(false, 13, false, game)
        wait(.2)
        guiservice.SelectedObject = nil
        wait(.2)
        path.Text = text
        wait(.2)
    end
end

spawn(function()
    while wait() do
        if shared.AutoSell.ChatSetting.Active then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(shared.AutoSell.ChatSetting.List[math.random(1, #shared.AutoSell.ChatSetting.List)], "All")
            wait(shared.AutoSell.ChatSetting.Delay)
        end
    end
end)

spawn(function()
    while wait(shared.AutoSell.HopSetting.EverySecond) do
        pcall(function()
            local PlaceID = game.PlaceId
            local AllIDs = {}
            local foundAnything = ""
            local actualHour = os.date("!*t").hour
            local Deleted = false
            local File = pcall(function()
                AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
            end)
            if not File then
                table.insert(AllIDs, actualHour)
                writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
            end
            function TPReturner()
                local Site;
                if foundAnything == "" then
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                else
                    Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                end
                local ID = ""
                if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                    foundAnything = Site.nextPageCursor
                end
                local num = 0;
                for i,v in pairs(Site.data) do
                    local Possible = true
                    ID = tostring(v.id)
                    if tonumber(v.maxPlayers) > tonumber(v.playing) and tonumber(v.playing) >= shared.AutoSell.HopSetting.MinPlayer then
                        for _,Existing in pairs(AllIDs) do
                            if num ~= 0 then
                                if ID == tostring(Existing) then
                                    Possible = false
                                end
                            else
                                if tonumber(actualHour) ~= tonumber(Existing) then
                                    local delFile = pcall(function()
                                        delfile("NotSameServers.json")
                                        AllIDs = {}
                                        table.insert(AllIDs, actualHour)
                                    end)
                                end
                            end
                            num = num + 1
                        end
                        if Possible == true then
                            table.insert(AllIDs, ID)
                            wait()
                            pcall(function()
                                writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                wait()
                                game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                            end)
                            wait(4)
                        end
                    end
                end
            end
            
            function Teleport()
                while wait() do
                    pcall(function()
                        TPReturner()
                        if foundAnything ~= "" then
                            TPReturner()
                        end
                    end)
                end
            end
            Teleport()
        end)
    end
end)

repeat wait() until plr:FindFirstChild("leaderstats")
clickGui(plr.PlayerGui.Lobby.LeftSideFrame.Units.IntractiveBtn)
wait(2)
print(plr.Name .. " | Unit: " .. plr.PlayerGui.Lobby.UnitFrame.TopButtons.UnitLimit.UnitAmount.Text .. " | Gem: " .. plr.leaderstats.Gems.Value)

if shared.AutoSell.Webhook ~= "" then
    local Content = ''
    local Embed = {
                ["title"] = "Notification",
                ["description"] = plr.Name .. " | Unit: " .. plr.PlayerGui.Lobby.UnitFrame.TopButtons.UnitLimit.UnitAmount.Text .. " | Gem: " .. plr.leaderstats.Gems.Value,
                ["type"] = "rich",
                ["color"] = tonumber(0xffff00),
    };
    (syn and syn.request or http_request or http.request) {
        Url = shared.AutoSell.Webhook;
        Method = 'POST';
        Headers = {
            ['Content-Type'] = 'application/json';
        };
        Body = game:GetService'HttpService':JSONEncode({content = Content; embeds = {Embed}; });
    };
end

spawn(function()
    while wait(0.1) do
        pcall(function()
            if plr.PlayerGui.MainFrames.NotificationFrame.Visible then
                for i, v in pairs(plr.PlayerGui.MainFrames.NotificationFrame.BigNotification.Buttons:GetChildren()) do
                    if v.Visible then
                        clickGui(v.Btn)
                        break
                    end
                end
            elseif plr.PlayerGui.Lobby.MarketplaceFrame.Visible == false and plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible == false then
                plr.Character.PrimaryPart.CFrame = CFrame.new(1440.1375732421875, 111.3502197265625, 2535.1767578125)
                wait(1)
                plr.Character.PrimaryPart.CFrame = CFrame.new(1436.17041015625, 112.8502426147461, 2572.00927734375)
            elseif plr.PlayerGui.Lobby.MarketplaceFrame.Visible and plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible == false and plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.BuyMenu.Visible == true then
                clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.TopBar.Sell.Button)
            end
        end)
    end
end)

spawn(function()
    while wait(0.1) do
        pcall(function()
            if plr.PlayerGui.Lobby.MarketplaceFrame.Visible and plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Visible then
                for i, v in pairs(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.Inventory.Inventory:GetChildren()) do
                    if v:IsA("Frame") and v.TroopPicture.CannotTrade.Visible == false and ableToSellUnit2() then
                        repeat wait()
                            clickGui(v.TroopPicture.InteractiveButton)
                        until plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.Visible
                        wait(.2)
                        local priceCheck = canSellThisUnit(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.UnitName.UnitName.Text)
                        if priceCheck then
                            repeat wait()
                                writeGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.MiddleMenu.PriceFrame.GemsFrame.TextBox, tostring(priceCheck))
                                clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.RightMenu.PutOnSale.SellButton)
                                clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.RightMenu.PutOnSale.SellButton)
                            until plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible
                            wait(0.5)
                            repeat wait()
                                clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Options.Confirm.ConfirmButton)
                            until plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.ConfirmPopup.Visible == false
                        else
                            repeat wait()
                                clickGui(plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.CloseButton)
                            until plr.PlayerGui.Lobby.MarketplaceFrame.MarketplaceMain.MainFrame.SellUnitMenu.SellUnitPopup.Visible == false
                            wait(.2)
                        end
                    end
                end
            end
        end)
    end
end)
