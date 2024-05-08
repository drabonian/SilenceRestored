-- Decompiled with the Synapse X Luau decompiler.

wait(0.09);
local l__LocalPlayer__1 = game.Players.LocalPlayer;
local l__CurrentCamera__2 = game.Workspace.CurrentCamera;
local l__Level__3 = l__CurrentCamera__2.Level;
playerStats = l__LocalPlayer__1.Stats;
if l__Level__3:findFirstChild("Ammo") then
	local v4 = l__Level__3.Ammo:GetChildren();
	for v5 = 1, #v4 do
		if v4[v5]:findFirstChild("MainPart") then
			v4[v5].MainPart.Amount.Value = math.ceil(v4[v5].MainPart.Amount.Value * playerStats.Difficulty.Value * 0.5);
			v4[v5].MainPart.SurfaceGui1.Text.Text = "" .. v4[v5].MainPart.Amount.Value;
			v4[v5].MainPart.SurfaceGui2.Text.Text = "" .. v4[v5].MainPart.Amount.Value;
		end;
	end;
end;
local l__Parent__1 = script.Parent;
function handleGUIs(p1)
	l__Parent__1.Health.Visible = p1;
	l__Parent__1.Ammo.Visible = p1;
	l__Parent__1.Power.Visible = p1;
	l__Parent__1.Reticle.Visible = p1;
	l__Parent__1.Radar.Visible = p1;
	l__Parent__1.Interface.Info.Visible = p1;
	if not p1 then
		l__Parent__1.TouchedInfo.Visible = p1;
		l__Parent__1.InRange.Visible = p1;
		l__Parent__1.AmmoInfo.Visible = p1;
	end;
end;
local l__GameItems__2 = game.ReplicatedStorage.GameItems;
function runSound(p2, p3)
	local v6 = Instance.new("StringValue");
	v6.Name = "Sound";
	if l__GameItems__2.MasterSounds:findFirstChild(p3) then
		v6.Value = p3;
	else
		v6.Value = "BinClang";
	end;
	local v7 = Instance.new("ObjectValue");
	v7.Name = "Location";
	v7.Value = p2;
	v7.Parent = v6;
	v6.Parent = l__Parent__1.SoundScript.Effects;
end;
local l__Debris__3 = game:GetService("Debris");
function runExplosion(p4, p5, p6)
	local v8 = Instance.new("Explosion");
	v8.Position = p4.Position;
	v8.BlastPressure = 0;
	v8.BlastRadius = p5;
	v8.Parent = l__CurrentCamera__2;
	l__Debris__3:AddItem(v8, 3);
	if p6 then
		runSound(p4, p6);
	end;
end;
function spawnDrone(p7)
	l__Level__3.Map1Task.Bots.Value = l__Level__3.Map1Task.Bots.Value + 1;
	local v9 = l__GameItems__2.MasterModels.Drone:clone();
	v9.Parent = l__Level__3.Parent.Map;
	v9:MakeJoints();
	v9.Torso.CFrame = p7;
	v9.Stats.WaitTime.Value = 1;
	v9.Stats.Counter.Value = l__Level__3.Map1Task.Bots;
	v9.Stats.OffsetMaxX.Value = 1000;
	v9.Stats.OffsetMaxZ.Value = 1000;
	v9.Stats.OffsetMinX.Value = -1000;
	v9.Stats.OffsetMinZ.Value = -1000;
	v9.Stats.Agressive.Value = true;
	local v10 = v9.MainControlNPC:clone();
	v10.Name = "DroneScript";
	v10.Parent = l__Parent__1;
	local v11 = Instance.new("ObjectValue");
	v11.Name = "LinkedModel";
	v11.Value = v9;
	v11.Parent = v10;
	v10.Disabled = false;
end;

function waitTime(p5)
	for i = 0, p5 do
		task.wait(0.03)
		if script.Parent.GamePause.Value then
			script.Parent.GamePause.Changed:Wait()
		end
	end
end;

local l__Stats__4 = l__LocalPlayer__1.Stats;
local u5 = 0;
local l__Torso__6 = l__LocalPlayer__1.Character.Torso;
function runObjectives()
	local l__MissionText__13 = l__Parent__1.Interface.Info.MissionText;
	local l__LevelComplete__14 = l__Parent__1.Interface.LevelComplete;
	local l__Objectives__15 = l__Level__3.Objectives;
	if l__Stats__4.LoadingZone.Value == 1 then
		l__MissionText__13.Text = "WAIT FOR ROYAL'S INSTRUCTIONS";
		while true do
			wait();
			if not (0 < u5) then

			else
				break;
			end;		
		end;
		l__Objectives__15.Weapons.Part.Name = "Torso";
		l__MissionText__13.Text = "FIND A GOOD WEAPON";
		while true do
			wait(0.09);
			if l__Stats__4.Tool.Value == "None" then

			else
				break;
			end;		
		end;
		l__Objectives__15.Weapons:Destroy();
		while true do
			wait();
			if l__Objectives__15:findFirstChild("Weapons") then

			else
				break;
			end;		
		end;
		l__MissionText__13.Text = "EXPLORE THE MAP";
		local v16 = 0;
		while true do
			wait(1);
			v16 = v16 + 1;
			if not (32 < v16) then

			else
				break;
			end;
			if not ((l__Torso__6.Position - l__Objectives__15.Ammo.MeshPart.Position).magnitude < 120) then

			else
				break;
			end;		
		end;
		u5 = 2;
		l__Objectives__15.Ammo.MeshPart.Name = "Torso";
		l__MissionText__13.Text = "TEST WEAPON AND GET AMMO";
		while true do
			wait(1);
			if not (l__Objectives__15.Ammo.MainPart.Amount.Value < 80) then

			else
				break;
			end;		
		end;
		l__Objectives__15.Ammo.Torso.Name = "MeshPart";
		game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=58757773";
		game.Lighting.FogEnd = 60;
		game.Lighting.Brightness = 0;
		game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0);

		local v17 = l__Level__3.Greyness:GetChildren();

		for _,part in v17 do
			part.Transparency = 0
		end

		l__MissionText__13.Text = "FIGHT THE BOTS";
		spawnDrone(CFrame.new(-1243.8, 796.5, -4152.9));
		wait(0.3);
		spawnDrone(CFrame.new(-1234.2, 796.5, -4286.7));
		wait(0.3);
		spawnDrone(CFrame.new(-1106.4, 787.5, -4286.9));
		wait(0.3);
		spawnDrone(CFrame.new(-1089.2, 793.5, -4119.5));
		wait(0.3);
		spawnDrone(CFrame.new(-1004.4, 793.5, -4211.3));
		wait(0.3);
		spawnDrone(CFrame.new(-1151.4, 798.5, -4207.7));
		while true do
			wait(0.3);
			if not (l__Level__3.Map1Task.Bots.Value < 4) then

			else
				break;
			end;		
		end;
		game.Lighting.FogColor = Color3.new(1, 1, 1);
		game.Lighting.FogEnd = 400;
		game.Lighting.Brightness = 2;
		game.Lighting.OutdoorAmbient = Color3.new(1, 1, 1);
		u5 = 3;
	end;
	if l__Stats__4.LoadingZone.Value < 3 then
		l__MissionText__13.Text = "SURVIVE";
		while true do
			if l__Stats__4.LoadingZone.Value ~= 2 then

			else
				break;
			end;
			wait(0.09);		
		end;
		while true do
			if not l__Parent__1.SoundScript.Disabled then
				if l__Parent__1.SoundScript.Busy.Value then

				else
					break;
				end;
			end;
			wait();		
		end;
		l__Parent__1.SoundScript.Current.Value = "DetroitScuffle";
		local v20 = l__Level__3.Greyness:GetChildren();

		for _,part in v20 do
			part.Transparency = 0
		end

		wait(2);
		while true do
			wait(0.09);
			if not l__Level__3.Parent.Map:findFirstChild("LightUpholder") then

			else
				break;
			end;		
		end;
		runExplosion(l__Level__3.Parent.Map.FallingPart1, 6, "BinClang");
		l__Level__3.Parent.Map.FallingPart1.Anchored = false;
		wait(0.09);
		runExplosion(l__Level__3.Parent.Map.FallingPipe1, 6, "BinClang");
		l__Level__3.Parent.Map.FallingPipe1.Anchored = false;
		wait(0.09);
		runExplosion(l__Level__3.Parent.Map.FallingPart2, 6, "BinClang");
		l__Level__3.Parent.Map.FallingPart2.Anchored = false;
		wait(0.2);
		runExplosion(l__Level__3.Parent.Map.FallingPipe2, 6, "BinClang");
		l__Level__3.Parent.Map.FallingPipe2.Anchored = false;
		wait(0.7);
		runExplosion(l__Level__3.Parent.Map.LightUpholder.MainJoint, 10, "WhippingExplosion");
		wait(1);
		runExplosion(l__Level__3.Parent.Map.LightUpholder.Wire1, 12, nil);
		l__Level__3.Parent.Map.LightUpholder.WallLight.Light.PointLight.Enabled = false;
		wait(0.15);
		l__Level__3.Parent.Map.LightUpholder.WallLight.Light.PointLight.Enabled = true;
		wait(0.15);
		runExplosion(l__Level__3.Parent.Map.LightUpholder.Wire2, 8, "ExplodeSound");
		l__Level__3.Parent.Map.LightUpholder.MainJoint.BodyPosition.maxForce = Vector3.new(4, 4, 4) * 10000;
		wait(0.3);
		l__Level__3.Parent.Map.LightUpholder.WallLight.Light.PointLight.Enabled = false;
		wait(0.15);
		l__Level__3.Parent.Map.LightUpholder.WallLight.Light.PointLight.Enabled = true;
		wait(0.15);
		l__Level__3.Parent.Map.LightUpholder.WallLight.Light.PointLight.Enabled = false;
		l__Level__3.Parent.Map.LightUpholder.MainJoint.BodyPosition.maxForce = Vector3.new(4, 4, 4) * 100;
		wait(1);
		runExplosion(l__Level__3.Parent.Map.FallingPart3, 6, "BinClang");
		l__Level__3.Parent.Map.FallingPart3.Anchored = false;
		while true do
			wait(0.09);
			if not ((l__Torso__6.Position - l__Level__3.Parent.Map.FallingPartWait.Position).magnitude < 24) then

			else
				break;
			end;		
		end;
		runExplosion(l__Level__3.Parent.Map.FallingPartWait, 6, "BinClang");
		l__Level__3.Parent.Map.FallingPartWait.Anchored = false;
		while true do
			wait(0.09);
			if not ((l__Torso__6.Position - l__Level__3.Parent.Map.BrokenElevator.MainJoint.Position).magnitude < 52) then

			else
				break;
			end;		
		end;
		local v23 = 1 - 1;
		while true do
			l__Level__3.Parent.Map.BrokenElevator.MainJoint.BodyPosition.position = Vector3.new(-571.2, 649.9 - v23 / 2, -3645.6);
			wait();
			if 0 <= 1 then
				if v23 < 8 then

				else
					break;
				end;
			elseif 8 < v23 then

			else
				break;
			end;
			v23 = v23 + 1;		
		end;
		while true do
			wait(0.09);
			if not ((l__Torso__6.Position - l__Level__3.Parent.Map.BrokenElevator.MainJoint.Position).magnitude < 32) then

			else
				break;
			end;		
		end;
		runSound(l__Level__3.Parent.Map.BrokenElevator.MainJoint, "MetalClang");
		l__Level__3.Parent.Map.BrokenElevator.MainJoint.BodyPosition.position = Vector3.new(-571.2, 569.9, -3645.6);
		l__Level__3.Parent.Map.BrokenElevator.MainJoint.BodyPosition.maxForce = Vector3.new(4, 4, 4) * 1000;
		wait(0.42);
		runExplosion(l__Level__3.Parent.Map.BrokenElevator.MainJoint, 8, "WhippingExplosion");
		wait(0.9);
		l__Level__3.Parent.Map.BrokenElevator:Destroy();
		while true do
			wait(0.09);
			if not ((l__Torso__6.Position - l__Level__3.Parent.Map.BrokenRoomSection.MainJoint.Position).magnitude < 36) then

			else
				break;
			end;		
		end;
		runExplosion(l__Level__3.Parent.Map.BrokenRoomSection.MainJoint, 8, "ExplodeSound");
		l__Level__3.Parent.Map.BrokenRoomSection.MainJoint.BodyPosition.position = Vector3.new(-619.2, 636, -3627.6);
		wait(0.18);
		l__Level__3.Parent.Map.BrokenRoomSection.MainJoint.BodyPosition.position = Vector3.new(-619.2, 637, -3627.6);
		l__Level__3.Parent.Map.BrokenRoomSection.WallLight.Light.PointLight.Enabled = false;
		wait(0.15);
		l__Level__3.Parent.Map.BrokenRoomSection.WallLight.Light.PointLight.Enabled = true;
		wait(0.09);
		runExplosion(l__Level__3.Parent.Map.BrokenRoomSection.WallLight.Light, 8, "MetalClang");
		wait();
		l__Level__3.Parent.Map.BrokenRoomSection.WallLight.Light.PointLight.Enabled = false;
		runExplosion(l__Level__3.Parent.Map.BrokenRoomSection.MainJoint, 12, "ExplodeSound");
		l__Level__3.Parent.Map.BrokenRoomSection.MainJoint.BodyPosition.position = Vector3.new(-619.2, 604, -3627.6);
		while true do
			wait(0.09);
			if not ((l__Torso__6.Position - l__Level__3.Parent.Map.BrokenCeiling.MainJoint.Position).magnitude < 9) then

			else
				break;
			end;		
		end;
		runExplosion(l__Level__3.Parent.Map.BrokenCeiling.MainJoint, 8, "MetalClang");
		l__Level__3.Parent.Map.BrokenCeiling.MainJoint.BodyPosition.position = Vector3.new(-593.7, 591.5, -3693.1);
		l__Level__3.Parent.Map.NoReturnBlock.Transparency = 0;
		l__Level__3.Parent.Map.NoReturnBlock.CanCollide = true;
		wait(0.06);
		l__Level__3.Parent.Map.BrokenCeiling:BreakJoints();
		while true do
			wait(0.09);
			if not (l__Torso__6.Position.y < 598.5) then

			else
				break;
			end;		
		end;
		l__Level__3.Parent.Map.DeathParts.HighFall:Destroy();
	end;
	if l__Stats__4.LoadingZone.Value < 5 then
		l__MissionText__13.Text = "SURVIVE";
		while true do
			wait(0.3);
			if l__Objectives__15:findFirstChild("Wrench") then

			else
				break;
			end;
			if not l__Objectives__15.Wrench:findFirstChild("Torso") then

			else
				break;
			end;		
		end;
		if l__Objectives__15:findFirstChild("Wrench") then
			l__MissionText__13.Text = "GET A WRENCH";
			while true do
				wait(0.09);
				if l__Stats__4.Tool.Value ~= "Wrench" then

				else
					break;
				end;
				if l__Level__3.Parent then
					if l__Level__3.Parent:findFirstChild("Map") then
						if not l__Level__3.Parent.Map:findFirstChild("VTOL2") then

						else
							break;
						end;
					end;
				end;			
			end;
			l__Objectives__15.Wrench:Destroy();
		end;
		while true do
			wait(0.09);
			if not l__Level__3.Parent.Map:findFirstChild("VTOL2") then

			else
				break;
			end;		
		end;
		l__MissionText__13.Text = "DEFEAT THE VTOL";
		while true do
			wait(0.09);
			if l__Level__3.Parent.Map:findFirstChild("VTOL2") then

			else
				break;
			end;		
		end;
		l__Objectives__15.Elevator.Part.Name = "Torso";
		l__MissionText__13.Text = "TRAVEL TO THE SUBLAYER";
		while true do
			wait(0.09);
			if not ((l__Torso__6.Position - l__Objectives__15.Elevator.Torso.Position).magnitude < 6) then

			else
				break;
			end;		
		end;
		l__Objectives__15.Elevator:Destroy();
	end;
	l__MissionText__13.Text = "LEVEL COMPLETE";
	wait(0.24);
	l__Stats__4.LoadingZone.Value = 1;
	l__Stats__4.Checkpoint.Value = 1;
	l__Stats__4.Progress.Value = 0;
	l__Parent__1.LocalScript.LocalPause.Value = true;

	local l__Background__24 = l__Parent__1.Interface.Background;
	local v25 = 1 - 1;
	while true do
		wait();
		l__Background__24.BackgroundTransparency = 1 - v25 / 20;
		if 0 <= 1 then
			if v25 < 20 then

			else
				break;
			end;
		elseif 20 < v25 then

		else
			break;
		end;
		v25 = v25 + 1;	
	end;
	l__LevelComplete__14.LevelNumberDone.Text = "::LEVEL 2 COMPLETE::";
	l__LevelComplete__14.LevelNumberNext.Text = "::NEXT : LEVEL 3 : JUSTICE::";
	l__LevelComplete__14.LevelImage.Image = "http://www.roblox.com/asset/?id=122598825";
	l__LevelComplete__14.Visible = true;
	wait(0.09);
	l__LevelComplete__14.Visible = false;
	wait(0.06);
	l__LevelComplete__14.Visible = true;
	wait(0.12);
	l__LevelComplete__14.Visible = false;
	wait(0.06);
	l__LevelComplete__14.Visible = true;
	local l__NextButton__26 = l__LevelComplete__14.NextButton;
	local l__RedoButton__27 = l__LevelComplete__14.RedoButton;
	local l__LoadingText__7 = l__Parent__1.Interface.LoadingText;
	function startLoading()
		l__LevelComplete__14.Visible = false;
		l__Parent__1.LocalScript.LocalPause.Value = false;
		l__Parent__1.CanPause.Value = false;
		l__LoadingText__7.Visible = true;
		wait(0.12);
		l__LoadingText__7.Visible = false;
		wait(0.06);
		l__LoadingText__7.Visible = true;
	end;
	local u8 = false;
	l__NextButton__26.MouseButton1Click:connect(function()
		if u8 then
			return;
		end;
		u8 = true;
		startLoading();
		l__Stats__4.Level.Value = l__Stats__4.Level.Value + 1;
	end);
	l__RedoButton__27.MouseButton1Click:connect(function()
		if u8 then
			return;
		end;
		u8 = true;
		startLoading();
		local v28 = l__LocalPlayer__1.Character:findFirstChild("Humanoid");
		if v28 then
			v28.Health = 0;
		end;
	end);
	wait(0.09);
	l__NextButton__26.Visible = true;
	wait(0.09);
	l__RedoButton__27.Visible = true;
