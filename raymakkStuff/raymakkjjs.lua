-- deobfuscated by L0LeR

local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))
v2 = v2()
local v1 = v2:MakeWindow({
	Name = "ray makk | nilaura | Unreleased Emotes & Moves | KadeHub V2",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "workspace",
})
local v3 = v1:MakeTab({ Name = "Unreleased Emotes", Icon = "rbxassetid://4483345998", PremiumOnly = false })
v3:AddButton({
	Name = "This tab is empty rn, goto Characters",
	Callback = function()
	print("idiot ass niggas bro why the fuck did your stupid ass click this button fag")
end,
})
local v4 = v1:MakeTab({ Name = "Server Stuff", Icon = "rbxassetid://4483345998", PremiumOnly = false })
v4:AddButton({
	Name = "Rejoin",
	Callback = function()
	local v5 = game:GetService("TeleportService")
	local v6 = game:GetService("Players")
	local v9 = coroutine.create(function()
		local v7, v8 = pcall(function() _u0:Teleport(game.PlaceId, _u1) end)

		if not v8 then

			if v7 then
				warn(v8)
			end

		end
	end)
	coroutine.resume(v9)
end,
})
v4:AddToggle({
	Name = "Super-Human!",
	Default = false,
	Callback = function(a)
	if not a then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 120
	else
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
	end
end,
})
local v10 = v1:MakeTab({ Name = "Moves", Icon = "rbxassetid://4483345998", PremiumOnly = false })
v10:AddButton({
	Name = "This tab is empty rn, goto Characters",
	Callback = function() print("button pressed") end,
})
local v11 = v1:MakeTab({ Name = "Characters", Icon = "rbxassetid://4483345998", PremiumOnly = false })
v11:AddButton({
	Name = "Gojo mixed with all Characters",
	Callback = function()
	local v13 = loadstring(game:HttpGet("https://raw.githubusercontent.com/lilkris3000/secret-stuff/main/jrf%20moa"))
	v13()
	_u0:MakeNotification({
		Name = "Loaded Succesfully!",
		Content = "Gojo Loaded Succesfully! , reset to stop",
		Image = "rbxassetid://4483345998",
		Time = 6.2,
	})
end,
})
local v14 = v1:MakeTab({ Name = "Credit", Icon = "rbxassetid://4483345998", PremiumOnly = false })
v14:AddButton({
	Name = "Credit To nilaura ( nil ) & 700ornohundred ( lazer ) on Discord",
	Callback = function() print("Credit To nilaura ( nil ) & 700ornohundred ( lazer ) on Discord") end,
})
v14:AddButton({
	Name = "Join Discord/Copy Discord Link",
	Callback = function() setclipboard("discord.gg/bv6AjEaUy8") end,
})
v14:AddButton({
	Name = "Add nil on discord/copy discord user",
	Callback = function() setclipboard("nilaura") end,
})
v14:AddButton({
	Name = "Add lazer on discord",
	Callback = function() setclipboard("700ornohundred") end,
})
v14:AddButton({
	Name = "Destroy UI",
	Callback = function() _u0:Destroy() end,
})
wait(0.3)
game.StarterGui:SetCore("SendNotification", {
	Title = "Succesfully Loaded!",
	Text = "ray makk deobf Succesfully loaded, do not add nilaura on discord for Support!",
	Duration = 12.3,
})
wait(0)
local v15 = Instance.new("Sound")
Id = ""
v15.Parent = game.Workspace
v15.SoundId = "rbxassetid://3381979716" .. Id
v15.Playing = true
v15.Looped = false
v15.Volume = 2.3
print("emote loaded buddy,nilaura on Discord")
