local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerData = require(ReplicatedStorage.Stats.PlayerData)

local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")
local gameGui = playerGui:WaitForChild("GameGui")

local gameItems = ReplicatedStorage.GameItems

local camera = workspace.CurrentCamera
local level = camera.Level

if level:FindFirstChild("Ammo") then
	local v4 = level.Ammo:GetChildren()
	for v5 = 1, #v4 do
		if v4[v5]:FindFirstChild("MainPart") then
			v4[v5].MainPart.Amount.Value =
				math.ceil(v4[v5].MainPart.Amount.Value * PlayerData.Gameplay.Difficulty * 0.5)
			v4[v5].MainPart.SurfaceGui1.Text.Text = "" .. v4[v5].MainPart.Amount.Value
			v4[v5].MainPart.SurfaceGui2.Text.Text = "" .. v4[v5].MainPart.Amount.Value
		end
	end
end

function handleGUIs(p1)
	gameGui.Health.Visible = p1
	gameGui.Ammo.Visible = p1
	gameGui.Power.Visible = p1
	gameGui.Reticle.Visible = p1
	gameGui.Radar.Visible = p1
	gameGui.Interface.Info.Visible = p1
	if not p1 then
		gameGui.TouchedInfo.Visible = p1
		gameGui.InRange.Visible = p1
		gameGui.AmmoInfo.Visible = p1
	end
end

function addMap(p2, p3)
	local v6 = p2:getChildren()

	for _, item in v6 do
		if item:IsA("Model") then
			if item:FindFirstChild("MainJoint") then
				local npc = item:Clone()
				npc:MakeJoints()
				npc.Parent = p3
			else
				local newModel = Instance.new("Model")
				newModel.Name = item.Name
				newModel.Parent = p3
				addMap(item, newModel)
			end
		else
			item:Clone().Parent = p3
		end
	end
end

function spawnFlashBack()
	print("Spawning flash back...")

	level.Parent.Map:Destroy()
	wait()
	local v11 = Instance.new("Model")
	v11.Name = "Map"
	v11.Parent = camera
	local l__Map3__3 = gameItems.MasterLevels.Level0.Extras.Map3

	task.spawn(function()
		addMap(l__Map3__3, v11)
	end)
end

function spawnMCC()
	level.Parent.Map:Destroy()
	wait()
	local v12 = Instance.new("Model")
	v12.Name = "Map"
	v12.Parent = camera
	local l__Map1__4 = gameItems.MasterLevels.Level1.Map1

	task.spawn(addMap, l__Map1__4, v12)
end

local u6 = 0

