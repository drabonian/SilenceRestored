-- Decompiled with the Synapse X Luau decompiler.

print("Game Script Running");
while true do
	wait(0.09);
	if script.Parent and script.Parent.Parent and game.Workspace and game.ReplicatedStorage and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character.Torso:findFirstChild("Right Shoulder") and game.Players.LocalPlayer.Character.Torso:findFirstChild("Left Shoulder") and game.Players.LocalPlayer:findFirstChild("Stats") and game.Players.LocalPlayer.Stats:findFirstChild("Location") and game.Players.LocalPlayer.Stats:findFirstChild("Progress") and game.Players.LocalPlayer.Stats:findFirstChild("Restart") then
		break;
	end;
end;
wait(0.09);
local gameGui = script.Parent;
local player = game.Players.LocalPlayer;
local char = player.Character;
local head = char.Head;
local camera = game.Workspace.CurrentCamera;
local mouse = player:GetMouse();
local debrisService = game:GetService("Debris");
local gameItems = game.ReplicatedStorage.GameItems;
local levelData = {
	Level0 = {
		canSwitch = false, 
		theIncident = false, 
		tool = "None", 
		location = CFrame.new(126, 121, -3895), 
		song = "DetroitAmbient"
	}, 
	Level1 = {
		canSwitch = false, 
		theIncident = false, 
		tool = "None", 
		location = CFrame.new(-1026, 303, -3998), 
		song = "EnteringTYM"
	}, 
	Level2 = {
		canSwitch = true, 
		theIncident = true, 
		tool = "None", 
		location = CFrame.new(-1120, 828, -4241), 
		song = "DetroitAmbient"
	}, 
	Level3 = {
		canSwitch = true, 
		theIncident = true, 
		tool = "Pistol", 
		location = CFrame.new(-130, 42, 93), 
		song = "DetroitAmbient"
	}, 
	Level4 = {
		canSwitch = true, 
		theIncident = true, 
		tool = "Pistol", 
		location = CFrame.new(-32, 7, 24), 
		song = "EverybodyLies"
	}, 
	Level5 = {
		canSwitch = true, 
		theIncident = true, 
		tool = "Pistol", 
		location = CFrame.new(-32, 7, 24), 
		song = "DetroitAmbient"
	}, 
	Level6 = {
		canSwitch = true, 
		theIncident = true, 
		tool = "Pistol", 
		location = CFrame.new(-32, 7, 24), 
		song = "DetroitAmbient"
	}, 
	Level7 = {
		canSwitch = true, 
		theIncident = true, 
		tool = "Pistol", 
		location = CFrame.new(-32, 7, 24), 
		song = "DetroitAmbient"
	}, 
	Level8 = {
		canSwitch = true, 
		theIncident = true, 
		tool = "Assault Rifle 1", 
		location = CFrame.new(32, 104, -3500), 
		song = "DetroitAmbient"
	}
};
local v10 = camera:getChildren();
for v11 = 1, #v10 do
	if v10[v11]:IsA("Model") then
		v10[v11]:Destroy();
	end;
end;
function handleGUIs(p1)
	gameGui.Health.Visible = p1;
	gameGui.Ammo.Visible = p1;
	gameGui.Power.Visible = p1;
	gameGui.Reticle.Visible = p1;
	gameGui.Radar.Visible = p1;
	gameGui.Interface.Info.Visible = p1;
end;
handleGUIs(true);
function playSoundEffect(p2, p3)
	if script.Parent:FindFirstChild("SoundScript") then
		local v12 = Instance.new("StringValue");
		v12.Name = "Sound";
		v12.Value = p2;
		local v13 = Instance.new("ObjectValue");
		v13.Name = "Location";
		v13.Value = p3;
		v13.Parent = v12;
		v12.Parent = script.Parent.SoundScript.Effects;
	end;
end;

local v14 = gameItems.MasterLevels:getChildren();

local v19 = game.Players.LocalPlayer.userId == -1;

if player:findFirstChild("FirstEnter") and player.FirstEnter.Value then
	coroutine.resume(coroutine.create(function()
		local v20 = gameItems.MasterSounds:GetChildren();
		for v21 = 1, #v20 do
			local v22 = v20[v21]:Clone();
			v22.Volume = 0;
			v22.Parent = gameGui;
			v22:Play();
			v22.Name = "LoadingSound";
			wait(0.12);
			v22:Stop();
			v22:Destroy();
		end;
	end));
	player.FirstEnter.Value = false;
	for v23 = 1, #v14 do
		local v24 = v14[v23]:getChildren();
		for v25 = 1, #v24 do
			local v26 = v24[v25]:clone();
			v26.Parent = camera;
			if v19 then
				wait();
			else
				wait(0.12);
			end;
			v26:Destroy();
		end;
	end;
