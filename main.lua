pcall(function()
    loadstring(readfile("lib/esp.lua"))()
end)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("ESP Hub by You", "BloodTheme")
local Tab = Window:NewTab("ESP")
local Section = Tab:NewSection("Main Settings")

Section:NewToggle("Enable ESP", "Menyalakan / Mematikan ESP", function(state)
    getgenv().ESP_Settings.Enabled = state
end)

Section:NewToggle("Show Username", "Menampilkan Nama Pemain", function(state)
    getgenv().ESP_Settings.ShowName = state
end)

Section:NewToggle("Show Team", "Menampilkan Team Pemain", function(state)
    getgenv().ESP_Settings.ShowTeam = state
end)
