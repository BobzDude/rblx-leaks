-- original script name is stupid so named it like this
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
game:GetService("UserInputService")
game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = Workspace.CurrentCamera
local v1 = (function()
	local tbl = {
		infAmmo = false,
		rapidFire = false,
		noSpread = false,
		instaReload = false,
		damageBoost = false,
		pagesEsp = false,
		bearEsp = false,
		autoFarm = false,
		autoGrinder = false,
		targetGunName = ""
	}

	if readfile and pcall(readfile, "medved_config_v5.json") then
		local ok, result = pcall(function()
			return HttpService:JSONDecode(readfile("medved_config_v5.json"))
		end)
		if ok and type(result) == "table" then
			for k, v1 in pairs(tbl) do
				if result[k] == nil then
					result[k] = v1
				end
			end
			return result
		end
	end

	return tbl
end)()
local infAmmo = v1.infAmmo
local rapidFire = v1.rapidFire
local noSpread = v1.noSpread
local instaReload = v1.instaReload
local damageBoost = v1.damageBoost
local pagesEsp = v1.pagesEsp
local bearEsp = v1.bearEsp
local autoFarm = v1.autoFarm
local autoGrinder = v1.autoGrinder
local targetGunName = v1.targetGunName

local function func()
	local tbl = {
		infAmmo = infAmmo,
		rapidFire = rapidFire,
		noSpread = noSpread,
		instaReload = instaReload,
		damageBoost = damageBoost,
		pagesEsp = pagesEsp,
		bearEsp = bearEsp,
		autoFarm = autoFarm,
		autoGrinder = autoGrinder,
		targetGunName = targetGunName
	}
	pcall(function()
		if writefile then
			writefile("medved_config_v5.json", HttpService:JSONEncode(tbl))
		end
	end)
end

local tbl = {}
local tbl1 = {}

local function func1(arg1)
	if arg1:find("grizzlytall") or arg1:find("grizzly") and arg1:find("tall") then
		return 5
	end

	if arg1:find("tall") then
		return 4
	end

	if arg1:find("grizzlymedved") or arg1:find("grizzly") and arg1:find("medved") then
		return 3
	end

	if arg1:find("thin") then
		return 1
	end

	return 2
end

