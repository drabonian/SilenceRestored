-- Decompiled with the Synapse X Luau decompiler.
local RunService = game:GetService("RunService")

print("Menu Module Running");

for i = 1, 20 do
	task.wait(0.03);
	script.Parent.Interface.Background.BackgroundTransparency = 1 - i / 20;
end;

task.wait(0.06);
--[[
if script.Parent.Parent:FindFirstChild("TestStats") then
	local h = script.Parent.Parent.TestStats:GetChildren();
	for i = 1, #h do
		if script.Parent.Parent.Stats:FindFirstChild(h[i].Name) then
			script.Parent.Parent.Stats[h[i].Name].Value = h[i].Value;
		end;
	end;
	script.Parent.Parent.TestStats:Destroy();
end;
]]

local gameGui = script.Parent;
local player = game.Players.LocalPlayer;
local char = player.Character;
local torso = char.Torso;
local camera = game.Workspace.CurrentCamera;
local gameItems = game.ReplicatedStorage.GameItems;
local stat = player.Stats;
local menu = gameItems.MasterGuis.Menu:Clone();
menu.Parent = gameGui.Interface;


local h = camera:getChildren();
for i = 1, #h do
	if h[i]:IsA("Model") then
		h[i]:Destroy();
	end;
end;
gameGui.SoundScript.Disabled = false;
gameGui.SoundScript.Current.Value = "DetroitAmbient";

if false and (stat.Level.Value < 0) then
	print("GRRR")
	stat.Level.Value = 0;
	stat.Intro.Value = true;
