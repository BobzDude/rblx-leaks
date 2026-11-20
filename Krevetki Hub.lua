local httpService = game:GetService("HttpService")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local virtualInputManager = game:GetService("VirtualInputManager")

if getgenv().KrevetkiMiniWindow and getgenv().KrevetkiMiniWindow.Destroy then
  pcall(function() getgenv().KrevetkiMiniWindow:Destroy() end)
end

getgenv().KrevetkiMiniWindow = nil
getgenv().KrevetkiMiniLoaded = nil
getgenv().KrevetkiTPAllowedTokens = {}
getgenv().KrevetkiCurrentTPToken = nil

local v1 = (getgenv().KrevetkiActiveGen or 0) + 1
getgenv().KrevetkiActiveGen = v1

pcall(function()
  if not isfolder("Rayfield") then
    makefolder("Rayfield")
  end

  if not isfolder("Rayfield/Reports") then
    makefolder("Rayfield/Reports")
  end

  if not isfolder("KrevetkiHub") then
    makefolder("KrevetkiHub")
  end

  for _, value in ipairs({
    "Rayfield/Reports.json", "Rayfield/Reports.txt", "Rayfield/Reports/reports.json",
    "Rayfield/Reports/reports.txt",
  }) do
    pcall(function()
      local v2

      if isfile(value) then
        v2 = readfile(value)

        if not v2 or v2 == "" or v2 == "null" then
          writefile(value, "[]")
        elseif not pcall(function() return httpService:JSONDecode(v2) end) then
          writefile(value, "[]")
        end
      else
        writefile(value, "[]")
      end
    end)
  end
end)

pcall(function()
  local rawmetatable = getrawmetatable(game)
  local newindex = rawmetatable.__newindex
  setreadonly(rawmetatable, false)

  rawmetatable.__newindex = newcclosure(function(instance, p1, p2)
    local v3 = p1 == "CFrame" and typeof(p2) == "CFrame"
    local localPlayer, v4

    if v3 then
      local ok, result = pcall(function() return instance:IsA("BasePart") end)

      if ok and result and instance.Name == "HumanoidRootPart" then
        localPlayer = players.LocalPlayer
        v4 = false

        pcall(function()
          v4 = localPlayer.Character ~= nil and instance.Parent == localPlayer.Character
        end)

        if v4 then
          if (p2.Position - instance.Position).Magnitude > 50 then
            local krevetkiCurrentTPToken = getgenv().KrevetkiCurrentTPToken
            local v5 = not krevetkiCurrentTPToken
            local krevetkiTPAllowedTokens = getgenv().KrevetkiTPAllowedTokens

            if v5 or not krevetkiTPAllowedTokens
              or not krevetkiTPAllowedTokens[krevetkiCurrentTPToken] then
              return
            end
          end
        end
      end
    end

    return newindex(instance, p1, p2)
  end)

  setreadonly(rawmetatable, true)
end)

local v6 = tostring(os.clock()) .. "_" .. tostring(math.random(1000000, 9999999))
getgenv().KrevetkiTPAllowedTokens[v6] = true
local rayfield
pcall(function() rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))() end)

if not rayfield then
  return
end

local localPlayer2 = players.LocalPlayer
local seen = { DemonBear = true, GhostBear = true }

local function f1()
  pcall(function() writefile("KrevetkiHub/Blacklist.json", httpService:JSONEncode(seen)) end)
end

local v7 = {
  BearFarm = false,
  LootFarm = false,
  FarmPages = true,
  FarmCrates = true,
  LootSearchRange = 400,
  TPLootCooldown = 0.5,
  TPBearCooldown = 1,
  PageHoldTime = 1.5,
  CrateStayTime = 3,
  CrateMaxLock = 30,
  ESpamInterval = 0.05,
  TPBehind = 5,
  TPAbove = 1,
  MeleeRange = 8,
  GunRange = 15,
  MeleeCooldown = 0.4,
  GunCooldown = 0.15,
  SwapCooldown = 0.5,
  ReloadCooldown = 2.5,
  UseGun = true,
  UseMelee = true,
  OrbitSpeed = 12,
  OrbitRadiusMult = 0.5,
  OrbitAbove = 2,
  ESPEnabled = false,
  ESPPlayers = true,
  ESPBears = true,
  ESPDistance = 500,
  InfiniteStamina = false,
  SpeedMultiplier = 1,
}

