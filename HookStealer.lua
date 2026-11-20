local coreGui      = game:GetService("CoreGui")
local players      = game:GetService("Players")
local tweenService = game:GetService("TweenService")

local list  = {}
local list2 = {}

local screenGui = Instance.new("ScreenGui")
math.randomseed(os.time())

local function getText(n)
  local alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  local out = {}
  for i = 1, n do
    local p = math.random(1, #alphabet)
    out[i] = alphabet:sub(p, p)
  end
  return table.concat(out)
end

local wrap = newcclosure or function(f) return f end

screenGui.Name           = getText(math.random(5, 20))
screenGui.ResetOnSpawn   = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder   = 9999999

local flagRepeats    = false
local flagBlockHooks = false
local flagBlockLinks = false
local mode = "HOOK"

local protectGui = (syn and syn.protect_gui)
  or (Xeno and Xeno.protect_gui)
  or protectgui

if protectGui then
  pcall(function() protectGui(screenGui) end)
end

players.LocalPlayer:WaitForChild("PlayerGui")

local function getParentGui()
  if gethui then
    local ok, hui = pcall(gethui)
    if ok and hui then return hui end
  end
  return coreGui
end

screenGui.Parent = getParentGui()

if hookmetamethod and getnamecallmethod then
  pcall(function()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
      local method = getnamecallmethod()
      if method == "GetDescendants"
        or method == "GetChildren"
        or method == "FindFirstChild" then
        local parent = self
        while parent do
          if parent == screenGui then
            if method == "FindFirstChild" then return nil end
            return {}
          end
          parent = parent.Parent
        end
      end
      return oldNamecall(self, ...)
    end)
  end)
end

local C = {
  bg        = Color3.fromRGB(15, 15, 15),
  header    = Color3.fromRGB(20, 20, 20),
  border    = Color3.fromRGB(40, 40, 55),
  muted     = Color3.fromRGB(130, 130, 140),
  white     = Color3.fromRGB(255, 255, 255),
  soft      = Color3.fromRGB(230, 230, 235),
  cardBg    = Color3.fromRGB(30, 30, 30),
  cardHover = Color3.fromRGB(35, 35, 35),
  green     = Color3.fromRGB(60, 160, 60),
  red       = Color3.fromRGB(200, 60, 60),
  blue      = Color3.fromRGB(70, 110, 180),
  amber     = Color3.fromRGB(200, 130, 50),
  btn       = Color3.fromRGB(28, 28, 28),
  btn2      = Color3.fromRGB(24, 24, 24),
  btn3      = Color3.fromRGB(33, 33, 33),
  btn4      = Color3.fromRGB(30, 30, 30),
}

local frame = Instance.new("Frame")
frame.Size             = UDim2.new(0, 520, 0, 420)
frame.Position         = UDim2.new(0.5, -260, 0.5, -210)
frame.BackgroundColor3 = C.bg
frame.BorderSizePixel  = 0
frame.Active           = true
frame.Draggable        = true
frame.BackgroundTransparency = 1
frame.Parent           = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 6)
uiCorner.Parent = frame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = C.border
uiStroke.Thickness = 1
uiStroke.Transparency = 1
uiStroke.Parent = frame

task.spawn(function()
  tweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
    BackgroundTransparency = 0,
  }):Play()
  tweenService:Create(uiStroke, TweenInfo.new(0.3), { Transparency = 0 }):Play()
end)

local frame2 = Instance.new("Frame")
frame2.Size             = UDim2.new(1, 0, 0, 32)
frame2.BackgroundColor3 = C.header
frame2.BorderSizePixel  = 0
frame2.Parent           = frame

local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 6)
uiCorner2.Parent = frame2

local headerBottom = Instance.new("Frame")
headerBottom.Size             = UDim2.new(1, 0, 0, 6)
headerBottom.Position         = UDim2.new(0, 0, 1, -6)
headerBottom.BackgroundColor3 = C.header
headerBottom.BorderSizePixel  = 0
headerBottom.Parent           = frame2

local headerLine = Instance.new("Frame")
headerLine.Size             = UDim2.new(1, 0, 0, 1)
headerLine.Position         = UDim2.new(0, 0, 1, -1)
headerLine.BackgroundColor3 = C.border
headerLine.BorderSizePixel  = 0
headerLine.Parent           = frame2

local execName = (identifyexecutor and identifyexecutor()) or "Unknown"
local title = Instance.new("TextLabel")
title.Size               = UDim2.new(1, -140, 1, 0)
title.Position           = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text               = "HookStealer - " .. execName
title.TextColor3         = C.soft
title.Font               = Enum.Font.GothamMedium
title.TextSize           = 13
title.TextXAlignment     = Enum.TextXAlignment.Left
title.Parent             = frame2

