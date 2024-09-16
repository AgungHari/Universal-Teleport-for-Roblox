local players = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local localPlayer = players.LocalPlayer
local camera = game.Workspace.CurrentCamera 
local starterGui = game:GetService("StarterGui")

local function showNotification(title, text)
    starterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 5; 
    })
end

local function teleportPlayerToTouchPosition(touchPosition)
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local ray = camera:ScreenPointToRay(touchPosition.X, touchPosition.Y)
        
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {localPlayer.Character} 
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
        
        local raycastResult = workspace:Raycast(ray.Origin, ray.Direction * 1000, raycastParams)
        if raycastResult then
            local newPosition = raycastResult.Position
            localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition)

            showNotification("Teleported", "Kamu telah teleport ke lokasi yang disentuh!")
        else
            showNotification("Error", "Tidak ada tempat yang disentuh di dunia!")
        end
    else
        showNotification("Error", "Tidak dapat menemukan HumanoidRootPart!")
    end
end

userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.Touch then
        teleportPlayerToTouchPosition(input.Position)
    end
end)

showNotification("Script Active", "Teleport script telah diaktifkan.")