LocalPlayer.Idled:Connect(function()
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)
local num = 120
task.spawn(function()
	while true do
		task.wait(1)
		if autoFarm or autoGrinder then
			num = num - 1
			if num <= 0 then
				num = 120
				pcall(function()
					local Character = LocalPlayer.Character
					local v1 = Character and Character:FindFirstChildOfClass("Humanoid")

					if v1 then
						v1.Health = 0
					end
				end)
			end
		else
			num = 120
		end
	end
end)
task.spawn(function()
	while true do
		task.wait(0.2)
		pcall(function()
			local Character = LocalPlayer.Character
			local v1 = Character and Character:FindFirstChild("HumanoidRootPart")
			local v2 = Character and Character:FindFirstChildOfClass("Humanoid")

			if v1 and v2 then
				if v1.Position.Y < -150 or v2.Health <= 0 and v1.Position.Y < -20 then
					pcall(function()
						local Character = LocalPlayer.Character
						local v1 = Character and Character:FindFirstChildOfClass("Humanoid")

						if v1 then
							v1.Health = 0
						end

						task.wait(0.3)
						local v2 =
							Workspace:FindFirstChild("Respawn", true)
								or ReplicatedStorage:FindFirstChild("Respawn", true)

						if v2 and v2:IsA("RemoteEvent") then
							v2:FireServer()
						elseif Character then
							Character:BreakJoints()
						end
					end)
					task.wait(2)
				end
			end
		end)
	end
end)
LocalPlayer.CharacterAdded:Connect(function(character)
	task.wait(0.5)
	pcall(function()
		local Humanoid = character:WaitForChild("Humanoid", 5)
		if Humanoid then
			Humanoid.Died:Connect(function()
				if autoFarm or autoGrinder then
					task.wait(1)
					pcall(function()
						local Character = LocalPlayer.Character
						local v1 = Character and Character:FindFirstChildOfClass("Humanoid")

						if v1 then
							v1.Health = 0
						end

						task.wait(0.3)
						local v2 =
							Workspace:FindFirstChild("Respawn", true)
								or ReplicatedStorage:FindFirstChild("Respawn", true)

						if v2 and v2:IsA("RemoteEvent") then
							v2:FireServer()
						elseif Character then
							Character:BreakJoints()
						end
					end)
				end
			end)
		end
	end)
end)
local medvedDestroyerGUI = Instance.new("ScreenGui")
medvedDestroyerGUI.Name = "MedvedDestroyerGUI"
medvedDestroyerGUI.ResetOnSpawn = false
medvedDestroyerGUI.IgnoreGuiInset = true
medvedDestroyerGUI.Parent = CoreGui
local timerHUD = Instance.new("Frame")
timerHUD.Name = "TimerHUD"
timerHUD.Size = UDim2.new(0, 200, 0, 52)
timerHUD.Position = UDim2.new(0.5, -100, 0, 10)
timerHUD.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
timerHUD.BackgroundTransparency = 0.15
timerHUD.BorderSizePixel = 0
timerHUD.Active = true
timerHUD.Draggable = true
timerHUD.Parent = medvedDestroyerGUI
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = timerHUD
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(0, 170, 255)
uiStroke.Transparency = 0.3
uiStroke.Thickness = 1.2
uiStroke.Parent = timerHUD
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, -12, 0, 18)
textLabel.Position = UDim2.new(0, 6, 0, 4)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Ping: 0 ms"
textLabel.TextColor3 = Color3.fromRGB(0, 220, 255)
textLabel.TextSize = 10
textLabel.Font = Enum.Font.GothamBold
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.Parent = timerHUD
local textLabel1 = Instance.new("TextLabel")
textLabel1.Size = UDim2.new(1, -12, 0, 22)
textLabel1.Position = UDim2.new(0, 6, 0, 24)
textLabel1.BackgroundTransparency = 1
textLabel1.Text = "Auto resetting in: 2m 0s"
textLabel1.TextColor3 = Color3.fromRGB(200, 210, 225)
textLabel1.TextSize = 10
textLabel1.Font = Enum.Font.GothamMedium
textLabel1.TextXAlignment = Enum.TextXAlignment.Left
textLabel1.Parent = timerHUD
RunService.RenderStepped:Connect(function()
	pcall(function()
		local num1 = 0

		if Stats and Stats.Network and Stats.Network.ServerStatsItem then
			local DataPing = Stats.Network.ServerStatsItem:FindFirstChild("Data Ping")
			if DataPing then
				num1 = math.floor(DataPing:GetValue())
			end
		end

		textLabel.Text = "Ping: " .. num1 .. " ms"

		if autoFarm or autoGrinder then
			local v1 = math.floor(num / 60)
			local v2 = num % 60
			textLabel1.Text = string.format("Auto resetting in: %dm %ds", v1, v2)
		else
			textLabel1.Text = "Auto resetting in: Paused"
		end
	end)
end)
local textButton = Instance.new("TextButton")
textButton.Size = UDim2.new(0, 42, 0, 42)
textButton.Position = UDim2.new(0, 20, 0.4, 0)
textButton.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
textButton.BackgroundTransparency = 0.1
textButton.BorderSizePixel = 0
textButton.Text = ""
textButton.TextColor3 = Color3.fromRGB(0, 200, 255)
textButton.TextSize = 18
textButton.Font = Enum.Font.GothamBold
textButton.Active = true
textButton.Draggable = true
textButton.Parent = medvedDestroyerGUI
local uiCorner1 = Instance.new("UICorner")
uiCorner1.CornerRadius = UDim.new(1, 0)
uiCorner1.Parent = textButton
local uiStroke1 = Instance.new("UIStroke")
uiStroke1.Color = Color3.fromRGB(0, 170, 255)
uiStroke1.Thickness = 1.5
uiStroke1.Parent = textButton
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 280, 0, 400)
mainFrame.Position = UDim2.new(0.5, -140, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 18)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = medvedDestroyerGUI
local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 12)
uiCorner2.Parent = mainFrame
local uiStroke2 = Instance.new("UIStroke")
uiStroke2.Color = Color3.fromRGB(0, 170, 255)
uiStroke2.Transparency = 0.3
uiStroke2.Thickness = 1.5
uiStroke2.Parent = mainFrame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 0, 36)
frame.BackgroundTransparency = 1
frame.Parent = mainFrame
local textLabel2 = Instance.new("TextLabel")
textLabel2.Size = UDim2.new(1, -40, 1, 0)
textLabel2.Position = UDim2.new(0, 10, 0, 0)
textLabel2.BackgroundTransparency = 1
textLabel2.Text = "MEDVED DESTROYER [STABLE]"
textLabel2.TextColor3 = Color3.fromRGB(0, 200, 255)
textLabel2.TextSize = 11
textLabel2.Font = Enum.Font.GothamBold
textLabel2.TextXAlignment = Enum.TextXAlignment.Left
textLabel2.Parent = frame
local textButton1 = Instance.new("TextButton")
textButton1.Size = UDim2.new(0, 32, 0, 32)
textButton1.Position = UDim2.new(1, -34, 0.5, -16)
textButton1.BackgroundTransparency = 1
textButton1.Text = "✕"
textButton1.TextColor3 = Color3.fromRGB(160, 170, 190)
textButton1.TextSize = 14
textButton1.Font = Enum.Font.GothamBold
textButton1.Parent = frame
local creditsBanner = Instance.new("TextLabel")
creditsBanner.Name = "CreditsBanner"
creditsBanner.Size = UDim2.new(1, -20, 0, 18)
creditsBanner.Position = UDim2.new(0, 10, 0, 32)
creditsBanner.BackgroundTransparency = 1
creditsBanner.Text = "Made by BasicEast (superleg5nd)"
creditsBanner.TextColor3 = Color3.fromRGB(0, 220, 255)
creditsBanner.TextSize = 10
creditsBanner.Font = Enum.Font.GothamBold
creditsBanner.TextXAlignment = Enum.TextXAlignment.Left
creditsBanner.Parent = mainFrame