local v8 = {
  lastMelee = 0,
  lastGun = 0,
  lastTPBear = 0,
  lastTPLoot = 0,
  lastSwap = 0,
  triedTools = {},
  shotCount = {},
  reloadCooldown = {},
  attemptedCrates = {},
  orbitAngle = 0,
  CrateLock = nil,
  ESPData = {},
  speedValue = nil,
  lastTargetBear = nil,
  lastTargetHP = nil,
  lastTargetCheck = 0,
}

local function f2(p3)
  if not p3 then
    return
  end

  pcall(function()
    if p3.highlight then
      p3.highlight:Destroy()
    end
  end)

  pcall(function()
    if p3.billboard then
      p3.billboard:Destroy()
    end
  end)
end

local function getCharacter()
  return localPlayer2.Character
end

local function makeFolder(speedMultiplier)
  local character = getCharacter()

  if not character then
    return
  end

  local speedModifiers = character:FindFirstChild("SpeedModifiers")
  local krevetkiSpeed

  if speedMultiplier <= 1 then
    if speedModifiers then
      krevetkiSpeed = speedModifiers:FindFirstChild("KrevetkiSpeed")

      if krevetkiSpeed then
        pcall(function() krevetkiSpeed:Destroy() end)
      end
    end

    return
  end

  if not speedModifiers then
    speedModifiers = Instance.new("Folder")
    speedModifiers.Name = "SpeedModifiers"
    speedModifiers.Parent = character
  end

  local krevetkiSpeed2 = speedModifiers:FindFirstChild("KrevetkiSpeed")
  local value2 = speedMultiplier - 1

  if krevetkiSpeed2 and krevetkiSpeed2:IsA("NumberValue") then
    if math.abs(krevetkiSpeed2.Value - value2) > 0.001 then
      krevetkiSpeed2.Value = value2
    end

    v8.speedValue = krevetkiSpeed2
  else
    if krevetkiSpeed2 then
      pcall(function() krevetkiSpeed2:Destroy() end)
    end

    local krevetkiSpeed3 = Instance.new("NumberValue")
    krevetkiSpeed3.Name = "KrevetkiSpeed"
    krevetkiSpeed3.Value = value2
    krevetkiSpeed3.Parent = speedModifiers

    v8.speedValue = krevetkiSpeed3
  end
end

localPlayer2.CharacterAdded:Connect(function(character2)
  if getgenv().KrevetkiActiveGen ~= v1 then
    return
  end

  v8.triedTools = {}
  v8.shotCount = {}
  v8.reloadCooldown = {}
  v8.attemptedCrates = {}
  v8.orbitAngle = 0
  v8.CrateLock = nil
  v8.ESPData = {}
  v8.speedValue = nil
  v8.lastTargetBear = nil
  v8.lastTargetHP = nil

  task.wait(1)

  if getgenv().KrevetkiActiveGen ~= v1 then
    return
  end

  makeFolder(v7.SpeedMultiplier)
end)

task.spawn(function()
  while getgenv().KrevetkiActiveGen == v1 do
    task.wait(0.05)
  end
end)

task.spawn(function()
  while getgenv().KrevetkiActiveGen == v1 do
    task.wait(0.1)
  end
end)

task.spawn(function()
  while getgenv().KrevetkiActiveGen == v1 do
    task.wait(0.4)
  end
end)

task.spawn(function()
  while getgenv().KrevetkiActiveGen == v1 do
    task.wait(0.1)
  end
end)

task.spawn(function()
  while getgenv().KrevetkiActiveGen == v1 do
    task.wait(0.5)

    if v7.SpeedMultiplier > 1 then
      pcall(makeFolder, v7.SpeedMultiplier)
    end
  end
end)

