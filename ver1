
local players = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local localPlayer = players.LocalPlayer

local function showNotification(title, text)
    local starterGui = game:GetService("StarterGui")
    starterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 5; 
    })
end

local function teleportPlayer()
    if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local newPosition = Vector3.new(0, 50, 0) 
        
        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition)
        
        showNotification("Teleported", "Kamu telah teleport!")
    end
end

userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.Touch then
        teleportPlayer()
    end
end)

showNotification("Script Active", "Teleport script telah diaktifkan.")