local statusLabel = Instance.new("TextLabel")
statusLabel.Size               = UDim2.new(0, 60, 0, 20)
statusLabel.Position           = UDim2.new(1, -300, 0, 6)
statusLabel.BackgroundTransparency = 1
statusLabel.Text               = ""
statusLabel.TextColor3         = C.red
statusLabel.Font               = Enum.Font.GothamBold
statusLabel.TextSize           = 11
statusLabel.Parent             = frame2

local modeButton = Instance.new("TextButton")
modeButton.Size             = UDim2.new(0, 90, 0, 20)
modeButton.Position         = UDim2.new(1, -130, 0, 6)
modeButton.BackgroundColor3 = C.btn4
modeButton.BorderSizePixel  = 0
modeButton.Text             = "HOOK"
modeButton.TextColor3       = C.white
modeButton.Font             = Enum.Font.GothamBold
modeButton.TextSize         = 11
modeButton.AutoButtonColor  = false
modeButton.Parent           = frame2

local mc = Instance.new("UICorner")
mc.CornerRadius = UDim.new(0, 4)
mc.Parent = modeButton

modeButton.MouseEnter:Connect(function()
  tweenService:Create(modeButton, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }):Play()
end)
modeButton.MouseLeave:Connect(function()
  tweenService:Create(modeButton, TweenInfo.new(0.12), { BackgroundColor3 = C.btn4 }):Play()
end)
modeButton.MouseButton1Click:Connect(function()
  if mode == "HOOK" then
    mode = "ALL"
    modeButton.Text = "ALL"
  else
    mode = "HOOK"
    modeButton.Text = "HOOK"
  end
  modeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  setStatus("Mode: " .. mode)
end)

local repeatsButton = Instance.new("TextButton")
repeatsButton.Size             = UDim2.new(0, 90, 0, 20)
repeatsButton.Position         = UDim2.new(1, -226, 0, 6)
repeatsButton.BackgroundColor3 = C.btn4
repeatsButton.BorderSizePixel  = 0
repeatsButton.Text             = "Repeats: OFF"
repeatsButton.TextColor3       = C.white
repeatsButton.Font             = Enum.Font.GothamBold
repeatsButton.TextSize         = 11
repeatsButton.AutoButtonColor  = false
repeatsButton.Parent           = frame2

local rc = Instance.new("UICorner")
rc.CornerRadius = UDim.new(0, 4)
rc.Parent = repeatsButton

repeatsButton.MouseEnter:Connect(function()
  tweenService:Create(repeatsButton, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }):Play()
end)
repeatsButton.MouseLeave:Connect(function()
  tweenService:Create(repeatsButton, TweenInfo.new(0.12), { BackgroundColor3 = C.btn4 }):Play()
end)
repeatsButton.MouseButton1Click:Connect(function()
  flagRepeats = not flagRepeats
  repeatsButton.Text = flagRepeats and "Repeats: ON" or "Repeats: OFF"
  repeatsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  setStatus("REPEATS: " .. (flagRepeats and "ON" or "OFF"))
end)

local modeLabel = Instance.new("TextLabel")
modeLabel.Size               = UDim2.new(1, -24, 0, 16)
modeLabel.Position           = UDim2.new(0, 12, 0, 78)
modeLabel.BackgroundTransparency = 1
modeLabel.Text               = "Mode: HOOK"
modeLabel.TextColor3         = C.muted
modeLabel.Font               = Enum.Font.Code
modeLabel.TextSize           = 10
modeLabel.TextXAlignment     = Enum.TextXAlignment.Left
modeLabel.Parent             = frame

local function setStatus(text)
  modeLabel.Text = text
end

