-- deobf by L0LeR
-- this script is shit
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local soundService = game:GetService("SoundService")
local debris = game:GetService("Debris")
local runService = game:GetService("RunService")
local teleportService = game:GetService("TeleportService")
local xeno = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxkuhl/XENO/refs/heads/main/XENO"))()
wait(6)
local localPlayer = players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
local v1 = true
local v2 = 6
local v3 = 15000
local v4 = 1
local v5 = 0

xeno:AddSearchBar()
xeno:AddHeader("🐱 KITTYSCRIPTS PLS DONATE 🐱")
xeno:AddLabel("By KittyScripts")

local uiTemplates = playerGui:FindFirstChild("UITemplates")
local donationPopup

if uiTemplates and uiTemplates:FindFirstChild("donationPopup") then
  donationPopup = uiTemplates:FindFirstChild("donationPopup")
end

local v6

for index, value in ipairs(playerGui:GetChildren()) do
  if value:IsA("ScreenGui") and value:FindFirstChild("Popups", true) then
    v6 = value
    break
  end
end

local popups

if donationPopup and v6 then
  popups = v6:FindFirstChild("Popups", true)
end

if not donationPopup then
  local kittyDonateTemplateGui = v6

  if not kittyDonateTemplateGui then
    kittyDonateTemplateGui = Instance.new("ScreenGui")
    kittyDonateTemplateGui.Name = "KittyDonateTemplateGui"
    kittyDonateTemplateGui.ResetOnSpawn = false
    kittyDonateTemplateGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    kittyDonateTemplateGui.Parent = playerGui
  end

  local donationPopup2 = Instance.new("Frame")
  donationPopup2.Name = "donationPopup"
  donationPopup2.AnchorPoint = Vector2.new(0.5, 0)
  donationPopup2.Position = UDim2.new(0.5, 0, 0.1, 0)
  donationPopup2.Size = UDim2.new(0, 350, 0, 60)
  donationPopup2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  donationPopup2.BackgroundTransparency = 0.1
  donationPopup2.BorderSizePixel = 0
  donationPopup2.Parent = kittyDonateTemplateGui

  local uiCorner = Instance.new("UICorner")
  uiCorner.CornerRadius = UDim.new(0, 10)
  uiCorner.Parent = donationPopup2

  local message = Instance.new("TextLabel")
  message.Name = "Message"
  message.BackgroundTransparency = 1
  message.Position = UDim2.new(0, 10, 0, 10)
  message.Size = UDim2.new(1, -20, 1, -20)
  message.Font = Enum.Font.GothamBold
  message.Text = ""
  message.TextColor3 = Color3.new(1, 1, 1)
  message.TextSize = 20
  message.TextWrapped = true
  message.TextXAlignment = Enum.TextXAlignment.Left
  message.Parent = donationPopup2

  Instance.new("UIScale").Parent = donationPopup2
  donationPopup = donationPopup2
end

if not popups then
  local kittyDonatePopups = Instance.new("ScreenGui")
  kittyDonatePopups.Name = "KittyDonatePopups"
  kittyDonatePopups.ResetOnSpawn = false
  kittyDonatePopups.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  kittyDonatePopups.Parent = playerGui

  popups = Instance.new("Folder")
  popups.Name = "Popups"
  popups.Parent = kittyDonatePopups
end

local function f1(p1)
  local reverse = tostring(p1):reverse():gsub("(%d%d%d)", "%1,"):reverse()

  if reverse:sub(1, 1) == "," then
    reverse = reverse:sub(2)
  end

  return reverse
end

local v7 = { 1, 2, 5, 10, 15, 20, 50, 75 }

local function f2(p2)
  local v8 = v7[1]
  local huge = math.huge

  for index2, value2 in ipairs(v7) do
    local v9 = math.abs(p2 - value2)

    if v9 < huge then
      huge = v9
      v8 = value2
    end
  end

  return v8
end

local v10 = { { val = 100, w = 60 }, { val = 200, w = 35 }, { val = 500, w = 25 } }
local total = 0

for index3, value3 in ipairs(v10) do
  total = total + value3.w
end