function carRide()
	local function v13(p4)
		if not level.Parent:findFirstChild("Map") then
			return
		end
		print("OldBot")
		local v14 = gameItems.MasterModels.OldBot:clone()
		v14.Parent = level.Parent.Map
		v14:MakeJoints()
		v14.Torso.CFrame = CFrame.new(p4)
		v14.Stats.WaitTime.Value = 0
		v14.Stats.Speed.Value = 4
		v14.Stats.Health.Value = 100
		v14.Stats.OffsetMaxX.Value = 15
		v14.Stats.OffsetMaxZ.Value = 11
		v14.Stats.OffsetMinX.Value = -15
		v14.Stats.OffsetMinZ.Value = -11
		local v15 = v14.MainControlNPC:clone()
		v15.Name = "MapScript"
		v15.Parent = script.Parent
		local v16 = Instance.new("ObjectValue")
		v16.Name = "LinkedModel"
		v16.Value = v14
		v16.Parent = v15
		v15.Disabled = false
	end
	local function v17(p5)
		gameGui.StoryScript.Current.Value = p5
		while true do
			wait(0.09)
			if gameGui.StoryScript.Busy.Value then
			else
				break
			end
		end
	end
	local background = gameGui.Interface.Background
	local v19 = 1 - 1
	while true do
		wait()
		background.BackgroundTransparency = 1 - v19 / 20
		if 0 <= 1 then
			if v19 < 20 then
			else
				break
			end
		elseif 20 < v19 then
		else
			break
		end
		v19 = v19 + 1
	end
	level.Parent.Map.FutureTownCar:Destroy()
	level.NPC:Destroy()
	local v20 = gameItems.MasterModels.FutureTownCarWelded:clone()
	v20.Parent = level
	--v20:MakeJoints();

	v20.Base.CFrame = CFrame.new(-53, 117.4, -3898.5)
	v20.Base.BodyPosition.position = Vector3.new(-53, 117.4, -3898.5)

	gameGui.LocalScript.LocalPause.Value = true

	handleGUIs(false)

	gameGui.Interface.Info.Visible = true
	gameGui.Interface.Info.PauseText.Visible = false
	if gameGui.TouchedInfo.Visible then
		gameGui.TouchedInfo.Visible = false
	end
	if gameGui.AmmoInfo.Visible then
		gameGui.AmmoInfo.Visible = false
	end

	player.Character.HumanoidRootPart.CFrame = v20.PlayerPosition.CFrame

	local v21 = Instance.new("WeldConstraint")

	v21.Part0 = player.Character.HumanoidRootPart
	v21.Part1 = v20.PlayerPosition

	v21.Parent = player.Character.Torso

	level.Parent.Map.InvisibleWalls:Destroy()
	local v22 = 1 - 1
	while true do
		wait()
		background.BackgroundTransparency = 0 + v22 / 20
		if 0 <= 1 then
			if v22 < 20 then
			else
				break
			end
		elseif 20 < v22 then
		else
			break
		end
		v22 = v22 + 1
	end
	wait(0.9)

	gameGui.StoryScript.Current.Value = v20.d.Head.Dialogue

	while true do
		wait()
		if gameGui.StoryScript.Busy.Value then
		else
			break
		end
	end
	local v23 = 1 - 1
	while true do
		v20.Roof1.Transparency = 0 + v23 / 25
		v20.Roof2.Transparency = 0 + v23 / 25
		wait()
		if 0 <= 1 then
			if v23 < 20 then
			else
				break
			end
		elseif 20 < v23 then
		else
			break
		end
		v23 = v23 + 1
	end
	wait(0.09)
	local v24 = v20.Base.Position.Y - level.CarPath.CarPath1.Position.Y + 2
	local v25 = #level.CarPath:getChildren()
	local v26 = 1
	while true do
		local v27 = level.CarPath["CarPath" .. v26]
		print(
			v27.Name .. "'s Position: ( " .. v27.Position.X .. ", " .. v27.Position.Y .. ", " .. v27.Position.Z .. " )"
		)
		if v26 == 5 then
			print("Reached 5...")
			spawnFlashBack()
		elseif v26 == 6 then
			print("Reached 6....")

			task.spawn(function()
				local v28 = 1 - 1
				while true do
					wait()
					background.BackgroundTransparency = 1 - v28 / 20
					if 0 <= 1 then
						if v28 < 20 then
						else
							break
						end
					elseif 20 < v28 then
					else
						break
					end
					v28 = v28 + 1
				end
				gameGui.Interface.Info.MissionTitle.Text = "FLASHBACK MISSION:"
				gameItems.MasterGuis.Vintage:clone().Parent = gameGui
				local v29 = Instance.new("BoolValue")
				v29.Name = "ForceField"
				v29.Parent = player.Character
				v21:Destroy()
				gameGui.LocalScript.LocalCanSwitch.Value = true
				level.Objectives["Heart of Core"].Part.Name = "Torso"
				level.Objectives["Heart of Core"].Torso.Touched:connect(function(p6)
					if p6 then
						if p6.Parent then
							if p6.Name == "Torso" then
								if script.Parent:findFirstChild("LocalScript") then
									level.Objectives["Heart of Core"]:Destroy()
									level.Parent.Map["Young Hubris Hauteur"]:Destroy()
								end
							end
						end
					end
				end)
				local l__Cutscene__30 = script.Parent.Cutscene
				camera.CameraSubject = nil
				camera.CameraType = "Scriptable"
				local l__CutsceneData__31 = level.Map3Task.CutsceneData
				local v32 = l__CutsceneData__31:GetChildren()
				camera.CFrame = l__CutsceneData__31["1"].c1.Value
				camera.Focus = l__CutsceneData__31["1"].f1.Value
				camera.FieldOfView = l__CutsceneData__31["1"].FOV.Value
				camera:SetRoll(l__CutsceneData__31["1"].Roll.Value)
				player.Character.Torso.CFrame =
					CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500)
				local v33 = 1 - 1
				while true do
					l__Cutscene__30.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v33, 0)
					l__Cutscene__30.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v33, 0)
					background.BackgroundTransparency = 0 + v33 / 20
					wait()
					if 0 <= 1 then
						if v33 < 20 then
						else
							break
						end
					elseif 20 < v33 then
					else
						break
					end
					v33 = v33 + 1
				end
				v13((Vector3.new(-856.8, 0, -1166.4)))
				v17(level.Map3Task.Dialogue)
				player.Character.Torso.CFrame = CFrame.new(-865.3, 28.1, -1170.3)
					* CFrame.Angles(0, 1.5707963267948966, 0)
				wait(0.06)
				script.Parent.LocalScript.LocalPause.Value = false
				--camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
				camera.CameraType = "Custom"
				camera.FieldOfView = 70
				handleGUIs(true)
				local v34 = 1 - 1
				while true do
					l__Cutscene__30.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v34, 0)
					l__Cutscene__30.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v34, 0)
					wait()
					if 0 <= 1 then
						if v34 < 20 then
						else
							break
						end
					elseif 20 < v34 then
					else
						break
					end
					v34 = v34 + 1
				end
				v29:Destroy()
			end)
		elseif v26 == 13 then
			while true do
				wait()
				if level.Objectives:findFirstChild("Exit Flashback") then
				else
					break
				end
			end

			PlayerData.Local.Mode = true

			PlayerData.Local.CanSwitch = false

			if PlayerData.Player.Tool ~= "None" then
				PlayerData.Player.Tool = "None"
			end

			local v35 = 1 - 1

			while true do
				wait()
				background.BackgroundTransparency = 1 - v35 / 20
				if 0 <= 1 then
					if v35 < 20 then
					else
						break
					end
				elseif 20 < v35 then
				else
					break
				end
				v35 = v35 + 1
			end

			PlayerData.Local.Pause = true

			handleGUIs(false)
			gameGui.Interface.Info.Visible = true
			gameGui.Interface.Info.PauseText.Visible = false
			gameGui.Interface.Info.MissionTitle.Text = "MISSION:"
			if gameGui:findFirstChild("Vintage") then
				gameGui.Vintage:Destroy()
			end
			local v36 = Instance.new("Weld")
			v36.Part0 = player.Character.Torso
			v36.Part1 = v20.PlayerPosition
			v36.Parent = player.Character.Torso
			local v37 = 1 - 1
			while true do
				wait()
				background.BackgroundTransparency = 0 + v37 / 20
				if 0 <= 1 then
					if v37 < 20 then
					else
						break
					end
				elseif 20 < v37 then
				else
					break
				end
				v37 = v37 + 1
			end
			spawnMCC()
		elseif v26 == 18 then
			local v38 = level.Greyness:getChildren()

			for _, part in v38 do
				part.Transparency = 0
			end
		elseif v26 == 28 then
			local v42 = level.Greyness:getChildren()

			for _, part in v42 do
				part.Transparency = 0.2
			end
		elseif v26 == 30 then
			wait(0.12)
			local v46 = 1 - 1
			while true do
				level.Parent.Map.GarageDoor.CFrame = level.Parent.Map.GarageDoor.CFrame + Vector3.new(0, 0.5, 0)
				wait()
				if 0 <= 1 then
					if v46 < 34 then
					else
						break
					end
				elseif 34 < v46 then
				else
					break
				end
				v46 = v46 + 1
			end
			wait(0.06)
		end

		while true do
			local v47 = 1
			if 2 < v26 then
				if v26 < 24 then
					v47 = 2
				end
			end
			local v48 = v47
				* (Vector3.new(v27.Position.x, v27.Position.y + v24, v27.Position.z) - v20.Base.Position).unit
			v20.Base.BodyPosition.position = v20.Base.BodyPosition.position + v48
			v20.Base.BodyGyro.cframe = CFrame.new(v20.Base.Position, v20.Base.BodyPosition.position + v48)
			if v26 < 30 then
				v20.CarHUD.SurfaceGui.Text1.Text = ":"
					.. math.ceil((v20.Base.Position - level.CarPath.CarPath30.Position).magnitude + 8)
			else
				v20.CarHUD.SurfaceGui.Text1.Text = ":0"
			end
			wait(0.12)
			if
				not (
					(v20.Base.Position - Vector3.new(v27.Position.x, v20.Base.Position.y, v27.Position.z)).magnitude
					< 4
				)
			then
			else
				break
			end
		end

		if 0 <= 1 then
			if v26 < v25 then
			else
				break
			end
		elseif v25 < v26 then
		else
			break
		end
		v26 = v26 + 1
	end

	print("Current car ride node: " .. tostring(v26))

	gameGui.Interface.Info.PauseText.Visible = false
	u6 = 11
