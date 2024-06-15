repeat
    wait()
until game:IsLoaded()
function ClickMiddle()
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y/2,0,true,a,1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(workspace.CurrentCamera.ViewportSize.X/2,workspace.CurrentCamera.ViewportSize.Y/2,0,false,a,1)    
end 
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
repeat wait()
    ClickMiddle()
until game:GetService("tutulklh1").LocalPlayer.PlayerGui.Loading.Enabled == true
_G.farm = true
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
function ClickButton(a)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
end



game:GetService("RunService").RenderStepped:Connect(function()
    if _G.farm  then
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            for i,v in next,game.Players.LocalPlayer.Character:GetDescendants() do 
                if (v:IsA("Part") or v:IsA("MeshPart")) and  v.CanCollide then 
                    v.CanCollide = false 
                end
            end
        end
    end
end)    
print(1)
while _G.farm do wait()
pcall(function()
    if string.find(tostring(game.Players.LocalPlayer.Team),"Giao") then
        if game.Players.LocalPlayer.Character:FindFirstChild("Cardboard_Box") then 
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.DeliveryBeam.Attachment1.WorldCFrame
            wait(.5)
            fireproximityprompt(game.Players.LocalPlayer.Character.DeliveryBeam.Attachment1.ProximityPrompt)
            wait(15)
        else 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  workspace.Map.Delivery.Cardboard_Box.Box.CFrame
            wait(.5)
            fireproximityprompt(workspace.Map.Delivery.Cardboard_Box.Box.ProximityPrompt)
            wait(.5)
        end
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.Delivery["Giao H\195\160ng"].HumanoidRootPart.CFrame*CFrame.new(0,0,-1)
        wait(.25)
        if game:GetService("Players").LocalPlayer.PlayerGui.Interact.Option.Visible then
            ClickButton(game:GetService("Players").LocalPlayer.PlayerGui.Interact.Option.Yes.Button)
            wait(.5)
        else 
            ClickMiddle()
            wait(.5)
        end 
        
            
    end
end)
end