end;
function addMap(p5, p6)
	local v27 = p5:getChildren();
	
	for i,item in v27 do
		if item:IsA("Model") then
			if item:findFirstChild("MainJoint") then
				local v30 = item:Clone();
				v30:MakeJoints();
				v30.Parent = p6;
			else
				local v31 = Instance.new("Model");
				v31.Name = item.Name;
				v31.Parent = p6;
				addMap(item, v31);
			end;
		else
			item:Clone().Parent = p6;
		end;
		-- ????
		if i % 160 == 0 then
			wait();
		end;
	end
end;
local stat = player.Stats;
function loadMap()
	if gameGui:findFirstChild("MapControl") then
		gameGui.MapControl:Destroy();
	end;
	local v32 = gameGui:getChildren();
	local v33 = #v32;
	local v34 = 1 - 1;
	while true do
		if v32[v34] then
			if v32[v34].Name == "MapScript" then
				v32[v34]:Destroy();
			end;
		end;
		if 0 <= 1 then
			if v34 < v33 then

			else
				break;
			end;
		elseif v33 < v34 then

		else
			break;
		end;
		v34 = v34 + 1;	
	end;
	if camera:findFirstChild("Map") then
		camera.Map:Destroy();
	end;
	wait();
	local v35 = Instance.new("Model");
	v35.Name = "Map";
	v35.Parent = camera;
	local v36 = gameItems.MasterLevels["Level" .. stat.Level.Value]["Map" .. stat.LoadingZone.Value];
	(function()
		game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.FogEnd = 60;
		game.Lighting.Brightness = 0;
		game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0);
	end)();
	addMap(v36, v35);
	local v37 = v36:findFirstChild("MapControl");
	if v37 then
		v37:clone().Parent = gameGui;
		gameGui.MapControl.Disabled = false;
	end;
end;
local l__Humanoid__3 = char.Humanoid;
function loadingZoneChanged()
	if 0 < l__Humanoid__3.Health then
		loadMap();
	end;