local function func2()
	mainFrame.Visible = not mainFrame.Visible
end

textButton1.MouseButton1Click:Connect(func2)
textButton.MouseButton1Click:Connect(func2)
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, -16, 1, -56)
scrollingFrame.Position = UDim2.new(0, 8, 0, 52)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollingFrame.ScrollBarThickness = 2
scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
scrollingFrame.Parent = mainFrame
local uiListLayout = Instance.new("UIListLayout")
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 6)
uiListLayout.Parent = scrollingFrame
local uiPadding = Instance.new("UIPadding")
uiPadding.PaddingBottom = UDim.new(0, 10)
uiPadding.Parent = scrollingFrame
local frame1 = Instance.new("Frame")
frame1.Size = UDim2.new(1, 0, 0, 34)
frame1.BackgroundColor3 = Color3.fromRGB(15, 25, 40)
frame1.BackgroundTransparency = 0.2
frame1.BorderSizePixel = 0
frame1.Parent = scrollingFrame
local uiCorner3 = Instance.new("UICorner")
uiCorner3.CornerRadius = UDim.new(0, 8)
uiCorner3.Parent = frame1
local textLabel3 = Instance.new("TextLabel")
textLabel3.Size = UDim2.new(1, -12, 1, 0)
textLabel3.Position = UDim2.new(0, 6, 0, 0)
textLabel3.BackgroundTransparency = 1
textLabel3.Text = "Status: Idle"
textLabel3.TextColor3 = Color3.fromRGB(0, 220, 255)
textLabel3.TextSize = 11
textLabel3.Font = Enum.Font.GothamMedium
textLabel3.TextXAlignment = Enum.TextXAlignment.Left
textLabel3.Parent = frame1
local textButton2 = Instance.new("TextButton")
textButton2.Size = UDim2.new(1, 0, 0, 34)
textButton2.BackgroundColor3 = Color3.fromRGB(15, 35, 50)
textButton2.BackgroundTransparency = 0.2
textButton2.BorderSizePixel = 0
textButton2.AutoButtonColor = false
textButton2.Text = ""
textButton2.Parent = scrollingFrame
local uiCorner4 = Instance.new("UICorner")
uiCorner4.CornerRadius = UDim.new(0, 8)
uiCorner4.Parent = textButton2
local textLabel4 = Instance.new("TextLabel")
textLabel4.Size = UDim2.new(1, -16, 1, 0)
textLabel4.Position = UDim2.new(0, 8, 0, 0)
textLabel4.BackgroundTransparency = 1
textLabel4.Text = targetGunName ~= "" and "Gun: " .. targetGunName or "Equip Gun & Click: Set Gun"
textLabel4.TextColor3 = Color3.fromRGB(0, 200, 255)
textLabel4.TextSize = 11
textLabel4.Font = Enum.Font.GothamBold
textLabel4.TextXAlignment = Enum.TextXAlignment.Left
textLabel4.Parent = textButton2
textButton2.MouseButton1Click:Connect(function()
	local Character = LocalPlayer.Character
	local v1 = Character and Character:FindFirstChildOfClass("Tool")

	if v1 then
		targetGunName = v1.Name
		textLabel4.Text = "Gun: " .. targetGunName
		func()
	else
		textLabel4.Text = "Hold gun first!"
		task.wait(1)
		textLabel4.Text =
			targetGunName ~= "" and "Gun: " .. targetGunName or "Equip Gun & Click: Set Gun"
	end
end)

