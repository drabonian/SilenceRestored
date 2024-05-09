local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

local SoundManager = require(script.Parent.SoundManager)
local LevelManager = require(script.Parent.LevelManager)
local PlayerData = require(ReplicatedStorage.Stats.PlayerData)

local LEVEL_DATA = {
	Level0 = {
		canSwitch = false,
		theIncident = false,
		tool = "None",
		location = CFrame.new(126, 121, -3895),
		song = "DetroitAmbient",
	},
	Level1 = {
		canSwitch = false,
		theIncident = false,
		tool = "None",
		location = CFrame.new(-1026, 303, -3998),
		song = "EnteringTYM",
	},
	Level2 = {
		canSwitch = true,
		theIncident = true,
		tool = "None",
		location = CFrame.new(-1120, 828, -4241),
		song = "DetroitAmbient",
	},
	Level3 = {
		canSwitch = true,
		theIncident = true,
		tool = "Pistol",
		location = CFrame.new(-130, 42, 93),
		song = "DetroitAmbient",
	},
	Level4 = {
		canSwitch = true,
		theIncident = true,
		tool = "Pistol",
		location = CFrame.new(-32, 7, 24),
		song = "EverybodyLies",
	},
	Level5 = {
		canSwitch = true,
		theIncident = true,
		tool = "Pistol",
		location = CFrame.new(-32, 7, 24),
		song = "DetroitAmbient",
	},
	Level6 = {
		canSwitch = true,
		theIncident = true,
		tool = "Pistol",
		location = CFrame.new(-32, 7, 24),
		song = "DetroitAmbient",
	},
	Level7 = {
		canSwitch = true,
		theIncident = true,
		tool = "Pistol",
		location = CFrame.new(-32, 7, 24),
		song = "DetroitAmbient",
	},
	Level8 = {
		canSwitch = true,
		theIncident = true,
		tool = "Assault Rifle 1",
		location = CFrame.new(32, 104, -3500),
		song = "DetroitAmbient",
	},
}

local module = {}

local RunEffectWithName = SoundManager.RunEffectWithName

local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")
local gameGui = playerGui:WaitForChild("GameGui")

local char = player.Character

local camera = workspace.CurrentCamera

local gameItems = ReplicatedStorage.GameItems

local function handleGUIs(visibility: boolean)
	gameGui.Health.Visible = visibility
	gameGui.Ammo.Visible = visibility
	gameGui.Power.Visible = visibility
	gameGui.Reticle.Visible = visibility
	gameGui.Radar.Visible = visibility
	gameGui.Interface.Info.Visible = visibility
end

local function addMap(p5, p6)
	local v27 = p5:GetChildren()

	for i, item in v27 do
		if item:IsA("Model") then
			if item:FindFirstChild("MainJoint") then
				local v30 = item:Clone()
				v30:MakeJoints()
				v30.Parent = p6
			else
				local v31 = Instance.new("Model")
				v31.Name = item.Name
				v31.Parent = p6
				addMap(item, v31)
			end
		else
			item:Clone().Parent = p6
		end
		-- ????
		if i % 160 == 0 then
			wait()
		end
	end
end

local function loadMap()
	if gameGui:FindFirstChild("MapControl") then
		gameGui.MapControl:Destroy()
	end

	local v32 = gameGui:GetChildren()
	local v33 = #v32
	local v34 = 1 - 1

	while true do
		if v32[v34] then
			if v32[v34].Name == "MapScript" then
				v32[v34]:Destroy()
			end
		end
		if 0 <= 1 then
			if v34 > v33 then
				break
			end
		elseif v33 > v34 then
			break
		end
		v34 = v34 + 1
	end

	if camera:FindFirstChild("Map") then
		camera.Map:Destroy()
	end

	local v35 = Instance.new("Model")
	v35.Name = "Map"
	v35.Parent = camera

	local v36 = gameItems.MasterLevels["Level" .. PlayerData.Gameplay.Level]["Map" .. PlayerData.Gameplay.LoadingZone]

	Lighting.Sky.SkyboxBk = "rbxassetid://58757773"
	Lighting.Sky.SkyboxDn = "rbxassetid://58757773"
	Lighting.Sky.SkyboxFt = "rbxassetid://58757773"
	Lighting.Sky.SkyboxLf = "rbxassetid://58757773"
	Lighting.Sky.SkyboxRt = "rbxassetid://58757773"
	Lighting.Sky.SkyboxUp = "rbxassetid://58757773"
	Lighting.FogEnd = 60
	Lighting.Brightness = 0
	Lighting.OutdoorAmbient = Color3.new(0, 0, 0)

	addMap(v36, v35)

	local v37 = v36:FindFirstChild("MapControl")
	if v37 then
		v37:Clone().Parent = gameGui
		gameGui.MapControl.Disabled = false
	end