end;
function elevatorLoad(elevator)
	coroutine.resume(coroutine.create(function()
		gameGui.LocalScript.LocalPause.Value = true;
		if elevator.Button.Parent.Elevator:findFirstChild("ElevatorDoor") then
			local doors = elevator.Button.Parent.Elevator.ElevatorDoor;
			playSoundEffect("SlideClosed", doors.Door1);
			playSoundEffect("SlideClosed", doors.Door2);
			for i = 1, 8 do
				doors.Door1.CFrame = doors.Door1.CFrame + (doors.ClosedPosition1.Position - doors.OpenPosition1.Position) / 8;
				doors.Door2.CFrame = doors.Door2.CFrame + (doors.ClosedPosition2.Position - doors.OpenPosition2.Position) / 8;
				wait();		
			end;
		elseif elevator.Button.Parent.Elevator:findFirstChild("ElevatorDoor1") then
			if elevator.Button.Parent.Elevator:findFirstChild("ElevatorDoor2") then
				local doorSet1 = elevator.Button.Parent.Elevator.ElevatorDoor1;
				local doorSet2 = elevator.Button.Parent.Elevator.ElevatorDoor2;
				playSoundEffect("SlideClosed", doorSet1.Door1);
				playSoundEffect("SlideClosed", doorSet1.Door2);
				playSoundEffect("SlideClosed", doorSet2.Door1);
				playSoundEffect("SlideClosed", doorSet2.Door2);
				for i = 1, 8 do
					doorSet1.Door1.CFrame = doorSet1.Door1.CFrame + (doorSet1.ClosedPosition1.Position - doorSet1.OpenPosition1.Position) / 8;
					doorSet1.Door2.CFrame = doorSet1.Door2.CFrame + (doorSet1.ClosedPosition2.Position - doorSet1.OpenPosition2.Position) / 8;
					doorSet2.Door1.CFrame = doorSet2.Door1.CFrame + (doorSet2.ClosedPosition1.Position - doorSet2.OpenPosition1.Position) / 8;
					doorSet2.Door2.CFrame = doorSet2.Door2.CFrame + (doorSet2.ClosedPosition2.Position - doorSet2.OpenPosition2.Position) / 8;
					wait();			
				end;
			end;
		end;
		gameGui.LocalScript.LocalPause.Value = false;
		if stat.LoadingZone.Value == elevator.Button.Map.Value.X then
			stat.LoadingZone.Value = elevator.Button.Map.Value.Y;
		else
			stat.LoadingZone.Value = elevator.Button.Map.Value.X;
		end;
		coroutine.resume(coroutine.create(function()
			loadingZoneChanged();
		end));
		local l__Value__43 = elevator.Button.Time.Value;
		local v44 = 1 - 1;
		while true do
			local v45 = 1 - 1;
			while true do
				local v46 = 0 + 0.02 * v45;
				elevator.Button.Parent.Elevator.ElevatorSign.SurfaceGui.Text1.TextStrokeColor3 = Color3.new(0.5 + v46, 0.5 - v46, 0.5 - v46);
				elevator.Button.Parent.Elevator.ElevatorSign.SurfaceGui.Text2.TextStrokeColor3 = Color3.new(0.5 + v46, 0.5 - v46, 0.5 - v46);
				wait();
				if 0 <= 1 then
					if v45 < 25 then

					else
						break;
					end;
				elseif 25 < v45 then

				else
					break;
				end;
				v45 = v45 + 1;			
			end;
			local v47 = 25 - -1;
			while true do
				local v48 = 0 + 0.02 * v47;
				elevator.Button.Parent.Elevator.ElevatorSign.SurfaceGui.Text1.TextStrokeColor3 = Color3.new(0.5 + v48, 0.5 - v48, 0.5 - v48);
				elevator.Button.Parent.Elevator.ElevatorSign.SurfaceGui.Text2.TextStrokeColor3 = Color3.new(0.5 + v48, 0.5 - v48, 0.5 - v48);
				wait();
				if 0 <= -1 then
					if v47 < 1 then

					else
						break;
					end;
				elseif 1 < v47 then

				else
					break;
				end;
				v47 = v47 + -1;			
			end;
			wait();
			if 0 <= 1 then
				if v44 < l__Value__43 then

				else
					break;
				end;
			elseif l__Value__43 < v44 then

			else
				break;
			end;
			v44 = v44 + 1;		
		end;
		if elevator.Button.Parent.Elevator:findFirstChild("ElevatorDoor") then
			local l__ElevatorDoor__49 = elevator.Button.Parent.Elevator.ElevatorDoor;
			playSoundEffect("SlideOpen", l__ElevatorDoor__49.Door1);
			playSoundEffect("SlideOpen", l__ElevatorDoor__49.Door2);
			for i = 1, 8 do
				l__ElevatorDoor__49.Door1.CFrame = l__ElevatorDoor__49.Door1.CFrame - (l__ElevatorDoor__49.ClosedPosition1.Position - l__ElevatorDoor__49.OpenPosition1.Position) / 8;
				l__ElevatorDoor__49.Door2.CFrame = l__ElevatorDoor__49.Door2.CFrame - (l__ElevatorDoor__49.ClosedPosition2.Position - l__ElevatorDoor__49.OpenPosition2.Position) / 8;	
			end;
		elseif elevator.Button.Parent.Elevator:findFirstChild("ElevatorDoor1") then
			if elevator.Button.Parent.Elevator:findFirstChild("ElevatorDoor2") then
				local doorSet1 = elevator.Button.Parent.Elevator.ElevatorDoor1;
				local doorSet2 = elevator.Button.Parent.Elevator.ElevatorDoor2;
				playSoundEffect("SlideOpen", doorSet1.Door1);
				playSoundEffect("SlideOpen", doorSet1.Door2);
				playSoundEffect("SlideOpen", doorSet2.Door1);
				playSoundEffect("SlideOpen", doorSet2.Door2);
				for i = 0, 8 do
					doorSet1.Door1.CFrame = doorSet1.Door1.CFrame - (doorSet1.ClosedPosition1.Position - doorSet1.OpenPosition1.Position) / 8;
					doorSet1.Door2.CFrame = doorSet1.Door2.CFrame - (doorSet1.ClosedPosition2.Position - doorSet1.OpenPosition2.Position) / 8;
					doorSet2.Door1.CFrame = doorSet2.Door1.CFrame - (doorSet2.ClosedPosition1.Position - doorSet2.OpenPosition1.Position) / 8;
					doorSet2.Door2.CFrame = doorSet2.Door2.CFrame - (doorSet2.ClosedPosition2.Position - doorSet2.OpenPosition2.Position) / 8;
					wait()			
				end;
			end;
		end;
		elevator.Button.Busy.Value = false;
		if stat.Checkpoint.Value < stat.LoadingZone.Value then
			stat.Checkpoint.Value = stat.LoadingZone.Value;
		end;
	end));
