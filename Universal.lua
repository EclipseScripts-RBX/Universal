local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local player = game.Players.LocalPlayer
local Character1 = player.Character or player.CharacterAdded:Wait()
local hrp = Character1.HumanoidRootPart
local h = Character1.Humanoid
local isSpinning = false
-- window

local Window = Fluent:CreateWindow({
    Title = "Universal Hub " ,
    SubTitle = "by Eclipse",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Options = Fluent.Options

Fluent:Notify({
    Title = "NOTE",
    Content = "In Dev, no key",
    SubContent = "Use while u can", -- Optional
    Duration = 5 -- Set to nil to make the notification not disappear
})

Window:Dialog({
    Title = "In DEV",
    Content = "If features get patched and u get banned not my fault, its in Dev",
    Buttons = {
        { 
            Title = "ok",
            Callback = function()
                print("Welcome to Hell")
            end 
        }, {
            Title = "Exit Script",
            Callback = function()
                Fluent:Destroy()
            end 
        }
    }
})

-- Fluent provides Lucide Icons, they are optional
local Tabs = {
    Character = Window:AddTab({ Title = "Character", Icon = "" }),
    Troll = Window:AddTab({ Title = "Troll", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

Window:SelectTab(1)

Tabs.Character:AddButton({
    Title = "Reload",
    Description = "RELOAD SCRIPT IF FUNCTIONS DONT WORK",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EclipseScripts-RBX/Universal/refs/heads/main/Universal.lua"))()
		Fluent:Destroy()
    end
})

local Slider1 = Tabs.Character:AddSlider("Slider", 
{
    Title = "WalkSpeed",
    Description = "Change ur speed of walking",
    Default = 16,
    Min = 1,
    Max = 50,
    Rounding = 1,
    Callback = function(Value)
        if hrp.Anchored == false then
            h.WalkSpeed = Value
        end 
    end
})

local Slider = Tabs.Character:AddSlider("Slider", 
{
    Title = "Jump Power",
    Description = "Change the power of Jumping",
    Default = 50,
    Min = 10,
    Max = 150,
    Rounding = 1,
    Callback = function(Value)
        if hrp.Anchored == false then
            h.JumpPower = Value
        end 
    end
})

local Toggle = Tabs.Character:AddToggle("MyToggle", 
{
    Title = "Freeze Character", 
    Description = "Freeze your character",
    Default = false,
    Callback = function(state)
	if state then
	    hrp.Anchored = true
	else
	    hrp.Anchored = false
        end
    end 
})

local function startSpinning()
    if not isSpinning then
        isSpinning = true
        local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
        bodyAngularVelocity.MaxTorque = Vector3.new(400000, 400000, 400000)  -- High torque for rapid spinning
        bodyAngularVelocity.AngularVelocity = Vector3.new(0, 50, 0) -- Spin around the Y-axis
        bodyAngularVelocity.Parent = hrp
    end

end

Tabs.Character:AddButton({
    Title = "Spin",
    Description = "Glitches you out",
    Callback = function()
        if not isSpinning then
            isSpinning = true
            local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
            bodyAngularVelocity.MaxTorque = Vector3.new(400000, 400000, 400000)  -- High torque for rapid spinning
            bodyAngularVelocity.AngularVelocity = Vector3.new(0, 5000, 0) -- Spin around the Y-axis
            bodyAngularVelocity.Parent = hrp
            end
    end
})

Tabs.Character:AddButton({
    Title = "Kill Character",
    Description = "Does what it says",
    Callback = function()
        h.Health = 0
    end
})