end

local l__Humanoid__3 = char.Humanoid

local function loadingZoneChanged()
	if 0 < l__Humanoid__3.Health then
		loadMap()
	end
end

local function elevatorLoad(elevator)
	coroutine.resume(coroutine.create(function()
		gameGui.LocalScript.LocalPause.Value = true

		if elevator.Button.Parent.Elevator:FindFirstChild("ElevatorDoor") then
			local doors = elevator.Button.Parent.Elevator.ElevatorDoor

			RunEffectWithName("SlideClosed", doors.Door1)
			RunEffectWithName("SlideClosed", doors.Door2)
			for i = 1, 8 do
				doors.Door1.CFrame = doors.Door1.CFrame
					+ (doors.ClosedPosition1.Position - doors.OpenPosition1.Position) / 8
				doors.Door2.CFrame = doors.Door2.CFrame
					+ (doors.ClosedPosition2.Position - doors.OpenPosition2.Position) / 8
				wait()
			end
		elseif elevator.Button.Parent.Elevator:FindFirstChild("ElevatorDoor1") then
			if elevator.Button.Parent.Elevator:FindFirstChild("ElevatorDoor2") then
				local doorSet1 = elevator.Button.Parent.Elevator.ElevatorDoor1
				local doorSet2 = elevator.Button.Parent.Elevator.ElevatorDoor2
				RunEffectWithName("SlideClosed", doorSet1.Door1)
				RunEffectWithName("SlideClosed", doorSet1.Door2)
				RunEffectWithName("SlideClosed", doorSet2.Door1)
				RunEffectWithName("SlideClosed", doorSet2.Door2)
				for i = 1, 8 do
					doorSet1.Door1.CFrame = doorSet1.Door1.CFrame
						+ (doorSet1.ClosedPosition1.Position - doorSet1.OpenPosition1.Position) / 8
					doorSet1.Door2.CFrame = doorSet1.Door2.CFrame
						+ (doorSet1.ClosedPosition2.Position - doorSet1.OpenPosition2.Position) / 8
					doorSet2.Door1.CFrame = doorSet2.Door1.CFrame
						+ (doorSet2.ClosedPosition1.Position - doorSet2.OpenPosition1.Position) / 8
					doorSet2.Door2.CFrame = doorSet2.Door2.CFrame
						+ (doorSet2.ClosedPosition2.Position - doorSet2.OpenPosition2.Position) / 8
					wait()
				end
			end
		end

		gameGui.LocalScript.LocalPause.Value = false

		if PlayerData.Gameplay.LoadingZone == elevator.Button.Map.Value.X then
			PlayerData.Gameplay.LoadingZone = elevator.Button.Map.Value.Y
		else
			PlayerData.Gamepaly.LoadingZone = elevator.Button.Map.Value.X
		end

		task.spawn(loadingZoneChanged)

		local l__Value__43 = elevator.Button.Time.Value
		local v44 = 1 - 1
		while true do
			local v45 = 1 - 1
			while true do
				local v46 = 0 + 0.02 * v45
				elevator.Button.Parent.Elevator.ElevatorSign.SurfaceGui.Text1.TextStrokeColor3 =
					Color3.new(0.5 + v46, 0.5 - v46, 0.5 - v46)
				elevator.Button.Parent.Elevator.ElevatorSign.SurfaceGui.Text2.TextStrokeColor3 =
					Color3.new(0.5 + v46, 0.5 - v46, 0.5 - v46)
				wait()
				if 0 <= 1 then
					if v45 > 25 then
						break
					end
				elseif 25 > v45 then
					break
				end
				v45 = v45 + 1
			end
			local v47 = 25 - -1
			while true do
				local v48 = 0 + 0.02 * v47
				elevator.Button.Parent.Elevator.ElevatorSign.SurfaceGui.Text1.TextStrokeColor3 =
					Color3.new(0.5 + v48, 0.5 - v48, 0.5 - v48)
				elevator.Button.Parent.Elevator.ElevatorSign.SurfaceGui.Text2.TextStrokeColor3 =
					Color3.new(0.5 + v48, 0.5 - v48, 0.5 - v48)
				wait()
				if 0 <= -1 then
					if v47 > 1 then
						break
					end
				elseif 1 > v47 then
					break
				end
				v47 = v47 + -1
			end
			wait()
			if 0 <= 1 then
				if v44 > l__Value__43 then
					break
				end
			elseif l__Value__43 > v44 then
				break
			end
			v44 = v44 + 1
		end
		if elevator.Button.Parent.Elevator:FindFirstChild("ElevatorDoor") then
			local l__ElevatorDoor__49 = elevator.Button.Parent.Elevator.ElevatorDoor
			RunEffectWithName("SlideOpen", l__ElevatorDoor__49.Door1)
			RunEffectWithName("SlideOpen", l__ElevatorDoor__49.Door2)
			for i = 1, 8 do
				l__ElevatorDoor__49.Door1.CFrame = l__ElevatorDoor__49.Door1.CFrame
					- (l__ElevatorDoor__49.ClosedPosition1.Position - l__ElevatorDoor__49.OpenPosition1.Position)
						/ 8
				l__ElevatorDoor__49.Door2.CFrame = l__ElevatorDoor__49.Door2.CFrame
					- (l__ElevatorDoor__49.ClosedPosition2.Position - l__ElevatorDoor__49.OpenPosition2.Position)
						/ 8
			end
		elseif elevator.Button.Parent.Elevator:FindFirstChild("ElevatorDoor1") then
			if elevator.Button.Parent.Elevator:FindFirstChild("ElevatorDoor2") then
				local doorSet1 = elevator.Button.Parent.Elevator.ElevatorDoor1
				local doorSet2 = elevator.Button.Parent.Elevator.ElevatorDoor2
				RunEffectWithName("SlideOpen", doorSet1.Door1)
				RunEffectWithName("SlideOpen", doorSet1.Door2)
				RunEffectWithName("SlideOpen", doorSet2.Door1)
				RunEffectWithName("SlideOpen", doorSet2.Door2)
				for i = 0, 8 do
					doorSet1.Door1.CFrame = doorSet1.Door1.CFrame
						- (doorSet1.ClosedPosition1.Position - doorSet1.OpenPosition1.Position) / 8
					doorSet1.Door2.CFrame = doorSet1.Door2.CFrame
						- (doorSet1.ClosedPosition2.Position - doorSet1.OpenPosition2.Position) / 8
					doorSet2.Door1.CFrame = doorSet2.Door1.CFrame
						- (doorSet2.ClosedPosition1.Position - doorSet2.OpenPosition1.Position) / 8
					doorSet2.Door2.CFrame = doorSet2.Door2.CFrame
						- (doorSet2.ClosedPosition2.Position - doorSet2.OpenPosition2.Position) / 8
					wait()
				end
			end
		end

		elevator.Button.Busy.Value = false

		if PlayerData.Gameplay.Checkpoint < PlayerData.Gameplay.LoadingZone then
			PlayerData.Gameplay.Checkpoint = PlayerData.Gameplay.LoadingZone
		end
	end))