local function f3(name, p3)
  local v11 = name .. " DONATED " .. f1(p3) .. " TO YOU!"

  local clone = donationPopup:Clone()
  clone.Parent = popups
  clone.Transparency = 1
  clone.Visible = true

  if clone:FindFirstChild("Message") then
    clone.Message.Text = v11
    pcall(function() clone.Message.MaxVisibleGraphemes = 0 end)
  end

  if clone:FindFirstChild("UIScale") then
    clone.UIScale.Scale = 0
  end

  tweenService:Create(clone, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
    Transparency = 0,
  }):Play()

  if clone:FindFirstChild("UIScale") then
    tweenService:Create(clone.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
      Scale = 1,
    }):Play()
  end

  if clone:FindFirstChild("Message") then
    tweenService:Create(clone.Message, TweenInfo.new(1, Enum.EasingStyle.Quint), {
      MaxVisibleGraphemes = #v11,
    }):Play()
  end

  return clone
end

local function f4(p4, p5, p6, p7)
  if not p4 then
    return
  end

  if p5 then
    p5.Brightness = 1
    p5.Range = 7.5
  end

  if p6 then
    p6:Emit(12)
  end

  if p7 then
    p7:Play()
  end

  tweenService:Create(p4, TweenInfo.new(0.25), { Size = Vector3.new(0, 0, 0) }):Play()

  task.delay(0.3, function()
    if p4 then
      p4:Destroy()
    end
  end)
end

local function f5(p8)
  if not p8 then
    return
  end

  tweenService:Create(p8, TweenInfo.new(0.25), { Transparency = 1 }):Play()

  task.delay(0.5, function()
    if p8 then
      p8:Destroy()
    end
  end)
end

local f6

local function f7(index4)
  if index4 < 100 then
    return f2(index4)
  elseif index4 < 1000 then
    if math.random() <= 0.8 then
      return f6()
    end

    return math.floor((index4 + 50) / 100) * 100
  else
    local v12 = math.floor((index4 + 500) / 1000)
    return math.clamp(v12 * 1000, 1000, v3)
  end
end

function f6()
  local v13 = math.random(1, total)
  local total2 = 0

  for index5, value4 in ipairs(v10) do
    total2 = total2 + value4.w

    if v13 <= total2 then
      return value4.val
    end
  end

  return 100
end

local function makeSound(p9)
  local soundId

  if p9 <= 99 then
    soundId = "rbxassetid://15333945695"
  elseif p9 <= 999 then
    soundId = "rbxassetid://15333946014"
  elseif p9 <= 9999 then
    soundId = "rbxassetid://15333945376"
  else
    soundId = "rbxassetid://15333945889"
  end

  local sound = Instance.new("Sound")
  sound.SoundId = soundId
  sound.Volume = 1
  sound.Parent = soundService
  sound:Play()

  debris:AddItem(sound, 6)
end

local function f8(p10)
  if math.random(1, 10000) <= 9500 then
    return f7(math.floor((1 - math.random() ^ 2.6) * 1000) + 1)
  else
    local v14 = math.random(1, 5)
    return math.min(({ 11000, 12000, 13000, 14000, 15000 })[v14], p10)
  end
end

local v15 = {}

local function f9()
  v5 = 0
  local v16 = {}

  for index6, value5 in ipairs(players:GetPlayers()) do
    if value5 ~= localPlayer then
      table.insert(v16, value5)
    end
  end

  for i = #v16, 2, -1 do
    local v17 = math.random(1, i)
    local v18 = v16[i]

    v16[i] = v16[v17]
    v16[v17] = v18
  end

  for index7, value6 in ipairs(v16) do
    local v19 = value6

    for j = 1, v4 do
      local name2 = v19.Name
      local v20 = f8(v3)
      v5 = v5 + v20

      task.spawn(function()
        makeSound(v20)
        local v21 = f3(name2, v20)

        local humanoidRootPart = v19.Character
          and v19.Character:FindFirstChild("HumanoidRootPart")

        local position = humanoidRootPart and humanoidRootPart.Position + Vector3.new(0, 2, 0)
          or workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position
          or Vector3.new(0, 10, 0)

        v15.spawn(v20, position, localPlayer.Character)
        task.delay(4, function() f5(v21) end)
      end)

      task.wait(0.1)
    end
  end
end

