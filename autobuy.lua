getgenv().Key = "k3d5cc04abcc9f3116173d57"
getgenv().BountyFarm = {
    ["Script"] = {
        ["Black Screen"] = true,
        ["Team"] = "Pirates", -- Pirates/Marines
        ["Panic % Health"] = 20, -- Teleport to Safe Zone if player below x % HP
        ["Skip Timer"] = 60, -- Skip if took more than x seconds to kill
        ["M1 Health"] = 90, -- Attack M1 if target health above x % HP
        ["Ignore User"] = {"Portal-Portal", "Kitsune-Kitsune", "Mammoth-Mammoth"}, -- Ignore user with the ate Blox Fruit
        ["Ignore Bounty"] = 5000000, -- Ignore user with higher than x bounty than you
    },
    ["Hop Server"] = {
        ["Delay"] = 10, -- Delay before Hop Server
        ["Below Ping"] = 100, -- Hop to Server below x ping
        ["Hop Ping"] = 1000, -- Hop if current server ping is higher than x 
    },
    ["Skill"] = {
        ["Cycle"] = true, -- Use in a Cycle (making use used all skill) instead of use prioritize the first order
        ["Prioritize"] = {"Melee", "Blox Fruit", "Sword", "Gun"}, -- Use skill Left to right (first to last)
        -- ["Skill"] = {Enable, Predict, Hold, Delay Next Skill}
        ["Melee"] = {
            ["Z"] = {true, true, 0.2, 0.1},
            ["X"] = {true, true, 0.2, 0.1},
            ["C"] = {true, true, 0.5, 0.1},
        },
        ["Blox Fruit"] = {
            ["Z"] = {false, true, 0, 1},
            ["X"] = {false, true, 0, 1},
            ["C"] = {false, true, 0, 1},
            ["V"] = {false, true, 0, 1},
            ["F"] = {false, true, 0, 1},
        },
        ["Sword"] = {
            ["Z"] = {true, true, 0.8, 0},
            ["X"] = {true, true, 0.2, 0},
        },
        ["Gun"] = {
            ["Z"] = {false, true, 0, 1},
            ["X"] = {false, true, 0, 1},
        },
    },
}
getgenv().Setup = {
    ["Melee"]  = "Dragon Talon",
    ["Sword"] = "Cursed Dual Katana",
    ["Gun"] = "Soul Guitar",
    ["Accessory"] = "Warrior Helmet",
    ["Stat"] = {
        ["Melee"] = 2550,
        ["Defense"] = 2550,
        ["Sword"] = 2550,
        ["Gun"] = 0,
        ["Blox Fruit"] = 0,
    }
}
repeat wait()spawn(function()loadstring(game:HttpGet("https://nousigi.com/loader.lua"))()end)wait(20)until Joebiden
