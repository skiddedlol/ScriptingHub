
-- Uses WindUI: https://github.com/Footagesus/WindUI

-- Load WindUI library
local success, WindUI = pcall(function()
 return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)
if not success then
 warn("Failed to load WindUI library. Please check your network.")
 return
end

-- Create main window
local Window = WindUI:CreateWindow({
 Title = "C.GG Hub",
 Icon = "sparkles",
 Author = "C.GG Scripts",
 Folder = "C.GG_Hub",
 Size = UDim2.fromOffset(545, 376),
 Transparent = true,
 Theme = "Dark",
 SideBarWidth = 200,
 Background = "",
 User = {
 Enabled = true,
 Anonymous = false,
 Callback = function() print("User button clicked") end,
 },
 KeySystem = {
 Key () print("User button clicked") end,
 },
 KeySystem = {
 Key = { "1234", "5678" },
 Thumbnail = { Title = "C.GG Key System" },
 URL = "https://rekonise.com/key-system-12-tj4fc",
 SaveKey = true,
 },
})

-- Create tabs
local Tab1 = Window:Tab({ Title = "Shooting", Icon = "target" })
local Tab2 = Window:Tab({ Title = "Tracking", Icon = "crosshair" })
local Tab3 = Window:Tab({ Title = "Physics", Icon = "atom" })
local Tab4 = Window:Tab({ Title = "Settings", Icon = "settings-2" })

-- CAMLOCK section
local Section1 = Tab1:Section({ Title = "Camlock", TextXAlignment = "Left", TextSize = 22 })

local ArcType = "High Arc (PC)"
local CamlockEnabled = false
local CamlockActive = false

local Dropdown = Tab1:Dropdown({
 Title = "Camlocks",
 Values = { "High Arc (PC)", "High Arc (Mobile)", "Low Arc (PC)", "Low Arc (Mobile)" },
 Value = ArcType,
 Multi = false,
 AllowNone = false,
 Callback = function(Value) ArcType = Value end
})

local CamlockToggle = Tab1:Toggle({
 Title = "Enable Camlock",
 Type = "Checkbox",
 Default = false,
 Callback = function(state) CamlockEnabled = state end
})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

local function HasBall()
 return Camera = Workspace.CurrentCamera

local function HasBall()
 return Player.Character and Player.Character:FindFirstChild("Basketball") ~= nil
end

local function GetGoal()
 local Character = Player.Character
 if not Character or not Character.PrimaryPart then return nil, math.huge end
 local CharPos = Character.PrimaryPart.Position
 local closestDist = math.huge
 local closestGoal = nil
 for _, court in ipairs(Workspace:GetChildren()) do
 for _, obj in ipairs(court:GetDescendants()) do
 if obj.Name == "Swish" and obj.Parent:FindFirstChildOfClass("TouchTransmitter") then
 local dist = (CharPos - obj.Parent.Position).Magnitude
 if dist < closestDist then
 closestDist = dist
 closestGoal = obj.Parent
 end
 end
 end
 end
 return closestGoal, closestDist
end

local function CalculateArc(distance)
 if ArcType == "High Arc (PC)" then
 return math.max(0.029 * (distance ^ 2) - 1.0 * distance + 15, 5)
 elseif ArcType == "Low Arc (PC)" then
 return math.max(0.025 * (distance ^ 2) - 1.2 * distance + 20, 5)
 elseif ArcType == "High Arc (Mobile)" then
