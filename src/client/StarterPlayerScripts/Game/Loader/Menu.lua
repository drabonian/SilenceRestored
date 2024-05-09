local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SoundManager = require(script.Parent.SoundManager)
local GameScript = require(script.Parent.GameScript)
local PlayerData = require(ReplicatedStorage.Stats.PlayerData)

local LIGHT_PARTS = { "LightRow1", "LightRow2", "LightRow3", "LightRow4" }

local module = {}

local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")
local gameGui = playerGui:WaitForChild("GameGui")

local interface = gameGui.Interface
local background = interface.Background

local cutscenes = ReplicatedStorage.Cutscenes

local camera = workspace.CurrentCamera
local gameItems = ReplicatedStorage.GameItems

local menu = gameItems.MasterGuis.Menu:Clone()

local loadingText = interface.LoadingText
local buttons = menu.Buttons

menu.Parent = gameGui.Interface

local function LevelSelectButton(button)
	button:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true)
	menu.Visible = false
	loadingText.Visible = true
	task.wait(0.09)
	menu.Visible = true
	loadingText.Visible = false
	task.wait(0.12)
	menu.Visible = false
	loadingText.Visible = true
	task.wait(0.06)
	menu.Visible = true
	loadingText.Visible = false
	task.wait(0.06)
	menu.Visible = false
	loadingText.Visible = true

	menu:Destroy()

	GameScript.LoadLevel()
end

local function runMenu()
	local selectedLevel = 0

	for _, button in buttons:GetChildren() do
		if button:IsA("TextButton") then
			button.MouseEnter:Connect(function()
				if button.BackgroundTransparency < 0.8 then
					button:TweenSize(UDim2.new(0, 340, 0.05, 8), "Out", "Quad", 0.48, true)
				end
			end)
			button.MouseLeave:Connect(function()
				button:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true)
			end)
			if string.len(button.Name) == 1 then
				if tonumber(button.Name) <= PlayerData.Gameplay.MaxCompletedLevel then
					button.Active = true
					button.AutoButtonColor = true
					button.BackgroundTransparency = 0.7
					button.TextStrokeTransparency = 0
					button.TextTransparency = 0
					local debounce = false
					button.MouseButton1Click:Connect(function()
						if debounce then
							return
						end
						debounce = true
						selectedLevel = tonumber(button.Name)
						button:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true)
						buttons:TweenPosition(UDim2.new(0, 0, -2, 0), "Out", "Quad", 1, false)
						task.wait(1)
						debounce = false
					end)
				end
			end
			if string.sub(button.Name, 1, 4) == "diff" then
				local debounce = false

				button.MouseButton1Click:Connect(function()
					if debounce then
						return
					end
					debounce = true
					PlayerData.Difficulty = tonumber((string.sub(button.Name, 5)))
					PlayerData.Player.Tool = "None"
					PlayerData.Gameplay.Progress = 0
					PlayerData.Gameplay.LoadingZone = 1
					PlayerData.Gameplay.Checkpoint = 1
					PlayerData.Gameplay.Level = selectedLevel
					LevelSelectButton(button)
				end)
			end
		end
	end

	local debounce = false

	buttons.LoadButton.MouseButton1Click:Connect(function()
		if not buttons.LoadButton.Active then
			return
		end
		if debounce then
			return
		end

		debounce = true
		LevelSelectButton(buttons.LoadButton)
	end)

	buttons.NewButton.MouseButton1Click:Connect(function()
		if debounce then
			return
		end
		debounce = true
		buttons.NewButton:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true)
		buttons:TweenPosition(UDim2.new(0, 0, -1, 0), "Out", "Quad", 1, false)
		task.wait(1)
		debounce = false
	end)

	buttons.BackButton1.MouseButton1Click:Connect(function()
		if debounce then
			return
		end
		debounce = true
		buttons.BackButton1:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true)
		buttons:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 1, false)
		task.wait(1)
		debounce = false
	end)

	buttons.BackButton2.MouseButton1Click:Connect(function()
		if debounce then
			return
		end
		debounce = true
		buttons.BackButton2:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true)
		buttons:TweenPosition(UDim2.new(0, 0, -1, 0), "Out", "Quad", 1, false)
		task.wait(1)
		debounce = false
	end)

	menu.Visible = true
	task.wait(0.09)
	menu.Visible = false
	task.wait(0.12)
	menu.Visible = true
	task.wait(0.06)
	menu.Visible = false
	task.wait(0.06)
	menu.Visible = true
	task.wait(0.06)
	menu.Visible = false
	task.wait(0.06)
	menu.Visible = true
end

