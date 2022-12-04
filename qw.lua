local lplr = game.Players.LocalPlayer
local Run = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}
local ids = {
	TornadoAlleyUltimate = 2313058949,
	DoorsLobby = 6516141723,
	Doors = 6839171747,
	TheUndergroundWar = 3829055572
}
do --// Credits to 7GrandDad/VapeV4ForRoblox
	function Run:BindToStepped(name, num, func)
		if Run.StepTable[name] == nil then
			Run.StepTable[name] = game:GetService("RunService").Stepped:connect(func)
		end
	end

	function Run:UnbindFromStepped(name)
		if Run.StepTable[name] then
			Run.StepTable[name]:Disconnect()
			Run.StepTable[name] = nil
		end
	end
end --// Credits to 7GrandDad/VapeV4ForRoblox
local colors = {
    SchemeColor = Color3.fromRGB(255,75,255),
    Background = Color3.fromRGB(255,175,255),
    Header = Color3.fromRGB(255,145,255),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(235,165,245)
}
local wronggame = true
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("qwertyware - 1.0", colors)
for i,v in pairs(ids) do
	if game.PlaceId == v then
		wronggame = false
		local MainTab = Window:NewTab("Main")
		local Main = MainTab:NewSection("Main")
		local AutoTab = Window:NewTab("Automated")
		local Auto = AutoTab:NewSection("Automated")
		if i == "TornadoAlleyUltimate" then
			Main:NewButton("ShelterTP","does what it says",function()
				lplr.Character.HumanoidRootPart.CFrame = CFrame.new(75494, 31957, -142) -- nvm
			end)
			Auto:NewToggle("AutoWin","does what it says",function(callback)
				if callback then
					Run:BindToStepped("AutoWin",1,function()
						lplr.Character.HumanoidRootPart.CFrame = CFrame.new(75492, 31957, -63) -- nvm
					end)
				else
					Run:UnbindFromStepped("AutoWin")
				end
			end)
		elseif i == "TheUndergroundWar" then
			local farm = false
			Main:NewButton("Grab Flag","does what it says",function()
				lplr.Character.Humanoid.HipHeight = -25
				workspace.Gravity = 0
				lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-25,6,182)
				task.wait(5)
				lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-25,6,-182)
				task.wait(4)
				lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,10,10)
				task.wait(0.5)
				lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,10)
				task.wait(0.5)
				workspace.Gravity = 196.2
				lplr.Character.HumanoidRootPart.CFrame = CFrame.new(6,17,-75)
				task.wait(0.63)
				workspace.Gravity = 0
				lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-12,-10)
				task.wait(3.4)
				lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-25,6,182)
				task.wait(1)
				lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,11,-15)
				task.wait(1)
				lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-8,17,75)
				lplr.Character.Humanoid.HipHeight = 0
				workspace.Gravity = 196.2
			end)
			Auto:NewToggle("AutoFlag","does what it says",function(callback)
				if callback then
					farm = true
					repeat
						lplr.Character.Humanoid.HipHeight = -25
						workspace.Gravity = 0
						lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-25,6,182)
						task.wait(5)
						lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-25,6,-182)
						task.wait(4)
						lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,10,10)
						task.wait(0.5)
						lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,10)
						task.wait(0.5)
						workspace.Gravity = 196.2
						lplr.Character.HumanoidRootPart.CFrame = CFrame.new(6,19,-75)
						task.wait(0.63)
						workspace.Gravity = 0
						lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,-12,-10)
						task.wait(3.4)
						lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-25,6,182)
						task.wait(1)
						lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,11,-15)
						task.wait(1)
						lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-8,17,75)
						lplr.Character.Humanoid.HipHeight = 0
						workspace.Gravity = 196.2
						task.wait(2.5)
					until not farm
				else
					farm = false
				end
			end)
		elseif i == "DoorsLobby" or i == "Doors" then
			local speed
			Main:NewToggle("Speed","does what it says",function(callback)
				if callback then
					speed = lplr.Character.Humanoid.WalkSpeed
					Run:BindToStepped("Speed",1,function(delta)
						if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
									lplr.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * 20/75)
							end
					end)
				else
					Run:UnbindFromStepped("Speed")
					lplr.Character.Humanoid.WalkSpeed = speed
				end
			end)
			Main:NewToggle("AntiGate","does what it says",function(callback)
				if callback then
					Run:BindToStepped("AntiGate",1,function()
						local rooms = workspace.CurrentRooms
						for i,v in pairs(rooms:GetChildren()) do
							if rooms[tostring(v)]:FindFirstChild("Gate") then
								novoline["Utility"]["CreateNotification"]("AntiGate","Removed a gate!",5)
								rooms[tostring(v)].Gate:Destroy()
							end
						end
					end)
				else
					Run:UnbindFromStepped("AntiGate")
				end
			end)
			Auto:NewToggle("AutoDoor","does what it says",function(callback)
				if callback then
					Run:BindToStepped("AutoDoor",1,function()
						local rooms = workspace.CurrentRooms
						for i,v in pairs(rooms:GetChildren()) do
							if rooms[tostring(v)]:FindFirstChild("Door") then
								rooms[tostring(v)].Door.ClientOpen:FireServer()
							end
						end
					end)
				else
					Run:UnbindFromStepped("AutoDoor")
				end
			end)
			local key = false
			Auto:NewToggle("AutoKey","does what it says",function(callback)
				if callback then
					key = true
					for i,v in ipairs(workspace.CurrentRooms:GetDescendants()) do
						if v.Name == "KeyObtain" then
							game.StarterGui:SetCore("SendNotification", {Title = "qwertyware", Text = "Found a key!\nTeleporting.."})
							lplr.Character:PivotTo(CFrame.new(v.Hitbox.Position))
							fireproximityprompt(v.ModulePrompt,0)
						end
					end
				else
					key = false
				end
			end)
			workspace.CurrentRooms.DescendantAdded:Connect(function(v)
				if v.Name == "KeyObtain" and key then
					game.StarterGui:SetCore("SendNotification", {Title = "qwertyware", Text = "Found a key!\nTeleporting.."})
					game.Players.LocalPlayer.Character:PivotTo(CFrame.new(v.Hitbox.Position))
					fireproximityprompt(v.ModulePrompt,0)
				end
			end)
			Main:NewToggle("NoDark","does what it says",function(callback)
				if callback then
					local light = Instance.new("SpotLight")
					light.Brightness = 1
					light.Face = Enum.NormalId.Front
					light.Range = 90000
					light.Parent = lplr.Character.Head
					light.Enabled = true
					light.Name = "NoDark"
				else
					local light = lplr.Character.Head:WaitForChild("NoDark")
					light:Destroy()
				end
			end)
			local ash = false
			Main:NewToggle("AntiSeekHall","does what it says",function(callback)
				if callback then
					ash = true
				else
					ash = false
				end
			end)
			workspace.CurrentRooms.DescendantAdded:Connect(function(thing)
				if ash then
					if thing.Name == ("Seek_Arm" or "ChandelierObstruction") then
						task.spawn(function()
							wait()
							thing:Destroy()
						end)
					end
				end
			end)
			local ealert = false
			Main:NewToggle("SpawnAlert","does what it says",function(callback)
				if callback then
					ealert = true
				else
					ealert = false
				end
			end)
			workspace.ChildAdded:Connect(function(thing)
				if ealert then
					if thing.Name == "RushMoving" then
						game.StarterGui:SetCore("SendNotification", {Title = "qwertyware", Text = "Rush has spawned!"})
					elseif thing.Name == "AmbushMoving" then
						game.StarterGui:SetCore("SendNotification", {Title = "qwertyware", Text = "Ambush has spawned!"})
					end
				end
			end)
			local screech = false
			Main:NewToggle("AntiScreech","does what it says",function(callback)
				if callback then
					screech = true
				else
					screech = false
				end
			end)
			workspace.CurrentCamera.ChildAdded:Connect(function(thing)
				if thing.Name == "Screech" then
					if screech then
						game.StarterGui:SetCore("SendNotification", {Title = "qwertyware", Text = "Killed Screech!"})
						thing:Destroy()
					end
				end
			end)
		end
	end
end
local DiscordTab = Window:NewTab("Discord")
local Discord = DiscordTab:NewSection("Discord")
Discord:NewButton("Copy Discord Invite", "Copies the Qwertyware Discord invite", function()
    setclipboard("https://discord.gg/AeXGDZZB")
    game.StarterGui:SetCore("SendNotification", {Title = "qwertyware", Text = "Copied Qwertyware Discord Invite"})
end)
if wronggame then
	game.StarterGui:SetCore("SendNotification", {Title = "qwertyware", Text = "Unsupported Game!"})
end