local closeButton = Instance.new("TextButton")
closeButton.Size               = UDim2.new(0, 34, 0, 34)
closeButton.Position           = UDim2.new(1, -34, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.Text               = "×"
closeButton.TextColor3         = C.muted
closeButton.Font               = Enum.Font.GothamMedium
closeButton.TextSize           = 20
closeButton.Parent             = frame2

closeButton.MouseEnter:Connect(function()
  tweenService:Create(closeButton, TweenInfo.new(0.15), { TextColor3 = C.red }):Play()
end)
closeButton.MouseLeave:Connect(function()
  tweenService:Create(closeButton, TweenInfo.new(0.15), { TextColor3 = C.muted }):Play()
end)
closeButton.MouseButton1Click:Connect(function()
  tweenService:Create(frame, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
  tweenService:Create(uiStroke, TweenInfo.new(0.2), { Transparency = 1 }):Play()
  task.wait(0.2)
  screenGui:Destroy()
end)

local toolbar = Instance.new("Frame")
toolbar.Size               = UDim2.new(1, -24, 0, 28)
toolbar.Position           = UDim2.new(0, 12, 0, 44)
toolbar.BackgroundTransparency = 1
toolbar.Parent             = frame

local function makeButton(text, x, width, bg)
  local btn = Instance.new("TextButton")
  btn.Size             = UDim2.new(0, width, 1, 0)
  btn.Position         = UDim2.new(0, x, 0, 0)
  btn.BackgroundColor3 = bg
  btn.BorderSizePixel  = 0
  btn.Text             = text
  btn.TextColor3       = C.soft
  btn.Font             = Enum.Font.GothamMedium
  btn.TextSize         = 11
  btn.AutoButtonColor  = false
  btn.Parent           = toolbar

  local corner = Instance.new("UICorner")
  corner.CornerRadius = UDim.new(0, 4)
  corner.Parent = btn

  local hover = Color3.new(
    math.min(bg.R + 0.08, 1),
    math.min(bg.G + 0.08, 1),
    math.min(bg.B + 0.08, 1)
  )

  btn.MouseEnter:Connect(function()
    tweenService:Create(btn, TweenInfo.new(0.12), { BackgroundColor3 = hover }):Play()
  end)
  btn.MouseLeave:Connect(function()
    tweenService:Create(btn, TweenInfo.new(0.12), { BackgroundColor3 = bg }):Play()
  end)

  return btn
end

local copyAllBtn    = makeButton("Copy All", 0, 80, C.btn2)
local clearBtn      = makeButton("Clear", 88, 60, C.bg)
local blockHooksBtn = makeButton("Block: OFF", 156, 90, C.btn)
local blockLinksBtn = makeButton("Links: OFF", 254, 90, C.btn3)

local foundLabel = Instance.new("TextLabel")
foundLabel.Size               = UDim2.new(0, 200, 1, 0)
foundLabel.Position           = UDim2.new(1, -200, 0, 0)
foundLabel.BackgroundTransparency = 1
foundLabel.Text               = "Found: 0"
foundLabel.TextColor3         = C.muted
foundLabel.Font               = Enum.Font.Gotham
foundLabel.TextSize           = 11
foundLabel.TextXAlignment     = Enum.TextXAlignment.Right
foundLabel.Parent             = toolbar

local divider = Instance.new("Frame")
divider.Size             = UDim2.new(1, -24, 0, 1)
divider.Position         = UDim2.new(0, 12, 0, 98)
divider.BackgroundColor3 = C.border
divider.BorderSizePixel  = 0
divider.Parent           = frame

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size                   = UDim2.new(1, -24, 1, -120)
scrollingFrame.Position               = UDim2.new(0, 12, 0, 108)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel        = 0
scrollingFrame.ScrollBarThickness     = 4
scrollingFrame.ScrollBarImageColor3   = C.border
scrollingFrame.CanvasSize             = UDim2.new(0, 0, 0, 0)
scrollingFrame.Parent                 = frame

local pad = Instance.new("UIPadding")
pad.PaddingLeft  = UDim.new(0, 3)
pad.PaddingRight = UDim.new(0, 3)
pad.PaddingTop   = UDim.new(0, 3)
pad.Parent       = scrollingFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding   = UDim.new(0, 6)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent    = scrollingFrame

listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
  scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end)

local detailWindow

local function copyToClipboard(text)
  if not setclipboard then return end
  pcall(setclipboard, tostring(text))
end

local function addCard(url, source, isWebhook, reqData)
  local card = Instance.new("Frame")
  card.Size             = UDim2.new(1, -4, 0, 52)
  card.BackgroundColor3 = C.cardBg
  card.BorderSizePixel  = 0
  card.BackgroundTransparency = 1
  card.Parent           = scrollingFrame

  table.insert(list2, card)

  local corner = Instance.new("UICorner")
  corner.CornerRadius = UDim.new(0, 4)
  corner.Parent = card

  local stroke = Instance.new("UIStroke")
  stroke.Color        = isWebhook and C.amber or C.border
  stroke.Thickness    = 1
  stroke.Transparency = isWebhook and 0.6 or 1
  stroke.Parent       = card

  task.spawn(function()
    tweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
      BackgroundTransparency = 0,
    }):Play()
  end)

  local headerLabel = Instance.new("TextLabel")
  headerLabel.Size               = UDim2.new(1, -140, 0, 14)
  headerLabel.Position           = UDim2.new(0, 10, 0, 8)
  headerLabel.BackgroundTransparency = 1
  headerLabel.Text               = (isWebhook and "WEBHOOK | " or "ALL | ") .. source
  headerLabel.TextColor3         = isWebhook and C.amber or C.muted
  headerLabel.Font               = Enum.Font.GothamMedium
  headerLabel.TextSize           = 11
  headerLabel.TextXAlignment     = Enum.TextXAlignment.Left
  headerLabel.Parent             = card

  do
    local holder = Instance.new("Frame")
    holder.Size               = UDim2.new(1, -140, 0, 16)
    holder.Position           = UDim2.new(0, 10, 0, 26)
    holder.BackgroundTransparency = 1
    holder.Parent             = card

    local hLayout = Instance.new("UIListLayout")
    hLayout.FillDirection = Enum.FillDirection.Horizontal
    hLayout.SortOrder     = Enum.SortOrder.LayoutOrder
    hLayout.Parent        = holder

    local measure = Instance.new("TextLabel")
    measure.Font = Enum.Font.Code
    measure.TextSize = 10
    measure.Text = "A"
    measure.Parent = holder
    local charW = math.max(measure.TextBounds.X, 1)
    local holderW = holder.AbsoluteSize.X
    local fit = math.max(math.floor(holderW / charW), 1)
    measure:Destroy()

    local preview = url
    if #preview > fit - 3 then
      preview = url:sub(1, math.max(fit - 3, 1)) .. "..."
    end

    local chunk = 12
    local idx = 0
    for i = 1, #preview, chunk do
      idx = idx + 1
      local part = Instance.new("TextLabel")
      part.Size               = UDim2.new(0, 0, 1, 0)
      part.AutomaticSize      = Enum.AutomaticSize.X
      part.BackgroundTransparency = 1
      part.Text               = preview:sub(i, i + chunk - 1)
      part.TextColor3         = C.soft
      part.Font               = Enum.Font.Code
      part.TextSize           = 10
      part.TextXAlignment     = Enum.TextXAlignment.Left
      part.LayoutOrder        = idx
      part.Parent             = holder
    end
  end

  local infoBtn = Instance.new("TextButton")
  infoBtn.Size             = UDim2.new(0, 22, 0, 24)
  infoBtn.Position         = UDim2.new(1, -96, 0, 14)
  infoBtn.BackgroundColor3 = C.muted
  infoBtn.BorderSizePixel  = 0
  infoBtn.Text             = "i"
  infoBtn.TextColor3       = C.bg
  infoBtn.Font             = Enum.Font.GothamBold
  infoBtn.TextSize         = 12
  infoBtn.AutoButtonColor  = false
  infoBtn.BackgroundTransparency = 1
  infoBtn.TextTransparency = 1
  infoBtn.Parent           = card

  local ic = Instance.new("UICorner")
  ic.CornerRadius = UDim.new(0, 4)
  ic.Parent = infoBtn

  local copyBtn = Instance.new("TextButton")
  copyBtn.Size             = UDim2.new(0, 60, 0, 24)
  copyBtn.Position         = UDim2.new(1, -70, 0, 14)
  copyBtn.BackgroundColor3 = C.muted
  copyBtn.BorderSizePixel  = 0
  copyBtn.Text             = "Copy"
  copyBtn.TextColor3       = C.soft
  copyBtn.Font             = Enum.Font.GothamMedium
  copyBtn.TextSize         = 10
  copyBtn.AutoButtonColor  = false
  copyBtn.BackgroundTransparency = 1
  copyBtn.TextTransparency = 1
  copyBtn.Parent           = card

  local cc = Instance.new("UICorner")
  cc.CornerRadius = UDim.new(0, 4)
  cc.Parent = copyBtn

  card.MouseEnter:Connect(function()
    tweenService:Create(card, TweenInfo.new(0.15), { BackgroundColor3 = C.cardHover }):Play()
    tweenService:Create(stroke, TweenInfo.new(0.15), { Transparency = 0 }):Play()
    tweenService:Create(infoBtn, TweenInfo.new(0.15), { BackgroundTransparency = 0, TextTransparency = 0 }):Play()
    tweenService:Create(copyBtn, TweenInfo.new(0.15), { BackgroundTransparency = 0, TextTransparency = 0 }):Play()
  end)
  card.MouseLeave:Connect(function()
    tweenService:Create(card, TweenInfo.new(0.15), { BackgroundColor3 = C.cardBg }):Play()
    tweenService:Create(stroke, TweenInfo.new(0.15), {
      Transparency = isWebhook and 0.6 or 1,
    }):Play()
    tweenService:Create(infoBtn, TweenInfo.new(0.15), { BackgroundTransparency = 1, TextTransparency = 1 }):Play()
    tweenService:Create(copyBtn, TweenInfo.new(0.15), { BackgroundTransparency = 1, TextTransparency = 1 }):Play()
  end)

  copyBtn.MouseButton1Click:Connect(function()
    copyToClipboard(url)
    copyBtn.Text = "Done"
    task.delay(1, function() copyBtn.Text = "Copy" end)
  end)

  infoBtn.MouseButton1Click:Connect(function()
    if detailWindow then
      detailWindow:Destroy()
      detailWindow = nil
    end

    local whId, whToken = "", ""
    local id, tok = url:match("webhooks/(%d+)/([%w_%-]+)")
    if id then
      whId    = id
      whToken = tok or ""
    end

    local hash = 0
    for k = 1, #url do
      hash = (hash * 31 + url:byte(k)) % 2147483647
    end
    local fingerprint = string.format("%08X", hash)

    local win = Instance.new("Frame")
    win.Size             = UDim2.new(0, 600, 0, 500)
    win.Position         = UDim2.new(0.5, -300, 0.5, -250)
    win.BackgroundColor3 = C.bg
    win.BorderSizePixel  = 0
    win.Active           = true
    win.Draggable        = true
    win.ZIndex           = 50
    win.Parent           = frame

    local wc = Instance.new("UICorner")
    wc.CornerRadius = UDim.new(0, 6)
    wc.Parent = win

    local ws = Instance.new("UIStroke")
    ws.Color = C.border
    ws.Thickness = 1
    ws.Parent = win

    local winHeader = Instance.new("Frame")
    winHeader.Size             = UDim2.new(1, 0, 0, 32)
    winHeader.BackgroundColor3 = C.header
    winHeader.BorderSizePixel  = 0
    winHeader.ZIndex           = 51
    winHeader.Parent           = win

    local whc = Instance.new("UICorner")
    whc.CornerRadius = UDim.new(0, 6)
    whc.Parent = winHeader

    local winTitle = Instance.new("TextLabel")
    winTitle.Size               = UDim2.new(1, -40, 1, 0)
    winTitle.Position           = UDim2.new(0, 12, 0, 0)
    winTitle.BackgroundTransparency = 1
    winTitle.Text               = isWebhook and "HS: Webhook Details" or "HS: Request Details"
    winTitle.TextColor3         = C.soft
    winTitle.Font               = Enum.Font.GothamMedium
    winTitle.TextSize           = 13
    winTitle.TextXAlignment     = Enum.TextXAlignment.Left
    winTitle.ZIndex             = 52
    winTitle.Parent             = winHeader

    local winClose = Instance.new("TextButton")
    winClose.Size               = UDim2.new(0, 32, 0, 32)
    winClose.Position           = UDim2.new(1, -32, 0, 0)
    winClose.BackgroundTransparency = 1
    winClose.Text               = "×"
    winClose.TextColor3         = C.muted
    winClose.Font               = Enum.Font.GothamMedium
    winClose.TextSize           = 20
    winClose.ZIndex             = 52
    winClose.Parent             = winHeader

    winClose.MouseEnter:Connect(function()
      tweenService:Create(winClose, TweenInfo.new(0.15), { TextColor3 = C.red }):Play()
    end)
    winClose.MouseLeave:Connect(function()
      tweenService:Create(winClose, TweenInfo.new(0.15), { TextColor3 = C.muted }):Play()
    end)
    winClose.MouseButton1Click:Connect(function()
      win:Destroy()
      detailWindow = nil
    end)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size                   = UDim2.new(1, -20, 1, -80)
    scroll.Position               = UDim2.new(0, 10, 0, 40)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel        = 0
    scroll.ScrollBarThickness     = 4
    scroll.ScrollBarImageColor3   = C.border
    scroll.CanvasSize             = UDim2.new(0, 0, 0, 0)
    scroll.ZIndex                 = 52
    scroll.Parent                 = win

    local sLayout = Instance.new("UIListLayout")
    sLayout.Padding   = UDim.new(0, 4)
    sLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sLayout.Parent    = scroll

    sLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
      scroll.CanvasSize = UDim2.new(0, 0, 0, sLayout.AbsoluteContentSize.Y + 10)
    end)

    local function addRow(labelText, valueText, valueColor)
      local row = Instance.new("Frame")
      row.Size             = UDim2.new(1, -8, 0, 0)
      row.AutomaticSize    = Enum.AutomaticSize.Y
      row.BackgroundColor3 = C.cardBg
      row.BorderSizePixel  = 0
      row.ZIndex           = 52
      row.Parent           = scroll

      local rc2 = Instance.new("UICorner")
      rc2.CornerRadius = UDim.new(0, 4)
      rc2.Parent = row

      local rp = Instance.new("UIPadding")
      rp.PaddingTop    = UDim.new(0, 6)
      rp.PaddingBottom = UDim.new(0, 6)
      rp.PaddingLeft   = UDim.new(0, 10)
      rp.PaddingRight  = UDim.new(0, 10)
      rp.Parent        = row

      local rl = Instance.new("UIListLayout")
      rl.SortOrder = Enum.SortOrder.LayoutOrder
      rl.Parent    = row

      local lbl = Instance.new("TextLabel")
      lbl.Size               = UDim2.new(1, 0, 0, 14)
      lbl.BackgroundTransparency = 1
      lbl.Text               = labelText
      lbl.TextColor3         = C.muted
      lbl.Font               = Enum.Font.GothamBold
      lbl.TextSize           = 11
      lbl.TextXAlignment     = Enum.TextXAlignment.Left
      lbl.ZIndex             = 53
      lbl.Parent             = row

      local val = Instance.new("TextLabel")
      val.Size               = UDim2.new(1, 0, 0, 0)
      val.AutomaticSize      = Enum.AutomaticSize.Y
      val.BackgroundTransparency = 1
      val.Text               = valueText
      val.TextColor3         = valueColor or C.soft
      val.Font               = Enum.Font.Code
      val.TextSize           = 11
      val.TextXAlignment     = Enum.TextXAlignment.Left
      val.TextWrapped        = true
      val.ZIndex             = 53
      val.Parent             = row
    end

    addRow("Source", source)

    if isWebhook then
      addRow("Type", "Discord Webhook", C.muted)
      addRow("Webhook ID", whId ~= "" and whId or "n/a", C.muted)
      addRow("Token", whToken ~= "" and whToken or "n/a")
    else
      local host = url:match("^https?://([^/]+)") or "unknown"
      local path = url:match("^https?://[^/]+(/[^?]*)") or "/"
      local query = url:match("%?(.+)$") or ""
      addRow("Type", "HTTP Request", C.amber)
      addRow("Host", host)
      addRow("Path", path)
      addRow("Query", query ~= "" and query or "n/a")
    end

    addRow("Length", tostring(#url) .. " chars")
    addRow("Fingerprint", fingerprint, C.green)
    addRow("Caught At", os.date("%H:%M:%S"))
    addRow("URL", "Split URL hidden in UI")

    if reqData and type(reqData) == "table" then
      addRow("Method", tostring(reqData.Method or "?"), C.green)

      if reqData.Body and tostring(reqData.Body) ~= "" then
        addRow("Body", tostring(reqData.Body))
      end

      if reqData.Headers and type(reqData.Headers) == "table" then
        local lines = {}
        for k, v in pairs(reqData.Headers) do
          lines[#lines + 1] = tostring(k) .. ": " .. tostring(v)
        end
        if #lines > 0 then
          addRow("Headers", table.concat(lines, "\n"))
        end
      end

      local extras = {}
      for k, v in pairs(reqData) do
        if k ~= "Url" and k ~= "Method" and k ~= "Body" and k ~= "Headers" then
          extras[#extras + 1] = tostring(k) .. " = " .. tostring(v)
        end
      end
      if #extras > 0 then
        addRow("Extras", table.concat(extras, "\n"), C.muted)
      end
    end

    local copyUrl = Instance.new("TextButton")
    copyUrl.Size             = UDim2.new(0, 130, 0, 28)
    copyUrl.Position         = UDim2.new(0, 14, 1, -38)
    copyUrl.BackgroundColor3 = C.blue
    copyUrl.BorderSizePixel  = 0
    copyUrl.Text             = "Copy URL"
    copyUrl.TextColor3       = C.soft
    copyUrl.Font             = Enum.Font.GothamMedium
    copyUrl.TextSize         = 11
    copyUrl.AutoButtonColor  = false
    copyUrl.ZIndex           = 53
    copyUrl.Parent           = win

    local cuc = Instance.new("UICorner")
    cuc.CornerRadius = UDim.new(0, 4)
    cuc.Parent = copyUrl

    local copyFull = Instance.new("TextButton")
    copyFull.Size             = UDim2.new(0, 130, 0, 28)
    copyFull.Position         = UDim2.new(0, 152, 1, -38)
    copyFull.BackgroundColor3 = C.green
    copyFull.BorderSizePixel  = 0
    copyFull.Text             = "Copy Full"
    copyFull.TextColor3       = C.soft
    copyFull.Font             = Enum.Font.GothamMedium
    copyFull.TextSize         = 11
    copyFull.AutoButtonColor  = false
    copyFull.ZIndex           = 53
    copyFull.Parent           = win

    local cfc = Instance.new("UICorner")
    cfc.CornerRadius = UDim.new(0, 4)
    cfc.Parent = copyFull

    local closeBottom = Instance.new("TextButton")
    closeBottom.Size             = UDim2.new(0, 100, 0, 28)
    closeBottom.Position         = UDim2.new(1, -114, 1, -38)
    closeBottom.BackgroundColor3 = C.red
    closeBottom.BorderSizePixel  = 0
    closeBottom.Text             = "Close"
    closeBottom.TextColor3       = C.soft
    closeBottom.Font             = Enum.Font.GothamMedium
    closeBottom.TextSize         = 11
    closeBottom.AutoButtonColor  = false
    closeBottom.ZIndex           = 53
    closeBottom.Parent           = win

    local cbc = Instance.new("UICorner")
    cbc.CornerRadius = UDim.new(0, 4)
    cbc.Parent = closeBottom

    copyUrl.MouseButton1Click:Connect(function()
      copyToClipboard(url)
      copyUrl.Text = "Copied!"
      task.delay(1, function() copyUrl.Text = "Copy URL" end)
    end)

    copyFull.MouseButton1Click:Connect(function()
      local out = { "URL: " .. url, "Source: " .. source }
      if reqData and type(reqData) == "table" then
        out[#out + 1] = "Method: " .. tostring(reqData.Method or "?")
        if reqData.Body then
          out[#out + 1] = "Body: " .. tostring(reqData.Body)
        end
        if reqData.Headers and type(reqData.Headers) == "table" then
          out[#out + 1] = "Headers:"
          for k, v in pairs(reqData.Headers) do
            out[#out + 1] = "  " .. tostring(k) .. ": " .. tostring(v)
          end
        end
      end
      copyToClipboard(table.concat(out, "\n"))
      copyFull.Text = "Copied!"
      task.delay(1, function() copyFull.Text = "Copy Full" end)
    end)

    closeBottom.MouseButton1Click:Connect(function()
      win:Destroy()
      detailWindow = nil
    end)

    detailWindow = win
  end)
end

local function refreshFound()
  foundLabel.Text = "Found: " .. #list
end

copyAllBtn.MouseButton1Click:Connect(function()
  if #list == 0 then
    copyAllBtn.Text = "Empty"
    task.wait(1)
    copyAllBtn.Text = "Copy All"
    return
  end

  local out = {}
  for i, item in ipairs(list) do
    local line = i .. ". " .. item.url
    if item.method then
      line = line .. " [" .. tostring(item.method) .. "]"
    end
    line = line .. "  (" .. item.source .. ")"
    if item.body and tostring(item.body) ~= "" then
      line = line .. "\n   body: " .. tostring(item.body):sub(1, 300)
    end
    out[#out + 1] = line
  end

  copyToClipboard(table.concat(out, "\n"))
  copyAllBtn.Text = "Copied"
  task.wait(1)
  copyAllBtn.Text = "Copy All"
end)

clearBtn.MouseButton1Click:Connect(function()
  list = {}
  for _, card in ipairs(list2) do
    if card and card.Destroy then card:Destroy() end
  end
  list2 = {}
  refreshFound()
  setStatus("Cleared")
end)

blockHooksBtn.MouseButton1Click:Connect(function()
  flagBlockHooks = not flagBlockHooks
  blockHooksBtn.Text = flagBlockHooks and "BLOCK: ON" or "BLOCK: OFF"
  blockHooksBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  statusLabel.Text = flagBlockHooks and "BLOCKED" or ""
  setStatus("WEBHOOK BLOCK: " .. (flagBlockHooks and "ON" or "OFF"))
end)

blockLinksBtn.MouseButton1Click:Connect(function()
  flagBlockLinks = not flagBlockLinks
  blockLinksBtn.Text = flagBlockLinks and "Links: ON" or "Links: OFF"
  blockLinksBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  setStatus("ALL LINKS BLOCK: " .. (flagBlockLinks and "ON" or "OFF"))
end)

do
  local checks = {
    { "getgenv",      getgenv },
    { "http_request", http_request },
    { "request",      request },
    { "http.request", http and http.request },
    { "loadstring",   loadstring },
    { "game:HttpGet", game and game.HttpGet },
    { "setclipboard", setclipboard },
  }

  local okCount, missCount = 0, 0
  for _, entry in ipairs(checks) do
    if type(entry[2]) == "function" then
      okCount = okCount + 1
    else
      missCount = missCount + 1
    end
  end

  setStatus("Executor: " .. okCount .. " OK / " .. missCount .. " missing")
end

local function isWebhook(url)
  if type(url) ~= "string" then return false end
  return url:find("discord%.com/api/webhooks")
      or url:find("discordapp%.com/api/webhooks")
      or url:find("canary%.discord%.com/api/webhooks")
      or url:find("ptb%.discord%.com/api/webhooks")
      or false
end

local function isLink(str)
  return type(str) == "string" and str:find("https?://") ~= nil
end

local function shouldBlock(url)
  if flagBlockLinks and isLink(url) then return true end
  if flagBlockHooks and isWebhook(url) then return true end
  return false
end

local OK_RESPONSE = {
  StatusCode = 200,
  Body = '{"success":true,"valid":true,"status":"ok"}',
  Headers = {},
}

local function capture(url, source, reqData)
  if mode == "HOOK" and not isWebhook(url) then
    return
  end

  local bodyStr = reqData and tostring(reqData.Body or "") or ""

  for _, item in ipairs(list) do
    if item.url == url then
      if not flagRepeats then return end
      if tostring(item.body or "") == bodyStr then return end
    end
  end

  local isWh = isWebhook(url)
  table.insert(list, {
    url     = url,
    source  = source,
    webhook = isWh,
    method  = reqData and reqData.Method  or nil,
    body    = reqData and reqData.Body    or nil,
    headers = reqData and reqData.Headers or nil,
  })
  setStatus((isWh and "WEBHOOK" or "ALL") .. ": " .. source)
  addCard(url, source, isWh, reqData)
  refreshFound()
end

local function installHook(root, path, source)
  if not root then return end

  local parts = {}
  for p in path:gmatch("[^%.]+") do parts[#parts + 1] = p end

  local obj = root
  for i = 1, #parts - 1 do
    if type(obj) ~= "table" then return end
    obj = obj[parts[i]]
    if obj == nil then return end
  end

  local key = parts[#parts]
  local orig = obj[key]
  if type(orig) ~= "function" then return end

  obj[key] = wrap(function(...)
    local args = { ... }

    for _, arg in ipairs(args) do
      if type(arg) == "table" then
        local mt = getmetatable(arg)
        local idx = mt and mt.__index
        if idx then
          setStatus("DETECTED: __index bypass!")
          local rawUrl = rawget(arg, "Url")
          if type(rawUrl) == "string" then
            capture(rawUrl, source, arg)
          else
            capture("BYPASS_ATTEMPT_DETECTED", source, {
              Url = "BYPASS_ATTEMPT",
              Method = arg.Method,
              Body = arg.Body,
            })
          end
          return OK_RESPONSE
        end

        local samples = {}
        for i = 1, 10 do samples[i] = arg.Url end
        local first = samples[1]
        local changed = false
        for i = 2, 10 do
          if samples[i] ~= first then changed = true; break end
        end
        if changed then
          setStatus("DETECTED: Url changes between reads!")
          capture("CHANGING_URL_DETECTED", source, arg)
          return OK_RESPONSE
        end

        if type(first) ~= "string" then
          setStatus("DETECTED: Url is not a string!")
          capture("INVALID_URL_TYPE: " .. type(first), source, arg)
          return OK_RESPONSE
        end

        capture(first, source, arg)
        if shouldBlock(first) then
          return OK_RESPONSE
        end
      elseif type(arg) == "string" and isLink(arg) then
        capture(arg, source, nil)
        if shouldBlock(arg) then
          return OK_RESPONSE
        end
      end
    end

    return orig(...)
  end)
end

installHook(_G, "http_request", "http_request")
installHook(_G, "request", "request")
installHook(_G, "http.request", "http.request")
installHook(getgenv and getgenv() or _G, "http_request", "getgenv().http_request")
installHook(getgenv and getgenv() or _G, "request", "getgenv().request")

if http and http.request then
  local origHttpRequest = http.request
  http.request = wrap(function(...)
    local args = { ... }
    for _, arg in ipairs(args) do
      if type(arg) == "table" then
        local mt = getmetatable(arg)
        local idx = mt and mt.__index
        if idx then
          setStatus("DETECTED: __index bypass!")
          capture("BYPASS_ATTEMPT_DETECTED", "http.request", {
            Url = "BYPASS_ATTEMPT",
            Method = arg.Method,
            Body = arg.Body,
          })
          return OK_RESPONSE
        end

        local samples = {}
        for i = 1, 10 do samples[i] = arg.Url end
        local first = samples[1]
        local changed = false
        for i = 2, 10 do
          if samples[i] ~= first then changed = true; break end
        end
        if changed then
          setStatus("DETECTED: Url changes!")
          capture("CHANGING_URL_DETECTED", "http.request", arg)
          return OK_RESPONSE
        end

        if type(first) ~= "string" then
          setStatus("DETECTED: Url not string!")
          capture("INVALID_URL_TYPE: " .. type(first), "http.request", arg)
          return OK_RESPONSE
        end

        capture(first, "http.request", arg)
        if shouldBlock(first) then
          return OK_RESPONSE
        end
      end
    end
    return origHttpRequest(...)
  end)
end

do
  local origGetUpvalues = debug and debug.getupvalues
  if origGetUpvalues then
    debug.getupvalues = wrap(function(f)
      local ups = origGetUpvalues(f)
      if type(ups) ~= "table" then return ups end

      local genvReq = getgenv and getgenv().request
      if type(genvReq) ~= "function" then return ups end

      for k, v in pairs(ups) do
        if type(v) == "function" then
          local info = debug.getinfo(v)
          if info and info.what == "C" then
            ups[k] = function(...) return genvReq(...) end
          end
        end
      end
      return ups
    end)
  end
end

setStatus("Hooks installed. Mode: HOOK")
refreshFound()