end

local function decontaminationLoad(loadZone)
	coroutine.resume(coroutine.create(function()
		gameGui.LocalScript.LocalPause.Value = true
		local doorSet1 = loadZone.Button.Parent.Decontamination.DoorSet1
		local doorSet2 = loadZone.Button.Parent.Decontamination.DoorSet2
		RunEffectWithName("SlideClosed", doorSet1)
		RunEffectWithName("SlideClosed", doorSet2)
		if loadZone.Button.Way.Value then --opening phase
			local door1Pos = doorSet1.Door1.Position
			local door2Pos = doorSet1.Door2.Position
			for i = 1, 8 do
				doorSet1.Door1.Position = door1Pos
					+ (doorSet1.ClosedPosition1.Position - doorSet1.OpenPosition1.Position) * i / 8
				doorSet1.Door2.Position = door2Pos
					+ (doorSet1.ClosedPosition2.Position - doorSet1.OpenPosition2.Position) * i / 8
				wait()
			end
		else
			local door1Pos = doorSet2.Door1.Position
			local door2Pos = doorSet2.Door2.Position
			for i = 1, 8 do
				doorSet2.Door1.Position = door1Pos
					+ (doorSet2.ClosedPosition1.Position - doorSet2.OpenPosition1.Position) * i / 8
				doorSet2.Door2.Position = door2Pos
					+ (doorSet2.ClosedPosition2.Position - doorSet2.OpenPosition2.Position) * i / 8
				wait()
			end
		end
		gameGui.LocalScript.LocalPause.Value = false
		if PlayerData.Gameplay.LoadingZone.Value == loadZone.Button.Map.Value.X then
			PlayerData.Gameplay.LoadingZone.Value = loadZone.Button.Map.Value.Y
		else
			PlayerData.Gameplay.LoadingZone.Value = loadZone.Button.Map.Value.X
		end
		coroutine.resume(coroutine.create(function()
			loadingZoneChanged()
		end))

		local v58 = loadZone.Button.Parent.Decontamination.Cleaners:GetChildren()

		for _, cleaner in v58 do
			if math.random(1, 4) == 2 then
				cleaner.Mist.Enabled = true
			end
		end

		local l__Value__61 = loadZone.Button.Time.Value

		local v62 = 1 - 1
		while true do
			local v63 = 1 - 1
			while true do
				loadZone.Button.Parent.Decontamination.Light.PointLight.Brightness = 1 - 0.025 * v63
				wait()
				if 0 <= 1 then
					if v63 > 20 then
						break
					end
				elseif 20 > v63 then
					break
				end
				v63 = v63 + 1
			end
			local v64 = 1 - 1
			while true do
				loadZone.Button.Parent.Decontamination.Light.PointLight.Brightness = 0.5 + 0.025 * v64
				wait()
				if 0 <= 1 then
					if v64 > 20 then
						break
					end
				elseif 20 > v64 then
					break
				end
				v64 = v64 + 1
			end
			wait()
			if 0 <= 1 then
				if v62 > l__Value__61 then
					break
				end
			elseif l__Value__61 > v62 then
				break
			end
			v62 = v62 + 1
		end

		for _, cleaner in v58 do
			cleaner.Mist.Enabled = false
		end

		RunEffectWithName("SlideOpen", doorSet1)
		RunEffectWithName("SlideOpen", doorSet2)
		loadZone.Button.Way.Value = not loadZone.Button.Way.Value
		if loadZone.Button.Way.Value then --closing phase
			for i = 0, 8 do
				doorSet1.Door1.CFrame = doorSet1.Door1.CFrame
					- (doorSet1.ClosedPosition1.Position - doorSet1.OpenPosition1.Position) / 8
				doorSet1.Door2.CFrame = doorSet1.Door2.CFrame
					- (doorSet1.ClosedPosition2.Position - doorSet1.OpenPosition2.Position) / 8
				wait()
			end
		else
			for i = 0, 8 do
				doorSet2.Door1.CFrame = doorSet2.Door1.CFrame
					- (doorSet2.ClosedPosition1.Position - doorSet2.OpenPosition1.Position) / 8
				doorSet2.Door2.CFrame = doorSet2.Door2.CFrame
					- (doorSet2.ClosedPosition2.Position - doorSet2.OpenPosition2.Position) / 8
				wait()
			end
		end
		loadZone.Button.Busy.Value = false
		if PlayerData.Gameplay.Checkpoint.Value < PlayerData.Gameplay.LoadingZone.Value then
			PlayerData.Gameplay.Checkpoint.Value = PlayerData.Gameplay.LoadingZone.Value
		end
	end))