task.spawn(function()
  while getgenv().KrevetkiActiveGen == v1 do
    task.wait(3)

    if v7.BearFarm or v7.LootFarm then
      v8.triedTools = {}
      local now = os.clock()

      for key, value3 in pairs(v8.reloadCooldown) do
        if now > value3 + 10 then
          v8.reloadCooldown[key] = nil
        end
      end

      if v8.CrateLock then
        if os.clock() - v8.CrateLock.startTime > v7.CrateMaxLock then
          v8.attemptedCrates[v8.CrateLock.crate] = os.clock()
          v8.CrateLock = nil
        end
      end
    end
  end
end)

local v9

for _, value4 in ipairs({ "Blood", "Crimson", "Amethyst", "Default" }) do
  local ok2, result2 = pcall(function()
    return rayfield:CreateWindow({
      Name = "Krevetki Hub v0.4",
      LoadingTitle = "Krevetki Hub",
      LoadingSubtitle = "by Innovator",
      Theme = value4,
      ConfigurationSaving = { Enabled = false },
      Discord = {
        Enabled = true,
        Invite = "https://discord.gg/uP2TbsB6N",
        RememberJoins = true,
      },
      KeySystem = false,
    })
  end)

  if ok2 and result2 then
    v9 = result2
    break
  end
end

if not v9 then
  return
end

getgenv().KrevetkiMiniWindow = v9
local genv = getgenv()

local function f3(p4, p5)
  if p4 then
    pcall(function() p4:CreateSlider(p5) end)
  end
end

genv.KrevetkiMiniLoaded = true

local function f4(p6, p7)
  if p6 then
    pcall(function() p6:CreateSection(p7) end)
  end
end

local function f5(p8, p9)
  if p8 then
    pcall(function() p8:CreateLabel(p9) end)
  end
end

local function f6(p10)
  local ok3, result3 = pcall(function() return v9:CreateTab(p10) end)

  if ok3 and result3 then
    return result3
  end

  return nil
end

local function f7(p11, p12)
  if p11 then
    pcall(function() p11:CreateToggle(p12) end)
  end
end

local function f8(other, p13)
  if other then
    pcall(function() other:CreateButton(p13) end)
  end
end

local bearFarm = f6("Bear Farm")
local lootFarm = f6("Loot Farm")
local esp = f6("ESP")
local other2 = f6("Other")
local list = {}

pcall(function()
  local bears = replicatedStorage:FindFirstChild("Bears")

  if bears then
    for _, value5 in ipairs(bears:GetChildren()) do
      table.insert(list, value5.Name)
    end
  end

  table.sort(list)
end)

if #list == 0 then
  list = { "DemonBear", "GhostBear", "Grizzly", "Polar", "Black" }
end

f4(bearFarm, "Master")

f7(bearFarm, {
  Name = "Enable Bear Farm",
  CurrentValue = false,
  Flag = "BearFarm",
  Callback = function(value6) v7.BearFarm = value6 end,
})

f4(bearFarm, "Blacklist (Ignore)")
f5(bearFarm, "Toggle bears that auto farm should SKIP")

for _, value7 in ipairs(list) do
  local v10 = seen[value7]

  f7(bearFarm, {
    Name = "Ignore " .. value7,
    CurrentValue = v10 == true,
    Flag = "IgnoreBear_" .. value7,
    Callback = function(value8)
      if value8 then
        seen[value7] = true
      else
        seen[value7] = nil
      end

      f1()
    end,
  })
end

f4(bearFarm, "Orbit")

f3(bearFarm, {
  Name = "Orbit Speed",
  Range = { 2, 30 },
  Increment = 1,
  Suffix = " rad/s",
  CurrentValue = 22,
  Flag = "OrbitSpeed",
  Callback = function(value9) v7.OrbitSpeed = value9 end,
})

