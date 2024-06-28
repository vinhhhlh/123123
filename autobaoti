repeat wait() until game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer.Team ~= nil

getgenv().link = "http://192.168.1.4:2908/mirage"
getgenv().execute = true
print("Passed",execute)
if game.Players.LocalPlayer.Name ~= "Phamtram0rfqU" and game.Players.LocalPlayer.Name ~= "PhapSuTrungQuoc175" and game.Players.LocalPlayer.Name ~= "bocanhet164" then
      local args = {
        [1] = "redeemRefundPoints",
        [2] = "Refund Points"
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))

    local string_1 = "BuySharkmanKarate";
    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
    Target:InvokeServer(string_1);
    local args = {
        [1] = "AddPoint",
        [2] = "Sword",
        [3] = 2550
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "AddPoint",
        [2] = "Defense",
        [3] = 2550
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "AddPoint",
        [2] = "Melee",
        [3] = 2550
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "LoadItem",
        [2] = "Tushita"
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    function getinfoall()
        local res = request({
            Url = link,
            Method = "GET",
        })
        local data = game:GetService("HttpService"):JSONDecode(res.Body)
        return data
    end

    function IsMirageIsland2()
        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
            return true
        else
            return false
        end
    end

    function checkgatcan()
        if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(
                "CheckTempleDoor") then
            return true
        else
            return false
        end
    end

    local l__LocalPlayer__3 = game.Players.LocalPlayer;
    local l__Character__4 = l__LocalPlayer__3.Character;

    local function CheckRace()
        local bf = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
        local c4 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
        if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
            return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
        end
        if bf == -2 then
            return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
        end
        if c4 == -2 then
            return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
        end
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
    end;
    local checkpoint = false

    while wait() do

        Race = CheckRace()
        if string.find(Race,"V3") or string.find(Race,"V4") and game.PlaceId ~= 7449423635 then
                local args = { [1] = "TravelZou" }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        if not checkgatcan() and string.find(Race,"V3") and not string.find(Race,"V4") and game.PlaceId == 7449423635 then
         
            if not IsMirageIsland2() then
                local allData = getinfoall()

                if #allData > 1 then
                    local player = string.split(allData[#allData].Players, "/")
                    local time = string.split(allData[#allData].Time, ":")
                    print(allData[#allData].JobId, allData[#allData].Players, allData[#allData].Time)
                    if tonumber(player[1]) <= 11 and (tonumber(time[1]) >= 12 or tonumber(time[1]) <= 0) then
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
                            allData[#allData].JobId,
                            game.Players.LocalPlayer)
                    end
                else
                    print("Dont Have Server")
                end
            end
        end
    end
end