local function makePart(p11)
  local part = Instance.new("Part")
  part.Anchored = true
  part.CanCollide = false
  part.CanTouch = true
  part.Material = Enum.Material.Neon
  part.Color = Color3.fromRGB(255, 207, 64)
  part.Size = Vector3.new(0.2, 0.9, 0.9)
  part.CFrame = CFrame.new(p11)
  part.Parent = workspace

  local center = Instance.new("Attachment", part)
  center.Name = "Center"

  local instance = Instance.new("PointLight", center)
  instance.Range = 6
  instance.Brightness = 0.2

  local instance2 = Instance.new("ParticleEmitter", center)
  instance2.Rate = 0
  instance2.Texture = "rbxassetid://258128463"

  local instance3 = Instance.new("Sound", part)
  instance3.SoundId = "rbxassetid://6792279908"
  instance3.Volume = 1

  return part, center, instance, instance2, instance3
end

local function f10(p12, p13)
  local v22, v23, v24, v25, v26 = makePart(p12)
  local v27 = false
  local renderStepped = runService.RenderStepped
  local v28

  local connect = renderStepped:Connect(function(index8)
    if not v22 or v27 then
      v28:Disconnect()
      return
    end

    v22.Orientation = v22.Orientation + Vector3.new(0, 180 * index8, 0)
  end)

  local function f11()
    if v27 then
      return
    end

    v27 = true
    f4(v22, v24, v25, v26)
  end

  v28 = connect

  v22.Touched:Connect(function(part2)
    if v27 then
      return
    else
      local parent = p13 and p13.Parent

      if parent and part2 and part2:IsDescendantOf(parent) then
        f11()
      end

      return
    end
  end)

  task.delay(1, function()
    if v27 then
      return
    end

    if v25 then
      v25.Enabled = true
    end

    local v29 = 0
    local v30 = os.clock()

    local connect2 = nil

    connect2 = runService.Heartbeat:Connect(function(delta)
      if not v22 or v27 then
        connect2:Disconnect()
        return
      end

      if not p13 or not p13.Parent then
        v27 = true
        tweenService:Create(v22, TweenInfo.new(0.4), { Size = Vector3.new(0, 0, 0) }):Play()

        task.delay(0.4, function()
          if v22 then
            v22:Destroy()
          end
        end)

        connect2:Disconnect()
        return
      end

      if (v23.WorldPosition - p13.Position).Magnitude < 2.5 then
        f11()
        connect2:Disconnect()
        return
      end

      v29 = math.clamp(v29 + 0.05 * delta * 60 / 60, 0, 1)
      v22.Position = v22.Position:Lerp(p13.Position, v29)

      if os.clock() - v30 > 12 then
        f11()
        connect2:Disconnect()
      end
    end)
  end)
end

function v15.spawn(index9, p14, p15)
  local humanoidRootPart2 = p15 and p15:FindFirstChild("HumanoidRootPart")

  if not humanoidRootPart2 then
    return
  end

  for k = 1, math.clamp(math.floor(index9 / 100) + 3, 5, 20) do
    task.spawn(f10, p14, humanoidRootPart2)
    task.wait(0.1)
  end
end