end;
coroutine.resume(coroutine.create(function()
	runObjectives();
end));
function normalDamage(p9, p10)
	local v29 = p9.Parent:findFirstChild("Humanoid") or p9.Parent.Parent:findFirstChild("Humanoid");
	if v29 then
		if game.Players:findFirstChild(v29.Parent.Name) then
			if 0 < v29.Health then
				if not v29.Parent:findFirstChild("ForceField") then
					if v29.Parent:findFirstChild("Head") then
						local l__Head__30 = v29.Parent.Head;
						v29:TakeDamage(p10);
					end;
				end;
			end;
		end;
	end;
end;
function event1()
	local v31 = nil;
	while true do
		wait();
		if l__Parent__1:findFirstChild("LocalScript") then
			if l__LocalPlayer__1.Character:findFirstChild("Torso") then
				v31 = l__Parent__1.CanPause.Value;
				if not v31 then

				else
					break;
				end;
			end;
		end;	
	end;
	--local function u9(p11, p12)
	--	local v32 = p11:getChildren();
	--	local v33 = #v32;
	--	local v34 = 1 - 1;
	--	while true do
	--		if v32[v34]:IsA("Model") then
	--			if v32[v34]:findFirstChild("MainJoint") then
	--				local v35 = v32[v34]:Clone();
	--				v35:MakeJoints();
	--				v35.Parent = p12;
	--			else
	--				local v36 = Instance.new("Model");
	--				v36.Name = v32[v34].Name;
	--				v36.Parent = p12;
	--				u9(v32[v34], v36);
	--			end;
	--		else
	--			v32[v34]:Clone().Parent = p12;
	--		end;
	--		if v34 % 40 == 0 then
	--			wait();
	--		end;
	--		if 0 <= 1 then
	--			if v34 < v33 then

	--			else
	--				break;
	--			end;
	--		elseif v33 < v34 then

	--		else
	--			break;
	--		end;
	--		v34 = v34 + 1;		
	--	end;
	--end;

	local function u9(p2, p3)
		local v6 = p2:getChildren();

		for _,item in v6 do
			if item:IsA("Model") then
				if item:FindFirstChild("MainJoint") then
					local npc = item:Clone()
					npc:MakeJoints()
					npc.Parent = p3
				else
					local newModel = Instance.new("Model")
					newModel.Name = item.Name
					newModel.Parent = p3
					u9(item, newModel)
				end
			else
				item:Clone().Parent = p3
			end
		end;
	end;
	local l__LoadingText__37 = l__Parent__1.Interface.LoadingText;
	l__LoadingText__37.Text = "SIMULATION RUNNING_/";
	l__LoadingText__37.Visible = true;
	wait(3);
	l__LoadingText__37.Text = "LOADING_/";
	l__LoadingText__37.Visible = false;
	wait(4);
	local function v38(p13)
		while true do
			if not l__Parent__1.CanPause.Value then

			else
				break;
			end;
			wait();		
		end;
		l__Parent__1.LocalScript.LocalPause.Value = true;
		local v39 = Instance.new("BodyPosition");
		v39.Name = "PausePos";
		v39.position = l__Torso__6.Position;
		v39.D = 200;
		v39.maxForce = Vector3.new(4, 4, 4) * 1000000;
		v39.P = 10000000;
		v39.Parent = l__Torso__6;
		if l__Parent__1.TouchedInfo.Visible then
			l__Parent__1.TouchedInfo.Visible = false;
		end;
		if l__Parent__1.AmmoInfo.Visible then
			l__Parent__1.AmmoInfo.Visible = false;
		end;
		l__Parent__1.Health.Visible = false;
		l__Parent__1.Ammo.Visible = false;
		l__Parent__1.Power.Visible = false;
		l__Parent__1.Reticle.Visible = false;
		l__Parent__1.Radar.Visible = false;
		l__Parent__1.Interface.Info.PauseText.Visible = false;
		l__Parent__1.StoryScript.Current.Value = p13;
		while true do
			wait();
			if l__Parent__1.StoryScript.Busy.Value then

			else
				break;
			end;		
		end;
		l__Parent__1.Health.Visible = true;
		l__Parent__1.Ammo.Visible = true;
		l__Parent__1.Power.Visible = true;
		l__Parent__1.Reticle.Visible = true;
		l__Parent__1.Radar.Visible = true;
		v39:Destroy();
		l__Parent__1.LocalScript.LocalPause.Value = false;
		l__Parent__1.Interface.Info.PauseText.Visible = true;
	end;
	v38(l__Level__3.Map1Task.Dialogue1);
	u5 = 1;
	while true do
		wait();
		if not (1 < u5) then

		else
			break;
		end;	
	end;
	v38(l__Level__3.Map1Task.Dialogue2);
	while true do
		wait();
		if not (2 < u5) then

		else
			break;
		end;	
	end;
	local v40 = Instance.new("Model");
	v40.Name = "Map";
	v40.Parent = l__CurrentCamera__2;
	local l__Map2__10 = l__GameItems__2.MasterLevels.Level2.Map2;
	coroutine.resume(coroutine.create(function()
		u9(l__Map2__10, v40);
	end));
	v38(l__Level__3.Map1Task.Dialogue3);
	l__Parent__1.SoundScript.Current.Value = "DetroitScuffle";
	local v41 = Instance.new("BoolValue");
	v41.Name = "ForceField";
	v41.Parent = l__LocalPlayer__1.Character;

	local v43 = l__Level__3.Map1Task.FallingParts:getChildren();

	for _,part in v43 do
		part.Transparency = 0;
		part.Anchored = false;

		local debounce = false;

		part.Touched:connect(function(p14)
			if debounce then return end

			if not part:FindFirstChild("Explosion") then
				runExplosion(part, 12, nil);
			end;

			debounce = true;

			task.spawn(function()
				runSound(part, "ExplodeSound");
			end)

			wait(0.3);

			debounce = false;
		end);

		wait(0.3)
	end

	print("Ok should be at loop where we get stuck...")

	print(v40)

	while true do
		waitTime(3);
		if not v40:findFirstChild("SpawnPosition") then

		else
			break;
		end;	
	end;

	print("Uhhhh ok")

	if l__Stats__4.Tool.Value ~= "None" then
		l__Stats__4.Tool.Value = "None";
	end;
	l__Stats__4.Power.Value = l__Stats__4.PowerMax.Value;
	local l__CFrame__46 = l__Torso__6.CFrame;
	l__Torso__6.CFrame = v40.SpawnPosition.Value;
	waitTime(7);
	l__Torso__6.CFrame = l__CFrame__46;
	waitTime(9);
	l__Torso__6.CFrame = v40.SpawnPosition.Value;
	waitTime(7);
	l__Torso__6.CFrame = l__CFrame__46;
	waitTime(8);
	l__Torso__6.CFrame = v40.SpawnPosition.Value;
	waitTime(6);
	l__Torso__6.CFrame = l__CFrame__46;
	waitTime(5);
	l__Torso__6.CFrame = v40.SpawnPosition.Value;
	if l__Parent__1:findFirstChild("MapControl") then
		l__Parent__1.MapControl:Destroy();
	end;
	l__Stats__4.LoadingZone.Value = 2;
	if l__Stats__4.Checkpoint.Value < l__Stats__4.LoadingZone.Value then
		l__Stats__4.Checkpoint.Value = l__Stats__4.LoadingZone.Value;
	end;
	local v47 = v40:findFirstChild("MapControl");
	if v47 then
		v47:clone().Parent = l__Parent__1;
		l__Parent__1.MapControl.Disabled = false;
	end;
	wait();
	l__Level__3.Parent.Map:Destroy();
	v40.Name = "Map";
	wait();
	v41:Destroy();
	game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=58757773";
	game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=58757773";
	game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=58757773";
	game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=58757773";
	game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=58757773";
	game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=58757773";
	game.Lighting.FogColor = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
	game.Lighting.FogEnd = 60;
	game.Lighting.Brightness = 0;
	game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0);
	l__Level__3.Map1Task:Destroy();