end;
function decontaminationLoad(loadZone)
	coroutine.resume(coroutine.create(function()
		gameGui.LocalScript.LocalPause.Value = true;
		local doorSet1 = loadZone.Button.Parent.Decontamination.DoorSet1;
		local doorSet2 = loadZone.Button.Parent.Decontamination.DoorSet2;
		playSoundEffect("SlideClosed", doorSet1);
		playSoundEffect("SlideClosed", doorSet2);
		if loadZone.Button.Way.Value then --opening phase
			local door1Pos = doorSet1.Door1.Position
			local door2Pos = doorSet1.Door2.Position
			for i = 1, 8 do
				doorSet1.Door1.Position = door1Pos + (doorSet1.ClosedPosition1.Position-doorSet1.OpenPosition1.Position)*i/8;
				doorSet1.Door2.Position = door2Pos + (doorSet1.ClosedPosition2.Position-doorSet1.OpenPosition2.Position)*i/8;
				wait()
			end;
		else
			local door1Pos = doorSet2.Door1.Position
			local door2Pos = doorSet2.Door2.Position
			for i = 1, 8 do
				doorSet2.Door1.Position = door1Pos + (doorSet2.ClosedPosition1.Position-doorSet2.OpenPosition1.Position)*i/8;
				doorSet2.Door2.Position = door2Pos + (doorSet2.ClosedPosition2.Position-doorSet2.OpenPosition2.Position)*i/8;
				wait()
			end;
		end;
		gameGui.LocalScript.LocalPause.Value = false;
		if stat.LoadingZone.Value == loadZone.Button.Map.Value.X then
			stat.LoadingZone.Value = loadZone.Button.Map.Value.Y;
		else
			stat.LoadingZone.Value = loadZone.Button.Map.Value.X;
		end;
		coroutine.resume(coroutine.create(function()
			loadingZoneChanged();
		end));
		
		local v58 = loadZone.Button.Parent.Decontamination.Cleaners:getChildren();
		
		for _,cleaner in v58 do
			if math.random(1, 4) == 2 then
				cleaner.Mist.Enabled = true
			end	
		end

		local l__Value__61 = loadZone.Button.Time.Value;
		
		
		local v62 = 1 - 1;
		while true do
			local v63 = 1 - 1;
			while true do
				loadZone.Button.Parent.Decontamination.Light.PointLight.Brightness = 1 - 0.025 * v63;
				wait();
				if 0 <= 1 then
					if v63 < 20 then

					else
						break;
					end;
				elseif 20 < v63 then

				else
					break;
				end;
				v63 = v63 + 1;			
			end;
			local v64 = 1 - 1;
			while true do
				loadZone.Button.Parent.Decontamination.Light.PointLight.Brightness = 0.5 + 0.025 * v64;
				wait();
				if 0 <= 1 then
					if v64 < 20 then

					else
						break;
					end;
				elseif 20 < v64 then

				else
					break;
				end;
				v64 = v64 + 1;			
			end;
			wait();
			if 0 <= 1 then
				if v62 < l__Value__61 then

				else
					break;
				end;
			elseif l__Value__61 < v62 then

			else
				break;
			end;
			v62 = v62 + 1;		
		end;
		
		for _,cleaner in v58 do
			cleaner.Mist.Enabled = false
		end
		
		playSoundEffect("SlideOpen", doorSet1);
		playSoundEffect("SlideOpen", doorSet2);
		loadZone.Button.Way.Value = not loadZone.Button.Way.Value;
		if loadZone.Button.Way.Value then --closing phase
			for i = 0, 8 do
				doorSet1.Door1.CFrame = doorSet1.Door1.CFrame - (doorSet1.ClosedPosition1.Position - doorSet1.OpenPosition1.Position) / 8;
				doorSet1.Door2.CFrame = doorSet1.Door2.CFrame - (doorSet1.ClosedPosition2.Position - doorSet1.OpenPosition2.Position) / 8;
				wait();		
			end;
		else
			for i = 0, 8 do
				doorSet2.Door1.CFrame = doorSet2.Door1.CFrame - (doorSet2.ClosedPosition1.Position - doorSet2.OpenPosition1.Position) / 8;
				doorSet2.Door2.CFrame = doorSet2.Door2.CFrame - (doorSet2.ClosedPosition2.Position - doorSet2.OpenPosition2.Position) / 8;
				wait();		
			end;
		end;
		loadZone.Button.Busy.Value = false;
		if stat.Checkpoint.Value < stat.LoadingZone.Value then
			stat.Checkpoint.Value = stat.LoadingZone.Value;
		end;
	end));
