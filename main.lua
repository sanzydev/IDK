pcall(function()
    loadstring(readfile("lib/esp.lua"))()
end)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "ESP Hub",
    SubTitle = "by You",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    ESP = Window:AddTab({ Title = "ESP", Icon = "eye" })
}

local Toggle1 = Tabs.ESP:AddToggle("Toggle1", {Title = "Enable ESP", Default = false})
Toggle1:OnChanged(function()
    getgenv().ESP_Settings.Enabled = Toggle1.Value
end)

local Toggle2 = Tabs.ESP:AddToggle("Toggle2", {Title = "Show Username", Default = false})
Toggle2:OnChanged(function()
    getgenv().ESP_Settings.ShowName = Toggle2.Value
end)

local Toggle3 = Tabs.ESP:AddToggle("Toggle3", {Title = "Show Team", Default = false})
Toggle3:OnChanged(function()
    getgenv().ESP_Settings.ShowTeam = Toggle3.Value
end)

Window:SelectTab(1)
