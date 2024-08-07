repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
-- Quest / เควส
_G.Quest = { 
    ['RGB Aura Haki'] = true,
    ['Pull Lever'] = true,
    ['Quest Dough Awaken'] = true
}

-- Race / เผ่า
_G.Race = { 
    ['Select Race'] = {'Human','Fishman','Skypiea','Mink'},
    ['Lock Race'] = true,
    ['Evo Race V3'] = true
}

-- Melee / หมัด
_G.Melee = { 
    ['Godhuman'] = true
}

-- Sword / ดาบ
_G.Sword = { 
    ['Saber'] = true,
    ['Midnight Blade'] = true,
    ['Shisui'] = true,
    ['Saddi'] = true,
    ['Wando'] = true,
    ['Yama'] = true,
    ['Koko'] = false,
    ['Rengoku'] = true,
    ['Canvander'] = true,
    ['Buddy Sword'] = true,
    ['Twin Hooks'] = true,
    ['SpikeyTrident'] = true,
    ['Hallow Scryte'] = true,
    ['Dark Dagger'] = true,
    ['Tushita'] = true,
    ['True Triple Katana'] = true,
    ['Cursed Dual Katana'] = true,
    ['Shark Anchor'] = true
}

-- Farm Gun / ฟามปืน
_G.Gun = {  
    ['Kabucha'] = true,
    ['Acidum Rifle'] = true,
    ['Soul Guitar'] = true, 
    ['Serpent Bow'] = true
}

-- Devil Fruit / ผลปีศาจ
_G.Fruit = { 
    ['Main Fruit'] = {'Kitsune-Kitsune','T-Rex-T-Rex','Mammoth-Mammoth'},
    ['Select Fruit'] = {'Dark-Dark','Magma-Magma'}
}

-- Mastery / มาสเตอรี่
_G.Mastery = { 
    ['Melee'] = true,
    ['Sword'] = true,
    ['Fruit'] = true
}

-- Setting / ตั้งค่าหลัก
_G.Setting = {
    ['FPS Booster'] = true,
    ['Auto Close Ui'] = false 
}

script_key="oiAFCCiclfQKXiihOcPBatlxOCUpmieD";
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/58876769bc015b00b9a3008484e99085.lua"))()
