-- deobf by L0LeR
do
    local savedpos1 = Instance.new("Vector3Value")
    local PosMenu = Instance.new("ScreenGui")
    local MainHub = Instance.new("Frame")
    local getpos = Instance.new("TextButton")
    local UIGradient = Instance.new("UIGradient")
    local UIGradient_2 = Instance.new("UIGradient")
    local savepos = Instance.new("TextButton")
    local UIGradient_3 = Instance.new("UIGradient")
    local loadpos = Instance.new("TextButton")
    local UIGradient_4 = Instance.new("UIGradient")
    local UICorner = Instance.new("UICorner")
    local tppos = Instance.new("TextButton")
    local UIGradient_5 = Instance.new("UIGradient")
    local tpbox = Instance.new("TextBox")
    local UIGradient_6 = Instance.new("UIGradient")
    local UICorner_2 = Instance.new("UICorner")
    local getpostext = Instance.new("TextLabel")
    local savedpostext = Instance.new("TextLabel")
    local lastpos = Instance.new("TextLabel")
    local Tutorial = Instance.new("TextLabel")
    local PosTutor = Instance.new("TextLabel")
    local UICorner_3 = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local second = Instance.new("Frame")
    local first = Instance.new("Frame")
    local OpenMenu = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")
    local UIGradient_7 = Instance.new("UIGradient")

    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer = game.Players.LocalPlayer

    local function getHRP()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        return char:WaitForChild("HumanoidRootPart")
    end

    local function makeDraggable(frame)
        local Mouse = LocalPlayer:GetMouse()
        local Hovered = false
        local Holding = false
        local MoveCon = nil
        local InitialX, InitialY, UIInitialPos

        local function Drag()
            if not Holding then
                if MoveCon then MoveCon:Disconnect() end
                return
            end
            local dx = InitialX - Mouse.X
            local dy = InitialY - Mouse.Y
            frame.Position = UIInitialPos - UDim2.new(0, dx, 0, dy)
        end

        frame.MouseEnter:Connect(function() Hovered = true end)
        frame.MouseLeave:Connect(function() Hovered = false end)

        UserInputService.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                Holding = Hovered
                if Holding then
                    InitialX, InitialY = Mouse.X, Mouse.Y
                    UIInitialPos = frame.Position
                    if MoveCon then MoveCon:Disconnect() end
                    MoveCon = Mouse.Move:Connect(Drag)
                end
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                Holding = false
            end
        end)
    end

    local function hoverTween(btn, inSize, inPos, outSize, outPos)
        local info = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0)
        local tIn = TweenService:Create(btn, info, {Size = inSize, Position = inPos})
        local tOut = TweenService:Create(btn, info, {Size = outSize, Position = outPos})
        btn.MouseEnter:Connect(function() tIn:Play() end)
        btn.MouseLeave:Connect(function() tOut:Play() end)
    end

    savedpos1.Name = "savedpos1"

    PosMenu.Name = "PosMenu"
    PosMenu.Parent = LocalPlayer:WaitForChild("PlayerGui")
    PosMenu.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainHub.Name = "MainHub"
    MainHub.Parent = PosMenu
    MainHub.AnchorPoint = Vector2.new(0.5, 0.5)
    MainHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainHub.BackgroundTransparency = 1
    MainHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainHub.BorderSizePixel = 0
    MainHub.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainHub.Size = UDim2.new(0, 292, 0, 301)
    MainHub.Visible = false

    getpos.Name = "getpos"
    getpos.Parent = MainHub
    getpos.BackgroundColor3 = Color3.fromRGB(245, 255, 55)
    getpos.BorderColor3 = Color3.fromRGB(0, 0, 0)
    getpos.LayoutOrder = 1000
    getpos.Position = UDim2.new(0.0445205495, 0, 0.043210458, 0)
    getpos.Size = UDim2.new(0, 266, 0, 30)
    getpos.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
    getpos.Font = Enum.Font.SourceSans
    getpos.Text = "Get Position"
    getpos.TextColor3 = Color3.fromRGB(0, 0, 0)
    getpos.TextSize = 14

    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(137, 255, 82)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(151, 165, 255))
    })
    UIGradient.Parent = getpos

    UIGradient_2.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(137, 255, 82)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(151, 165, 255))
    })
    UIGradient_2.Parent = MainHub

    savepos.Name = "savepos"
    savepos.Parent = MainHub
    savepos.BackgroundColor3 = Color3.fromRGB(245, 255, 55)
    savepos.BorderColor3 = Color3.fromRGB(0, 0, 0)
    savepos.BorderSizePixel = 0
    savepos.LayoutOrder = 10000
    savepos.Position = UDim2.new(0.0445205495, 0, 0.194173411, 0)
    savepos.Size = UDim2.new(0, 266, 0, 30)
    savepos.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
    savepos.Font = Enum.Font.SourceSans
    savepos.Text = "Save Position"
    savepos.TextColor3 = Color3.fromRGB(0, 0, 0)
    savepos.TextSize = 14

    UIGradient_3.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(137, 255, 82)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(151, 165, 255))
    })
    UIGradient_3.Parent = savepos

    loadpos.Name = "loadpos"
    loadpos.Parent = MainHub
    loadpos.BackgroundColor3 = Color3.fromRGB(245, 255, 55)
    loadpos.BorderColor3 = Color3.fromRGB(0, 0, 0)
    loadpos.BorderSizePixel = 0
    loadpos.LayoutOrder = 1000
    loadpos.Position = UDim2.new(0.0445205495, 0, 0.359056354, 0)
    loadpos.Size = UDim2.new(0, 266, 0, 30)
    loadpos.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
    loadpos.Font = Enum.Font.SourceSans
    loadpos.Text = "Load Position"
    loadpos.TextColor3 = Color3.fromRGB(0, 0, 0)
    loadpos.TextSize = 14

    UIGradient_4.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(137, 255, 82)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(151, 165, 255))
    })
    UIGradient_4.Parent = loadpos

    UICorner.Parent = MainHub

    tppos.Name = "tppos"
    tppos.Parent = MainHub
    tppos.BackgroundColor3 = Color3.fromRGB(245, 255, 55)
    tppos.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tppos.BorderSizePixel = 0
    tppos.LayoutOrder = 1000
    tppos.Position = UDim2.new(0.0445205495, 0, 0.737793863, 0)
    tppos.Size = UDim2.new(0, 266, 0, 30)
    tppos.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
    tppos.Font = Enum.Font.SourceSans
    tppos.Text = "Teleport to Position"
    tppos.TextColor3 = Color3.fromRGB(0, 0, 0)
    tppos.TextSize = 14

    UIGradient_5.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(137, 255, 82)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(151, 165, 255))
    })
    UIGradient_5.Parent = tppos

    tpbox.Name = "tpbox"
    tpbox.Parent = MainHub
    tpbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tpbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tpbox.Position = UDim2.new(0.0445205495, 0, 0.873754144, 0)
    tpbox.Size = UDim2.new(0, 266, 0, 19)
    tpbox.Font = Enum.Font.SourceSans
    tpbox.PlaceholderColor3 = Color3.fromRGB(145, 152, 113)
    tpbox.PlaceholderText = "Enter position (X, Y, Z)"
    tpbox.Text = ""
    tpbox.TextColor3 = Color3.fromRGB(0, 0, 0)
    tpbox.TextScaled = true
    tpbox.TextSize = 14
    tpbox.TextWrapped = true

    UIGradient_6.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(121, 186, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(13, 255, 0))
    })
    UIGradient_6.Parent = tpbox
    UICorner_2.Parent = tpbox
    UICorner_2.CornerRadius = UDim.new(0, 4)

    getpostext.Name = "getpostext"
    getpostext.Parent = MainHub
    getpostext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    getpostext.BackgroundTransparency = 1
    getpostext.BorderColor3 = Color3.fromRGB(0, 0, 0)
    getpostext.BorderSizePixel = 0
    getpostext.Position = UDim2.new(0.0445205495, 0, 0.495016605, 0)
    getpostext.Size = UDim2.new(0, 266, 0, 18)
    getpostext.Font = Enum.Font.SourceSans
    getpostext.Text = "Current position:"
    getpostext.TextColor3 = Color3.fromRGB(129, 0, 141)
    getpostext.TextScaled = true
    getpostext.TextSize = 14
    getpostext.TextWrapped = true
    getpostext.TextXAlignment = Enum.TextXAlignment.Left

    savedpostext.Name = "savedpostext"
    savedpostext.Parent = MainHub
    savedpostext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    savedpostext.BackgroundTransparency = 1
    savedpostext.BorderColor3 = Color3.fromRGB(0, 0, 0)
    savedpostext.BorderSizePixel = 0
    savedpostext.Position = UDim2.new(0.0445205495, 0, 0.574750841, 0)
    savedpostext.Size = UDim2.new(0, 266, 0, 18)
    savedpostext.Font = Enum.Font.SourceSans
    savedpostext.Text = "Saved position:"
    savedpostext.TextColor3 = Color3.fromRGB(129, 0, 141)
    savedpostext.TextScaled = true
    savedpostext.TextSize = 14
    savedpostext.TextWrapped = true
    savedpostext.TextXAlignment = Enum.TextXAlignment.Left

    lastpos.Name = "lastpos"
    lastpos.Parent = MainHub
    lastpos.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    lastpos.BackgroundTransparency = 1
    lastpos.BorderColor3 = Color3.fromRGB(0, 0, 0)
    lastpos.BorderSizePixel = 0
    lastpos.Position = UDim2.new(0.0445205495, 0, 0.657807291, 0)
    lastpos.Size = UDim2.new(0, 266, 0, 18)
    lastpos.Font = Enum.Font.SourceSans
    lastpos.Text = "Last loaded position:"
    lastpos.TextColor3 = Color3.fromRGB(129, 0, 141)
    lastpos.TextScaled = true
    lastpos.TextSize = 14
    lastpos.TextWrapped = true
    lastpos.TextXAlignment = Enum.TextXAlignment.Left

    Tutorial.Name = "Tutorial"
    Tutorial.Parent = MainHub
    Tutorial.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tutorial.BackgroundTransparency = 1
    Tutorial.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tutorial.BorderSizePixel = 0
    Tutorial.Position = UDim2.new(0.955479443, 0, 0.936877072, 0)
    Tutorial.Size = UDim2.new(0, 13, 0, 19)
    Tutorial.Font = Enum.Font.SourceSans
    Tutorial.Text = "?"
    Tutorial.TextColor3 = Color3.fromRGB(255, 200, 0)
    Tutorial.TextSize = 21
    Tutorial.TextStrokeTransparency = 0

    PosTutor.Name = "PosTutor"
    PosTutor.Parent = MainHub
    PosTutor.BackgroundColor3 = Color3.fromRGB(255, 183, 149)
    PosTutor.BackgroundTransparency = 0.7
    PosTutor.BorderColor3 = Color3.fromRGB(0, 0, 0)
    PosTutor.Position = UDim2.new(1.02739727, 0, 0.936877072, 0)
    PosTutor.Size = UDim2.new(0, 121, 0, 234)
    PosTutor.Visible = false
    PosTutor.Font = Enum.Font.SourceSans
    PosTutor.Text = table.concat({
        "How to use?",
        "",
        "Get Position - shows your current position.",
        "Save Position - saves your current position.",
        "Load Position - teleports to saved position.",
        "Teleport to Position - enter X, Y, Z",
        "manually and hit the button.",
        "",
        "Cleaned by L0LeR"
    }, "\n")
    PosTutor.TextColor3 = Color3.fromRGB(255, 225, 0)
    PosTutor.TextSize = 14
    PosTutor.TextStrokeTransparency = 0
    PosTutor.TextWrapped = true
    PosTutor.TextXAlignment = Enum.TextXAlignment.Left
    PosTutor.TextYAlignment = Enum.TextYAlignment.Top
    UICorner_3.Parent = PosTutor
    UICorner_3.CornerRadius = UDim.new(0, 8)

    Title.Name = "Title"
    Title.Parent = MainHub
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0, 0, -0.0531561449, 0)
    Title.Size = UDim2.new(0, 292, 0, 16)
    Title.Font = Enum.Font.SourceSans
    Title.Text = "Position Saver"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.TextSize = 14
    Title.TextStrokeTransparency = 0
    Title.TextWrapped = true

    second.Name = "second"
    second.Parent = MainHub
    second.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    second.BackgroundTransparency = 1
    second.BorderColor3 = Color3.fromRGB(0, 0, 0)
    second.BorderSizePixel = 0
    second.Position = UDim2.new(0.493150681, 0, 0, 0)
    second.Size = UDim2.new(0, 148, 0, 301)

    first.Name = "first"
    first.Parent = MainHub
    first.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    first.BackgroundTransparency = 1
    first.BorderColor3 = Color3.fromRGB(0, 0, 0)
    first.BorderSizePixel = 0
    first.Size = UDim2.new(0, 148, 0, 301)

    OpenMenu.Name = "OpenMenu"
    OpenMenu.Parent = PosMenu
    OpenMenu.BackgroundColor3 = Color3.fromRGB(167, 255, 120)
    OpenMenu.BackgroundTransparency = 0
    OpenMenu.BorderColor3 = Color3.fromRGB(0, 0, 0)
    OpenMenu.BorderSizePixel = 0
    OpenMenu.Position = UDim2.new(0.488623142, 0, 0.107673265, 0)
    OpenMenu.Size = UDim2.new(0, 39, 0, 39)
    OpenMenu.Font = Enum.Font.SourceSans
    OpenMenu.Text = "@"
    OpenMenu.TextColor3 = Color3.fromRGB(165, 138, 28)
    OpenMenu.TextScaled = true
    OpenMenu.TextSize = 14
    OpenMenu.TextStrokeTransparency = 0
    OpenMenu.TextTransparency = 0
    OpenMenu.TextWrapped = true

    UICorner_4.Parent = OpenMenu
    UICorner_4.CornerRadius = UDim.new(0, 12)

    UIGradient_7.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 255, 153)),
        ColorSequenceKeypoint.new(0.31, Color3.fromRGB(167, 255, 51)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(19, 255, 19)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(21, 113, 0))
    })
    UIGradient_7.Parent = OpenMenu

    savedpos1.Parent = MainHub

    getpos.MouseButton1Click:Connect(function()
        local p = getHRP().CFrame.Position
        getpostext.Text = string.format("Current position: %s, %s, %s", p.X, p.Y, p.Z)
    end)
    hoverTween(getpos,
        UDim2.new(0, 354, 0, 37), UDim2.new(-0.106, 0, 0.023, 0),
        UDim2.new(0, 266, 0, 30), UDim2.new(0.045, 0, 0.043, 0))

    savepos.MouseButton1Click:Connect(function()
        local p = getHRP().CFrame.Position
        savedpostext.Text = string.format("Saved position: %s, %s, %s", p.X, p.Y, p.Z)
        savedpos1.Value = p
    end)
    hoverTween(savepos,
        UDim2.new(0, 354, 0, 37), UDim2.new(-0.106, 0, 0.194, 0),
        UDim2.new(0, 266, 0, 30), UDim2.new(0.045, 0, 0.194, 0))

    loadpos.MouseButton1Click:Connect(function()
        local hrp = getHRP()
        hrp.CFrame = CFrame.new(savedpos1.Value)
        local p = savedpos1.Value
        lastpos.Text = string.format("Last loaded position: %s, %s, %s", p.X, p.Y, p.Z)
    end)
    hoverTween(loadpos,
        UDim2.new(0, 354, 0, 37), UDim2.new(-0.106, 0, 0.349, 0),
        UDim2.new(0, 266, 0, 30), UDim2.new(0.045, 0, 0.359, 0))

    hoverTween(tppos,
        UDim2.new(0, 354, 0, 37), UDim2.new(-0.106, 0, 0.751, 0),
        UDim2.new(0, 266, 0, 30), UDim2.new(0.045, 0, 0.738, 0))

    tppos.MouseButton1Click:Connect(function()
        local success, result = pcall(function()
            local parts = {}
            for part in tpbox.Text:gmatch("[^,]+") do
                table.insert(parts, tonumber(part:match("%-?%d+%.?%d*")))
            end
            if #parts == 3 then
                return Vector3.new(parts[1], parts[2], parts[3])
            end
        end)
        if success and result then
            getHRP().CFrame = CFrame.new(result)
            tpbox.Text = "Success"
            task.wait(1)
            tpbox.Text = ""
        else
            tpbox.Text = "Invalid format. Use: 0, 0, 0"
            task.wait(2)
            tpbox.Text = ""
        end
    end)

    do
        local info = TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, 0, false)
        first.MouseEnter:Connect(function()
            TweenService:Create(UIGradient_2, info, {Rotation = 180}):Play()
        end)
        second.MouseEnter:Connect(function()
            TweenService:Create(UIGradient_2, info, {Rotation = 0}):Play()
        end)
    end

    makeDraggable(MainHub)
    makeDraggable(OpenMenu)

    Tutorial.MouseEnter:Connect(function() PosTutor.Visible = true end)
    Tutorial.MouseLeave:Connect(function() PosTutor.Visible = false end)

    OpenMenu.MouseButton1Click:Connect(function()
        local target = 1 - MainHub.BackgroundTransparency
        for _, v in pairs(MainHub:GetChildren()) do
            if v:IsA("TextLabel") then
                TweenService:Create(v, TweenInfo.new(1), {TextTransparency = target}):Play()
            elseif v:IsA("TextButton") or v:IsA("TextBox") then
                TweenService:Create(v, TweenInfo.new(1), {
                    TextTransparency = target,
                    BackgroundTransparency = target
                }):Play()
            end
        end
        local mainTween = TweenService:Create(MainHub, TweenInfo.new(1), {BackgroundTransparency = target})
        if target == 0 then
            MainHub.Visible = true
        end
        mainTween.Completed:Connect(function()
            if target == 1 then
                MainHub.Visible = false
            end
        end)
        mainTween:Play()
    end)
end