end
local u4 = false
local function normalLoad(p9, p10)
	if p10 then
		if p10.Parent then
			if p10.Name == "Torso" then
				if not u4 then
					if tostring(PlayerData.Gameplay.LoadingZone.Value) ~= p9.Name then
						u4 = true
						if p9.Parent.Parent:FindFirstChild("Door" .. PlayerData.Gameplay.LoadingZone.Value) then
							coroutine.resume(coroutine.create(function()
								local v69 = p9.Parent.Parent["Door" .. PlayerData.Gameplay.LoadingZone.Value]
								RunEffectWithName("SlideClosed", v69)
								local v70 = 1 - 1
								while true do
									if v69:FindFirstChild("Right") then
										v69.Right.CFrame = v69.Right.CFrame - Vector3.new(0, 0, 0.5)
									end
									if v69:FindFirstChild("Left") then
										v69.Left.CFrame = v69.Left.CFrame + Vector3.new(0, 0, 0.5)
									end
									if v69:FindFirstChild("Front") then
										v69.Front.CFrame = v69.Front.CFrame - Vector3.new(0.5, 0, 0)
									end
									if v69:FindFirstChild("Back") then
										v69.Back.CFrame = v69.Back.CFrame + Vector3.new(0.5, 0, 0)
									end
									wait()
									if 0 <= 1 then
										if v70 > 10 then
											break
										end
									elseif 10 > v70 then
										break
									end
									v70 = v70 + 1
								end
							end))
						end
						PlayerData.Gameplay.LoadingZone.Value = tonumber(p9.Name)
						coroutine.resume(coroutine.create(function()
							loadingZoneChanged()
							if p9.Parent.Parent:FindFirstChild("Door" .. PlayerData.Gameplay.LoadingZone.Value) then
								local v71 = p9.Parent.Parent["Door" .. PlayerData.Gameplay.LoadingZone.Value]
								RunEffectWithName("SlideOpen", v71)
								local v72 = 1 - 1
								while true do
									if v71:FindFirstChild("Right") then
										v71.Right.CFrame = v71.Right.CFrame + Vector3.new(0, 0, 0.25)
									end
									if v71:FindFirstChild("Left") then
										v71.Left.CFrame = v71.Left.CFrame - Vector3.new(0, 0, 0.25)
									end
									if v71:FindFirstChild("Front") then
										v71.Front.CFrame = v71.Front.CFrame + Vector3.new(0.25, 0, 0)
									end
									if v71:FindFirstChild("Back") then
										v71.Back.CFrame = v71.Back.CFrame - Vector3.new(0.25, 0, 0)
									end
									wait()
									if 0 <= 1 then
										if v72 > 20 then
											break
										end
									elseif 20 > v72 then
										break
									end
									v72 = v72 + 1
								end
							end
							u4 = false
						end))
						if PlayerData.Gameplay.Checkpoint.Value < PlayerData.Gameplay.LoadingZone.Value then
							PlayerData.Gameplay.Checkpoint.Value = PlayerData.Gameplay.LoadingZone.Value
						end
					end
				end
			end
		end
	end