local function func3(text, arg2, arg3)
	local textButton = Instance.new("TextButton")
	textButton.Size = UDim2.new(1, 0, 0, 34)
	textButton.BackgroundColor3 = Color3.fromRGB(20, 24, 34)
	textButton.BackgroundTransparency = 0.2
	textButton.BorderSizePixel = 0
	textButton.AutoButtonColor = false
	textButton.Text = ""
	textButton.Parent = scrollingFrame
	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = UDim.new(0, 8)
	uiCorner.Parent = textButton
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, -44, 1, 0)
	textLabel.Position = UDim2.new(0, 10, 0, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = text
	textLabel.TextColor3 = arg2 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 210, 225)
	textLabel.TextSize = 11
	textLabel.Font = Enum.Font.GothamMedium
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = textButton
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 32, 0, 16)
	frame.Position = UDim2.new(1, -38, 0.5, -8)
	frame.BackgroundColor3 = arg2 and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(35, 42, 58)
	frame.BorderSizePixel = 0
	frame.Parent = textButton
	local uiCorner1 = Instance.new("UICorner")
	uiCorner1.CornerRadius = UDim.new(1, 0)
	uiCorner1.Parent = frame
	local frame1 = Instance.new("Frame")
	frame1.Size = UDim2.new(0, 12, 0, 12)
	frame1.Position = arg2 and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
	frame1.BackgroundColor3 =
		arg2 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 160, 180)
	frame1.BorderSizePixel = 0
	frame1.Parent = frame
	local uiCorner2 = Instance.new("UICorner")
	uiCorner2.CornerRadius = UDim.new(1, 0)
	uiCorner2.Parent = frame1
	local v1 = arg2
	textButton.MouseButton1Click:Connect(function()
		v1 = not v1

		if v1 then
			frame.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
			frame1.Position = UDim2.new(1, -14, 0.5, -6)
			frame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		else
			frame.BackgroundColor3 = Color3.fromRGB(35, 42, 58)
			frame1.Position = UDim2.new(0, 2, 0.5, -6)
			frame1.BackgroundColor3 = Color3.fromRGB(150, 160, 180)
			textLabel.TextColor3 = Color3.fromRGB(200, 210, 225)
		end

		arg3(v1)
		func()
	end)
end