end
function runObjectives()
	local missionText = gameGui.Interface.Info.MissionText
	local completeFrame = gameGui.Interface.LevelComplete
	local objectives = level.Objectives
	if PlayerData.Gameplay.LoadingZone == 1 then
		missionText.Text = "TAKE THE ELEVATOR TO THE LOBBY"
		while true do
			wait()
			if level.LoadingZones.Special.Button.Busy.Value then
				break
			end
		end
	end
	objectives.Elevator:Destroy()
	objectives.Outside.Part.Name = "Torso"
	missionText.Text = "GO OUTSIDE OF THE BUILDING"
	objectives.Outside.Torso.Touched:connect(function(p7)
		if p7 then
			if p7.Parent then
				if p7.Name == "Torso" then
					if script.Parent:findFirstChild("LocalScript") then
						objectives.Outside:Destroy()
					end
				end
			end
		end
	end)
	while true do
		wait()
		if not objectives:findFirstChild("Outside") then
			break
		end
	end
	objectives.Assistant.Part.Name = "Torso"
	missionText.Text = "SPEAK WITH THE ASSISTANT"
	while true do
		wait()
		if script.Parent.StoryScript.Current.Value then
			if script.Parent.StoryScript.Current.Value.Value ~= "Dr. Umar Tamid" then
			else
				break
			end
		end
	end
	objectives.Assistant:Destroy()
	missionText.Text = "TRAVEL TO THE HEADQUARTERS"
	while true do
		wait()
		if script.Parent.StoryScript.Busy.Value then
		else
			break
		end
	end
	wait(0.3)
	coroutine.resume(coroutine.create(function()
		carRide()
	end))
	while true do
		wait(0.3)
		if not objectives["Heart of Core"]:findFirstChild("Torso") then
		else
			break
		end
	end
	missionText.Text = "FIND THE SECRET ROOM"
	while true do
		wait()
		if objectives:findFirstChild("Heart of Core") then
		else
			break
		end
	end
	objectives["The Plan"].Part.Name = "Torso"
	missionText.Text = "READ HUBRIS HAUTEUR'S PLAN"
	while true do
		wait()
		if script.Parent.StoryScript.Current.Value then
			if script.Parent.StoryScript.Current.Value.Value ~= "Hubris Hauteur's Plan" then
			else
				break
			end
		end
	end
	objectives["The Plan"]:Destroy()
	objectives["Exit Flashback"].Part.Name = "Torso"
	missionText.Text = "EXIT FLASHBACK"
	while true do
		wait(0.12)
		if not ((objectives["Exit Flashback"].Torso.Position - player.Character.Torso.Position).magnitude < 12) then
		else
			break
		end
	end
	objectives["Exit Flashback"]:Destroy()
	missionText.Text = "TRAVEL TO THE HEADQUARTERS"
	while true do
		wait()
		if not (10 < u6) then
		else
			break
		end
	end
	missionText.Text = "LEVEL COMPLETE"
	wait(0.24)
	PlayerData.Gameplay.LoadingZone = 1
	PlayerData.Gameplay.Checkpoint = 1
	PlayerData.Gameplay.Progress = 0
	PlayerData.Local.Pause = true
	local l__Background__52 = gameGui.Interface.Background
	local v53 = 1 - 1
	while true do
		wait()
		l__Background__52.BackgroundTransparency = 1 - v53 / 20
		if 0 <= 1 then
			if v53 < 20 then
			else
				break
			end
		elseif 20 < v53 then
		else
			break
		end
		v53 = v53 + 1
	end
	completeFrame.LevelNumberDone.Text = "::INTRO LEVEL COMPLETE::"
	completeFrame.LevelNumberNext.Text = "::NEXT : LEVEL 1 : SILENCE::"
	completeFrame.LevelImage.Image = "http://www.roblox.com/asset/?id=122598868"
	completeFrame.Visible = true
	wait(0.09)
	completeFrame.Visible = false
	wait(0.06)
	completeFrame.Visible = true
	wait(0.12)
	completeFrame.Visible = false
	wait(0.06)
	completeFrame.Visible = true
	local nextButton = completeFrame.NextButton
	local redoButton = completeFrame.RedoButton
	local loadingText = gameGui.Interface.LoadingText
	local function startLoading()
		completeFrame.Visible = false
		gameGui.LocalScript.LocalPause.Value = false
		gameGui.CanPause.Value = false
		loadingText.Visible = true
		wait(0.12)
		loadingText.Visible = false
		wait(0.06)
		loadingText.Visible = true
	end
	nextButton.MouseButton1Click:connect(function()
		startLoading()
		PlayerData.Gameplay.Level += 1
	end)
	redoButton.MouseButton1Click:connect(function()
		startLoading()
		local hum = player.Character:findFirstChild("Humanoid")
		if hum then
			hum.Health = 0
		end
	end)
	wait(0.09)
	nextButton.Visible = true
	wait(0.09)
	redoButton.Visible = true