end

function module.LoadLevel()
	camera:ClearAllChildren()

	handleGUIs(true)

	print("Loading level " .. PlayerData.Gameplay.Level)

	local v73 = gameGui:GetChildren()
	local v74 = #v73
	local v75 = 1 - 1
	while true do
		if v73[v75] then
			if v73[v75].Name ~= "LevelControl" then
				if v73[v75].Name == "LevelScript" then
					v73[v75]:Destroy()
				end
			else
				v73[v75]:Destroy()
			end
		end
		if 0 <= 1 then
			if v75 > v74 then
				break
			end
		elseif v74 > v75 then
			break
		end
		v75 = v75 + 1
	end

	if PlayerData.Gameplay.Checkpoint ~= 1 then
		if
			gameItems.MasterLevels["Level" .. PlayerData.Gameplay.Level]:FindFirstChild(
				"Map" .. PlayerData.Gameplay.Checkpoint
			)
		then
			PlayerData.Gameplay.LoadingZone = PlayerData.Gameplay.Checkpoint
		else
			PlayerData.Gameplay.Checkpoint = 1
			PlayerData.Gameplay.LoadingZone = 1
		end
	else
		PlayerData.Gameplay.Checkpoint = 1
		PlayerData.Gameplay.LoadingZone = 1
	end

	local v76 =
		gameItems.MasterLevels["Level" .. PlayerData.Gameplay.Level]["Map" .. PlayerData.Gameplay.LoadingZone]:GetChildren()

	local v77 = 0

	for _, item in v76 do
		if item:IsA("CFrameValue") then
			if item:FindFirstChild("Prereq") then
				if item.Prereq.Value <= PlayerData.Gameplay.Progress then
					if v77 < item.Prereq.Value then
						v77 = item.Prereq.Value
						PlayerData.Gameplay.Location = item.Value
					elseif not item:FindFirstChild("Prereq") then
						if v77 < 1 then
							PlayerData.Gameplay.Location = item.Value
						end
					end
				elseif not item:FindFirstChild("Prereq") then
					if v77 < 1 then
						PlayerData.Gameplay.Location = item.Value
					end
				end
			elseif not item:FindFirstChild("Prereq") then
				if v77 < 1 then
					PlayerData.Gameplay.Location = item.Value
				end
			end
		end
	end

	if PlayerData.Player.Tool == "None" then
		PlayerData.Player.Tool = LEVEL_DATA["Level" .. PlayerData.Gameplay.Level].tool
	end

	PlayerData.Local.Mode = true
	PlayerData.Local.CanSwitch = LEVEL_DATA["Level" .. PlayerData.Gameplay.Level].canSwitch
	PlayerData.Local.TheIncident = LEVEL_DATA["Level" .. PlayerData.Gameplay.Level].theIncident

	SoundManager.RunSoundWithName(LEVEL_DATA["Level" .. PlayerData.Gameplay.Level].song)

	local v80 = gameItems.MasterLevels["Level" .. PlayerData.Gameplay.Level].Level:Clone()
	v80.Parent = camera
	v80:MakeJoints()
	loadMap()
	local v81, v82, v83 = pairs(v80.LoadingZones:GetChildren())
	while true do
		local v84, v85 = v81(v82, v83)
		if not v84 then
			break
		end
		v83 = v84
		if v85:IsA("Model") then
			if v85:FindFirstChild("LoadingTriggers") then
				local v86, v87, v88 = pairs(v85.LoadingTriggers:GetChildren())
				while true do
					local v89, v90 = v86(v87, v88)
					if not v89 then
						break
					end
					v88 = v89
					if v90:IsA("Part") then
						v90.Touched:connect(function(p11)
							normalLoad(v90, p11)
						end)
					end
				end
			elseif v85:IsA("Model") then
				if v85:FindFirstChild("Button") then
					v85.Button.Busy.Changed:connect(function()
						if not v85.Button.Busy.Value then
							return
						end
						if v85.Button.Parent:FindFirstChild("Elevator") then
							elevatorLoad(v85)
							return
						end
						if v85.Button.Parent:FindFirstChild("Decontamination") then
							decontaminationLoad(v85)
						end
					end)
				end
			end
		elseif v85:IsA("Model") then
			if v85:FindFirstChild("Button") then
				v85.Button.Busy.Changed:connect(function()
					if not v85.Button.Busy.Value then
						return
					end
					if v85.Button.Parent:FindFirstChild("Elevator") then
						elevatorLoad(v85)
						return
					end
					if v85.Button.Parent:FindFirstChild("Decontamination") then
						decontaminationLoad(v85)
					end
				end)
			end
		end
	end

	LevelManager.StartLevel(PlayerData.Gameplay.Level)

	print("Loaded level " .. PlayerData.Gameplay.Level .. " without issue.")
end

return module
