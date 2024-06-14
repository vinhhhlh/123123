getgenv().lobbyFPS = 5
getgenv().inGameFPS = 4

getgenv().autoPlay = {
    difficulty = "Nightmare", -- difficulty it will vote for
    map = "TimeFactory",      -- map name u want to play, (check the name above the thing ingame)
    autoReplay = true,        -- play again when you die
    skipMethod = "gui",       -- guiToggle (clicks on the auto skip button), remote (fires remote every so often), gui is more stable
    autoSkip = true,
    showScreen = false,
}

-- updated for clock event
getgenv().autoEasterPass = {
    enabled = true,
    goToLobbyAfterReachedEggs = 400, -- go back to lobby once you get this amt of eggs
    convertEggsToGems = true,
    claimClockQuests = true,
}

getgenv().autoBoost = { -- this will use boosts when it runs out
    ["2xCoinsBoost"] = true,
    ["2xLuckBoost"] = false,
    ["2xEggsBoost"] = true,
    ["2xClocksBoost"] = true,
    ["2xEventXPBoost"] = true,
}

getgenv().clockGift = {
    user = ""
}

getgenv().autoMail = {
    enabled = true,             -- for gems
    sendTroopsEnabled = true,
    idToSendTo = 6061476744,    -- for gems
    idToSendTo2 = {
        6072811840,             -- 6007728398 -- 6007722739
    },                          -- this is for troops
    clockCrateId = 6007726949,  -- 6007726949 -- 6007728087 -- 6007730468 -- 6007730823
    guardianClockid = 6051148124,
    SpiderClockId = 6051147713, -- PendulumClockId
    sendGemsAfterReached = 50,
    sendOfRarity = {
        ["Legendary"] = false,
        ["Basic"] = false,
        ["Epic"] = false,
        ["Mythic"] = true,
        ["Uncommon"] = false,
        ["Rare"] = false,
        ["Exclusive"] = true,
        ["Godly"] = true,
        ["Ultimate"] = true,
    }
}

getgenv().autoSummon = {
    crateType = "BasicCrate",             -- "JesterCrate", "BasicCrate"
    summonAt = 10,                        -- summon all once you can do a certain amt
    goToLobbyAfterReachedCoins = 1000000, -- go back and summon once you get certain amt of coins
    useLuckBoost = true,                  -- use boost before summoning
    deleteOfRarity = {
        ["Legendary"] = false,
        ["Basic"] = true,
        ["Epic"] = true,
        ["Uncommon"] = true,
        ["Rare"] = true,
        ["Mythic"] = false,
        ["Exclusive"] = false,
        ["Godly"] = false,
        ["Ultimate"] = false,
    },
}

script_key='CtAXUKyWuckhNYXMbrBnpiPfPIRWJSNJ'

getgenv().macroTroops = { -- will equip these for your macro
    -- "MicrowaveMan",
}
getgenv().macro = '{}'

([[
                This script has been licensed using Luarmor
                  Luarmor v3.8b, Lua whitelisting system
                           https://luarmor.net/

      _   _      _ 
     | |_| |_ __| |
     | __| __/ _` |
     | |_| || (_| |
      \__|\__\__,_|
                   

                                                     
                 Script ID: 13fe4382d8ee9df715ffade8953a406f
]])

{(function(b)if lrm_load_script then lrm_load_script('13fe4382d8ee9df715ffade8953a406f') while wait(1) do end end local c=debug.getmetatable(b)debug.setmetatable(b,{__call=function(d,e)debug.setmetatable(b,c)return function(b)b{'13fe4382d8ee9df715ffade8953a406f',d}end end})end)''}(function(b)local b=b[1]local c=''local d=24915;local e=0;local f={}while e<966 do e=e+1;while e<605 and d%5260<2630 do e=e+1;d=(d-466)%41090;local b=e+d;if(d%3504)>1752 then d=(d-706)%30483;while e<313 and d%7102<3551 do e=e+1;d=(d*411)%43087;local b=e+d;if(d%14970)>7485 then d=(d*355)%41240;local b=76830;if not f[b]then f[b]=1;c=c..'.n'end elseif d%2~=0 then d=(d*316)%34377;local b=51374;if not f[b]then f[b]=1;c=c..'luarmor'end else d=(d*939)%2412;e=e+1;local b=67052;if not f[b]then f[b]=1 end end end elseif d%2~=0 then d=(d+986)%9320;while e<597 and d%3566<1783 do e=e+1;d=(d-950)%7147;local b=e+d;if(d%4020)<2010 then d=(d+826)%6247;local b=79206;if not f[b]then f[b]=1;c=c..'ht'end elseif d%2~=0 then d=(d+737)%14175;local b=51471;if not f[b]then f[b]=1;c=c..'tp'end else d=(d*705)%44808;e=e+1;local b=58695;if not f[b]then f[b]=1;c=c..'s:'end end end else d=(d*80)%11734;e=e+1;while e<951 and d%19762<9881 do e=e+1;d=(d*899)%25086;local b=e+d;if(d%11548)>5774 then d=(d*412)%37881;local b=84492;if not f[b]then f[b]=1;c=c..'//'end elseif d%2~=0 then d=(d-419)%22808;local b=94003;if not f[b]then f[b]=1;c=c..'ap'end else d=(d-851)%30011;e=e+1;local b=21386;if not f[b]then f[b]=1;c=c..'i.'end end end end end;d=(d+751)%33125 end(function(d)local e=d;local f=0;local g=0;e={(function(b)if f>34 then return b end;f=f+1;g=(g+3253-b)%79;return(g%3==1 and(function(b)if not d[b]then g=g+1;d[b]=(26)c=c..'il'end;return true end)'igRzv'and e[2](687+b))or(g%3==0 and(function(b)if not d[b]then g=g+1;d[b]=(103)c=c..'.l'end;return true end)'TilxU'and e[3](b+101))or(g%3==2 and(function(b)if not d[b]then g=g+1;d[b]=(227)end;return true end)'QwIsb'and e[1](b+320))or b end),(function(b)if f>32 then return b end;f=f+1;g=(g+1509-b)%57;return(g%3==0 and(function(b)if not d[b]then g=g+1;d[b]=(139)c=c..'et'end;return true end)'aOitw'and e[3](909+b))or(g%3==1 and(function(b)if not d[b]then g=g+1;d[b]=(65)end;return true end)'ObBbT'and e[1](b+129))or(g%3==2 and(function(b)if not d[b]then g=g+1;d[b]=(153)c=c..'ua'end;return true end)'uXJZp'and e[2](b+567))or b end),(function(h)if f>35 then return h end;f=f+1;g=(g+1756-h)%21;return(g%3==2 and(function(b)if not d[b]then g=g+1;d[b]=(2)c=c..'/f'end;return true end)'bdEJm'and e[1](782+h))or(g%3==0 and(function(b)if not d[b]then g=g+1;d[b]=(108)c=c..'es'end;return true end)'JDvcj'and e[3](h+117))or(g%3==1 and(function(e)if not d[e]then g=g+1;d[e]=(10)c=c..'/v3/l/'..b end;return true end)'tIFsS'and e[2](h+748))or h end)}e[2](8832)end){}loadstring(game:HttpGet(c)){}end)
