local webhooks = {
    ["Rare"] = "",
    ["Epic"] = "https://discord.com/api/webhooks/1247745918132817940/3iz-dKpd8hcJWS6SDqtBZjzADbf80QPnrCaeVM9ZL17ZiQiL2BP6hXeTaYKCaFyk5yus",
    ["Legendary"] = "https://discord.com/api/webhooks/1247746014849269811/rJoQkIFhQowY0nTh-S7Lfxte-oBibj5YSrW_k6CyHgSgO9f6jpWG90hqI56EPJ0xlWLq",
    ["Mythic"] = "https://discord.com/api/webhooks/1247746549921087509/03K6KobirF9kHjohQrHbZjYsWCHJ3VvEi_0kUfy-W4KJ6cPfT_cLoIjUXUVuZFhVmQ4w",
    ["Secret"] = "https://discord.com/api/webhooks/1247746617780731914/8ue96sjIFmHFnan0Hh2bIW_J-TQvP5MXLR5y_RrJ14Y43_LiFke9VgnCofsY-aukjHoP",
}

local notifyIfRarity = {
    ["Rare"] = false,
	["Epic"] = true,
    ["Legendary"] = true,
    ["Mythic"] = true,
    ["Secret"] = true,
}

local codes = {
'raidsarecool',
'sorry4delay',
'thanks400k',
'dayum100m',
'wsindach4ht',
'200kholymoly',
'adontop',
'subcool',
'sub2toadboigaming',
'sub2mozking',
'sub2karizmaqt',
'sub2jonaslyz',
'sub2riktime',
'sub2nagblox',
}

-- wait for game load
repeat task.wait(5) until game:IsLoaded()

task.wait(5)

-- redeem code
--for i, v in codes do
    --game:GetService("ReplicatedStorage").Remotes.UseCode:InvokeServer(v)
    --task.wait(0.1)
--end

-- get gem using UI 
local gems = game:GetService("Players").LocalPlayer.PlayerGui.HUD.Toolbar.CurrencyList.Gems.TextLabel

function getGems()
    return tonumber(gems.Text)
end

-- summon till you cant afford
repeat
game:GetService("ReplicatedStorage").Remotes.Summon:InvokeServer("Update1", 1) --Standard. Update1
task.wait(1)
until getGems() < 50

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

local rarityConvert = {
    [2] = "Rare",
	[3] = "Epic",
    [4] = "Legendary",
    [5] = "Mythic",
    [6] = "Secret"
}

function save()
    return game:GetService("ReplicatedStorage").Remotes.GetInventory:InvokeServer()
end

-- check inventory for troops of rarity
local UnitData = require(game:GetService("ReplicatedStorage").Modules.Bins.UnitData)
local unitDataV2 = {}

for i, v in UnitData do
    unitDataV2[i] = v.Rarity
end

for i, v in save().Units do
    local rarity = rarityConvert[unitDataV2[v.Type]]

    -- send webhook if got troop
    if notifyIfRarity[rarity] then
        webhook(
            webhooks[rarity],
            {
                ["content"] = game.Players.LocalPlayer.Name .. " rolled a rare troop",
                ["username"] = "Anime defender",
                ["embeds"] = {
                    {
                        ["title"] = game.Players.LocalPlayer.Name ..
                        " got a: " .. rarity .. " " .. v.Type,
                        ["type"] = "rich",
                        ["color"] = 8388736,
                        ["author"] = {
                            ["name"] = game.Players.LocalPlayer.Name,
                        }

                    }
                }
            })
    end
end


--write for yummytool
writefile(game.Players.LocalPlayer.Name .. ".txt","Yummytool")