end;
function runMainControlVTOL(p15)
	local l__Humanoid__48 = p15.Humanoid;
	local l__Head__49 = p15.Head;
	function visualDamage(p16, p17, p18)
		local v50 = Instance.new("BillboardGui");
		v50.Size = UDim2.new(1, 0, 1, 0);
		v50.StudsOffset = Vector3.new(math.random(-1, 1), 1.65, math.random(-1, 1));
		local v51 = l__GameItems__2.MasterGuis.DamageFrame:clone();
		v51.Parent = v50;
		if p17 == 0 then
			v51.TextLabel.Text = "-" .. p17;
			v51.TextLabel.TextStrokeColor3 = Color3.new(0, 0, 1);
		elseif p17 < 0 then
			v51.TextLabel.Text = "+" .. p17;
			v51.TextLabel.TextStrokeColor3 = Color3.new(0, 1, 0);
		else
			v51.TextLabel.Text = "-" .. p17;
			v51.TextLabel.TextStrokeColor3 = Color3.new(1, 0, 0);
		end;
		v50.Parent = p18;
		v50.Adornee = p18;
		local l__BillboardControl__52 = v51.BillboardControl;
		l__BillboardControl__52.Billboard.Value = v50;
		l__BillboardControl__52.Parent = script.Parent;
		l__BillboardControl__52.Disabled = false;
		l__Debris__3:AddItem(v50, 5);
	end;
	local function u13(p19)
		local l__X__53 = p19.Position.X;
		local l__Y__54 = p19.Position.Y;
		local l__Z__55 = p19.Position.Z;
		local l__X__56 = p19.Size.X;
		local l__Y__57 = p19.Size.Y;
		local l__Z__58 = p19.Size.Z;
		local v59 = p19.CFrame - p19.CFrame.p;
		p19:Destroy();
		local v60 = Instance.new("Part");
		v60.Name = "Averter";
		v60.FormFactor = 0;
		v60.Size = Vector3.new(1, 1, 1);
		v60.BrickColor = p19.BrickColor;
		v60.Shape = 1;
		v60.BottomSurface = 0;
		v60.TopSurface = 0;
		v60.Reflectance = p19.Reflectance;
		v60.Transparency = p19.Transparency;
		v60.CanCollide = false;
		local v61 = l__X__56 - 1;
		local v62 = 0 - 1;
		while true do
			local v63 = l__Y__57 - 1;
			local v64 = 0 - 1;
			while true do
				local v65 = l__Z__58 - 1;
				local v66 = 0 - 1;
				while true do
					local v67 = v60:clone();
					v67.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
					v67.CFrame = CFrame.new(l__X__53 - (l__X__56 - 1) / 2 + v62, l__Y__54 - (l__Y__57 - 1) / 2 + v64, l__Z__55 - (l__Z__58 - 1) / 2 + v66) * v59;
					l__Debris__3:AddItem(v67, 0.5);
					v67.Parent = l__CurrentCamera__2;
					if 0 <= 1 then
						if v66 < v65 then

						else
							break;
						end;
					elseif v65 < v66 then

					else
						break;
					end;
					v66 = v66 + 1;				
				end;
				if 0 <= 1 then
					if v64 < v63 then

					else
						break;
					end;
				elseif v63 < v64 then

				else
					break;
				end;
				v64 = v64 + 1;			
			end;
			if 0 <= 1 then
				if v62 < v61 then

				else
					break;
				end;
			elseif v61 < v62 then

			else
				break;
			end;
			v62 = v62 + 1;		
		end;
	end;
	function normalDamage(p20, p21)
		local v68 = p20.Parent:findFirstChild("Humanoid") or p20.Parent.Parent:findFirstChild("Humanoid");
		if v68 then
			if not game.Players:findFirstChild(v68.Parent.Name) then
				if v68.Parent:findFirstChild("MainControlVRT") then
					if 0 < v68.Health then
						if not v68.Parent:findFirstChild("ForceField") then
							if v68.Parent:findFirstChild("Head") then
								local v69 = p21;
								if p20.Name == "Head" then
									v69 = math.ceil(v69 * 2);
								elseif p20.Name == "Torso" then
									v69 = math.ceil(v69 * 1.5);
								end;
								v68:TakeDamage(v69);
								visualDamage(v68, v69, v68.Parent.Head);
								return;
							end;
						end;
					end;
				else
					if p20.Name == "Glass" then
						u13(p20);
						return;
					end;
					if p20.Name == "Explosive" then
						if p20:findFirstChild("Explode") then
							p20.Explode.Value = true;
						end;
					end;
				end;
			elseif 0 < v68.Health then
				if not v68.Parent:findFirstChild("ForceField") then
					if v68.Parent:findFirstChild("Head") then
						local v69 = p21;
						if p20.Name == "Head" then
							v69 = math.ceil(v69 * 2);
						elseif p20.Name == "Torso" then
							v69 = math.ceil(v69 * 1.5);
						end;
						v68:TakeDamage(v69);
						visualDamage(v68, v69, v68.Parent.Head);
						return;
					end;
				end;
			end;
		else
			if p20.Name == "Glass" then
				u13(p20);
				return;
			end;
			if p20.Name == "Explosive" then
				if p20:findFirstChild("Explode") then
					p20.Explode.Value = true;
				end;
			end;
		end;
	end;
	local v70 = Instance.new("Part");
	v70.FormFactor = Enum.FormFactor.Custom;
	v70.Size = Vector3.new(0.2, 0.2, 1);
	v70.BrickColor = BrickColor.new("Bright red");
	v70.CanCollide = false;
	v70.Anchored = true;
	v70.Transparency = 0.3;
	v70.TopSurface = Enum.SurfaceType.Smooth;
	v70.BottomSurface = Enum.SurfaceType.Smooth;
	v70.Name = "Averter";
	local u14 = false;
	local l__Torso__15 = p15.Torso;
	function onFireNormal(p22)
		u14 = true;
		local function u16(p23, p24)
			if p23 then
				if not (1 <= p23.Transparency) then
					if string.lower(p23.Name) ~= "water" then
						if p23.Name ~= "Effect" then
							if p23.Name ~= "Rocket" then
								if p23.Name ~= "Averter" then
									if p23.Parent.ClassName ~= "Hat" then
										if p23.Parent.ClassName == "Tool" then

										else
											return false;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			else
				return false;
			end;
			return true;
		end;
		local function u17(p25, p26, p27)
			local v71, v72 = workspace:FindPartOnRay(Ray.new(p25 + p26 * 0.01, p26 * p27), p15);
			if v71 then
				if v72 then
					local v73 = p27 - (v72 - p25).magnitude;
					if u16(v71, v72) then
						if 0 < v73 then
							return u17(v72, p26, v73);
						end;
					end;
				end;
			end;
			return v71, v72;
		end;
		local v74, v75 = u17(p22.Position, (CFrame.new(Vector3.new(0, 0, 0), p22.CFrame.lookVector) * CFrame.Angles(0, 0, math.random() * 2 * math.pi) * CFrame.Angles(math.random() * 0.5, 0, 0)).lookVector, 200);
		if script.Parent:FindFirstChild("SoundScript") then
			local v76 = Instance.new("StringValue");
			v76.Name = "Sound";
			v76.Value = "LaserShot";
			local v77 = Instance.new("ObjectValue");
			v77.Name = "Location";
			v77.Value = l__Torso__15;
			v77.Parent = v76;
			v76.Parent = script.Parent.SoundScript.Effects;
		end;
		if v75 then
			local v78 = v70:clone();
			local l__magnitude__79 = (v75 - p22.Position).magnitude;
			v78.CFrame = CFrame.new(v75, p22.Position) * CFrame.new(0, 0, -l__magnitude__79 / 2);
			local v80 = Instance.new("BlockMesh");
			v80.Scale = Vector3.new(1, 1, l__magnitude__79 - 2);
			v80.Offset = Vector3.new(0, 0, 2);
			v80.Parent = v78;
			v78.Parent = l__CurrentCamera__2;
			l__Debris__3:AddItem(v78, 0.06);
		end;
		if v74 then
			if v74.Parent then
				if v75 then
					normalDamage(v74, 8);
				end;
			end;
		end;
		waitTime(2);
		u14 = false;
	end;
	l__Humanoid__48.Died:connect(function()
		coroutine.resume(coroutine.create(function()
			waitTime(400);
			p15:Destroy();
		end));
		waitTime(1);
		if p15:findFirstChild("Torso") then
			if 0 < l__Torso__15.Position.y then
				local v81 = Instance.new("Explosion");
				v81.Position = l__Torso__15.Position;
				v81.BlastPressure = 0;
				v81.BlastRadius = 8;
				v81.Parent = l__CurrentCamera__2;
				l__Debris__3:AddItem(v81, 3);
				p15:BreakJoints();
				local v82 = script.Parent:FindFirstChild("SoundScript");
				if v82 then
					v82 = Instance.new("StringValue");
					v82.Name = "Sound";
					v82.Value = "RoboticExplosion";
					local v83 = Instance.new("ObjectValue");
					v83.Name = "Location";
					v83.Value = l__Torso__15;
					v83.Parent = v82;
					v82.Parent = script.Parent.SoundScript.Effects;
				end;
				local function u18(p28)
					local v84 = p28:GetChildren();
					local v85 = #v84;
					local v86 = 1 - 1;
					while true do
						if v84[v86] then
							if v84[v86]:IsA("Part") then
								v84[v86].Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
							elseif v84[v86] then
								if v84[v86]:IsA("Model") then
									u18(v84[v86]);
								end;
							end;
						elseif v84[v86] then
							if v84[v86]:IsA("Model") then
								u18(v84[v86]);
							end;
						end;
						if 0 <= 1 then
							if v86 < v85 then

							else
								break;
							end;
						elseif v85 < v86 then

						else
							break;
						end;
						v86 = v86 + 1;					
					end;
				end;
				u18(p15);
			end;
		end;
	end);
	local l__Stats__19 = p15.Stats;
	local u20 = false;
	local u21 = nil;
	local u22 = nil;
	local function v87(p29)
		if 0 < l__Humanoid__48.Health then
			local v88 = nil;
			if l__Stats__19.Agressive.Value then
				if not u14 then
					coroutine.resume(coroutine.create(function()
						onFireNormal(p15.Chaingun);
					end));
				end;
			end;
			if 2 < l__Stats__19.Ammo.Value then
				if l__Humanoid__48.Health <= 800 then
					l__Humanoid__48.Health = 800;
					if not p15:findFirstChild("ForceField") then
						local v89 = Instance.new("IntValue");
						v89.Name = "ForceField";
						v89.Parent = p15;
						p15.ForceField1.Transparency = 0.6;
						p15.ForceField2.Transparency = 0.8;
						l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = true;
					end;
				elseif 0 < l__Stats__19.Ammo.Value then
					if l__Humanoid__48.Health <= 600 then
						l__Humanoid__48.Health = 600;
						if not p15:findFirstChild("ForceField") then
							local v90 = Instance.new("IntValue");
							v90.Name = "ForceField";
							v90.Parent = p15;
							p15.ForceField1.Transparency = 0.6;
							p15.ForceField2.Transparency = 0.8;
							l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = true;
						end;
					elseif l__Stats__19.Ammo.Value <= 0 then
						if l__Humanoid__48.Health <= 300 then
							l__Humanoid__48.Health = 300;
						else
							if p15:findFirstChild("ForceField") then
								p15.ForceField:Destroy();
								p15.ForceField1.Transparency = 1;
								p15.ForceField2.Transparency = 1;
							end;
							l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = false;
						end;
					else
						if p15:findFirstChild("ForceField") then
							p15.ForceField:Destroy();
							p15.ForceField1.Transparency = 1;
							p15.ForceField2.Transparency = 1;
						end;
						l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = false;
					end;
				elseif l__Stats__19.Ammo.Value <= 0 then
					if l__Humanoid__48.Health <= 300 then
						l__Humanoid__48.Health = 300;
					else
						if p15:findFirstChild("ForceField") then
							p15.ForceField:Destroy();
							p15.ForceField1.Transparency = 1;
							p15.ForceField2.Transparency = 1;
						end;
						l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = false;
					end;
				else
					if p15:findFirstChild("ForceField") then
						p15.ForceField:Destroy();
						p15.ForceField1.Transparency = 1;
						p15.ForceField2.Transparency = 1;
					end;
					l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = false;
				end;
			elseif 0 < l__Stats__19.Ammo.Value then
				if l__Humanoid__48.Health <= 600 then
					l__Humanoid__48.Health = 600;
					if not p15:findFirstChild("ForceField") then
						local v90 = Instance.new("IntValue");
						v90.Name = "ForceField";
						v90.Parent = p15;
						p15.ForceField1.Transparency = 0.6;
						p15.ForceField2.Transparency = 0.8;
						l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = true;
					end;
				elseif l__Stats__19.Ammo.Value <= 0 then
					if l__Humanoid__48.Health <= 300 then
						l__Humanoid__48.Health = 300;
					else
						if p15:findFirstChild("ForceField") then
							p15.ForceField:Destroy();
							p15.ForceField1.Transparency = 1;
							p15.ForceField2.Transparency = 1;
						end;
						l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = false;
					end;
				else
					if p15:findFirstChild("ForceField") then
						p15.ForceField:Destroy();
						p15.ForceField1.Transparency = 1;
						p15.ForceField2.Transparency = 1;
					end;
					l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = false;
				end;
			elseif l__Stats__19.Ammo.Value <= 0 then
				if l__Humanoid__48.Health <= 300 then
					l__Humanoid__48.Health = 300;
				else
					if p15:findFirstChild("ForceField") then
						p15.ForceField:Destroy();
						p15.ForceField1.Transparency = 1;
						p15.ForceField2.Transparency = 1;
					end;
					l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = false;
				end;
			else
				if p15:findFirstChild("ForceField") then
					p15.ForceField:Destroy();
					p15.ForceField1.Transparency = 1;
					p15.ForceField2.Transparency = 1;
				end;
				l__Parent__1.Interface.Info.BossHealth.ShieldBar.Visible = false;
			end;
			if u20 then
				return;
			end;
			if l__Humanoid__48.Health < 301 then
				u20 = true;
				local v91 = Instance.new("Explosion");
				v91.Position = p15.Torso.Position;
				v91.BlastPressure = 0;
				v91.BlastRadius = 12;
				v91.Parent = l__CurrentCamera__2;
				l__Debris__3:AddItem(v91, 1);
				if script.Parent:FindFirstChild("SoundScript") then
					local v92 = Instance.new("StringValue");
					v92.Name = "Sound";
					v92.Value = "RoboticExplosion";
					local v93 = Instance.new("ObjectValue");
					v93.Name = "Location";
					v93.Value = p15.Torso;
					v93.Parent = v92;
					v92.Parent = script.Parent.SoundScript.Effects;
				end;
			elseif l__Humanoid__48.Health < 601 then
				if not u21 then
					u21 = Instance.new("Smoke");
					u21.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
					u21.Opacity = 0.2;
					u21.Size = 0.2;
					u21.Parent = p15.Thruster2.Part;
					p15.Thruster2.Fire.Fire.Color = Color3.new(0, 0, 0);
					local v94 = Instance.new("Explosion");
					v94.Position = p15.Thruster2.Part.Position;
					v94.BlastPressure = 0;
					v94.BlastRadius = 8;
					v94.Parent = l__CurrentCamera__2;
					l__Debris__3:AddItem(v94, 1);
					if script.Parent:FindFirstChild("SoundScript") then
						local v95 = Instance.new("StringValue");
						v95.Name = "Sound";
						v95.Value = "RoboticExplosion";
						local v96 = Instance.new("ObjectValue");
						v96.Name = "Location";
						v96.Value = p15.Thruster2.Part;
						v96.Parent = v95;
						v95.Parent = script.Parent.SoundScript.Effects;
					end;
				end;
			elseif l__Humanoid__48.Health < 801 then
				if not u22 then
					u22 = Instance.new("Smoke");
					u22.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
					u22.Opacity = 0.2;
					u22.Size = 0.2;
					u22.Parent = p15.Thruster1.Part;
					p15.Thruster1.Fire.Fire.Color = Color3.new(0, 0, 0);
					local v97 = Instance.new("Explosion");
					v97.Position = p15.Thruster1.Part.Position;
					v97.BlastPressure = 0;
					v97.BlastRadius = 8;
					v97.Parent = l__CurrentCamera__2;
					l__Debris__3:AddItem(v97, 1);
					if script.Parent:FindFirstChild("SoundScript") then
						local v98 = Instance.new("StringValue");
						v98.Name = "Sound";
						v98.Value = "RoboticExplosion";
						local v99 = Instance.new("ObjectValue");
						v99.Name = "Location";
						v99.Value = p15.Thruster1.Part;
						v99.Parent = v98;
						v98.Parent = script.Parent.SoundScript.Effects;
					end;
				end;
			end;
			local v100, v101, v102 = l__Torso__15.CFrame:toEulerAnglesXYZ();
			
			local v103 = 0
			
			v88 = math.deg(v101 + math.pi / 2);
			
			if 0 < l__Torso__15.CFrame.lookVector.Z then
				v103 = v88 + 180;
			else
				v103 = 180 - v88;
			end;
			l__Stats__19.RadarRotation.Value = math.ceil(v103 + 180);
		end;
	end;
	while true do
		if p15 then

		else
			break;
		end;
		if p15.Parent then

		else
			break;
		end;
		local v104, v105 = wait();
		if p15 then

		else
			break;
		end;
		if p15.Parent then

		else
			break;
		end;
		if script.Parent:findFirstChild("LocalScript") then
			if script.Parent.LocalScript:findFirstChild("LocalPause") then
				if script.Parent.LocalScript.LocalPause.Value then
					if l__CurrentCamera__2.CameraType == "Scriptable" then
						l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new((p15.Humanoid.Health - 300) / (p15.Humanoid.MaxHealth - 300), 0, 1, 0);
						v87(v105);
						local v106 = 1 - 1;
						while true do
							wait();
							if p15 then

							else
								break;
							end;
							if p15.Parent then

							else
								break;
							end;
							l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new((p15.Humanoid.Health - 300) / (p15.Humanoid.MaxHealth - 300), 0, 1, 0);
							if l__Stats__19.Agressive.Value then
								if not u14 then
									coroutine.resume(coroutine.create(function()
										onFireNormal(p15.Chaingun);
									end));
								end;
							end;
							if 0 <= 1 then
								if v106 < 3 then

								else
									break;
								end;
							elseif 3 < v106 then

							else
								break;
							end;
							v106 = v106 + 1;						
						end;
					end;
				else
					l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new((p15.Humanoid.Health - 300) / (p15.Humanoid.MaxHealth - 300), 0, 1, 0);
					v87(v105);
					local v106 = 1 - 1;
					while true do
						wait();
						if p15 then

						else
							break;
						end;
						if p15.Parent then

						else
							break;
						end;
						l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new((p15.Humanoid.Health - 300) / (p15.Humanoid.MaxHealth - 300), 0, 1, 0);
						if l__Stats__19.Agressive.Value then
							if not u14 then
								coroutine.resume(coroutine.create(function()
									onFireNormal(p15.Chaingun);
								end));
							end;
						end;
						if 0 <= 1 then
							if v106 < 3 then

							else
								break;
							end;
						elseif 3 < v106 then

						else
							break;
						end;
						v106 = v106 + 1;					
					end;
				end;
			else
				v87(v105);
			end;
		else
			v87(v105);
		end;	
	end;
