-- key sys removed
-- deobf by L0LeR

local v1 = Instance.new("ScreenGui")
local v2 = Instance.new("Frame")
local v3 = Instance.new("UIGradient")
local v7 = Instance.new("TextButton")

v1.Name = "Key"
v1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
v1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

v2.Name = "Main"
v2.Parent = v1
v2.AnchorPoint = Vector2.new(0.5, 0.5)
v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v2.BorderColor3 = Color3.fromRGB(0, 0, 0)
v2.BorderSizePixel = 0
v2.Position = UDim2.new(0.5, 0, 0.5, 0)
v2.Size = UDim2.new(0, 431, 0, 200)

Instance.new("UICorner").Parent = v2

v3.Parent = v2
v3.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(130, 255, 186)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})

v7.Name = "enter"
v7.Parent = v2
v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
v7.BorderSizePixel = 0
v7.AnchorPoint = Vector2.new(0.5, 0.5)
v7.Position = UDim2.new(0.5, 0, 0.5, 0)   -- по центру окна
v7.Size = UDim2.new(0, 254, 0, 42)
v7.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
v7.Font = Enum.Font.SourceSans
v7.Text = "Load Script"
v7.TextColor3 = Color3.fromRGB(0, 0, 0)
v7.TextScaled = true
v7.TextWrapped = true

v7.MouseButton1Click:Connect(function()
    v7.Text = "Loading..."
    pcall(function()
        loadstring(game:HttpGet(
            "https://gist.githubusercontent.com/FakeGuyX/2f8de94070a8a41b0a3308b3f96f8071/raw/8ba5864bc1d188b52ec2f4a2a8a04a39d29367a3/gistfile1.txt",
            true
        ))()
    end)
    v1:Destroy()
end)
