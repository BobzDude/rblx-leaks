-- deobf by L0LeR
-- also MoonSec v3 is shit

local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))
v2 = v2()
local v1 = v2:MakeWindow({
	Name = "RR nilsploit | nilaura | nilauraz | [ Early Access ]",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "EmotePlayerConfig",
})
local v3 = v1:MakeTab({ Name = "Fighting shit", Icon = "rbxassetid://4483345998", PremiumOnly = false })
local v4 = v3:AddSection({ Name = "Ultimate stuf" })
v3:AddButton({
	Name = "Auto Domain Clash",
	Callback = function()
	local v5 = game:GetService("UserInputService")
	function(a)
		game.StarterGui:SetCore("SendNotification", { Title = "Winning fr red FN", Text = a, Duration = 2 })
	end("Injected")
	local v6 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	v6 = v6:WaitForChild("MainUI")
	v6 = v6:WaitForChild("Domain")
	v6 = v6:WaitForChild("Clashing")
	v6 = v6:WaitForChild("Key")

	local function v7()
		local v8 = tick()

		while true do
			local v9 = tick()

			if v9 < v8 + 3 then
				v9 = game:GetService("VirtualInputManager")
				v9:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
				wait(0.2)
			end

		end

		v9 = game:GetService("VirtualInputManager")
		v9:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
	end

	local v10 = game:GetService("RunService")
	v10.RenderStepped:Connect(function()
		local v11 = tick()

		if _u0.AbsolutePosition ~= _u1 then

			if 30 < v11 - _u2 then
				_u3()
				_u2 = v11
			end

		end

		_u1 = _u0.AbsolutePosition
	end)
end,
})
local v12 = v1:MakeTab({ Name = "Emotes", Icon = "rbxassetid://7743875962", PremiumOnly = false })
local v13 = game:GetService("ReplicatedStorage")
local v14, v13, v15 = pairs(v13.Emotes:GetChildren())

