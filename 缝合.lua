local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Version = "1.6.31"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. Version .. "/main.lua"))()

WindUI:SetTheme("Dark")

WindUI:AddTheme({
    Name = "Dark",
    Accent = "#18181b",
    Dialog = "#18181b",
    Outline = "#FFFFFF",
    Text = "#FFFFFF",
    Placeholder = "#999999",
    Background = "#0e0e10",
    Button = "#52525b",
    Icon = "#a1a1aa",
})

WindUI:GetWindowSize()

local Window = WindUI:CreateWindow({
    Title = "Crystal Hub",
    Icon = "door-open",
    Author = "hac4er",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    Background = "", -- rbxassetid only
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            print("clicked")
        end,
    },
    KeySystem = { -- <- ↓ remove this all, if you dont neet the key system
        Key = { "giring", "tilio" },
        Note = "Crystals Key System.",
        Thumbnail = {
            Image = "rbxassetid://",
            Title = "Thumbnail",
        },
        URL = "https://github.com/Footagesus/WindUI",
        SaveKey = true,
    },
})

Window:EditOpenButton({
    Title = "Open Crystal Hub",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local MainSection = Window:Section({
    Title = "Main",
    Icon = "house",
    Opened = true,
})

local MainTab = Window:Tab({
    Title = "Main Tab",
    Icon = "house",
    Locked = false,
})

Window:SelectTab(1) -- Number of Tab

local Input = MainTab:Input({
    Title = "Input Speed Value",
    Desc = "16-500 for the speed.",
    Value = "16",
    InputIcon = "speedometer",
    Type = "Speed", -- or "Textarea"
    Placeholder = "Put Between 16-500.",
    Callback = function(input) 
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(input) or 16
    end
})

local Button = MainTab:Button({
    Title = "Set the WalkSpeed",
    Desc = "Set the WalkSpeed to the value you entered.",
    Locked = false,
    Callback = function()
         local speedValue = tonumber(Input.Value) or 16
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedValue
         WindUI:Notify({
               Title = "WalkSpeed Set",
               Description = "WalkSpeed has been set to " .. speedValue,
               Duration = 3,
               Icon = "check",
         })
    end
})

local Input = MainTab:Input({
    Title = "Input Jump Value",
    Desc = "50-500 for the jumppower.",
    Value = "50",
    InputIcon = "wings",
    Type = "Jumppower", -- or "Textarea"
    Placeholder = "Put Between 50-500.",
    Callback = function(input) 
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(input) or 50
    end
})

local Button = MainTab:Button({
    Title = "Set the JumpPower",
    Desc = "Set the JumpPower to the value you entered.",
    Locked = false,
    Callback = function()
         local jumpValue = tonumber(Input.Value) or 50
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpValue
         WindUI:Notify({
               Title = "JumpPower Set",
               Description = "JumpPower has been set to " .. jumpValue,
               Duration = 3,
               Icon = "check",
         })
    end
})