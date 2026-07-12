getgenv().ESP_Settings = {
    Enabled = false,
    ShowName = false,
    ShowTeam = false
}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera
local espObjects = {}
local function createEsp(player)
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Font = 2
    text.Size = 15
    text.Color = Color3.new(1, 1, 1)
    espObjects[player] = text
end
local function removeEsp(player)
    if espObjects[player] then
        espObjects[player]:Remove()
        espObjects[player] = nil
    end
end
for i, v in pairs(Players:GetPlayers()) do
    if v ~= LocalPlayer then
        createEsp(v)
    end
end
Players.PlayerAdded:Connect(function(v)
    if v ~= LocalPlayer then
        createEsp(v)
    end
end)
Players.PlayerRemoving:Connect(removeEsp)
RunService.RenderStepped:Connect(function()
    for player, text in pairs(espObjects) do
        if getgenv().ESP_Settings.Enabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local hrp = player.Character.HumanoidRootPart
            local vector, onScreen = camera:WorldToViewportPoint(hrp.Position)
            if onScreen then
                local displayText = ""
                if getgenv().ESP_Settings.ShowName then
                    displayText = displayText .. player.Name .. "\n"
                end
                if getgenv().ESP_Settings.ShowTeam then
                    if player.Team then
                        displayText = displayText .. "[" .. player.Team.Name .. "]"
                    else
                        displayText = displayText .. "[Neutral]"
                    end
                end
                if player.TeamColor then
                    text.Color = player.TeamColor.Color
                end
                text.Text = displayText
                text.Position = Vector2.new(vector.X, vector.Y - 40)
                text.Visible = true
            else
                text.Visible = false
            end
        else
            text.Visible = false
        end
    end
end)