while true do
	table.insert(v16, v17.Name)

	for v18, v17 in v14, v13, v15 do
	end

	local function v19()
		local v20 = isfolder(_u0)

		if v20 then
			makefolder(_u0)
		end

		local v21 = game:GetService("HttpService")
		writefile(_u0 .. "/" .. _u1)
	end

	function()
		local v23 = isfolder(_u0)

		if not v23 then
			v23 = isfile(_u0 .. "/" .. _u1)

			if not v23 then
				v23 = game:GetService("HttpService")
				v23 = v23:JSONDecode(v23)
				_u2 = v23
			end

		end
	end()
	v12:AddDropdown({
		Name = "Select Emote",
		Default = v16[1],
		Options = v16,
		Callback = function(a) _u0 = a end,
	})
	v12:AddToggle({
		Name = "Loop Emotes",
		Default = false,
		Callback = function(a) _u0 = a end,
	})

	local function v25()
		local v26 = game:GetService("ReplicatedStorage")
		v26 = v26:WaitForChild("Replicate")
		v26:FireServer(v26)
	end

	local function v29()
		if not game.Players.LocalPlayer.Character then
			local v30 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

			if not v30 then
				v30.AnimationPlayed:Wait()
			end

		end
	end

	v12:AddButton({
		Name = "Play Emote",
		Callback = function()
		if not _u0 then

			while true do

				if not _u0 then
					_u1()
					_u2()
				end

			else
				_u1()
			end

		end
	end,
	})
	v12:AddButton({
		Name = "Sound and Animation is FE",
		Callback = function() print("button pressed") end,
	})
	local v31 = v1:MakeTab({ Name = "Customz", Icon = "rbxassetid://7733920519", PremiumOnly = false })
	local v32 = v31:AddSection({ Name = "Custom Charactarz" })
	v31:AddButton({
		Name = "Earths Warrior to Megumi",
		Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.AnimationPlayed:Connect(function(a)
			if a.Animation.AnimationId == "rbxassetid://17585930276" then
				local v33 = Instance.new("Animation")
				v33.AnimationId = "rbxassetid://17082682572"
				local v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
				v34 = v34:LoadAnimation(v33)
				v34.Priority = Enum.AnimationPriority.Action4
				v34:Play()
				v34:AdjustSpeed(0.74)
				a.Ended:Connect(function() _u0:Stop() end)
			else

				if a.Animation.AnimationId == "rbxassetid://17585779478" then
					v33 = Instance.new("Animation")
					v33.AnimationId = "rbxassetid://17683758573"
					v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
					v34 = v34:LoadAnimation(v33)
					v34.Priority = Enum.AnimationPriority.Action4
					v34:Play()
					v34:AdjustSpeed(1)
					a.Ended:Connect(function() _u0:Stop() end)
				else
					if a.Animation.AnimationId == "rbxassetid://17585782788" then
						v34 = Instance.new("Animation")
						v34.AnimationId = "rbxassetid://17147384246"
						local v35 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
						v35 = v35:LoadAnimation(v34)
						v35.Priority = Enum.AnimationPriority.Action4
						v35:Play()
						v35:AdjustSpeed(3.3)
						task.wait(0.5)
						v35:AdjustSpeed(0.75)
						a.Ended:Connect(function() _u0:Stop() end)
					else

						if a.Animation.AnimationId == "rbxassetid://17585761154" then
							v33 = Instance.new("Animation")
							v33.AnimationId = "rbxassetid://17647684136"
							v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
							v34 = v34:LoadAnimation(v33)
							v34.Priority = Enum.AnimationPriority.Action4
							v34:Play()
							v34:AdjustSpeed(1.2)
							task.wait(5)
							v34:Stop()
						else

							if a.Animation.AnimationId == "rbxassetid://18630466245" then
								v34 = Instance.new("Animation")
								v34.AnimationId = "rbxassetid://17228130181"
								v35 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
								v35 = v35:LoadAnimation(v34)
								v35.Priority = Enum.AnimationPriority.Action4
								v35:Play()
								v35:AdjustSpeed(1)
								v35.Ended:Connect(function() _u0:Stop() end)
							else

								if a.Animation.AnimationId == "rbxassetid://17585756242" then
									v33 = Instance.new("Animation")
									v33.AnimationId = "rbxassetid://18783223946"
									v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
									v34 = v34:LoadAnimation(v33)
									v34.Priority = Enum.AnimationPriority.Action4
									v34:Play()
									v34:AdjustSpeed(1.11)
									task.wait(3.6)
									v34:Stop()
								else

									if a.Animation.AnimationId == "rbxassetid://18367915097" then
										v33 = Instance.new("Animation")
										v33.AnimationId = "rbxassetid://18485007811"
										v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
										v34 = v34:LoadAnimation(v33)
										v34.Priority = Enum.AnimationPriority.Action4
										v34:Play()
										v34:AdjustSpeed(0.46)
										a.Ended:Connect(function() _u0:Stop() end)
									else

										if a.Animation.AnimationId == "rbxassetid://18878778259" then
											v33 = Instance.new("Animation")
											v33.AnimationId = "rbxassetid://18135518032"
											v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
											v34 = v34:LoadAnimation(v33)
											v34.Priority = Enum.AnimationPriority.Action4
											v34:Play()
											v34:AdjustSpeed(0.45)
											a.Ended:Connect(function() _u0:Stop() end)
										else

											if a.Animation.AnimationId == "rbxassetid://17585797722" then
												v33 = Instance.new("Animation")
												v33.AnimationId = "rbxassetid://17334373908"
												v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
												v34 = v34:LoadAnimation(v33)
												v34.Priority = Enum.AnimationPriority.Action4
												v34:Play()
												v34:AdjustSpeed(0.54)
											else

												if a.Animation.AnimationId == "rbxassetid://17512405176" then
													v33 = Instance.new("Animation")
													v33.AnimationId = "rbxassetid://17484047260"
													v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
													v34 = v34:LoadAnimation(v33)
													v34.Priority = Enum.AnimationPriority.Action4
													v34:Play()
													v34:AdjustSpeed(1)
												else

													if a.Animation.AnimationId == "rbxassetid://17512406013" then
														v33 = Instance.new("Animation")
														v33.AnimationId = "rbxassetid://18533571529"
														v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
														v34 = v34:LoadAnimation(v33)
														v34.Priority = Enum.AnimationPriority.Action4
														v34:Play()
														v34:AdjustSpeed(1)
													else

														if a.Animation.AnimationId == "rbxassetid://17512406792" then
															v33 = Instance.new("Animation")
															v33.AnimationId = "rbxassetid://17484049211"
															v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
															v34 = v34:LoadAnimation(v33)
															v34.Priority = Enum.AnimationPriority.Action4
															v34:Play()
															v34:AdjustSpeed(1)
														else

															if a.Animation.AnimationId == "rbxassetid://17512407570" then
																v33 = Instance.new("Animation")
																v33.AnimationId = "rbxassetid://17239329484"
																v34 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
																v34 = v34:LoadAnimation(v33)
																v34.Priority = Enum.AnimationPriority.Action4
																v34:Play()
																v34:AdjustSpeed(1)
															end

														end

													end

												end

											end

										end

									end

								end

							end

						end

					end

				end

			end
		end)
	end,
	})
	local v36 = v1:MakeTab({ Name = "Discord Credits", Icon = "rbxassetid://7733965249", PremiumOnly = false })
	local v37 = v36:AddSection({ Name = "Add the Owners & Devs " })
	v36:AddButton({
		Name = "Copy Discord Server Link",
		Callback = function() setclipboard("https://discord.gg/nilsploit") end,
	})
	v36:AddButton({
		Name = "nilaura [ Osaka ] [ Owner + Dev ]",
		Callback = function() setclipboard("nilaura") end,
	})
	v36:AddButton({
		Name = "kusakamono [ Kusaka ] [ CEO + Dev ]",
		Callback = function() setclipboard("kusakamono") end,
	})
	v36:AddButton({
		Name = "nilauraz [ Osaka [ Compound V ] ] [ Owner Reincarnation + Dev ]",
		Callback = function() setclipboard("nilauraz") end,
	})
	v2:Init()