local function tweenFrame(cframe, focus, step, fov, roll, style)
	local v21
	local v22

	if style == 1 then
		v21 = 1
		v22 = 181
	else
		v21 = -90
		v22 = 90
	end

	local camCF = camera.CFrame
	local camFocus = camera.Focus
	local camFov = camera.FieldOfView
	local camRoll = camera:GetRoll()
	local v27 = v21 - step
	while true do
		camera.CameraType = "Scriptable"
		local percent = nil
		if style == 1 then
			percent = 1 / 181 * v27
		elseif style == 2 then
			percent = (math.sin((math.rad(v27))) + 1) / 2
		end
		camera.CFrame = CFrame.new(camCF.p:Lerp(cframe.p, percent))
		camera.Focus = CFrame.new(camFocus.p:Lerp(focus.p, percent))
		camera.FieldOfView = Vector3.new(camFov, 0, 0):Lerp(Vector3.new(fov, 0, 0), percent).X
		camera:SetRoll(Vector3.new(camRoll, 0, 0):Lerp(Vector3.new(roll, 0, 0), percent).X)
		camera.CFrame = CFrame.new(camera.CFrame.p, camera.Focus.p)
		task.wait(0.03)
		if 0 <= step then
			if v27 >= v22 then
				break
			end
		elseif v22 >= v27 then
			break
		end
		v27 = v27 + step
	end
end

local function introCutscene()
	print("Running Intro Cutscene")

	local cutscene = cutscenes.Intro
	local cutscenePieces = cutscene:GetChildren()

	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char.Humanoid

	local map = gameItems.MasterLevels.Level3.Map2:Clone()
	local zones = gameItems.MasterLevels.Level3.Level.LoadingZones:Clone()

	map.Name = "Map"
	map.Parent = camera

	task.wait(0.03)

	zones.Name = "Zones"
	zones.Parent = camera

	task.wait(3)

	local lights = map.Lights:GetChildren()

	for _, lightPart in lights do
		lightPart.PointLight.Enabled = false

		if lightPart.BrickColor.Name == "Medium stone grey" then
			lightPart.BrickColor = BrickColor.new("Black")
		end
	end

	gameGui.Health.Visible = false
	gameGui.Ammo.Visible = false
	gameGui.Power.Visible = false
	gameGui.Reticle.Visible = false
	gameGui.Radar.Visible = false

	camera.CameraSubject = nil
	camera.CameraType = "Scriptable"

	camera.CFrame = cutscene["1"].c1.Value
	camera.Focus = cutscene["1"].f1.Value
	camera.FieldOfView = cutscene["1"].FOV.Value
	camera:SetRoll(cutscene["1"].Roll.Value)

	local h0 = 0

	while true do
		task.wait(0.03)
		interface.Background.BackgroundTransparency = 0 + h0 / 20
		if 0 <= 1 then
			if h0 > 20 then
				break
			end
		elseif 20 > h0 then
			break
		end
		h0 = h0 + 1
	end

	task.spawn(function()
		task.wait(7)

		for _, lightPart in lights do
			if table.find(LIGHT_PARTS, lightPart.Name) then
				lightPart.PointLight.Enabled = true
				if lightPart.BrickColor == "Black" then
					lightPart.BrickColor = BrickColor.new("Medium stone grey")
				end
			end
		end

		task.wait(3)
	end)

	local numPieces = #cutscenePieces

	for i = 1, numPieces, 1 do
		local cutscenePiece = cutscene[tostring(i)]
		tweenFrame(
			cutscenePiece.c1.Value,
			cutscenePiece.f1.Value,
			cutscenePiece.step.Value,
			cutscenePiece.FOV.Value,
			cutscenePiece.Roll.Value,
			cutscenePiece.Style.Value
		)
	end

	local inc = 0

	while true do
		task.wait(0.03)
		background.BackgroundTransparency = 1 - inc / 20
		if 0 <= 1 then
			if inc > 20 then
				break
			end
		elseif 20 > inc then
			break
		end
		inc = inc + 1
	end

	camera.CameraSubject = humanoid
	camera.CameraType = "Custom"
	camera.FieldOfView = 70
	map:Destroy()
	zones:Destroy()
	gameGui.Health.Visible = true
	gameGui.Ammo.Visible = true
	gameGui.Power.Visible = true
	gameGui.Reticle.Visible = true
	gameGui.Radar.Visible = true
	runMenu()
end

function module.Init()
	print("Menu Module Running")

	for i = 1, 20 do
		task.wait(0.03)
		background.BackgroundTransparency = 1 - i / 20
	end

	task.wait(0.06)

	camera:ClearAllChildren()

	SoundManager.RunSoundWithName("DetroitAmbient")

	if PlayerData.Gameplay.Intro then
		PlayerData.Gameplay.Level = 0
		PlayerData.Gameplay.Intro = true
		introCutscene()
		return
	end

	buttons.LoadButton.Active = true
	buttons.LoadButton.AutoButtonColor = true
	buttons.LoadButton.BackgroundTransparency = 0.7
	buttons.LoadButton.TextStrokeTransparency = 0
	buttons.LoadButton.TextTransparency = 0

	runMenu()
end

return module