end;
local u4 = false;
function normalLoad(p9, p10)
	if p10 then
		if p10.Parent then
			if p10.Name == "Torso" then
				if not u4 then
					if tostring(stat.LoadingZone.Value) ~= p9.Name then
						u4 = true;
						if p9.Parent.Parent:findFirstChild("Door" .. stat.LoadingZone.Value) then
							coroutine.resume(coroutine.create(function()
								local v69 = p9.Parent.Parent["Door" .. stat.LoadingZone.Value];
								playSoundEffect("SlideClosed", v69);
								local v70 = 1 - 1;
								while true do
									if v69:findFirstChild("Right") then
										v69.Right.CFrame = v69.Right.CFrame - Vector3.new(0, 0, 0.5);
									end;
									if v69:findFirstChild("Left") then
										v69.Left.CFrame = v69.Left.CFrame + Vector3.new(0, 0, 0.5);
									end;
									if v69:findFirstChild("Front") then
										v69.Front.CFrame = v69.Front.CFrame - Vector3.new(0.5, 0, 0);
									end;
									if v69:findFirstChild("Back") then
										v69.Back.CFrame = v69.Back.CFrame + Vector3.new(0.5, 0, 0);
									end;
									wait();
									if 0 <= 1 then
										if v70 < 10 then

										else
											break;
										end;
									elseif 10 < v70 then

									else
										break;
									end;
									v70 = v70 + 1;								
								end;
							end));
						end;
						stat.LoadingZone.Value = tonumber(p9.Name);
						coroutine.resume(coroutine.create(function()
							loadingZoneChanged();
							if p9.Parent.Parent:findFirstChild("Door" .. stat.LoadingZone.Value) then
								local v71 = p9.Parent.Parent["Door" .. stat.LoadingZone.Value];
								playSoundEffect("SlideOpen", v71);
								local v72 = 1 - 1;
								while true do
									if v71:findFirstChild("Right") then
										v71.Right.CFrame = v71.Right.CFrame + Vector3.new(0, 0, 0.25);
									end;
									if v71:findFirstChild("Left") then
										v71.Left.CFrame = v71.Left.CFrame - Vector3.new(0, 0, 0.25);
									end;
									if v71:findFirstChild("Front") then
										v71.Front.CFrame = v71.Front.CFrame + Vector3.new(0.25, 0, 0);
									end;
									if v71:findFirstChild("Back") then
										v71.Back.CFrame = v71.Back.CFrame - Vector3.new(0.25, 0, 0);
									end;
									wait();
									if 0 <= 1 then
										if v72 < 20 then

										else
											break;
										end;
									elseif 20 < v72 then

									else
										break;
									end;
									v72 = v72 + 1;								
								end;
							end;
							u4 = false;
						end));
						if stat.Checkpoint.Value < stat.LoadingZone.Value then
							stat.Checkpoint.Value = stat.LoadingZone.Value;
						end;
					end;
				end;
			end;
		end;
	end;