end

task.spawn(runObjectives)

function event1()
	while true do
		wait()
		if gameGui:findFirstChild("LocalScript") then
			if player.Character:findFirstChild("Torso") then
				break
			end
		end
	end
	local cutsceneFrame = script.Parent.Cutscene
	handleGUIs(false)
	local function tweenFrame(cframe, focus, step, fov, roll, style)
		local v59
		local v60

		if style == 1 then
			v59 = 1
			v60 = 181
		else
			v59 = -90
			v60 = 90
		end

		local camCF = camera.CFrame
		local camFocus = camera.Focus
		local camFov = camera.FieldOfView
		local camRoll = camera:GetRoll()
		local v65 = v59 - step
		while true do
			camera.CameraType = "Scriptable"
			local percent
			if style == 1 then
				percent = 1 / 181 * v65
			elseif style == 2 then
				percent = (math.sin((math.rad(v65))) + 1) / 2
			end
			camera.CFrame = CFrame.new(camCF.p:lerp(cframe.p, percent))
			camera.Focus = CFrame.new(camFocus.p:lerp(focus.p, percent))
			camera.FieldOfView = Vector3.new(camFov, 0, 0):Lerp(Vector3.new(fov, 0, 0), percent).X
			camera:SetRoll(Vector3.new(camRoll, 0, 0):Lerp(Vector3.new(roll, 0, 0), percent).X)
			camera.CFrame = CFrame.new(camera.CFrame.p, camera.Focus.p)
			task.wait(0.03)
			if 0 <= step then
				if v65 >= v60 then
					break
				end
			elseif v60 >= v65 then
				break
			end
			v65 = v65 + step
		end
	end
	local cutsceneData = level.Map1Task.CutsceneData
	local v68 = cutsceneData:GetChildren()
	camera.CameraSubject = nil
	camera.CameraType = "Scriptable"
	camera.CFrame = cutsceneData["1"].c1.Value
	camera.Focus = cutsceneData["1"].f1.Value
	camera.FieldOfView = cutsceneData["1"].FOV.Value
	camera:SetRoll(cutsceneData["1"].Roll.Value)
	while not gameGui.CanPause.Value do
		wait()
	end
	gameGui.LocalScript.LocalPause.Value = true
	local l__p__69 = player.Character.Torso.CFrame.Position

	--print(player.Character.Torso.Position)

	--player.Character.Torso.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);

	local v70 = 0
	while true do
		cutsceneFrame.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v70, 0)
		cutsceneFrame.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v70, 0)
		wait(0.03)
		if 0 <= 1 then
			if v70 < 20 then
			else
				break
			end
		elseif 20 < v70 then
		else
			break
		end
		v70 = v70 + 1
	end
	local v71 = #v68
	local v72 = 2 - 1
	for i = 1, #v68 do
		local frame = cutsceneData[tostring(i)]
		tweenFrame(
			frame.c1.Value,
			frame.f1.Value,
			frame.step.Value,
			frame.FOV.Value,
			frame.Roll.Value,
			frame.Style.Value
		)
	end
	(function()
		local l__Map__75 = level.Parent.Map
		for i = 0, 28 do
			l__Map__75.Cutscene.Screen.CFrame = l__Map__75.Cutscene.Screen.CFrame + Vector3.new(0, 0.2, 0)
			wait(0.03)
		end
	end)()
	wait()
	cutsceneFrame.NameText.Position = UDim2.new(0, 0, 0.3125, 0)
	cutsceneFrame.NameText.Text = "HUBRIS HAUTEUR"
	cutsceneFrame.NameText.Visible = true
	wait(3)
	cutsceneFrame.NameText.Visible = false
	cutsceneFrame.NameText.Position = UDim2.new(0, 0, 0.5625, 0);
	(function()
		local l__SurfaceGui__77 = level.Parent.Map.Cutscene.Screen.SurfaceGui

		local v78 = {
			"http://www.roblox.com/asset/?id=140359949",
			"http://www.roblox.com/asset/?id=140359931",
			"http://www.roblox.com/asset/?id=140359907",
		}

		--game:GetService("ContentProvider"):Preload(v78);

		local v82 = 1
		local v83 = true
		gameGui.StoryScript.Current.Value = level.Map1Task.Dialogue
		while true do
			wait(0.09)
			if gameGui.StoryScript.Choice.Value ~= 0 then
				l__SurfaceGui__77.Mouth.Image = v78[v82]
				if v83 then
					v82 = v82 + 1
				else
					v82 = v82 - 1
				end
				if not (2 < v82) then
					if v82 < 2 then
						v83 = not v83
					end
				else
					v83 = not v83
				end
			else
				l__SurfaceGui__77.Mouth.Image = "http://www.roblox.com/asset/?id=140359893"
			end
			if gameGui.StoryScript.Busy.Value then
			else
				break
			end
		end
	end)()
	wait(0.12)
	local function u9()
		local l__Map__84 = level.Parent.Map
		local v85 = 1 - 1
		while true do
			l__Map__84.Cutscene.Screen.CFrame = l__Map__84.Cutscene.Screen.CFrame - Vector3.new(0, 0.2, 0)
			wait()
			if 0 <= 1 then
				if v85 < 29 then
				else
					break
				end
			elseif 29 < v85 then
			else
				break
			end
			v85 = v85 + 1
		end
	end
	coroutine.resume(coroutine.create(function()
		u9()
		level.Parent.Map.Cutscene.Screen.SurfaceGui:Destroy()
	end))
	wait(0.12)
	local l__Background__86 = gameGui.Interface.Background
	local v87 = 1 - 1
	while true do
		wait()
		l__Background__86.BackgroundTransparency = 1 - v87 / 20
		if 0 <= 1 then
			if v87 < 20 then
			else
				break
			end
		elseif 20 < v87 then
		else
			break
		end
		v87 = v87 + 1
	end
	player.Character.Torso.CFrame = CFrame.new(l__p__69.X, l__p__69.Y, l__p__69.Z) * CFrame.Angles(0, 0, 0)
	wait(0.3)
	script.Parent.LocalScript.LocalPause.Value = false
	camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	camera.CameraType = "Custom"
	camera.FieldOfView = 70
	handleGUIs(true)
	local v88 = 1 - 1
	while true do
		cutsceneFrame.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v88, 0)
		cutsceneFrame.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v88, 0)
		wait()
		if 0 <= 1 then
			if v88 < 20 then
			else
				break
			end
		elseif 20 < v88 then
		else
			break
		end
		v88 = v88 + 1
	end
	local v89 = 1 - 1
	while true do
		wait()
		l__Background__86.BackgroundTransparency = 0 + v89 / 20
		if 0 <= 1 then
			if v89 < 20 then
			else
				break
			end
		elseif 20 < v89 then
		else
			break
		end
		v89 = v89 + 1
	end
	level.Map1Task:Destroy()
end

if PlayerData.Gameplay.LoadingZone == 1 then
	event1()
else
	level.Map1Task:Destroy()
end