end;
function event3()
	l__Parent__1.SoundScript.Current.Value = "EnteringTYM";
	l__Level__3.Map3Task.Trigger.Touched:connect(function(p30)
		if p30 then
			if p30.Parent then
				if p30.Name == "Torso" then
					if l__Parent__1:findFirstChild("LocalScript") then
						l__Level__3.Map3Task.Trigger:Destroy();
						local l__Cutscene__107 = l__Parent__1.Cutscene;
						l__Parent__1.LocalScript.LocalPause.Value = true;
						handleGUIs(false);
						local function v108()
							if not l__Level__3.Parent:findFirstChild("Map") then
								return;
							end;
							print("+2 Bots");
							l__Level__3.Map3Task.Bots.Value = l__Level__3.Map3Task.Bots.Value + 2;
							local v109 = l__GameItems__2.MasterModels.BlinkBot:clone();
							v109.Parent = l__Level__3.Parent.Map;
							v109:MakeJoints();
							v109.Torso.CFrame = CFrame.new(-481.5, 580.5, -3812.2) * CFrame.Angles(0, 1.4835298641951802, 0);
							v109.Stats.Counter.Value = l__Level__3.Map3Task.Bots;
							v109.Stats.Health.Value = 80 + math.random(0, 2) * 10;
							v109.Stats.WaitTime.Value = 1;
							v109.Stats.OffsetMaxX.Value = -24;
							v109.Stats.OffsetMaxZ.Value = 1000;
							v109.Stats.OffsetMinX.Value = -1000;
							v109.Stats.OffsetMinZ.Value = -1000;
							v109.Stats.Agressive.Value = true;
							v109.Stats.Tool.Value = "Pistol";
							local v110 = v109.MainControlNPC:clone();
							v110.Name = "MapScript";
							v110.Parent = script.Parent;
							local v111 = Instance.new("ObjectValue");
							v111.Name = "LinkedModel";
							v111.Value = v109;
							v111.Parent = v110;
							v110.Disabled = false;
							wait(0.15);
							local v112 = l__GameItems__2.MasterModels.BlinkBot:clone();
							v112.Parent = l__Level__3.Parent.Map;
							v112:MakeJoints();
							v112.Torso.CFrame = CFrame.new(-478.5, 580.5, -3808.2) * CFrame.Angles(0, 1.4835298641951802, 0);
							v112.Stats.Counter.Value = l__Level__3.Map3Task.Bots;
							v112.Stats.Health.Value = 80 + math.random(0, 2) * 10;
							v112.Stats.WaitTime.Value = 1;
							v112.Stats.OffsetMaxX.Value = -24;
							v112.Stats.OffsetMaxZ.Value = 1000;
							v112.Stats.OffsetMinX.Value = -1000;
							v112.Stats.OffsetMinZ.Value = -1000;
							v112.Stats.Agressive.Value = true;
							v112.Stats.Tool.Value = "Machine Pistol";
							local v113 = v112.MainControlNPC:clone();
							v113.Name = "MapScript";
							v113.Parent = script.Parent;
							local v114 = Instance.new("ObjectValue");
							v114.Name = "LinkedModel";
							v114.Value = v112;
							v114.Parent = v113;
							v113.Disabled = false;
						end;
						local function v115()
							local l__Decal__116 = l__Level__3.NPC.Commander.Face.Decal;
							local v117 = { "http://www.roblox.com/asset/?id=36162442", "http://www.roblox.com/asset/?id=98065582", "http://www.roblox.com/asset/?id=98065601" };
							local v118 = 1;
							local v119 = true;
							l__Parent__1.StoryScript.Current.Value = l__Level__3.Map3Task.Dialogue;
							while true do
								wait(0.09);
								if l__Parent__1.StoryScript.Choice.Value ~= 0 then
									l__Decal__116.Texture = v117[v118];
									if v119 then
										v118 = v118 + 1;
									else
										v118 = v118 - 1;
									end;
									if not (2 < v118) then
										if v118 < 2 then
											v119 = not v119;
										end;
									else
										v119 = not v119;
									end;
								else
									l__Decal__116.Texture = "http://www.roblox.com/asset/?id=36162442";
								end;
								if l__Parent__1.StoryScript.Busy.Value then

								else
									break;
								end;							
							end;
							l__Decal__116.Texture = "http://www.roblox.com/asset/?id=36162442";
						end;
						local l__Map__23 = l__Level__3.Parent.Map;
						local function v120()
							l__Level__3.Map3Task.DestructivePart.BodyPosition.position = l__Map__23.DestructivePartEnd.DestructivePartFinal.Position;
							l__Level__3.Map3Task.DestructivePart.BodyGyro.cframe = l__Map__23.DestructivePartEnd.DestructivePartFinal.CFrame;
							l__Map__23.DestructableRingWindow.Glass.Touched:connect(function(p31)
								if p31 then
									if p31.Parent then
										if p31.Name == "DestructivePart" then
											l__Map__23.DestructableRingWindow.Glass:Destroy();
											local v121 = l__Map__23.DestructableRingWindow.DestructableGlass:getChildren();
											local v122 = #v121;
											local v123 = 1 - 1;
											while true do
												if v121[v123] then
													if v121[v123].Parent then
														v121[v123].Transparency = 0.4;
														v121[v123].Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
														v121[v123].Anchored = false;
													end;
												end;
												if 0 <= 1 then
													if v123 < v122 then

													else
														break;
													end;
												elseif v122 < v123 then

												else
													break;
												end;
												v123 = v123 + 1;											
											end;
											runSound(l__Map__23.DestructableRingWindow.Ring, "ExplodeSound");
										end;
									end;
								end;
							end);
							coroutine.resume(coroutine.create(function()
								l__Level__3.Map3Task.DestructivePart.Anchored = false;
								while true do
									wait();
									if not ((l__Level__3.Map3Task.DestructivePart.Position - l__Map__23.DestructivePartEnd.DestructivePartFinal.Position).magnitude < 3) then

									else
										break;
									end;								
								end;
								l__Map__23.DestructivePartHits:Destroy();
								l__Level__3.Map3Task.DestructivePart:Destroy();
								local v124 = l__Map__23.DestructivePartEnd:getChildren();
								local v125 = #v124;
								local v126 = 1 - 1;
								while true do
									if v124[v126] then
										if v124[v126].Parent then
											v124[v126].Transparency = 0;
											v124[v126].CanCollide = true;
										end;
									end;
									if 0 <= 1 then
										if v126 < v125 then

										else
											break;
										end;
									elseif v125 < v126 then

									else
										break;
									end;
									v126 = v126 + 1;								
								end;
								runExplosion(l__Map__23.DestructivePartEnd.DestructivePartFinal, 16, "ExplodeSound");
								wait(0.06);
								runExplosion(l__Map__23.DestructivePartEnd.ErodedPart1, 16, "ExplodeSound");
								runExplosion(l__Map__23.DestructivePartEnd.ErodedPart2, 16, nil);
								l__Map__23.CeilingWindowViewBlock.CanCollide = true;
							end));
						end;
						local function v127(p32, p33, p34, p35, p36, p37)
							local v128
							local v129
							if p37 == 1 then
								v128 = 1;
								v129 = 181;
							else
								v128 = -90;
								v129 = 90;
							end;
							local l__CoordinateFrame__130 = l__CurrentCamera__2.CoordinateFrame;
							local l__Focus__131 = l__CurrentCamera__2.Focus;
							local l__FieldOfView__132 = l__CurrentCamera__2.FieldOfView;
							local v133 = l__CurrentCamera__2:GetRoll();
							local v134 = v128 - p34;
							while true do
								l__CurrentCamera__2.CameraType = "Scriptable";
								local v135 = nil;
								if p37 == 1 then
									v135 = 0.0055248618784530384 * v134;
								elseif p37 == 2 then
									v135 = (math.sin((math.rad(v134))) + 1) / 2;
								end;
								l__CurrentCamera__2.CoordinateFrame = CFrame.new(l__CoordinateFrame__130.p:lerp(p32.p, v135));
								l__CurrentCamera__2.Focus = CFrame.new(l__Focus__131.p:lerp(p33.p, v135));
								l__CurrentCamera__2.FieldOfView = Vector3.new(l__FieldOfView__132, 0, 0):Lerp(Vector3.new(p35, 0, 0), v135).X;
								l__CurrentCamera__2:SetRoll(Vector3.new(v133, 0, 0):Lerp(Vector3.new(p36, 0, 0), v135).X);
								l__CurrentCamera__2.CoordinateFrame = CFrame.new(l__CurrentCamera__2.CoordinateFrame.p, l__CurrentCamera__2.Focus.p);
								wait();
								if 0 <= p34 then
									if v134 < v129 then

									else
										break;
									end;
								elseif v129 < v134 then

								else
									break;
								end;
								v134 = v134 + p34;							
							end;
						end;
						l__CurrentCamera__2.CameraSubject = nil;
						l__CurrentCamera__2.CameraType = "Scriptable";
						local l__CutsceneData__136 = l__Level__3.Map3Task.CutsceneData;
						local v137 = l__CutsceneData__136:GetChildren();
						p30.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
						local v138 = 1 - 1;
						while true do
							l__Cutscene__107.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v138, 0);
							l__Cutscene__107.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v138, 0);
							wait();
							if 0 <= 1 then
								if v138 < 20 then

								else
									break;
								end;
							elseif 20 < v138 then

							else
								break;
							end;
							v138 = v138 + 1;						
						end;
						local v139 = #v137;
						local v140 = 2 - 1;
						while true do
							local v141 = l__CutsceneData__136[tostring(v140)];
							if v140 == 3 then
								wait();
								l__Cutscene__107.NameText.Position = UDim2.new(0, 0, 0.625, 0);
								l__Cutscene__107.NameText.Text = "THE COMMANDER";
								l__Cutscene__107.NameText.Visible = true;
								wait(3);
								l__Cutscene__107.NameText.Visible = false;
								l__Cutscene__107.NameText.Position = UDim2.new(0, 0, 0.5625, 0);
								v115();
								v120();
							elseif v140 == 5 then
								wait();
								l__Cutscene__107.NameText.Position = UDim2.new(0, 0, 0.625, 0);
								l__Cutscene__107.NameText.Text = "THE EXIT VENT";
								l__Cutscene__107.NameText.Visible = true;
								wait(3);
								l__Cutscene__107.NameText.Visible = false;
								l__Cutscene__107.NameText.Position = UDim2.new(0, 0, 0.5625, 0);
								coroutine.resume(coroutine.create(function()
									local v142 = l__Map__23.DestructableHangingLightLarge.DestructableParts:getChildren();
									local v143 = #v142;
									local v144 = 1 - 1;
									while true do
										if v142[v144] then
											if v142[v144].Parent then
												v142[v144].Anchored = false;
											end;
										end;
										if 0 <= 1 then
											if v144 < v143 then

											else
												break;
											end;
										elseif v143 < v144 then

										else
											break;
										end;
										v144 = v144 + 1;									
									end;
									runSound(l__Map__23.DestructableHangingLightLarge.DestructableParts.Light, "MetalClang");
									while true do
										wait();
										if not (l__Map__23.DestructableHangingLightLarge.DestructableParts.Light.Position.y - l__Map__23.DestructableRaftersHits.MainBeam.Position.y < 5) then

										else
											break;
										end;									
									end;
									l__Map__23.DestructableRaftersHits:Destroy();
									local v145 = l__Map__23.DestructableRaftersEnd:getChildren();
									local v146 = #v145;
									local v147 = 1 - 1;
									while true do
										if v145[v147] then
											if v145[v147].Parent then
												if v145[v147].Name == "TransparentPart" then
													v145[v147].Transparency = 0.8;
												else
													v145[v147].Transparency = 0;
												end;
												v145[v147].CanCollide = true;
											end;
										end;
										if 0 <= 1 then
											if v147 < v146 then

											else
												break;
											end;
										elseif v146 < v147 then

										else
											break;
										end;
										v147 = v147 + 1;									
									end;
									runExplosion(l__Map__23.DestructableRaftersEnd.MainBeam, 8, "ExplodeSound");
									runExplosion(l__Map__23.DestructableRaftersEnd.Wedge, 16, nil);
									runSound(l__Map__23.DestructableMask, "MetalClang");
									l__Map__23.DestructableMask.Anchored = false;
									l__Level__3.NPC["VRT - Serial 47972B"].Head:Destroy();
									l__Level__3.NPC["VRT - Serial 47972B"].Gun:Destroy();
									local v148 = l__Level__3.NPC["VRT - Serial 47972B"]:getChildren();
									local v149 = #v148;
									local v150 = 1 - 1;
									while true do
										if v148[v150] then
											if v148[v150].Parent then
												if v148[v150]:IsA("Part") then
													v148[v150].Anchored = false;
												end;
											end;
										end;
										if 0 <= 1 then
											if v150 < v149 then

											else
												break;
											end;
										elseif v149 < v150 then

										else
											break;
										end;
										v150 = v150 + 1;									
									end;
									l__Debris__3:AddItem(l__Level__3.NPC["VRT - Serial 47972B"], 12);
									local v151 = l__Level__3.LoadingZones:getChildren();
									local v152 = #v151;
									local v153 = 1;
									while true do
										if v151[v153]:findFirstChild("Decontamination") then
											local l__DoorSet1__154 = v151[v153].Decontamination.DoorSet1;
											local l__DoorSet2__155 = v151[v153].Decontamination.DoorSet2;
											if v151[v153].Button.Way.Value then
												local v156 = 1 - 1;
												while true do
													l__DoorSet1__154.Door1.CFrame = l__DoorSet1__154.Door1.CFrame + (l__DoorSet1__154.ClosedPosition1.Position - l__DoorSet1__154.OpenPosition1.Position) / 8;
													l__DoorSet1__154.Door2.CFrame = l__DoorSet1__154.Door2.CFrame + (l__DoorSet1__154.ClosedPosition2.Position - l__DoorSet1__154.OpenPosition2.Position) / 8;
													wait();
													if 0 <= 1 then
														if v156 < 8 then

														else
															break;
														end;
													elseif 8 < v156 then

													else
														break;
													end;
													v156 = v156 + 1;												
												end;
											else
												local v157 = 1 - 1;
												while true do
													l__DoorSet2__155.Door1.CFrame = l__DoorSet2__155.Door1.CFrame + (l__DoorSet2__155.ClosedPosition1.Position - l__DoorSet2__155.OpenPosition1.Position) / 8;
													l__DoorSet2__155.Door2.CFrame = l__DoorSet2__155.Door2.CFrame + (l__DoorSet2__155.ClosedPosition2.Position - l__DoorSet2__155.OpenPosition2.Position) / 8;
													wait();
													if 0 <= 1 then
														if v157 < 8 then

														else
															break;
														end;
													elseif 8 < v157 then

													else
														break;
													end;
													v157 = v157 + 1;												
												end;
											end;
											v151[v153].Button.Way.Value = not v151[v153].Button.Way.Value;
											if v151[v153].Button.Way.Value then
												local v158 = 1 - 1;
												while true do
													l__DoorSet1__154.Door1.CFrame = l__DoorSet1__154.Door1.CFrame - (l__DoorSet1__154.ClosedPosition1.Position - l__DoorSet1__154.OpenPosition1.Position) / 8;
													l__DoorSet1__154.Door2.CFrame = l__DoorSet1__154.Door2.CFrame - (l__DoorSet1__154.ClosedPosition2.Position - l__DoorSet1__154.OpenPosition2.Position) / 8;
													wait();
													if 0 <= 1 then
														if v158 < 8 then

														else
															break;
														end;
													elseif 8 < v158 then

													else
														break;
													end;
													v158 = v158 + 1;												
												end;
											else
												local v159 = 1 - 1;
												while true do
													l__DoorSet2__155.Door1.CFrame = l__DoorSet2__155.Door1.CFrame - (l__DoorSet2__155.ClosedPosition1.Position - l__DoorSet2__155.OpenPosition1.Position) / 8;
													l__DoorSet2__155.Door2.CFrame = l__DoorSet2__155.Door2.CFrame - (l__DoorSet2__155.ClosedPosition2.Position - l__DoorSet2__155.OpenPosition2.Position) / 8;
													wait();
													if 0 <= 1 then
														if v159 < 8 then

														else
															break;
														end;
													elseif 8 < v159 then

													else
														break;
													end;
													v159 = v159 + 1;												
												end;
											end;
										end;
										if 0 <= 1 then
											if v153 < v152 then

											else
												break;
											end;
										elseif v152 < v153 then

										else
											break;
										end;
										v153 = v153 + 1;									
									end;
								end));
								l__Level__3.NPC.Commander:Destroy();
								local l__CommanderVRT__160 = l__Level__3.NPC.CommanderVRT;
								l__CommanderVRT__160.Stats.Counter.Value = l__Level__3.Map3Task.Commander;
								l__CommanderVRT__160.Stats.WaitTime.Value = 0;
								l__CommanderVRT__160.Stats.Tool.Value = "Golden Pistol";
								l__CommanderVRT__160.Stats.Range.Value = 48;
								l__CommanderVRT__160.Stats.Health.Value = 600 * (playerStats.Difficulty.Value / 3);
								l__CommanderVRT__160.Stats.Speed.Value = 8;
								local v161 = l__Level__3.Map3Task.MainControlVRT:clone();
								v161.Name = "MapScript";
								v161.Parent = script.Parent;
								local v162 = Instance.new("ObjectValue");
								v162.Name = "LinkedModel";
								v162.Value = l__CommanderVRT__160;
								v162.Parent = v161;
								v161.Disabled = false;
								l__Level__3.Map3Task.Commander.Value = l__Level__3.Map3Task.Commander.Value + 1;
								l__CommanderVRT__160.Face.Decal.Texture = "http://www.roblox.com/asset/?id=36162442";
								local v163 = l__CommanderVRT__160:getChildren();
								local v164 = #v163;
								local v165 = 1 - 1;
								while true do
									if v163[v165] then
										if v163[v165].Parent then
											if v163[v165]:IsA("Part") then
												if v163[v165].Name ~= "Head" then
													v163[v165].Transparency = 0;
												end;
											end;
										end;
									end;
									if 0 <= 1 then
										if v165 < v164 then

										else
											break;
										end;
									elseif v164 < v165 then

									else
										break;
									end;
									v165 = v165 + 1;								
								end;
							end;
							v127(v141.c1.Value, v141.f1.Value, v141.step.Value, v141.FOV.Value, v141.Roll.Value, v141.Style.Value);
							if 0 <= 1 then
								if v140 < v139 then

								else
									break;
								end;
							elseif v139 < v140 then

							else
								break;
							end;
							v140 = v140 + 1;						
						end;
						wait(0.09);
						coroutine.resume(coroutine.create(function()
							while true do
								wait(0.09);
								if (l__Map__23.DestructableFan.DestructableBlade.Blade.Position - l__Torso__6.Position).magnitude < 20 then
									if not (l__Map__23.DestructableFan.DestructableBlade.Blade.Position.Y - 8 < l__Torso__6.Position.y) then

									else
										break;
									end;
								end;							
							end;
							runSound(l__Map__23.DestructableFan.DestructableBlade.Blade, "MetalClang");
							local v166 = l__Map__23.DestructableFan.DestructableBlade:getChildren();
							local v167 = #v166;
							local v168 = 1 - 1;
							while true do
								if v166[v168] then
									if v166[v168].Parent then
										v166[v168].Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
										v166[v168].Anchored = false;
									end;
								end;
								if 0 <= 1 then
									if v168 < v167 then

									else
										break;
									end;
								elseif v167 < v168 then

								else
									break;
								end;
								v168 = v168 + 1;							
							end;
						end));
						p30.CFrame = CFrame.new(-571.2, 598, -3733.1);
						wait(0.06);
						l__Parent__1.LocalScript.LocalPause.Value = false;
						l__CurrentCamera__2.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
						l__CurrentCamera__2.CameraType = "Custom";
						l__CurrentCamera__2.FieldOfView = 70;
						handleGUIs(true);
						local v169 = 1 - 1;
						while true do
							l__Cutscene__107.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v169, 0);
							l__Cutscene__107.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v169, 0);
							wait();
							if 0 <= 1 then
								if v169 < 20 then

								else
									break;
								end;
							elseif 20 < v169 then

							else
								break;
							end;
							v169 = v169 + 1;						
						end;
						wait(0.6);
						local v170 = 1 - 1;
						while true do
							l__Map__23.OffsetDoors.Door1.CFrame = l__Map__23.OffsetDoors.Door1.CFrame + Vector3.new(0, 0, 0.05);
							wait();
							if 0 <= 1 then
								if v170 < 20 then

								else
									break;
								end;
							elseif 20 < v170 then

							else
								break;
							end;
							v170 = v170 + 1;						
						end;
						local v171 = 1 - 1;
						while true do
							l__Map__23.OffsetDoors.Door1.CFrame = l__Map__23.OffsetDoors.Door1.CFrame + Vector3.new(0, 0, 0.1);
							wait();
							if 0 <= 1 then
								if v171 < 20 then

								else
									break;
								end;
							elseif 20 < v171 then

							else
								break;
							end;
							v171 = v171 + 1;						
						end;
						local v172 = l__Level__3.NPC:getChildren();
						local v173 = #v172;
						local v174 = 1;
						while true do
							if v172[v174]:findFirstChild("MainControlVRT") then
								if v172[v174].Name ~= "CommanderVRT" then
									if v172[v174].Name ~= "VRT - Serial 14205A" then
										local v175 = v172[v174];
										v175.Stats.Counter.Value = l__Level__3.Map3Task.VRTs;
										v175.Stats.Tool.Value = "Assault Rifle 1";
										v175.Stats.Range.Value = 64;
										v175.Stats.Health.Value = 50 + math.random(0, 3) * 10;
										local v176 = l__Level__3.Map3Task.MainControlVRT:clone();
										v176.Name = "MapScript";
										v176.Parent = script.Parent;
										local v177 = Instance.new("ObjectValue");
										v177.Name = "LinkedModel";
										v177.Value = v175;
										v177.Parent = v176;
										v176.Disabled = false;
										l__Level__3.Map3Task.VRTs.Value = l__Level__3.Map3Task.VRTs.Value + 1;
									end;
								end;
							end;
							if 0 <= 1 then
								if v174 < v173 then

								else
									break;
								end;
							elseif v173 < v174 then

							else
								break;
							end;
							v174 = v174 + 1;						
						end;
						v108();
						wait(1.2);
						v108();
						local v178 = 1 - 1;
						while true do
							l__Map__23.OffsetDoors.Door1.CFrame = l__Map__23.OffsetDoors.Door1.CFrame + Vector3.new(0, 0, 0.15);
							l__Map__23.OffsetDoors.FalseDoor1.CFrame = l__Map__23.OffsetDoors.FalseDoor1.CFrame + Vector3.new(0, 0, 0.15);
							l__Map__23.OffsetDoors.Door2.CFrame = l__Map__23.OffsetDoors.Door2.CFrame - Vector3.new(0, 0, 0.1);
							wait();
							if 0 <= 1 then
								if v178 < 40 then

								else
									break;
								end;
							elseif 40 < v178 then

							else
								break;
							end;
							v178 = v178 + 1;						
						end;
						local v179 = 1 - 1;
						while true do
							l__Map__23.OffsetDoors.Door2.CFrame = l__Map__23.OffsetDoors.Door2.CFrame - Vector3.new(0, 0, 0.1);
							l__Map__23.OffsetDoors.FalseDoor2.CFrame = l__Map__23.OffsetDoors.FalseDoor2.CFrame - Vector3.new(0, 0, 0.05);
							wait();
							if 0 <= 1 then
								if v179 < 20 then

								else
									break;
								end;
							elseif 20 < v179 then

							else
								break;
							end;
							v179 = v179 + 1;						
						end;
						local v180 = 0;
						while true do
							if l__Stats__4.Checkpoint.Value < 4 then

							else
								break;
							end;
							if 0 < l__Level__3.Map3Task.VRTs.Value then

							else
								break;
							end;
							if v180 < 12 then

							else
								break;
							end;
							if l__Level__3.Map3Task.Bots.Value < 3 then
								v180 = v180 + 2;
								v108();
							end;
							wait(0.6);						
						end;
						while true do
							wait(0.3);
							if not (3 < l__Stats__4.Checkpoint.Value) then

							else
								break;
							end;
							if not (l__Level__3.Map3Task.Bots.Value < 1) then

							else
								break;
							end;						
						end;
						if l__Level__3.Map3Task.Bots.Value < 1 then
							if l__Stats__4.Checkpoint.Value < 4 then
								wait();
								if l__Level__3.NPC:FindFirstChild("CommanderVRT") then
									if l__Level__3.NPC.CommanderVRT:FindFirstChild("Humanoid") then
										if 0 < l__Level__3.NPC.CommanderVRT.Humanoid.Health then
											print("Commander survived");
											l__Stats__4.CommanderDead.Value = false;
											if not l__Stats__4.BadgeRightfulDisobedience.Value then
												l__Stats__4.BadgeRightfulDisobedience.Value = true;
											end;
										else
											print("Commander has been killed");
											l__Stats__4.CommanderDead.Value = true;
										end;
									else
										print("Commander has been killed");
										l__Stats__4.CommanderDead.Value = true;
									end;
								else
									print("Commander has been killed");
									l__Stats__4.CommanderDead.Value = true;
								end;
								wait(1.5);
							else
								print("Commander has been killed");
								l__Stats__4.CommanderDead.Value = true;
							end;
						else
							print("Commander has been killed");
							l__Stats__4.CommanderDead.Value = true;
						end;
						while true do
							if l__Stats__4.Checkpoint.Value < 4 then

							else
								break;
							end;
							wait(0.3);						
						end;
						local v181 = l__Level__3.NPC:getChildren();
						local v182 = #v181;
						local v183 = 1;
						while true do
							if v181[v183] then
								if v181[v183].Parent then
									if v181[v183].Name ~= "VRT - Serial 14205A" then
										if v181[v183]:findFirstChild("Humanoid") then
											v181[v183]:Destroy();
										end;
									end;
								end;
							end;
							if 0 <= 1 then
								if v183 < v182 then

								else
									break;
								end;
							elseif v182 < v183 then

							else
								break;
							end;
							v183 = v183 + 1;						
						end;
					end;
				end;
			end;
		end;
	end);