end;
function loadLevel()
	print("Loading level "..stat.Level.Value)
	gameGui.LocalScript.LocalRestart.Value = false;
	
	local v73 = gameGui:getChildren();
	local v74 = #v73;
	local v75 = 1 - 1;
	while true do
		if v73[v75] then
			if v73[v75].Name ~= "LevelControl" then
				if v73[v75].Name == "LevelScript" then
					v73[v75]:Destroy();
				end;
			else
				v73[v75]:Destroy();
			end;
		end;
		if 0 <= 1 then
			if v75 < v74 then

			else
				break;
			end;
		elseif v74 < v75 then

		else
			break;
		end;
		v75 = v75 + 1;	
	end;
	if camera:findFirstChild("Level") then
		camera.Level:Destroy();
	end;
	if stat.Checkpoint.Value ~= 1 then
		if gameItems.MasterLevels["Level" .. stat.Level.Value]:FindFirstChild("Map" .. stat.Checkpoint.Value) then
			stat.LoadingZone.Value = stat.Checkpoint.Value;
		else
			stat.Checkpoint.Value = 1;
			stat.LoadingZone.Value = 1;
		end;
	else
		stat.Checkpoint.Value = 1;
		stat.LoadingZone.Value = 1;
	end;
	
	local v76 = gameItems.MasterLevels["Level" .. stat.Level.Value]["Map" .. stat.LoadingZone.Value]:GetChildren();
	
	local v77 = 0;
	
	for _,item in v76 do
		if item:IsA("CFrameValue") then
			if item:findFirstChild("Prereq") then
				if item.Prereq.Value <= stat.Progress.Value then
					if v77 < item.Prereq.Value then
						v77 = item.Prereq.Value;
						stat.Location.Value = item.Value;
					elseif not item:findFirstChild("Prereq") then
						if v77 < 1 then
							stat.Location.Value = item.Value;
						end;
					end;
				elseif not item:findFirstChild("Prereq") then
					if v77 < 1 then
						stat.Location.Value = item.Value;
					end;
				end;
			elseif not item:findFirstChild("Prereq") then
				if v77 < 1 then
					stat.Location.Value  =item.Value;
				end;
			end;
		end;
	end
	
	
	if stat.Tool.Value == "None" then
		stat.Tool.Value = levelData["Level" .. stat.Level.Value].tool;
	end;
	stat.Mode.Value = true;
	gameGui.LocalScript.LocalCanSwitch.Value = levelData["Level" .. stat.Level.Value].canSwitch;
	gameGui.LocalScript.LocalTheIncident.Value = levelData["Level" .. stat.Level.Value].theIncident;
	gameGui.SoundScript.Current.Value = levelData["Level" .. stat.Level.Value].song;
	local v80 = gameItems.MasterLevels["Level" .. stat.Level.Value].Level:clone();
	v80.Parent = camera;
	v80:MakeJoints();
	loadMap();
	local v81, v82, v83 = pairs(v80.LoadingZones:GetChildren());
	while true do
		local v84, v85 = v81(v82, v83);
		if v84 then

		else
			break;
		end;
		v83 = v84;
		if v85:IsA("Model") then
			if v85:findFirstChild("LoadingTriggers") then
				local v86, v87, v88 = pairs(v85.LoadingTriggers:GetChildren());
				while true do
					local v89, v90 = v86(v87, v88);
					if v89 then

					else
						break;
					end;
					v88 = v89;
					if v90:IsA("Part") then
						v90.Touched:connect(function(p11)
							normalLoad(v90, p11);
						end);
					end;				
				end;
			elseif v85:IsA("Model") then
				if v85:findFirstChild("Button") then
					v85.Button.Busy.Changed:connect(function()
						if not v85.Button.Busy.Value then
							return;
						end;
						if v85.Button.Parent:findFirstChild("Elevator") then
							elevatorLoad(v85);
							return;
						end;
						if v85.Button.Parent:findFirstChild("Decontamination") then
							decontaminationLoad(v85);
						end;
					end);
				end;
			end;
		elseif v85:IsA("Model") then
			if v85:findFirstChild("Button") then
				v85.Button.Busy.Changed:connect(function()
					if not v85.Button.Busy.Value then
						return;
					end;
					if v85.Button.Parent:findFirstChild("Elevator") then
						elevatorLoad(v85);
						return;
					end;
					if v85.Button.Parent:findFirstChild("Decontamination") then
						decontaminationLoad(v85);
					end;
				end);
			end;
		end;	
	end;
	local v91 = v80:findFirstChild("LevelControl");
	if v91 then
		v91.Parent = gameGui;
		v91.Disabled = false;
	end;
	gameGui.LocalScript.LocalRestart.Value = true;
	print("Loaded level "..stat.Level.Value.." without issue.")
end;
loadLevel();
local Torso = char.Torso;
stat.Level.Changed:connect(function()
	Torso.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
	loadLevel();
end);
print("Level and Map ready");
gameGui.LocalScript.Disabled = false;
gameGui.RadarScript.Disabled = false;
gameGui.StoryScript.Disabled = false;