local function makeTextLabel(text)
  local kittyRobuxSummary, summaryFrame

  if text <= 0 then
    return
  else
    local v31 = math.floor(text * 0.6)

    kittyRobuxSummary = Instance.new("ScreenGui")
    kittyRobuxSummary.Name = "KittyRobuxSummary"
    kittyRobuxSummary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    kittyRobuxSummary.ResetOnSpawn = false
    kittyRobuxSummary.Parent = playerGui

    summaryFrame = Instance.new("Frame")
    summaryFrame.Name = "SummaryFrame"
    summaryFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    summaryFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    summaryFrame.Size = UDim2.new(0, 0, 0, 0)
    summaryFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
    summaryFrame.BackgroundTransparency = 0.1
    summaryFrame.BorderSizePixel = 0
    summaryFrame.Parent = kittyRobuxSummary

    local uiCorner2 = Instance.new("UICorner")
    uiCorner2.CornerRadius = UDim.new(0, 14)
    uiCorner2.Parent = summaryFrame

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(138, 43, 226)
    uiStroke.Thickness = 2
    uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uiStroke.Parent = summaryFrame

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, -20, 0, 28)
    title.Position = UDim2.new(0, 10, 0, 8)
    title.Font = Enum.Font.GothamBold
    title.Text = "KittyScripts - Steal Robux"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 18
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextStrokeColor3 = Color3.new(0, 0, 0)
    title.TextStrokeTransparency = 0.5
    title.Parent = summaryFrame

    local mainText = Instance.new("TextLabel")
    mainText.Name = "MainText"
    mainText.BackgroundTransparency = 1
    mainText.Size = UDim2.new(1, -20, 0, 40)
    mainText.Position = UDim2.new(0, 10, 0, 40)
    mainText.Font = Enum.Font.GothamBold
    mainText.Text = "You got " .. f1(v31) .. " robux 💸"
    mainText.TextColor3 = Color3.fromRGB(138, 43, 226)
    mainText.TextSize = 20
    mainText.TextWrapped = true
    mainText.TextXAlignment = Enum.TextXAlignment.Left
    mainText.TextYAlignment = Enum.TextYAlignment.Center
    mainText.TextStrokeColor3 = Color3.new(0, 0, 0)
    mainText.TextStrokeTransparency = 0.4
    mainText.Parent = summaryFrame

    local subText = Instance.new("TextLabel")
    subText.Name = "SubText"
    subText.BackgroundTransparency = 1
    subText.Size = UDim2.new(1, -20, 0, 20)
    subText.Position = UDim2.new(0, 10, 0, 78)
    subText.Font = Enum.Font.Gotham
    subText.Text = "Total donated: " .. f1(text) .. " R$"
    subText.TextColor3 = Color3.fromRGB(200, 200, 200)
    subText.TextSize = 13
    subText.TextXAlignment = Enum.TextXAlignment.Left
    subText.TextYAlignment = Enum.TextYAlignment.Center
    subText.TextStrokeTransparency = 1
    subText.Parent = summaryFrame

    tweenService:Create(summaryFrame, TweenInfo.new(
      0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out
    ), { Size = UDim2.new(0, 280, 0, 110) }):Play()

    task.delay(5, function()
      if summaryFrame.Parent then
        tweenService:Create(summaryFrame, TweenInfo.new(
          0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In
        ), { Size = UDim2.new(0, 0, 0, 0) }):Play()

        task.delay(0.25, function()
          if kittyRobuxSummary then
            kittyRobuxSummary:Destroy()
          end
        end)
      end
    end)

    return
  end
end

local function f12(p16, p17, p18)
  local v32 = p16 or v2
  local v33 = p17 or 0.05
  local v34 = p18 or 0.2
  local character = localPlayer.Character

  if not (character and character:FindFirstChild("HumanoidRootPart")) then
    return
  else
    local v35 = os.clock()

    while os.clock() - v35 < v32 do
      local count = 0

      for index10, value7 in ipairs(players:GetPlayers()) do
        if value7 ~= localPlayer then
          local character2 = value7.Character

          if character2 and character2:FindFirstChild("HumanoidRootPart") then
            count = count + 1
            local v36 = count * 137.5 * math.pi / 180
            local v37 = v34 * (1 + count % 3 * 0.15)
            local v38 = math.cos(v36)
            local v39 = math.sin(v36)
            CFrame.new(v38 * v37, 0, v39 * v37)
          end
        end
      end

      task.wait(v33)
    end

    return
  end
end

local function f13()
  task.spawn(function()
    if v1 then
      f12(v2, 0.05, 0.2)
    end

    f9()
    makeTextLabel(v5)
  end)
end

xeno:AddHeader("MAIN FEATURES")
xeno:AddLabel("Steal Robux from players in the server")
xeno:AddButton("🐱 STEAL ROBUX 🐱", function() f13() end, true)

xeno:AddButton("😼 RICH SERVER HOP 😼", function()
  teleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
end, true)

xeno:AddHeader("SETTINGS")
xeno:AddLabel("Customize steal behavior")
xeno:AddSwitch("Push Players First", function(p19) v1 = p19 end, false)
xeno:AddSlider("Push Duration", 1, 10, 6, function(p20) v2 = p20 end)
xeno:AddSlider("Max Robux Amount", 1000, 15000, 15000, function(p21) v3 = p21 end)
xeno:AddSlider("Donations Per Player", 1, 5, 1, function(p22) v4 = p22 end)
xeno:AddHeader("INFORMATION")
xeno:AddLabel("By KittyScripts | deobf by L0LeR")
xeno:AddLabel("Thank you for using this script! 🐱")