end;
local background = gameGui.Interface.Background;
local humanoid = char.Humanoid;
function introCutscene()
	print("doing cutscene!")
	local map = gameItems.MasterLevels.Level3.Map2:clone(); --default
	--local map = gameItems.MasterLevels.Level0.Map1:Clone()
	map.Name = "Map";
	map.Parent = camera;
	task.wait(0.03);
	local zones = gameItems.MasterLevels.Level3.Level.LoadingZones:clone();
	zones.Name = "Zones";
	zones.Parent = camera;
	task.wait(3);
	local lights = map.Lights:GetChildren();
	local v18 = #lights;
	local v19 = 1 - 1;

	for _,lightPart in lights do
		lightPart.PointLight.Enabled = false

		if lightPart.BrickColor.Name == "Medium stone grey" then
			lightPart.BrickColor = BrickColor.new("Black")
		end
	end


	gameGui.Health.Visible = false;
	gameGui.Ammo.Visible = false;
	gameGui.Power.Visible = false;
	gameGui.Reticle.Visible = false;
	gameGui.Radar.Visible = false;
	local function tweenFrame(cframe, focus, step, fov, roll, style)
		local v21
		local v22

		if style == 1 then
			v21 = 1;
			v22 = 181;
		else
			v21 = -90;
			v22 = 90;
		end;

		local camCF = camera.CFrame;
		local camFocus = camera.Focus;
		local camFov = camera.FieldOfView;
		local camRoll = camera:GetRoll();
		local v27 = v21 - step;
		while true do
			camera.CameraType = "Scriptable";
			local percent = nil;
			if style == 1 then
				percent = 1/181 * v27;
			elseif style == 2 then
				percent = (math.sin((math.rad(v27))) + 1) / 2;
			end;
			camera.CFrame = CFrame.new(camCF.p:lerp(cframe.p, percent));
			camera.Focus = CFrame.new(camFocus.p:lerp(focus.p, percent));
			camera.FieldOfView = Vector3.new(camFov, 0, 0):Lerp(Vector3.new(fov, 0, 0), percent).X;
			camera:SetRoll(Vector3.new(camRoll, 0, 0):Lerp(Vector3.new(roll, 0, 0), percent).X);
			camera.CFrame = CFrame.new(camera.CFrame.p, camera.Focus.p);
			task.wait(0.03);
			if 0 <= step then
				if v27 >= v22 then
					break;
				end;
			elseif v22 >= v27 then
				break;
			end;
			v27 = v27 + step;		
		end;
	end;
	camera.CameraSubject = nil;
	camera.CameraType = "Scriptable";
	local cutscene = script.CutsceneData
	--local cutscene = gameItems.MasterLevels.Level0.Level.Map1Task.CutsceneData
	local cutscenePieces = cutscene:GetChildren();
	camera.CFrame = cutscene["1"].c1.Value;
	camera.Focus = cutscene["1"].f1.Value;
	camera.FieldOfView = cutscene["1"].FOV.Value;
	camera:SetRoll(cutscene["1"].Roll.Value);
	local h0 = 1 - 1;
	while true do
		task.wait(0.03);
		script.Parent.Interface.Background.BackgroundTransparency = 0 + h0 / 20;
		if 0 <= 1 then
			if h0 < 20 then

			else
				break;
			end;
		elseif 20 < h0 then

		else
			break;
		end;
		h0 = h0 + 1;	
	end;
	coroutine.resume(coroutine.create(function()
		task.wait(7);

		local parts = {"LightRow1", "LightRow2", "LightRow3", "LightRow4"}

		for _,lightName in parts do
			for _,lightPart in lights do
				if lightPart.Name == lightName then
					lightPart.PointLight.Enabled = true
					if lightPart.BrickColor == "Black" then
						lightPart.BrickColor = BrickColor.new("Medium stone grey")
					end
				end
			end

			task.wait(3)
		end
	end));

	local numPieces = #cutscenePieces;
	local i = 1;
	while true do
		local cutscenePiece = cutscene[tostring(i)];
		tweenFrame(cutscenePiece.c1.Value, cutscenePiece.f1.Value, cutscenePiece.step.Value, cutscenePiece.FOV.Value, cutscenePiece.Roll.Value, cutscenePiece.Style.Value);
		if 0 <= 1 then
			if i < numPieces then

			else
				break;
			end;
		elseif numPieces < i then

		else
			break;
		end;
		i = i + 1;	
	end;
	local inc = 0;
	while true do
		task.wait(0.03);
		background.BackgroundTransparency = 1 - inc / 20;
		if 0 <= 1 then
			if inc < 20 then

			else
				break;
			end;
		elseif 20 < inc then

		else
			break;
		end;
		inc = inc + 1;	
	end;
	camera.CameraSubject = humanoid;
	camera.CameraType = "Custom";
	camera.FieldOfView = 70;
	map:Destroy();
	zones:Destroy();
	gameGui.Health.Visible = true;
	gameGui.Ammo.Visible = true;
	gameGui.Power.Visible = true;
	gameGui.Reticle.Visible = true;
	gameGui.Radar.Visible = true;
	runMenu();
end

local loadingText = gameGui.Interface.LoadingText;
local buttons = menu.Buttons;