func3(
	"Auto Farm Bears",
	autoFarm,
	function(arg1)
		autoFarm = arg1
	end
)
func3(
	"Auto farm grinder",
	autoGrinder,
	function(arg1)
		autoGrinder = arg1
	end
)
func3(
	"Continuous Inf Ammo",
	infAmmo,
	function(arg1)
		infAmmo = arg1
	end
)
func3(
	"4x Rapid Fire",
	rapidFire,
	function(arg1)
		rapidFire = arg1
	end
)
func3(
	"No Spread",
	noSpread,
	function(arg1)
		noSpread = arg1
	end
)
func3(
	"Insta Reload",
	instaReload,
	function(arg1)
		instaReload = arg1
	end
)
func3(
	"Damage Boost (10x)",
	damageBoost,
	function(arg1)
		damageBoost = arg1
	end
)
func3(
	"Pages ESP",
	pagesEsp,
	function(arg1)
		pagesEsp = arg1
		if not pagesEsp then
			for _, v1 in pairs(tbl) do
				if v1 and v1.Parent then
					v1:Destroy()
				end
			end
			tbl = {}
		end
	end
)
func3(
	"Bear ESP (Global)",
	bearEsp,
	function(arg1)
		bearEsp = arg1
		if not bearEsp then
			for _, v1 in pairs(tbl1) do
				if v1 and v1.Parent then
					v1:Destroy()
				end
			end
			tbl1 = {}
		end
	end
)
local v2
RunService.RenderStepped:Connect(function()
	if (autoFarm or autoGrinder) and v2 and v2.Parent then
		local v1 = v2.Position + Vector3.new(0, 2, 0)
		CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position, v1)
	end