f3(bearFarm, {
  Name = "Orbit Radius (x Optimal)",
  Range = { 2, 15 },
  Increment = 1,
  Suffix = " /10",
  CurrentValue = 6,
  Flag = "OrbitRadius",
  Callback = function(value10) v7.OrbitRadiusMult = value10 / 10 end,
})

f3(bearFarm, {
  Name = "Orbit Above",
  Range = { 0, 10 },
  Increment = 1,
  Suffix = " studs",
  CurrentValue = 2,
  Flag = "OrbitAbove",
  Callback = function(value11) v7.OrbitAbove = value11 end,
})

f4(bearFarm, "Approach (Teleport)")

f3(bearFarm, {
  Name = "TP Behind Distance",
  Range = { 2, 15 },
  Increment = 1,
  Suffix = " studs",
  CurrentValue = 5,
  Flag = "TPBehind",
  Callback = function(value12) v7.TPBehind = value12 end,
})

f3(bearFarm, {
  Name = "TP Height Above",
  Range = { 0, 8 },
  Increment = 1,
  Suffix = " studs",
  CurrentValue = 1,
  Flag = "TPAbove",
  Callback = function(value13) v7.TPAbove = value13 end,
})

f3(bearFarm, {
  Name = "TP Cooldown",
  Range = { 5, 30 },
  Increment = 1,
  Suffix = " /10 s",
  CurrentValue = 10,
  Flag = "TPBearCD",
  Callback = function(value14) v7.TPBearCooldown = value14 / 10 end,
})

f4(bearFarm, "Combat")

f7(bearFarm, {
  Name = "Use Gun",
  CurrentValue = true,
  Flag = "UseGun",
  Callback = function(value15) v7.UseGun = value15 end,
})

f7(bearFarm, {
  Name = "Use Melee",
  CurrentValue = true,
  Flag = "UseMelee",
  Callback = function(value16) v7.UseMelee = value16 end,
})

f3(bearFarm, {
  Name = "Gun Range",
  Range = { 5, 50 },
  Increment = 1,
  Suffix = " studs",
  CurrentValue = 15,
  Flag = "GunRange",
  Callback = function(value17) v7.GunRange = value17 end,
})

f3(bearFarm, {
  Name = "Melee Range",
  Range = { 3, 20 },
  Increment = 1,
  Suffix = " studs",
  CurrentValue = 20,
  Flag = "MeleeRange",
  Callback = function(value18) v7.MeleeRange = value18 end,
})

f3(bearFarm, {
  Name = "Gun Cooldown",
  Range = { 1, 20 },
  Increment = 1,
  Suffix = " /10 s",
  CurrentValue = 1,
  Flag = "GunCD",
  Callback = function(value19) v7.GunCooldown = value19 / 10 end,
})

f3(bearFarm, {
  Name = "Melee Cooldown",
  Range = { 1, 20 },
  Increment = 1,
  Suffix = " /10 s",
  CurrentValue = 1,
  Flag = "MeleeCD",
  Callback = function(value20) v7.MeleeCooldown = value20 / 10 end,
})

f4(lootFarm, "Master")

f7(lootFarm, {
  Name = "Enable Loot Farm",
  CurrentValue = false,
  Flag = "LootFarm",
  Callback = function(value21) v7.LootFarm = value21 end,
})

f7(lootFarm, {
  Name = "Collect Pages",
  CurrentValue = true,
  Flag = "FarmPages",
  Callback = function(value22) v7.FarmPages = value22 end,
})

f7(lootFarm, {
  Name = "Collect Crates",
  CurrentValue = true,
  Flag = "FarmCrates",
  Callback = function(value23) v7.FarmCrates = value23 end,
})

f3(lootFarm, {
  Name = "Loot Search Range",
  Range = { 50, 1000 },
  Increment = 50,
  Suffix = " studs",
  CurrentValue = 400,
  Flag = "LootRange",
  Callback = function(value24) v7.LootSearchRange = value24 end,
})

f3(lootFarm, {
  Name = "TP Cooldown",
  Range = { 2, 20 },
  Increment = 1,
  Suffix = " /10 s",
  CurrentValue = 5,
  Flag = "TPLootCD",
  Callback = function(value25) v7.TPLootCooldown = value25 / 10 end,
})

