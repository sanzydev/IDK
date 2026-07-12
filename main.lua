local urlESP = "https://raw.githubusercontent.com/USERNAME_GITHUB/NAMA_REPO/main/lib/esp.lua"
pcall(function()
    loadstring(game:HttpGet(urlESP))()
end)
local WindUI = loadstring(game:HttpGet("https://tree-stores.github.io/WindUI/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "ESP Hub",
    Icon = "rbxassetid://10618928818",
    Author = "You",
    Folder = "ESPHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = true
})
local Tab = Window:Tab({
    Title = "ESP",
    Icon = "rbxassetid://10618928818"
})
Tab:Toggle({
    Title = "Enable ESP",
    Callback = function(value)
        getgenv().ESP_Settings.Enabled = value
    end,
    Default = false
})
Tab:Toggle({
    Title = "Show Username",
    Callback = function(value)
        getgenv().ESP_Settings.ShowName = value
    end,
    Default = false
})
Tab:Toggle({
    Title = "Show Team",
    Callback = function(value)
        getgenv().ESP_Settings.ShowTeam = value
    end,
    Default = false
})