end)
task.spawn(function()
	local num = 1
	while true do
		task.wait(0.5)
		if autoGrinder then
			pcall(function()
				local v1 =
					ReplicatedStorage:FindFirstChild("SharedEvents", true)
						and ReplicatedStorage.SharedEvents:FindFirstChild("PlayerBears", true)
						and ReplicatedStorage.SharedEvents.PlayerBears:FindFirstChild("BearAbility")
				if v1 and v1:IsA("RemoteEvent") then
					v1:FireServer(num)
					task.wait(2.5)
					v1:FireServer("Fire")
					v1:FireServer("Use")
					num = num % 4 + 1
					task.wait(15.5)
				end
			end)
		end
	end
end)
task.spawn(function()
	while true do
		task.wait(0.08)
		if autoFarm or autoGrinder then
			local Character = LocalPlayer.Character
			local character = Character
			character = character and Character:FindFirstChild("HumanoidRootPart")
			local v1 = Character and Character:FindFirstChildOfClass("Humanoid")
			local Backpack = LocalPlayer:FindFirstChildOfClass("Backpack")

			if Character and v1 and character and v1.Health > 0 then
				v1.HipHeight = 15

				if autoFarm and targetGunName ~= "" then
					local Tool = Character:FindFirstChildOfClass("Tool")
					if not Tool or not Tool:IsA("Tool") or Tool.Name ~= targetGunName then
						local v3 =
							Character:FindFirstChild(targetGunName)
								or Backpack and Backpack:FindFirstChild(targetGunName)
						if v3 then
							v1:EquipTool(v3)
						end
					end
				end

				local v5
				local v6
				local num = -1
				local huge = math.huge
				pcall(function()
					local Bears = Workspace:FindFirstChild("Bears")
					for _, descendant in ipairs((Bears or Workspace):GetDescendants()) do
						if descendant:IsA("Model") and descendant ~= Character then
							local v1 = descendant.Name:lower()
							if
								not (v1:find("cutie")
									or v1:find("hypersonic")
									or v1:find("demon")
									or v1:find("ghost"))
							then
								local Humanoid = descendant:FindFirstChildOfClass("Humanoid")
								if
									Humanoid
										and Humanoid.Health > 0
										and (v1:find("bear") or v1:find("medved") or v1:find("boo"))
								then
									local v2 =
										descendant.PrimaryPart
											or descendant:FindFirstChild("HumanoidRootPart")
											or descendant:FindFirstChildWhichIsA("BasePart", true)
									if v2 then
										local Magnitude =
											(v2.Position - character.Position).Magnitude
										local v3 = func1(v1)

										if v3 > num or v3 == num and Magnitude < huge then
											num = v3
											huge = Magnitude
											v5 = v2
											v6 = descendant
										end
									end
								end
							end
						end
					end
				end)
				v2 = v5

				if v5 then
					local str = "?"
					pcall(function()
						str =
							v6:FindFirstChildOfClass("Humanoid")
								and math.floor(v6:FindFirstChildOfClass("Humanoid").Health)
								or "?"
					end)
					textLabel3.Text = string.format(
						"Target: %s | HP: %s | Dist: %d",
						tostring(v6 and v6.Name),
						tostring(str),
						math.floor(huge)
					)
					local Position = v5.Position
					local Magnitude = (v5.Position - character.Position).Magnitude

					if Magnitude < 25 then
						Position = character.Position - (v5.Position - character.Position).Unit * 30
					elseif Magnitude > 55 then
						Position = v5.Position - (v5.Position - character.Position).Unit * 50
					elseif Magnitude < 45 then
						Position = character.Position - (v5.Position - character.Position).Unit * 25
					end

					local v4 = Position - character.Position

					if v4.Magnitude > 1.5 then
						character.CFrame = character.CFrame + v4.Unit * math.min(5.4, v4.Magnitude)
					end

					if autoFarm then
						local Tool1 = Character:FindFirstChildOfClass("Tool")
						if Tool1 and Tool1.Name == targetGunName then
							pcall(function()
								Tool1:Activate()
							end)
						end
					end
				else
					v2 = nil
					textLabel3.Text = "Status: Scanning radar..."
				end
			end
		else
			v2 = nil
			textLabel3.Text = "Status: Paused"
			pcall(function()
				local Character = LocalPlayer.Character
				local v1 = Character and Character:FindFirstChildOfClass("Humanoid")

				if v1 and v1.HipHeight == 15 then
					v1.HipHeight = 2
				end
			end)
		end
	end
end)
task.spawn(function()
	while true do
		task.wait(1.5)
		if pagesEsp then
			local tbl1 = {}
			pcall(function()
				for _, descendant in ipairs(Workspace:GetDescendants()) do
					if
						not descendant:IsA("TextLabel")
							and not descendant:IsA("Folder")
							and not descendant:IsA("Attachment")
					then
						local flag = false

						if
							descendant:FindFirstChild("PageLightAttach")
								or descendant:IsA("Model")
									and descendant.PrimaryPart
									and descendant.PrimaryPart:FindFirstChild("PageLightAttach")
						then
							flag = true
						elseif
							descendant.Parent
								and descendant.Parent.Name:lower() == "pages"
								and descendant:IsA("BasePart")
								and descendant.Name ~= "CollectThePages"
						then
							flag = true
						end

						if flag then
							table.insert(tbl1, descendant)
						end
					end
				end
			end)

			for k, v1 in pairs(tbl) do
				local flag = false

				for _, v2 in ipairs(tbl1) do
					if v2 == k then
						flag = true
						break
					end
				end

				if not flag then
					if v1 and v1.Parent then
						v1:Destroy()
					end
					tbl[k] = nil
				end
			end

			for _, v3 in ipairs(tbl1) do
				if not tbl[v3] then
					if
						v3:IsA("BasePart") and v3
							or v3:IsA("Model")
								and (v3.PrimaryPart or v3:FindFirstChildWhichIsA("BasePart", true))
					then
						local medvedPageHighlight = Instance.new("Highlight")
						medvedPageHighlight.Name = "MedvedPageHighlight"
						medvedPageHighlight.Adornee = v3
						medvedPageHighlight.FillColor = Color3.fromRGB(170, 0, 255)
						medvedPageHighlight.FillTransparency = 0.3
						medvedPageHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
						medvedPageHighlight.OutlineTransparency = 0
						medvedPageHighlight.Parent = CoreGui
						tbl[v3] = medvedPageHighlight
					end
				end
			end
		end
	end
end)
task.spawn(function()
	while true do
		task.wait(1)
		if bearEsp then
			local tbl = {}
			local Character = LocalPlayer.Character
			pcall(function()
				local Bears = Workspace:FindFirstChild("Bears")
				for _, descendant in ipairs((Bears or Workspace):GetDescendants()) do
					if descendant:IsA("Model") and descendant ~= Character then
						local v1 = descendant.Name:lower()
						if
							not (v1:find("cutie")
								or v1:find("hypersonic")
								or v1:find("demon")
								or v1:find("ghost"))
						then
							local Humanoid = descendant:FindFirstChildOfClass("Humanoid")
							if
								Humanoid
									and Humanoid.Health > 0
									and (v1:find("bear") or v1:find("medved") or v1:find("boo"))
							then
								if
									descendant.PrimaryPart
										or descendant:FindFirstChild("HumanoidRootPart")
										or descendant:FindFirstChildWhichIsA("BasePart", true)
								then
									table.insert(tbl, descendant)
								end
							end
						end
					end
				end
			end)

			for k, v1 in pairs(tbl1) do
				local flag = false

				for _, v2 in ipairs(tbl) do
					if v2 == k then
						flag = true
						break
					end
				end

				if not flag then
					if v1 and v1.Parent then
						v1:Destroy()
					end
					tbl1[k] = nil
				end
			end

			for _, v3 in ipairs(tbl) do
				if not tbl1[v3] then
					if v3.PrimaryPart or v3:FindFirstChildWhichIsA("BasePart", true) then
						local medvedBearHighlight = Instance.new("Highlight")
						medvedBearHighlight.Name = "MedvedBearHighlight"
						medvedBearHighlight.Adornee = v3
						medvedBearHighlight.FillColor = Color3.fromRGB(255, 50, 50)
						medvedBearHighlight.FillTransparency = 0.3
						medvedBearHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
						medvedBearHighlight.OutlineTransparency = 0
						medvedBearHighlight.Parent = CoreGui
						tbl1[v3] = medvedBearHighlight
					end
				end
			end
		end
	end
end)
RunService.Heartbeat:Connect(function()
	local Character = LocalPlayer.Character
	local v1 = Character and Character:FindFirstChildOfClass("Tool")

	if v1 then
		local Config = v1:FindFirstChild("Config")
		if Config then
			local Inaccuracy = Config:FindFirstChild("Inaccuracy")

			if Inaccuracy and (Inaccuracy:IsA("IntValue") or Inaccuracy:IsA("NumberValue")) then
				Inaccuracy.Value = noSpread and 0 or 3
			end

			local FireRate = Config:FindFirstChild("FireRate")

			if FireRate and (FireRate:IsA("IntValue") or FireRate:IsA("NumberValue")) then
				FireRate.Value = rapidFire and 0.1 or 0.4
			end

			local ReloadTime = Config:FindFirstChild("ReloadTime")

			if ReloadTime and (ReloadTime:IsA("IntValue") or ReloadTime:IsA("NumberValue")) then
				ReloadTime.Value = instaReload and 0 or 2.5
			end

			local Damage = Config:FindFirstChild("Damage")
			local damage = Damage
			local ClipSize, clipSize

			if Damage then
				if Damage:IsA("IntValue") then
					Damage.Value = damageBoost and 130 or 13
					ClipSize = Config:FindFirstChild("ClipSize")
					clipSize = ClipSize

					if ClipSize then
						if ClipSize:IsA("IntValue") then
							if infAmmo then
								ClipSize.Value = 999
							elseif ClipSize.Value > 50 then
								ClipSize.Value = 10
							end
							return
						end
						clipSize = ClipSize:IsA("NumberValue")
					end

					if clipSize then
						if infAmmo then
							ClipSize.Value = 999
						elseif ClipSize.Value > 50 then
							ClipSize.Value = 10
						end
					end

					return
				end
				damage = Damage:IsA("NumberValue")
			end

			if damage then
				Damage.Value = damageBoost and 130 or 13
			end

			ClipSize = Config:FindFirstChild("ClipSize")
			clipSize = ClipSize

			if ClipSize then
				if ClipSize:IsA("IntValue") then
					if infAmmo then
						ClipSize.Value = 999
					elseif ClipSize.Value > 50 then
						ClipSize.Value = 10
					end
					return
				end
				clipSize = ClipSize:IsA("NumberValue")
			end

			if clipSize then
				if infAmmo then
					ClipSize.Value = 999
				elseif ClipSize.Value > 50 then
					ClipSize.Value = 10
				end
			end
		end
	end
end)
print("MDestoyer loaded, deobf by Bobz")