end;
function event4()
	print("Event 4 started");
	while true do
		wait(0.09);
		if not l__Level__3.Parent:findFirstChild("Map") then

		else
			break;
		end;	
	end;
	wait(0.18);
	local l__Map__24 = l__Level__3.Parent.Map;
	coroutine.resume(coroutine.create(function()
		local v184 = l__GameItems__2.MasterModels.Drone:clone();
		v184.Parent = l__Level__3.Parent.Map;
		v184:MakeJoints();
		v184.Torso.CFrame = CFrame.new(-474.5, 603.5, -4027.4) * CFrame.Angles(0, -1.4835298641951802, 0);
		v184.Stats.Health.Value = 40;
		v184.Stats.WaitTime.Value = 0;
		v184.Stats.Speed.Value = 0;
		v184.Stats.Invisible.Value = true;
		v184.Stats.OffsetMaxX.Value = 1000;
		v184.Stats.OffsetMaxZ.Value = 1000;
		v184.Stats.OffsetMinX.Value = -1000;
		v184.Stats.OffsetMinZ.Value = -1000;
		v184.Stats.Agressive.Value = true;
		v184.Stats.Tool.Value = "None";
		local v185 = v184.MainControlNPC:clone();
		v185.Name = "MapScript";
		v185.Parent = script.Parent;
		local v186 = Instance.new("ObjectValue");
		v186.Name = "LinkedModel";
		v186.Value = v184;
		v186.Parent = v185;
		v185.Disabled = false;
		l__Map__24.BotRushTrigger.Touched:connect(function(p38)
			if p38 then
				if p38.Parent then
					if p38.Name == "Torso" then
						l__Map__24.BotRushTrigger:Destroy();
						print("Hidden Bot Look Vector: ", v184.Torso.CFrame.lookVector);
						v184.Torso.Velocity = Vector3.new(v184.Torso.CFrame.lookVector.x * 75, v184.Torso.Velocity.y, v184.Torso.CFrame.lookVector.z * 75);
						v184.Stats.Speed.Value = 8;
						v184.Stats.Invisible.Value = false;
						if v184:findFirstChild("Humanoid") then
							local v187 = Instance.new("ObjectValue");
							v187.Value = l__LocalPlayer__1;
							v187.Name = "creator";
							local v188 = Instance.new("StringValue");
							v188.Value = "None";
							v188.Parent = v187;
							v187.Parent = v184.Humanoid;
							l__Debris__3:AddItem(v187, 10);
						end;
					end;
				end;
			end;
		end);
	end));
	local v189 = l__Level__3.NPC["VRT - Serial 14205A"];
	v189.Stats.Counter.Value = l__Level__3.Map4Task.VRTs;
	v189.Stats.Tool.Value = "None";
	v189.Stats.Range.Value = 64;
	v189.Stats.Health.Value = 40;
	local v190 = l__Level__3.Map3Task.MainControlVRT:clone();
	v190.Name = "MapScript";
	v190.Parent = script.Parent;
	local v191 = Instance.new("ObjectValue");
	v191.Name = "LinkedModel";
	v191.Value = v189;
	v191.Parent = v190;
	v190.Disabled = false;
	l__Level__3.Map3Task.VRTs.Value = l__Level__3.Map4Task.VRTs.Value + 1;
	l__Map__24["Broken Assault Rifle 1"].Touched:connect(function(p39)
		if p39 then
			if p39.Parent then
				if p39.Name == "Wrench" then
					if p39.Parent:IsA("Tool") then
						if l__Stats__4.Tool.Value == "Wrench" then
							l__Stats__4.Tool.Value = "Elite Assault Rifle 1";
							l__Map__24["Broken Assault Rifle 1"]:Destroy();
							l__Map__24["Broken Assault Rifle 1 Part"]:Destroy();
						end;
					end;
				end;
			end;
		end;
	end);
	l__Map__24.Fight2StartTrigger.Touched:connect(function(p40)
		if p40 then
			if p40.Parent then
				if p40.Name == "Torso" then
					if p40.Parent == l__LocalPlayer__1.Character then
						l__Map__24.Fight2StartTrigger:Destroy();
						l__Level__3.Map4Task.Bots.Value = 0;
						l__Level__3.NPC["VRT - Serial 14205A"].Stats.Tool.Value = "Pistol";
						l__Level__3.NPC["VRT - Serial 14205A"].Stats.Speed.Value = 8;
						if l__Level__3.NPC["VRT - Serial 14205A"].Head:findFirstChild("Dialogue") then
							l__Level__3.NPC["VRT - Serial 14205A"].Head.Dialogue:Destroy();
						end;
						local v192 = l__GameItems__2.MasterModels.VTOL2:clone();
						v192.Parent = l__Level__3.Parent.Map;
						v192:MakeJoints();
						v192.Humanoid.MaxHealth = v192.Stats.Health.Value;
						v192.Humanoid.Health = v192.Humanoid.MaxHealth;
						v192.Stats.State.Value = 2;
						v192.Stats.Ammo.Value = 4;
						l__Parent__1.Interface.Info.BossHealth.Visible = true;
						l__Parent__1.Interface.Info.BossHealth.HealthText.Text = "VTOL Health";
						coroutine.resume(coroutine.create(function()
							runMainControlVTOL(v192);
						end));
						wait();
						v192.Torso.CFrame = CFrame.new(-625.5, 550, -3984.5) * CFrame.Angles(-1.5707963267948966, -1.3089969389957472, -1.5707963267948966);
						v192.Torso.BodyPosition.position = Vector3.new(-625.5, 590, -3985.5);
						v192.Torso.BodyGyro.cframe = CFrame.new(v192.Torso.BodyPosition.position) * CFrame.Angles(-1.5707963267948966, -1.3089969389957472, -1.5707963267948966);
						v192.Thruster1Joint.Weld.C1 = v192.Thruster1Joint.Weld.C1 * CFrame.Angles(-1.8325957145940461, 0, 0);
						v192.Thruster2Joint.Weld.C1 = v192.Thruster2Joint.Weld.C1 * CFrame.Angles(-1.8325957145940461, 0, 0);
						local function v193(p41, p42)
							l__Level__3.Map4Task.Bots.Value = l__Level__3.Map4Task.Bots.Value + 1;
							local v194 = l__GameItems__2.MasterModels[p42]:clone();
							v194.Parent = l__Level__3.Parent.Map;
							v194:MakeJoints();
							v194.Torso.CFrame = v192.Torso.CFrame + Vector3.new(0, 3.6, -5 * p41);
							v194.Stats.Counter.Value = l__Level__3.Map4Task.Bots;
							v194.Stats.Health.Value = 80 + math.random(0, 2) * 10;
							v194.Stats.WaitTime.Value = 0;
							if p42 == "Drone" then
								v194.Stats.Speed.Value = 16;
							end;
							v194.Stats.OffsetMaxX.Value = 98;
							v194.Stats.OffsetMaxZ.Value = 30;
							v194.Stats.OffsetMinX.Value = 16;
							v194.Stats.OffsetMinZ.Value = -30;
							v194.Stats.Agressive.Value = true;
							local v195 = v194.MainControlNPC:clone();
							v195.Name = "MapScript";
							v195.Parent = script.Parent;
							local v196 = Instance.new("ObjectValue");
							v196.Name = "LinkedModel";
							v196.Value = v194;
							v196.Parent = v195;
							v195.Disabled = false;
							while true do
								waitTime(1);
								if not v194:findFirstChild("Torso") then

								else
									break;
								end;							
							end;
							local v197 = Instance.new("BodyPosition");
							v197.Name = "TravelPos";
							v197.position = v194.Torso.Position;
							v197.D = 1000;
							v197.maxForce = Vector3.new(4, 4, 4) * 100000;
							v197.P = 4500;
							v197.Parent = v194.Torso;
							local v198 = Instance.new("BodyGyro");
							v198.Name = "TravelGyro";
							v198.cframe = v194.Torso.CFrame * CFrame.Angles(0, 1.5707963267948966, 0);
							v198.D = 500;
							v198.maxTorque = Vector3.new(4, 0, 4) * 100000;
							v198.P = 3000;
							v198.Parent = v194.Torso;
							waitTime(40);
							if v194:findFirstChild("Humanoid") then
								local v199 = Instance.new("ObjectValue");
								v199.Value = l__LocalPlayer__1;
								v199.Name = "creator";
								local v200 = Instance.new("StringValue");
								v200.Value = "None";
								v200.Parent = v199;
								v199.Parent = v194.Humanoid;
								l__Debris__3:AddItem(v199, 10);
							end;
							v197.position = v192.Torso.Position + Vector3.new(0, 3.6, 1.5 * p41);
							while true do
								waitTime(1);
								if not ((v194.Torso.Position - v197.position).magnitude < 0.5) then

								else
									break;
								end;							
							end;
							v197.position = v192.Torso.Position + Vector3.new(6, 3.6, 1.5 * p41);
							while true do
								waitTime(1);
								if not ((v194.Torso.Position - v197.position).magnitude < 0.5) then

								else
									break;
								end;							
							end;
							local v201 = math.random(1, 3);
							v197.position = Vector3.new(l__Map__24["JumpPos" .. v201].Position.x, l__Map__24["JumpPos" .. v201].Position.y + 4, l__Map__24["JumpPos" .. v201].Position.z);
							while true do
								waitTime(1);
								if not ((v194.Torso.Position - v197.position).magnitude < 0.5) then

								else
									break;
								end;							
							end;
							v197:Destroy();
							v198:Destroy();
						end;
						while true do
							waitTime(1);
							if not ((v192.Torso.Position - v192.Torso.BodyPosition.position).magnitude < 9) then

							else
								break;
							end;						
						end;
						l__Parent__1.SoundScript.Current.Value = "DetroitScuffle";
						v192.Stats.Agressive.Value = true;
						while true do
							waitTime(1);
							if not ((v192.Torso.Position - v192.Torso.BodyPosition.position).magnitude < 3) then

							else
								break;
							end;						
						end;
						waitTime(40);
						v192.Stats.Agressive.Value = false;
						local v202 = 1 - 1;
						while true do
							local v203 = 1 - 1;
							while true do
								v192.Thruster1Joint.Weld.C1 = v192.Thruster1Joint.Weld.C1 * CFrame.Angles(0.03490658503988659, 0, 0);
								waitTime(1);
								if 0 <= 1 then
									if v203 < 15 then

									else
										break;
									end;
								elseif 15 < v203 then

								else
									break;
								end;
								v203 = v203 + 1;							
							end;
							v192.Torso.BodyPosition.position = Vector3.new(-618, v192.Torso.BodyPosition.position.y, -3985.5);
							v192.Torso.BodyGyro.cframe = CFrame.new(v192.Torso.BodyPosition.position) * CFrame.Angles(0, 0, 0);
							waitTime(68);
							local v204 = 1 - 1;
							while true do
								v192.Thruster1Joint.Weld.C1 = v192.Thruster1Joint.Weld.C1 * CFrame.Angles(-0.017453292519943295, 0, 0);
								v192.Thruster2Joint.Weld.C1 = v192.Thruster2Joint.Weld.C1 * CFrame.Angles(0.017453292519943295, 0, 0);
								waitTime(1);
								if 0 <= 1 then
									if v204 < 15 then

									else
										break;
									end;
								elseif 15 < v204 then

								else
									break;
								end;
								v204 = v204 + 1;							
							end;
							if v202 == 2 then
								v193(1, "Drone");
								waitTime(40);
								v193(1, "BlinkBot");
							else
								v193(1, "Drone");
							end;
							v192.Stats.Ammo.Value = v192.Stats.Ammo.Value - 1;
							waitTime(40);
							local v205 = 1 - 1;
							while true do
								v192.Thruster1Joint.Weld.C1 = v192.Thruster1Joint.Weld.C1 * CFrame.Angles(-0.017453292519943295, 0, 0);
								v192.Thruster2Joint.Weld.C1 = v192.Thruster2Joint.Weld.C1 * CFrame.Angles(0.017453292519943295, 0, 0);
								waitTime(1);
								if 0 <= 1 then
									if v205 < 15 then

									else
										break;
									end;
								elseif 15 < v205 then

								else
									break;
								end;
								v205 = v205 + 1;							
							end;
							v192.Torso.BodyPosition.position = Vector3.new(-625.5, v192.Torso.BodyPosition.position.y, -3985.5);
							v192.Torso.BodyGyro.cframe = CFrame.new(v192.Torso.BodyPosition.position) * CFrame.Angles(-1.5707963267948966, -1.3089969389957472, -1.5707963267948966);
							waitTime(68);
							local v206 = 1 - 1;
							while true do
								v192.Thruster2Joint.Weld.C1 = v192.Thruster2Joint.Weld.C1 * CFrame.Angles(-0.03490658503988659, 0, 0);
								waitTime(1);
								if 0 <= 1 then
									if v206 < 15 then

									else
										break;
									end;
								elseif 15 < v206 then

								else
									break;
								end;
								v206 = v206 + 1;							
							end;
							v192.Stats.Agressive.Value = true;
							while true do
								waitTime(10);
								if not (l__Level__3.Map4Task.Bots.Value < 1) then

								else
									break;
								end;							
							end;
							waitTime(40);
							v192.Stats.Agressive.Value = false;
							local v207 = 1 - 1;
							while true do
								v192.Thruster2Joint.Weld.C1 = v192.Thruster2Joint.Weld.C1 * CFrame.Angles(0.03490658503988659, 0, 0);
								waitTime(1);
								if 0 <= 1 then
									if v207 < 15 then

									else
										break;
									end;
								elseif 15 < v207 then

								else
									break;
								end;
								v207 = v207 + 1;							
							end;
							v192.Torso.BodyPosition.position = Vector3.new(-618, v192.Torso.BodyPosition.position.y, -3985.5);
							v192.Torso.BodyGyro.cframe = CFrame.new(v192.Torso.BodyPosition.position) * CFrame.Angles(3.141592653589793, 0, 3.141592653589793);
							waitTime(68);
							local v208 = 1 - 1;
							while true do
								v192.Thruster1Joint.Weld.C1 = v192.Thruster1Joint.Weld.C1 * CFrame.Angles(0.017453292519943295, 0, 0);
								v192.Thruster2Joint.Weld.C1 = v192.Thruster2Joint.Weld.C1 * CFrame.Angles(-0.017453292519943295, 0, 0);
								waitTime(1);
								if 0 <= 1 then
									if v208 < 15 then

									else
										break;
									end;
								elseif 15 < v208 then

								else
									break;
								end;
								v208 = v208 + 1;							
							end;
							if v202 == 2 then
								v193(-1, "BlinkBot");
								v193(-1, "Drone");
								waitTime(60);
								v193(-1, "BlinkBot");
							else
								v193(-1, "BlinkBot");
							end;
							v192.Stats.Ammo.Value = v192.Stats.Ammo.Value - 1;
							waitTime(40);
							local v209 = 1 - 1;
							while true do
								v192.Thruster1Joint.Weld.C1 = v192.Thruster1Joint.Weld.C1 * CFrame.Angles(0.017453292519943295, 0, 0);
								v192.Thruster2Joint.Weld.C1 = v192.Thruster2Joint.Weld.C1 * CFrame.Angles(-0.017453292519943295, 0, 0);
								waitTime(1);
								if 0 <= 1 then
									if v209 < 15 then

									else
										break;
									end;
								elseif 15 < v209 then

								else
									break;
								end;
								v209 = v209 + 1;							
							end;
							v192.Torso.BodyPosition.position = Vector3.new(-625.5, v192.Torso.BodyPosition.position.y, -3985.5);
							v192.Torso.BodyGyro.cframe = CFrame.new(v192.Torso.BodyPosition.position) * CFrame.Angles(-1.5707963267948966, -1.3089969389957472, -1.5707963267948966);
							waitTime(68);
							local v210 = 1 - 1;
							while true do
								v192.Thruster1Joint.Weld.C1 = v192.Thruster1Joint.Weld.C1 * CFrame.Angles(-0.03490658503988659, 0, 0);
								waitTime(1);
								if 0 <= 1 then
									if v210 < 15 then

									else
										break;
									end;
								elseif 15 < v210 then

								else
									break;
								end;
								v210 = v210 + 1;							
							end;
							v192.Stats.Agressive.Value = true;
							while true do
								waitTime(10);
								if not (l__Level__3.Map4Task.Bots.Value < 1) then

								else
									break;
								end;							
							end;
							if v202 < 2 then
								waitTime(40);
							end;
							v192.Stats.Agressive.Value = false;
							if 0 <= 1 then
								if v202 < 2 then

								else
									break;
								end;
							elseif 2 < v202 then

							else
								break;
							end;
							v202 = v202 + 1;						
						end;
						v192.Stats.Agressive.Value = true;
						while true do
							waitTime(4);
							if not (v192.Humanoid.Health < 301) then

							else
								break;
							end;						
						end;
						v192.Stats.Agressive.Value = false;
						l__Parent__1.Interface.Info.BossHealth.Visible = false;
						v192.Torso.BodyPosition.position = Vector3.new(-625.5, 580, -3985.5);
						v192.Torso.BodyGyro.cframe = CFrame.new(v192.Torso.BodyPosition.position) * CFrame.Angles(-1.5707963267948966, -1.3089969389957472, -1.5707963267948966);
						runExplosion(v192.Head, 8, "ExplodeSound");
						while true do
							waitTime(1);
							if not ((v192.Torso.Position - v192.Torso.BodyPosition.position).magnitude < 3) then

							else
								break;
							end;						
						end;
						v192.Torso.BodyPosition.position = Vector3.new(-625.5, 590, -3985.5);
						while true do
							waitTime(1);
							v192.Torso.BodyGyro.cframe = CFrame.new(v192.Torso.BodyPosition.position) * CFrame.Angles(math.rad(-90 + math.random(-2, 2)), -1.3089969389957472, (math.rad(-90 + math.random(-2, 2))));
							if not ((v192.Torso.Position - v192.Torso.BodyPosition.position).magnitude < 3) then

							else
								break;
							end;						
						end;
						v192.Torso.BodyPosition.position = Vector3.new(-625.5, 490, -3985.5);
						runExplosion(v192.Torso, 12, "ExplodeSound");
						while true do
							waitTime(1);
							if not ((v192.Torso.Position - v192.Torso.BodyPosition.position).magnitude < 3) then

							else
								break;
							end;						
						end;
						v192:Destroy();
						l__Parent__1.SoundScript.Current.Value = "DetroitAmbient";
						l__Level__3.Map3Task:Destroy();
						l__Level__3.Map4Task:Destroy();
						local v211 = 1 - 1;
						while true do
							l__Map__24.ElevatorDoors.Door1.CFrame = l__Map__24.ElevatorDoors.Door1.CFrame + Vector3.new(0, 0, 0.25);
							l__Map__24.ElevatorDoors.Door3.CFrame = l__Map__24.ElevatorDoors.Door3.CFrame + Vector3.new(0, 0, 0.25);
							l__Map__24.ElevatorDoors.Door2.CFrame = l__Map__24.ElevatorDoors.Door2.CFrame - Vector3.new(0, 0, 0.25);
							l__Map__24.ElevatorDoors.Door4.CFrame = l__Map__24.ElevatorDoors.Door4.CFrame - Vector3.new(0, 0, 0.25);
							waitTime(1);
							if 0 <= 1 then
								if v211 < 20 then

								else
									break;
								end;
							elseif 20 < v211 then

							else
								break;
							end;
							v211 = v211 + 1;						
						end;
					end;
				end;
			end;
		end;
	end);
	while true do
		wait(0.3);
		if l__Level__3.NPC["VRT - Serial 14205A"].Head:findFirstChild("Dialogue") then

		else
			break;
		end;
		if l__Map__24:findFirstChild("Fight2StartTrigger") then

		else
			break;
		end;	
	end;
	if l__Map__24:findFirstChild("Fight2StartTrigger") then
		l__Level__3.Objectives.Wrench.Part.Name = "Torso";
		return;
	end;
	l__Level__3.Objectives.Wrench:Destroy();
