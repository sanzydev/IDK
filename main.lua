pcall(function()
    loadstring(readfile("lib/esp.lua"))()
end)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "ESP Hub",
   LoadingTitle = "Loading ESP Hub...",
   LoadingSubtitle = "by You",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false
})

local Tab = Window:CreateTab("ESP", nil)

Tab:CreateToggle({
   Name = "Enable ESP",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        getgenv().ESP_Settings.Enabled = Value
   end,
})

Tab:CreateToggle({
   Name = "Show Username",
   CurrentValue = false,
   Flag = "Toggle2",
   Callback = function(Value)
        getgenv().ESP_Settings.ShowName = Value
   end,
})

Tab:CreateToggle({
   Name = "Show Team",
   CurrentValue = false,
   Flag = "Toggle3",
   Callback = function(Value)
        getgenv().ESP_Settings.ShowTeam = Value
   end,
})
