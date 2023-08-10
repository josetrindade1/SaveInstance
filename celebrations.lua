local celebrations = game:GetService("ReplicatedStorage").Celebrations
_G.Loop = false
function play(anim)
    local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
    k:Play()
    k.Stopped:Wait()
    if _G.Loop == true then
        play(anim)
    end
end

local gui = Instance.new("ScreenGui")
gui.Name = "Celebration"
gui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer.PlayerGui
local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.9
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.Position = UDim2.new(0.05,0,0.321,0)
frame.Size = UDim2.new(0.145,0,0.357,0)
frame.Visible = true
frame.Parent = gui
local UARCC = Instance.new("UIAspectRatioConstraint")
UARCC.AspectRatio = 0.66
UARCC.AspectType = Enum.AspectType.FitWithinMaxSize
UARCC.DominantAxis = Enum.DominantAxis.Width
UARCC.Parent = frame
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0,8)
Corner.Parent = frame
local frame2 = Instance.new("Frame")
frame2.Name = "TopBar"
frame2.BackgroundTransparency = 0.75
frame2.BorderSizePixel = 0
frame2.BackgroundColor3 = Color3.new(0,0,0)
frame2.Position = UDim2.new(0,0,0,0)
frame2.Size = UDim2.new(1,0,0.065,0)
frame2.Visible = true
frame2.Parent = frame
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0,8)
Corner.Parent = frame2
local text = Instance.new("TextLabel")
text.BackgroundTransparency = 1
text.BorderSizePixel = 0
text.Position = UDim2.new(0,0,0.2,0)
text.Size = UDim2.new(1,0,0.574,0)
text.ZIndex = 4
text.FontFace = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Heavy)
text.Text = "Celebrations"
text.TextColor3 = Color3.new(1,1,1)
text.TextSize = 14
text.TextScaled = true
text.Parent = frame2
local frame3 = Instance.new("ScrollingFrame")
frame3.Name = "Animations"
frame3.BackgroundTransparency = 1
frame3.AnchorPoint = Vector2.new(0.5,0.5)
frame3.Size = UDim2.new(1,0,0.787,0)
frame3.Position = UDim2.new(0.5,0,0.528,0)
frame3.BorderSizePixel = 0
frame3.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png"
frame3.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
frame3.ScrollBarImageColor3 = Color3.new(0,0,0)
frame3.ScrollBarThickness = 2
frame3.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png"
frame3.Parent = frame
local ULL = Instance.new("UIListLayout")
ULL.Padding = UDim.new(0.01,0)
ULL.FillDirection = Enum.FillDirection.Vertical
ULL.HorizontalAlignment = Enum.HorizontalAlignment.Center
ULL.SortOrder = Enum.SortOrder.LayoutOrder
ULL.VerticalAlignment = Enum.VerticalAlignment.Top
ULL.Parent = frame3
for i , v in pairs(celebrations:GetChildren()) do
    local Button = Instance.new("TextButton")
    Button.Name = v.Name
    Button.BackgroundTransparency = 0.75
    Button.BorderSizePixel = 0
    Button.BackgroundColor3 = Color3.new(0,0,0)
    Button.Size = UDim2.new(0.719,0,0.038,0)
    Button.Position = UDim2.new(0.141,0,0.062,0)
    Button.Text = v.Name
    Button.Name = v.Name
    Button.ZIndex = 10
    Button.TextSize = 24
    Button.TextScaled = true
    Button.TextStrokeTransparency = 1
    Button.TextStrokeColor3 = Color3.new(1,1,1)
    Button.TextColor3 = Color3.new(1,1,1)
    Button.FontFace = Font.new("rbxasset://fonts/families/Roboto.json", Enum.FontWeight.Regular)
    Button.Parent = frame3
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0,8)
    Corner.Parent = Button
    Button.MouseButton1Click:Connect(function()
        play(celebrations:FindFirstChild(v.Name))
    end)
end