function runMenu()
	local function v43(p7)
		p7:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true);
		menu.Visible = false;
		loadingText.Visible = true;
		task.wait(0.09);
		menu.Visible = true;
		loadingText.Visible = false;
		task.wait(0.12);
		menu.Visible = false;
		loadingText.Visible = true;
		task.wait(0.06);
		menu.Visible = true;
		loadingText.Visible = false;
		task.wait(0.06);
		menu.Visible = false;
		loadingText.Visible = true;
		gameGui.GameScript.Disabled = false;
		menu:Destroy();
		script.Disabled = true;
	end;
	local v44, v45, v46 = pairs(buttons:GetChildren());
	local selectedLevel = 0
	while true do
		local v47, button = v44(v45, v46);
		if v47 then

		else
			break;
		end;
		v46 = v47;
		if button:IsA("TextButton") then
			button.MouseEnter:connect(function(p8, p9)
				if button.BackgroundTransparency < 0.8 then
					button:TweenSize(UDim2.new(0, 340, 0.05, 8), "Out", "Quad", 0.48, true);
				end;
			end);
			button.MouseLeave:connect(function(p10, p11)
				button:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true);
			end);
			if string.len(button.Name) == 1 then
				if tonumber(button.Name) <= stat.LevelMax.Value then
					button.Active = true;
					button.AutoButtonColor = true;
					button.BackgroundTransparency = 0.7;
					button.TextStrokeTransparency = 0;
					button.TextTransparency = 0;
					local u5 = false;
					button.MouseButton1Click:connect(function()
						if u5 then
							return;
						end;
						u5 = true;
						selectedLevel = tonumber(button.Name);
						button:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true);
						buttons:TweenPosition(UDim2.new(0, 0, -2, 0), "Out", "Quad", 1, false);
						task.wait(1);
						u5 = false;
					end);
				end;
			end;
			if string.sub(button.Name, 1, 4) == "diff" then
				local u7 = false;
				local u8 = 0;
				button.MouseButton1Click:connect(function()
					if u7 then
						return;
					end;
					u7 = true;
					stat.Difficulty.Value = tonumber((string.sub(button.Name, 5)));
					stat.Tool.Value = "None";
					stat.Progress.Value = 0;
					stat.Power.Value = stat.PowerMax.Value;
					stat.LoadingZone.Value = 1;
					stat.Checkpoint.Value = 1;
					stat.Level.Value = selectedLevel;
					v43(button);
				end);
			end;
		end;	
	end;
	local u9 = false;
	buttons.LoadButton.MouseButton1Click:connect(function()
		if buttons.LoadButton.Active then
			if u9 then
				return;
			end;
		else
			return;
		end;
		u9 = true;
		v43(buttons.LoadButton);
	end);
	buttons.NewButton.MouseButton1Click:connect(function()
		if u9 then
			return;
		end;
		u9 = true;
		buttons.NewButton:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true);
		buttons:TweenPosition(UDim2.new(0, 0, -1, 0), "Out", "Quad", 1, false);
		task.wait(1);
		u9 = false;
	end);
	buttons.BackButton1.MouseButton1Click:connect(function()
		if u9 then
			return;
		end;
		u9 = true;
		buttons.BackButton1:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true);
		buttons:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 1, false);
		task.wait(1);
		u9 = false;
	end);
	buttons.BackButton2.MouseButton1Click:connect(function()
		if u9 then
			return;
		end;
		u9 = true;
		buttons.BackButton2:TweenSize(UDim2.new(0, 300, 0.05, 8), "Out", "Quad", 0.48, true);
		buttons:TweenPosition(UDim2.new(0, 0, -1, 0), "Out", "Quad", 1, false);
		task.wait(1);
		u9 = false;
	end);
	menu.Visible = true;
	task.wait(0.09);
	menu.Visible = false;
	task.wait(0.12);
	menu.Visible = true;
	task.wait(0.06);
	menu.Visible = false;
	task.wait(0.06);
	menu.Visible = true;
	task.wait(0.06);
	menu.Visible = false;
	task.wait(0.06);
	menu.Visible = true;
end;

if not (stat.Level.Value >= 0 or stat.Intro.Value) then
	print("I AM PLAYING THE INTRO CUTSCENE")
	stat.Level.Value = 0;
	stat.Intro.Value = true;
	introCutscene();
	return;
end;

if v2 then
	game.Players.CharacterAutoLoads = true;
end;

buttons.LoadButton.Active = true;
buttons.LoadButton.AutoButtonColor = true;
buttons.LoadButton.BackgroundTransparency = 0.7;
buttons.LoadButton.TextStrokeTransparency = 0;
buttons.LoadButton.TextTransparency = 0;

if stat.LevelMax.Value < stat.Level.Value then
	stat.LevelMax.Value = stat.Level.Value;
end;

if not player:findFirstChild("FirstEnter") or not (not player.FirstEnter.Value) then
	runMenu();
	return;
end;

loadingText.Visible = true;
gameGui.GameScript.Disabled = false;
menu:Destroy();
script.Disabled = true;