f4(lootFarm, "Crate Behavior")
f5(lootFarm, "Settings")

f3(lootFarm, {
  Name = "Crate Stay Time",
  Range = { 10, 80 },
  Increment = 5,
  Suffix = " /10 s",
  CurrentValue = 30,
  Flag = "CrateStay",
  Callback = function(value26) v7.CrateStayTime = value26 / 10 end,
})

f3(lootFarm, {
  Name = "E Spam Interval",
  Range = { 1, 20 },
  Increment = 1,
  Suffix = " /100 s",
  CurrentValue = 5,
  Flag = "ESpam",
  Callback = function(value27) v7.ESpamInterval = value27 / 100 end,
})

f4(lootFarm, "Pages")

f3(lootFarm, {
  Name = "Page Hold Time",
  Range = { 10, 30 },
  Increment = 1,
  Suffix = " /10 s",
  CurrentValue = 15,
  Flag = "PageHold",
  Callback = function(value28) v7.PageHoldTime = value28 / 10 end,
})

f4(esp, "ESP")

f7(esp, {
  Name = "Enable ESP",
  CurrentValue = false,
  Flag = "ESP",
  Callback = function(value29)
    v7.ESPEnabled = value29

    if not value29 then
      for _, value30 in pairs(v8.ESPData) do
        f2(value30)
      end

      v8.ESPData = {}
    end
  end,
})

f7(esp, {
  Name = "Show Players",
  CurrentValue = true,
  Flag = "ESPPlayers",
  Callback = function(value31) v7.ESPPlayers = value31 end,
})

f7(esp, {
  Name = "Show Bears",
  CurrentValue = true,
  Flag = "ESPBears",
  Callback = function(value32) v7.ESPBears = value32 end,
})

f3(esp, {
  Name = "Max Distance",
  Range = { 100, 2000 },
  Increment = 100,
  Suffix = " studs",
  CurrentValue = 500,
  Flag = "ESPDist",
  Callback = function(value33)
    v7.ESPDistance = value33

    for _, value34 in pairs(v8.ESPData) do
      if value34.billboard then
        value34.billboard.MaxDistance = value33
      end
    end
  end,
})

f5(esp, "Player Bears show [BEAR]")
f5(esp, "BEARS :/")

f4(other2, "Stamina")

f7(other2, {
  Name = "Infinite Stamina",
  CurrentValue = false,
  Flag = "InfStam",
  Callback = function(value35) v7.InfiniteStamina = value35 end,
})

f4(other2, "Speed")
f5(other2, "Uses SpeedModifiers (safe from anti-tamper)")

f3(other2, {
  Name = "Speed Multiplier",
  Range = { 10, 30 },
  Increment = 1,
  Suffix = " /10",
  CurrentValue = 10,
  Flag = "SpeedMult",
  Callback = function(value36)
    v7.SpeedMultiplier = value36 / 10
    makeFolder(v7.SpeedMultiplier)
  end,
})

f4(other2, "Danger Zone")

f8(other2, {
  Name = "Hard Stop",
  Callback = function()
    v7.BearFarm = false
    v7.LootFarm = false
    v7.ESPEnabled = false
    v7.InfiniteStamina = false
    v7.SpeedMultiplier = 1

    v8.CrateLock = nil
    makeFolder(1)

    for _, value37 in pairs(v8.ESPData) do
      f2(value37)
    end

    v8.ESPData = {}

    getgenv().KrevetkiActiveGen = -1
    getgenv().KrevetkiCurrentTPToken = nil
    getgenv().KrevetkiTPAllowedTokens = {}

    if getgenv().KrevetkiMiniWindow and getgenv().KrevetkiMiniWindow.Destroy then
      pcall(function() getgenv().KrevetkiMiniWindow:Destroy() end)
    end

    getgenv().KrevetkiMiniWindow = nil
    getgenv().KrevetkiMiniLoaded = nil
  end,
})