end;
if l__Stats__4.LoadingZone.Value == 1 then
	event1();
else
	l__Level__3.Map1Task:Destroy();
end;
while l__Stats__4.LoadingZone.Value < 3 do
	wait(0.09);
end;
local v212 = l__Level__3.LoadingZones:getChildren();
for v213 = 1, #v212 do
	if v212[v213]:findFirstChild("Decontamination") and not v212[v213].Button.Busy.Value then
		local l__DoorSet1__214 = v212[v213].Decontamination.DoorSet1;
		local l__DoorSet2__215 = v212[v213].Decontamination.DoorSet2;
		if v212[v213].Button.Way.Value then
			for v216 = 1, 8 do
				l__DoorSet1__214.Door1.CFrame = l__DoorSet1__214.Door1.CFrame + (l__DoorSet1__214.ClosedPosition1.Position - l__DoorSet1__214.OpenPosition1.Position) / 8;
				l__DoorSet1__214.Door2.CFrame = l__DoorSet1__214.Door2.CFrame + (l__DoorSet1__214.ClosedPosition2.Position - l__DoorSet1__214.OpenPosition2.Position) / 8;
				wait();
			end;
		else
			for v217 = 1, 8 do
				l__DoorSet2__215.Door1.CFrame = l__DoorSet2__215.Door1.CFrame + (l__DoorSet2__215.ClosedPosition1.Position - l__DoorSet2__215.OpenPosition1.Position) / 8;
				l__DoorSet2__215.Door2.CFrame = l__DoorSet2__215.Door2.CFrame + (l__DoorSet2__215.ClosedPosition2.Position - l__DoorSet2__215.OpenPosition2.Position) / 8;
				wait();
			end;
		end;
		v212[v213].Button.Way.Value = not v212[v213].Button.Way.Value;
		if v212[v213].Button.Way.Value then
			for v218 = 1, 8 do
				l__DoorSet1__214.Door1.CFrame = l__DoorSet1__214.Door1.CFrame - (l__DoorSet1__214.ClosedPosition1.Position - l__DoorSet1__214.OpenPosition1.Position) / 8;
				l__DoorSet1__214.Door2.CFrame = l__DoorSet1__214.Door2.CFrame - (l__DoorSet1__214.ClosedPosition2.Position - l__DoorSet1__214.OpenPosition2.Position) / 8;
				wait();
			end;
		else
			for v219 = 1, 8 do
				l__DoorSet2__215.Door1.CFrame = l__DoorSet2__215.Door1.CFrame - (l__DoorSet2__215.ClosedPosition1.Position - l__DoorSet2__215.OpenPosition1.Position) / 8;
				l__DoorSet2__215.Door2.CFrame = l__DoorSet2__215.Door2.CFrame - (l__DoorSet2__215.ClosedPosition2.Position - l__DoorSet2__215.OpenPosition2.Position) / 8;
				wait();
			end;
		end;
	end;
end;
if l__Stats__4.LoadingZone.Value == 3 then
	event3();
end;
while l__Stats__4.LoadingZone.Value < 4 do
	wait(0.3);
end;
if l__Stats__4.LoadingZone.Value == 4 then
	event4();
else
	l__Level__3.Map3Task:Destroy();
	l__Level__3.Map4Task:Destroy();
end;
