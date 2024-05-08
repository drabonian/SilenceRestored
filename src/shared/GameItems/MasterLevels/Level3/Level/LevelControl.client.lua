
-- Decompiled with the Synapse X Luau decompiler.
print("Testing")

local RunService = game:GetService("RunService")

wait(0.09);
local l__LocalPlayer__1 = game.Players.LocalPlayer;
local l__CurrentCamera__2 = game.Workspace.CurrentCamera;
local l__GameItems__3 = game.ReplicatedStorage.GameItems;
local l__Stats__4 = l__LocalPlayer__1.Stats;
local l__Level__5 = l__CurrentCamera__2.Level;
local v6 = l__Level__5.NPC.ConversationLoops:getChildren();
playerStats = l__LocalPlayer__1.Stats;
if l__Level__5:findFirstChild("Ammo") then
	local v7 = l__Level__5.Ammo:GetChildren();
	for v8 = 1, #v7 do
		if v7[v8]:findFirstChild("MainPart") then
			v7[v8].MainPart.Amount.Value = math.ceil(v7[v8].MainPart.Amount.Value * playerStats.Difficulty.Value * 0.5);
			v7[v8].MainPart.SurfaceGui1.Text.Text = "" .. v7[v8].MainPart.Amount.Value;
			v7[v8].MainPart.SurfaceGui2.Text.Text = "" .. v7[v8].MainPart.Amount.Value;
		end;
	end;
end;
local l__Parent__1 = script.Parent;

function waitTime(p5)
	for i = 0, p5 do
		task.wait(0.03)
		if l__Parent__1.LocalScript.LocalPause.Value then
			l__Parent__1.LocalScript.LocalPause.Changed:Wait()
		end
	end
end;

local u2 = require(workspace.CFrameInterpolator);
function tweenCam(p2, p3, p4, p5, p6, p7)
	local v10
	local v11
	if p7 == 1 then
		v10 = 1;
		v11 = 181;
	else
		v10 = -90;
		v11 = 90;
	end;
	local l__Focus__12 = l__CurrentCamera__2.Focus;
	local l__FieldOfView__13 = l__CurrentCamera__2.FieldOfView;
	local v14 = l__CurrentCamera__2:GetRoll();
	local v15, v16 = u2(l__CurrentCamera__2.CoordinateFrame, p2);
	local v17 = v10 - p4;
	while true do
		l__CurrentCamera__2.CameraType = "Scriptable";
		local v18 = nil;
		if p7 == 1 then
			v18 = 0.0055248618784530384 * v17;
		elseif p7 == 2 then
			v18 = (math.sin((math.rad(v17))) + 1) / 2;
		end;
		l__CurrentCamera__2.CoordinateFrame = v16(v17 / v11);
		l__CurrentCamera__2.FieldOfView = Vector3.new(l__FieldOfView__13, 0, 0):Lerp(Vector3.new(p5, 0, 0), v18).X;
		l__CurrentCamera__2:SetRoll(Vector3.new(v14, 0, 0):Lerp(Vector3.new(p6, 0, 0), v18).X);
		wait();
		if 0 <= p4 then
			if v17 < v11 then

			else
				break;
			end;
		elseif v11 < v17 then

		else
			break;
		end;
		v17 = v17 + p4;	
	end;
end;
if l__Stats__4.Progress.Value < 2 then
	local v19 = l__GameItems__3.MasterModels.TileTurret:clone();
	v19.Parent = l__Level__5;
	v19:MakeJoints();
	local v20 = Instance.new("Vector3Value");
	v20.Name = "Home";
	v20.Value = Vector3.new(323, 2.2, 9);
	v20.Parent = v19.MainControlNPC;
	v19.Torso.CFrame = CFrame.new(v20.Value);
	local v21 = v19.MainControlNPC:clone();
	v21.Name = "LevelScript";
	v21.Parent = script.Parent;
	local v22 = Instance.new("ObjectValue");
	v22.Name = "LinkedModel";
	v22.Value = v19;
	v22.Parent = v21;
	v21.Disabled = false;
	local v23 = l__GameItems__3.MasterModels.TileTurret:clone();
	v23.Parent = l__Level__5;
	v23:MakeJoints();
	local v24 = Instance.new("Vector3Value");
	v24.Name = "Home";
	v24.Value = Vector3.new(347, 2.2, 25);
	v24.Parent = v23.MainControlNPC;
	v23.Torso.CFrame = CFrame.new(v24.Value);
	local v25 = v23.MainControlNPC:clone();
	v25.Name = "LevelScript";
	v25.Parent = script.Parent;
	local v26 = Instance.new("ObjectValue");
	v26.Name = "LinkedModel";
	v26.Value = v23;
	v26.Parent = v25;
	v25.Disabled = false;
end;
function handleGUIs(p8)
	l__Parent__1.Health.Visible = p8;
	l__Parent__1.Ammo.Visible = p8;
	l__Parent__1.Power.Visible = p8;
	l__Parent__1.Reticle.Visible = p8;
	l__Parent__1.Radar.Visible = p8;
	l__Parent__1.Interface.Info.Visible = p8;
	if not p8 then
		l__Parent__1.TouchedInfo.Visible = p8;
		l__Parent__1.InRange.Visible = p8;
		l__Parent__1.AmmoInfo.Visible = p8;
	end;
end;
function runObjectives()
	local l__MissionText__27 = l__Parent__1.Interface.Info.MissionText;
	local l__LevelComplete__28 = l__Parent__1.Interface.LevelComplete;
	local l__Objectives__29 = l__Level__5.Objectives;
	if l__Stats__4.Progress.Value < 1 then
		l__MissionText__27.Text = "MEET WITH ROYAL";
		while true do
			task.wait(0.09);
			if l__Objectives__29:findFirstChild("Royal") then

			else
				break;
			end;		
		end;
		l__Stats__4.Progress.Value = 1;
	else
		l__Objectives__29.Royal:Destroy();
		l__Level__5.Map1Task.RoyalTrigger:Destroy();
	end;
	l__Level__5.LoadingZones.Hallway03.nUnlockedDoubleDoor.Name = "UnlockedDoubleDoor";
	l__Level__5.LoadingZones.Hallway03.nUnlockedDoubleDoor.Name = "UnlockedDoubleDoor";
	l__Objectives__29["Offline Reactor"].Part.Name = "Torso";
	if l__Stats__4.Progress.Value < 2 then
		l__MissionText__27.Text = "TURN ON THE GENERATOR";
		l__Objectives__29["Offline Reactor"].Torso.Touched:connect(function(p9)
			if p9 then
				if p9.Parent then
					if p9.Name == "Torso" then
						l__Objectives__29["Offline Reactor"]:Destroy();
					end;
				end;
			end;
		end);
		while true do
			wait(0.09);
			if l__Objectives__29:findFirstChild("Offline Reactor") then

			else
				break;
			end;		
		end;
		l__Stats__4.Progress.Value = 2;
	else
		l__Objectives__29["Offline Reactor"]:Destroy();
	end;
	if l__Level__5:findFirstChild("Map3Task") then
		if l__Level__5.Map3Task:findFirstChild("Trigger") then
			l__Level__5.Map3Task.Trigger:Destroy();
		end;
	end;
	local v30 = l__Level__5:getChildren();
	local v31 = #v30;
	local v32 = 1 - 1;
	while true do
		if v30[v32] then
			if v30[v32].Parent then
				if v30[v32].Name == "TileTurret" then
					if v30[v32]:findFirstChild("Humanoid") then
						if 0 < v30[v32].Humanoid.Health then
							v30[v32].Humanoid.Health = 0;
						end;
					end;
				end;
			end;
		end;
		if 0 <= 1 then
			if v32 < v31 then

			else
				break;
			end;
		elseif v31 < v32 then

		else
			break;
		end;
		v32 = v32 + 1;	
	end;
	l__Objectives__29["Dr. Umar Tamid"].Part.Name = "Torso";
	if l__Stats__4.Progress.Value < 3 then
		l__MissionText__27.Text = "ASK FOR A NEW REACTOR";
		while true do
			wait(0.09);
			if l__Objectives__29:findFirstChild("Dr. Umar Tamid") then

			else
				break;
			end;		
		end;
		l__Stats__4.Progress.Value = 3;
	else
		l__Objectives__29["Dr. Umar Tamid"]:Destroy();
		l__Level__5.Map2Task.TamidTrigger:Destroy();
	end;
	l__Level__5.LoadingZones.Hallway04.nUnlockedDoubleDoor.Name = "UnlockedDoubleDoor";
	l__Level__5.LoadingZones.Hallway04.nUnlockedVent.Name = "UnlockedVent";
	l__Objectives__29["New Reactor"].Part.Name = "Torso";
	if l__Stats__4.Progress.Value < 4 then
		l__MissionText__27.Text = "NEW REACTOR";
		while true do
			wait(0.09);
			if l__Stats__4.Tool.Value ~= "Reactor" then

			else
				break;
			end;		
		end;
		l__Objectives__29["New Reactor"]:Destroy();
		l__MissionText__27.Text = "DEFEAT THE BOTS";
		while true do
			if l__Level__5:findFirstChild("Map4Task") then

			else
				break;
			end;
			wait(0.09);		
		end;
		l__Stats__4.Progress.Value = 4;
	else
		l__Level__5.Map4Task:Destroy();
	end;
	if l__Objectives__29:findFirstChild("New Reactor") then
		l__Objectives__29["New Reactor"]:Destroy();
	end;
	l__Objectives__29["Replace Reactor"].Part.Name = "Torso";
	if l__Stats__4.Progress.Value < 5 then
		l__MissionText__27.Text = "REPLACE OLD REACTOR";
		while true do
			if l__CurrentCamera__2:findFirstChild("Level") then

			else
				break;
			end;
			if l__CurrentCamera__2.Level:findFirstChild("GeneratorTask") then

			else
				break;
			end;
			if l__CurrentCamera__2.Level.GeneratorTask:findFirstChild("BlastDoor") then

			else
				break;
			end;
			wait(1.2);		
		end;
		l__Stats__4.Progress.Value = 5;
	else
		reactorInPlace();
	end;
	if l__Level__5:findFirstChild("Map4Task") then
		if l__Level__5.Map4Task:findFirstChild("Trigger") then
			l__Level__5.Map4Task.Trigger:Destroy();
		end;
	end;
	l__Objectives__29["Replace Reactor"]:Destroy();
	l__Objectives__29["The Overseer"].Part.Name = "Torso";
	if l__Stats__4.Progress.Value < 6 then
		l__MissionText__27.Text = "VISIT THE OVERSEER";
		while true do
			if l__CurrentCamera__2:findFirstChild("Level") then

			else
				break;
			end;
			if l__Level__5:findFirstChild("Map5Task") then

			else
				break;
			end;
			if l__Level__5.Map5Task:findFirstChild("Trigger") then

			else
				break;
			end;
			wait(0.3);		
		end;
		l__Stats__4.Progress.Value = 6;
		l__Objectives__29["The Overseer"]:Destroy();
	else
		l__Objectives__29["The Overseer"]:Destroy();
		l__Level__5.Map5Task.Trigger:Destroy();
		if l__Stats__4.Progress.Value < 7 then
			readyChoices(l__LocalPlayer__1.Character.Torso);
			coroutine.resume(coroutine.create(function()
				overseerBattle(l__LocalPlayer__1.Character.Torso);
			end));
		else
			game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1012890";
			game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1012891";
			game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1012887";
			game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889";
			game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1012888";
			game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1014449";
			l__Level__5.Map5Task.Gate.CFrame = l__Level__5.Map5Task.Gate.CFrame + Vector3.new(0, -8, 0);
		end;
	end;
	if l__Stats__4.Progress.Value < 7 then
		wait(3);
		l__MissionText__27.Text = "CHOOSE THE VILLAIN";
		while true do
			if l__Objectives__29:findFirstChild("Commander Choice") then

			else
				break;
			end;
			wait(0.09);		
		end;
		l__Level__5.NPC.Convo2:Destroy();
		l__Level__5.NPC.ConversationLoops.Conversation2:Destroy();
		l__Level__5.NPC.ConversationLoops.Conversation3:Destroy();
		l__GameItems__3.MasterLevels["Level" .. l__Stats__4.Level.Value].Extras.Convo3:clone().Parent = l__Level__5.NPC;
		wait(1.8);
		l__MissionText__27.Text = "DEFEAT THE OVERSEER";
		l__Parent__1.SoundScript.Current.Value = "DetroitScuffle";
		while true do
			if l__CurrentCamera__2:findFirstChild("Level") then

			else
				break;
			end;
			if l__Level__5:findFirstChild("Map5Task") then

			else
				break;
			end;
			if l__Level__5.Map5Task:findFirstChild("TheVillain") then

			else
				break;
			end;
			wait(0.09);		
		end;
		l__Stats__4.Progress.Value = 7;
	else
		if l__Level__5.NPC:findFirstChild("Convo2") then
			l__Level__5.NPC.Convo2:Destroy();
		end;
		l__Level__5.NPC.ConversationLoops.Conversation2:Destroy();
		l__Level__5.NPC.ConversationLoops.Conversation3:Destroy();
		l__Level__5.Parent.Map.Drones:Destroy();
		l__Level__5.Parent.Map["The Overseer"]:Destroy();
		l__Level__5.Objectives["Commander Choice"]:Destroy();
		l__Level__5.Objectives["Tamid Choice"]:Destroy();
		l__Level__5.Objectives["Royal Choice"]:Destroy();
		l__Level__5.Objectives["Hubris Choice"]:Destroy();
		coroutine.resume(coroutine.create(function()
			local v33 = l__Level__5.Parent.Map.OverseerStage.UncleHubris:GetChildren();
			l__Level__5.Parent.Map.Poison.CFrame = l__Level__5.Parent.Map.Poison.CFrame + Vector3.new(0, 14, 0);
			l__Level__5.Parent.Map.DeathParts.PoisonUndertones.CFrame = l__Level__5.Parent.Map.DeathParts.PoisonUndertones.CFrame + Vector3.new(0, 14, 0);
			local v34 = l__Level__5.Parent.Map.OverseerStage.MovingParts:GetChildren();
			local v35 = #v34;
			local v36 = 1;
			while true do
				local v37 = v34[v36]:GetChildren();
				local v38 = #v37;
				local v39 = 1 - 1;
				while true do
					if v37[v39] then
						if v37[v39].Parent then
							if v37[v39]:IsA("Part") then
								if v37[v39].Parent.Name == "Right" then
									v37[v39].CFrame = v37[v39].CFrame - Vector3.new(0, 0, 32);
								else
									v37[v39].CFrame = v37[v39].CFrame + Vector3.new(0, 0, 32);
								end;
							end;
						end;
					end;
					if 0 <= 1 then
						if v39 < v38 then

						else
							break;
						end;
					elseif v38 < v39 then

					else
						break;
					end;
					v39 = v39 + 1;				
				end;
				if 0 <= 1 then
					if v36 < v35 then

					else
						break;
					end;
				elseif v35 < v36 then

				else
					break;
				end;
				v36 = v36 + 1;			
			end;
			l__Level__5.Parent.Map.OverseerStage.MovingParts.Left.Center1.CFrame = l__Level__5.Parent.Map.OverseerStage.MovingParts.Left.Center1.CFrame + Vector3.new(8, 0, 0);
			l__Level__5.Parent.Map.OverseerStage.MovingParts.Right.Center1.CFrame = l__Level__5.Parent.Map.OverseerStage.MovingParts.Right.Center1.CFrame + Vector3.new(8, 0, 0);
			l__Level__5.Parent.Map.OverseerStage.MovingParts.Left.Center2.CFrame = l__Level__5.Parent.Map.OverseerStage.MovingParts.Left.Center2.CFrame - Vector3.new(8, 0, 0);
			l__Level__5.Parent.Map.OverseerStage.MovingParts.Right.Center2.CFrame = l__Level__5.Parent.Map.OverseerStage.MovingParts.Right.Center2.CFrame - Vector3.new(8, 0, 0);
			local v40 = #v33;
			local v41 = 1 - 1;
			while true do
				if v33[v41] then
					if v33[v41].Parent then
						if v33[v41]:IsA("Part") then
							if v33[v41].Name == "25" then
								v33[v41].Velocity = Vector3.new(20, 0, 0);
							end;
							v33[v41].Anchored = false;
						end;
					end;
				end;
				if 0 <= 1 then
					if v41 < v40 then

					else
						break;
					end;
				elseif v40 < v41 then

				else
					break;
				end;
				v41 = v41 + 1;			
			end;
		end));
		l__Level__5.Parent.Map.OverseerStage.FightInvisibles:Destroy();
		l__Level__5.Map5Task.TheVillain:Destroy();
		game.Lighting.OutdoorAmbient = Color3.new(0.4980392156862745, 0.4980392156862745, 0.4980392156862745);
	end;
	l__Parent__1.SoundScript.Current.Value = "DetroitAmbient";
	l__MissionText__27.Text = "FIND A WAY BACK INTO THE TOWER";
	l__Objectives__29["The Way"].Part.Name = "Torso";
	if l__Stats__4.Progress.Value < 8 then
		local v42, v43, v44 = pairs(l__Level__5.Map6Task.StageLoader:GetChildren());
		while true do
			local v45, v46 = v42(v43, v44);
			if v45 then

			else
				break;
			end;
			v44 = v45;
			if v46:IsA("Part") then
				v46.Touched:connect(function(p10)
					if p10 then
						if p10.Parent then
							if p10.Name == "Torso" then
								if p10.Parent == l__LocalPlayer__1.Character then
									l__Level__5.Map6Task.StageLoader:Destroy();
									map6Task();
								end;
							end;
						end;
					end;
				end);
			end;		
		end;
		while true do
			wait();
			if l__Level__5.Map6Task:findFirstChild("StageLoader") then

			else
				break;
			end;		
		end;
		l__Stats__4.Progress.Value = 8;
	else
		l__Level__5.Map6Task.StageLoader:Destroy();
		loadMap6();
	end;
	l__Objectives__29["The Way"].Torso.CFrame = CFrame.new(519, 60, 118);
	if l__Stats__4.Progress.Value < 9 then
		cavernFight();
		l__Level__5.Map6Task.DrillTrigger.Touched:connect(function(p11)
			if p11 then
				if p11.Parent then
					if p11.Name == "Torso" then
						if p11.Parent == l__LocalPlayer__1.Character then
							l__Level__5.Map6Task.DrillTrigger:Destroy();
						end;
					end;
				end;
			end;
		end);
		while true do
			wait();
			if l__Level__5.Map6Task:findFirstChild("DrillTrigger") then

			else
				break;
			end;		
		end;
		l__Stats__4.Progress.Value = 9;
	elseif 9 < l__Stats__4.Progress.Value then
		l__Level__5.Map6Task.DrillTrigger:Destroy();
	else
		l__Level__5.Map6Task.DrillTrigger.Touched:connect(function(p12)
			if p12 then
				if p12.Parent then
					if p12.Name == "Torso" then
						if p12.Parent == l__LocalPlayer__1.Character then
							l__Level__5.Map6Task.DrillTrigger:Destroy();
						end;
					end;
				end;
			end;
		end);
		while true do
			wait();
			if l__Level__5.Map6Task:findFirstChild("DrillTrigger") then

			else
				break;
			end;		
		end;
	end;
	l__Objectives__29["The Way"]:Destroy();
	l__MissionText__27.Text = "DESTROY THE EXTRACTOR";
	drillFight();
	l__MissionText__27.Text = "LEVEL COMPLETE";
	wait(0.24);
	l__Stats__4.LoadingZone.Value = 1;
	l__Stats__4.Checkpoint.Value = 1;
	l__Stats__4.Progress.Value = 0;
	l__Parent__1.LocalScript.LocalPause.Value = true;
	local l__Background__47 = l__Parent__1.Interface.Background;
	local v48 = 1 - 1;
	while true do
		wait();
		l__Background__47.BackgroundTransparency = 1 - v48 / 20;
		if 0 <= 1 then
			if v48 < 20 then

			else
				break;
			end;
		elseif 20 < v48 then

		else
			break;
		end;
		v48 = v48 + 1;	
	end;
	l__LevelComplete__28.LevelNumberDone.Text = "::LEVEL 3 COMPLETE::";
	l__LevelComplete__28.LevelNumberNext.Text = "::NEXT : LEVEL 4 : THE END::";
	l__LevelComplete__28.LevelImage.Image = "http://www.roblox.com/asset/?id=122598810";
	l__LevelComplete__28.Visible = true;
	wait(0.09);
	l__LevelComplete__28.Visible = false;
	wait(0.06);
	l__LevelComplete__28.Visible = true;
	wait(0.12);
	l__LevelComplete__28.Visible = false;
	wait(0.06);
	l__LevelComplete__28.Visible = true;
	local l__NextButton__49 = l__LevelComplete__28.NextButton;
	local l__RedoButton__50 = l__LevelComplete__28.RedoButton;
	local l__LoadingText__3 = l__Parent__1.Interface.LoadingText;
	function startLoading()
		l__LevelComplete__28.Visible = false;
		l__Parent__1.LocalScript.LocalPause.Value = false;
		l__Parent__1.CanPause.Value = false;
		l__CurrentCamera__2.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
		l__CurrentCamera__2.CameraType = "Custom";
		l__CurrentCamera__2.FieldOfView = 70;
		l__LoadingText__3.Visible = true;
		wait(0.12);
		l__LoadingText__3.Visible = false;
		wait(0.06);
		l__LoadingText__3.Visible = true;
	end;
	local u4 = false;
	l__NextButton__49.MouseButton1Click:connect(function()
		if u4 then
			return;
		end;
		u4 = true;
		startLoading();
		l__Stats__4.Level.Value = l__Stats__4.Level.Value + 1;
	end);
	l__RedoButton__50.MouseButton1Click:connect(function()
		if u4 then
			return;
		end;
		u4 = true;
		startLoading();
		local v51 = l__LocalPlayer__1.Character:findFirstChild("Humanoid");
		if v51 then
			v51.Health = 0;
		end;
	end);
	wait(0.09);
	l__NextButton__49.Visible = true;
	wait(0.09);
	l__RedoButton__50.Visible = true;
end;
function loadMap6()
	l__Level__5.Parent.Map.OverseerStage:Destroy();
	l__GameItems__3.MasterLevels["Level" .. l__Stats__4.Level.Value].Extras.DrillExtractorStage:clone().Parent = l__Level__5.Parent.Map;
end;
local l__Debris__5 = game:GetService("Debris");
function runMainControlDrill(p13)
	local l__Humanoid__52 = p13.Humanoid;
	local l__Torso__53 = p13.Torso;
	local l__Y__54 = l__Torso__53.Position.Y;
	function visualDamage(p14, p15, p16)
		local v55 = Instance.new("BillboardGui");
		v55.Size = UDim2.new(1, 0, 1, 0);
		v55.StudsOffset = Vector3.new(math.random(-1, 1), 1.65, math.random(-1, 1));
		local v56 = l__GameItems__3.MasterGuis.DamageFrame:clone();
		v56.Parent = v55;
		if p15 == 0 then
			v56.TextLabel.Text = "-" .. p15;
			v56.TextLabel.TextStrokeColor3 = Color3.new(0, 0, 1);
		elseif p15 < 0 then
			v56.TextLabel.Text = "+" .. p15;
			v56.TextLabel.TextStrokeColor3 = Color3.new(0, 1, 0);
		else
			v56.TextLabel.Text = "-" .. p15;
			v56.TextLabel.TextStrokeColor3 = Color3.new(1, 0, 0);
		end;
		v55.Parent = p16;
		v55.Adornee = p16;
		local l__BillboardControl__57 = v56.BillboardControl;
		l__BillboardControl__57.Billboard.Value = v55;
		l__BillboardControl__57.Parent = script.Parent;
		l__BillboardControl__57.Disabled = false;
		l__Debris__5:AddItem(v55, 5);
	end;
	local function u6(p17)
		local l__X__58 = p17.Position.X;
		local l__Y__59 = p17.Position.Y;
		local l__Z__60 = p17.Position.Z;
		local l__X__61 = p17.Size.X;
		local l__Y__62 = p17.Size.Y;
		local l__Z__63 = p17.Size.Z;
		local v64 = p17.CFrame - p17.CFrame.p;
		p17:Destroy();
		local v65 = Instance.new("Part");
		v65.Name = "Averter";
		v65.FormFactor = 0;
		v65.Size = Vector3.new(1, 1, 1);
		v65.BrickColor = p17.BrickColor;
		v65.Material = p17.Material;
		v65.Shape = 1;
		v65.BottomSurface = 0;
		v65.TopSurface = 0;
		v65.Reflectance = p17.Reflectance;
		v65.Transparency = p17.Transparency;
		v65.CanCollide = false;
		local v66 = 0;
		local v67 = l__X__61 - 1;
		local v68 = 0 - 1;
		while true do
			local v69 = l__Y__62 - 1;
			local v70 = 0 - 1;
			while true do
				local v71 = l__Z__63 - 1;
				local v72 = 0 - 1;
				while true do
					newNP = v65:clone();
					newNP.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
					newNP.CFrame = CFrame.new(l__X__58 - (l__X__61 - 1) / 2 + v68, l__Y__59 - (l__Y__62 - 1) / 2 + v70, l__Z__60 - (l__Z__63 - 1) / 2 + v72) * v64;
					l__Debris__5:AddItem(newNP, 0.5);
					newNP.Parent = l__CurrentCamera__2;
					v66 = v66 + 1;
					if 32 < v66 then
						return;
					end;
					if 0 <= 1 then
						if v72 < v71 then

						else
							break;
						end;
					elseif v71 < v72 then

					else
						break;
					end;
					v72 = v72 + 1;				
				end;
				if 0 <= 1 then
					if v70 < v69 then

					else
						break;
					end;
				elseif v69 < v70 then

				else
					break;
				end;
				v70 = v70 + 1;			
			end;
			if 0 <= 1 then
				if v68 < v67 then

				else
					break;
				end;
			elseif v67 < v68 then

			else
				break;
			end;
			v68 = v68 + 1;		
		end;
	end;
	function normalDamage(p18, p19)
		local v73 = p18.Parent:findFirstChild("Humanoid") or p18.Parent.Parent:findFirstChild("Humanoid");
		if v73 then
			if not game.Players:findFirstChild(v73.Parent.Name) then
				if v73.Parent:findFirstChild("MainControlVRT") then
					if 0 < v73.Health then
						if not v73.Parent:findFirstChild("ForceField") then
							if v73.Parent:findFirstChild("Head") then
								local v74 = p19;
								if p18.Name == "Head" then
									v74 = math.ceil(v74 * 2);
								elseif p18.Name == "Torso" then
									v74 = math.ceil(v74 * 1.5);
								end;
								v73:TakeDamage(v74);
								visualDamage(v73, v74, v73.Parent.Head);
								return;
							end;
						end;
					end;
				else
					if p18.Name == "Glass" then
						u6(p18);
						return;
					end;
					if p18.Name == "Explosive" then
						if p18:findFirstChild("Explode") then
							p18.Explode.Value = true;
						end;
					end;
				end;
			elseif 0 < v73.Health then
				if not v73.Parent:findFirstChild("ForceField") then
					if v73.Parent:findFirstChild("Head") then
						v74 = p19;
						if p18.Name == "Head" then
							v74 = math.ceil(v74 * 2);
						elseif p18.Name == "Torso" then
							v74 = math.ceil(v74 * 1.5);
						end;
						v73:TakeDamage(v74);
						visualDamage(v73, v74, v73.Parent.Head);
						return;
					end;
				end;
			end;
		else
			if p18.Name == "Glass" then
				u6(p18);
				return;
			end;
			if p18.Name == "Explosive" then
				if p18:findFirstChild("Explode") then
					p18.Explode.Value = true;
				end;
			end;
		end;
	end;
	l__Humanoid__52.Died:connect(function()
		coroutine.resume(coroutine.create(function()
			waitTime(400);
			p13:Destroy();
		end));
		if p13:findFirstChild("Torso") then
			if 0 < l__Torso__53.Position.y then
				local v75 = Instance.new("Explosion");
				v75.Position = l__Torso__53.Position;
				v75.BlastPressure = 0;
				v75.BlastRadius = 16;
				v75.Parent = l__CurrentCamera__2;
				l__Debris__5:AddItem(v75, 3);
				p13:BreakJoints();
				l__Torso__53.BodyGyro:Destroy();
				l__Torso__53.BodyPosition:Destroy();
				if game.Lighting.Brightness ~= 0 then
					game.Lighting.Brightness = 0;
					game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0);
				end;
				local v76 = script.Parent:FindFirstChild("SoundScript");
				if v76 then
					v76 = Instance.new("StringValue");
					v76.Name = "Sound";
					v76.Value = "RoboticExplosion";
					local v77 = Instance.new("ObjectValue");
					v77.Name = "Location";
					v77.Value = l__Torso__53;
					v77.Parent = v76;
					v76.Parent = script.Parent.SoundScript.Effects;
				end;
				local function u7(p20)
					local v78 = p20:GetChildren();
					local v79 = #v78;
					local v80 = 1 - 1;
					while true do
						if v78[v80] then
							if v78[v80]:IsA("Part") then
								v78[v80].Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
							elseif v78[v80] then
								if v78[v80]:IsA("Model") then
									u7(v78[v80]);
								end;
							end;
						elseif v78[v80] then
							if v78[v80]:IsA("Model") then
								u7(v78[v80]);
							end;
						end;
						if 0 <= 1 then
							if v80 < v79 then

							else
								break;
							end;
						elseif v79 < v80 then

						else
							break;
						end;
						v80 = v80 + 1;					
					end;
				end;
				u7(p13);
			end;
		end;
	end);
	local u8 = true;
	local u9 = true;
	local function v81(p21)
		if u8 then
			if p21 then
				if p21.Parent then
					if p21.Name == "Breakable" then
						u8 = false;
						u6(p21);
						u8 = true;
						return;
					end;
					if p21.Parent.Name == "Light" then
						if p21.Parent:findFirstChild("MainPart") then
							u8 = false;
							u6(p21.Parent.MainPart);
							p21.Parent:Destroy();
							u8 = true;
							return;
						end;
					end;
					if p21.Parent.Name == "Tool" then
						if p21.Parent:IsA("Model") then
							u8 = false;
							u6(p21);
							u8 = true;
							return;
						end;
					end;
					if not u9 then
						return;
					end;
					u9 = false;
					normalDamage(p21, 10);
					wait(0.9);
					u9 = true;
				end;
			end;
		end;
	end;
	local v82, v83, v84 = pairs(p13:GetChildren());
	while true do
		local v85, v86 = v82(v83, v84);
		if v85 then

		else
			break;
		end;
		v84 = v85;
		if v86:IsA("Model") then
			if v86:findFirstChild("Blades") then
				v86.Blades.Touched:connect(function(p22)
					v81(p22);
				end);
			elseif string.match(v86.Name, "PlasmaSaw") then
				local v87 = v86:GetChildren();
				local v88 = #v87;
				local v89 = 1 - 1;
				while true do
					if v87[v89] then
						if v87[v89].Parent then
							v87[v89].Touched:connect(function(p23)
								v81(p23);
							end);
						end;
					end;
					if 0 <= 1 then
						if v89 < v88 then

						else
							break;
						end;
					elseif v88 < v89 then

					else
						break;
					end;
					v89 = v89 + 1;				
				end;
			end;
		end;	
	end;
	function followEnemy(p24)
		local l__unit__90 = (l__Torso__53.Position - p24).unit;
		l__Torso__53.BodyGyro.cframe = CFrame.new(l__Torso__53.BodyGyro.cframe.p) * CFrame.new(Vector3.new(0, 0, 0), l__unit__90) * CFrame.Angles(math.pi, 0, math.pi);
		if 100 < l__Torso__53.Position.y then
			local v91 = 1 - 1;
			while true do
				l__Torso__53.BodyGyro.cframe = CFrame.new(l__Torso__53.BodyGyro.cframe.p) * CFrame.new(Vector3.new(0, 0, 0), l__unit__90) * CFrame.Angles(math.pi - v91 / 10 * math.pi, 0, math.pi + v91 / 10 * math.pi);
				wait();
				if 0 <= 1 then
					if v91 < 20 then

					else
						break;
					end;
				elseif 20 < v91 then

				else
					break;
				end;
				v91 = v91 + 1;			
			end;
		end;
	end;
	local u10 = false;
	local u11 = false;
	local l__Head__12 = p13.Head;
	local u13 = nil;
	local u14 = nil;
	local l__Stats__15 = p13.Stats;
	function runBot(p25)
		if 0 < l__Humanoid__52.Health then
			local v92 = nil;
			if l__Humanoid__52.Health < 100 then
				l__Humanoid__52.Health = 100;
			end;
			if l__LocalPlayer__1.Character then
				if not l__LocalPlayer__1.Character:findFirstChild("Torso") then
					return;
				end;
			else
				return;
			end;
			if u10 then
				return;
			end;
			followEnemy(l__LocalPlayer__1.Character.Torso.Position);
			if l__Humanoid__52.Health < 101 then
				u10 = true;
				local v93 = 1 - 1;
				while true do
					local v94 = Instance.new("Explosion");
					local v95 = l__Torso__53;
					if v93 == 3 then
						v95 = p13.Stack1;
					elseif v93 == 2 then
						v95 = p13.Stack2;
					end;
					v94.Position = v95.Position;
					v94.BlastPressure = 0;
					v94.BlastRadius = 16;
					v94.Parent = l__CurrentCamera__2;
					l__Debris__5:AddItem(v94, 1);
					if script.Parent:FindFirstChild("SoundScript") then
						local v96 = Instance.new("StringValue");
						v96.Name = "Sound";
						v96.Value = "RoboticExplosion";
						local v97 = Instance.new("ObjectValue");
						v97.Name = "Location";
						v97.Value = v95;
						v97.Parent = v96;
						v96.Parent = script.Parent.SoundScript.Effects;
					end;
					wait(0.3);
					if 0 <= 1 then
						if v93 < 4 then

						else
							break;
						end;
					elseif 4 < v93 then

					else
						break;
					end;
					v93 = v93 + 1;				
				end;
			elseif l__Humanoid__52.Health < 251 then
				if not u11 then
					u11 = true;
					local v98 = Instance.new("Explosion");
					v98.Position = l__Head__12.Position;
					v98.BlastPressure = 0;
					v98.BlastRadius = 16;
					v98.Parent = l__CurrentCamera__2;
					l__Debris__5:AddItem(v98, 1);
					local v99 = Instance.new("Fire");
					v99.Size = 10;
					v99.Parent = l__Torso__53;
					if script.Parent:FindFirstChild("SoundScript") then
						local v100 = Instance.new("StringValue");
						v100.Name = "Sound";
						v100.Value = "RoboticExplosion";
						local v101 = Instance.new("ObjectValue");
						v101.Name = "Location";
						v101.Value = l__Head__12;
						v101.Parent = v100;
						v100.Parent = script.Parent.SoundScript.Effects;
					end;
				elseif l__Humanoid__52.Health < 501 then
					if not u13 then
						u13 = Instance.new("Smoke");
						u13.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
						u13.Opacity = 0.2;
						u13.Size = 0.2;
						u13.Parent = p13.Stack1;
						local v102 = Instance.new("Explosion");
						v102.Position = l__Torso__53.Position;
						v102.BlastPressure = 0;
						v102.BlastRadius = 8;
						v102.Parent = l__CurrentCamera__2;
						l__Debris__5:AddItem(v102, 1);
						if script.Parent:FindFirstChild("SoundScript") then
							local v103 = Instance.new("StringValue");
							v103.Name = "Sound";
							v103.Value = "RoboticExplosion";
							local v104 = Instance.new("ObjectValue");
							v104.Name = "Location";
							v104.Value = l__Torso__53;
							v104.Parent = v103;
							v103.Parent = script.Parent.SoundScript.Effects;
						end;
					end;
				elseif l__Humanoid__52.Health < 751 then
					if not u14 then
						u14 = Instance.new("Smoke");
						u14.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
						u14.Opacity = 0.2;
						u14.Size = 0.2;
						u14.Parent = p13.Stack1;
						local v105 = Instance.new("Explosion");
						v105.Position = l__Torso__53.Position;
						v105.BlastPressure = 0;
						v105.BlastRadius = 8;
						v105.Parent = l__CurrentCamera__2;
						l__Debris__5:AddItem(v105, 1);
						if script.Parent:FindFirstChild("SoundScript") then
							local v106 = Instance.new("StringValue");
							v106.Name = "Sound";
							v106.Value = "RoboticExplosion";
							local v107 = Instance.new("ObjectValue");
							v107.Name = "Location";
							v107.Value = l__Torso__53;
							v107.Parent = v106;
							v106.Parent = script.Parent.SoundScript.Effects;
						end;
					end;
				end;
			elseif l__Humanoid__52.Health < 501 then
				if not u13 then
					u13 = Instance.new("Smoke");
					u13.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
					u13.Opacity = 0.2;
					u13.Size = 0.2;
					u13.Parent = p13.Stack1;
					v102 = Instance.new("Explosion");
					v102.Position = l__Torso__53.Position;
					v102.BlastPressure = 0;
					v102.BlastRadius = 8;
					v102.Parent = l__CurrentCamera__2;
					l__Debris__5:AddItem(v102, 1);
					if script.Parent:FindFirstChild("SoundScript") then
						v103 = Instance.new("StringValue");
						v103.Name = "Sound";
						v103.Value = "RoboticExplosion";
						v104 = Instance.new("ObjectValue");
						v104.Name = "Location";
						v104.Value = l__Torso__53;
						v104.Parent = v103;
						v103.Parent = script.Parent.SoundScript.Effects;
					end;
				end;
			elseif l__Humanoid__52.Health < 751 then
				if not u14 then
					u14 = Instance.new("Smoke");
					u14.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
					u14.Opacity = 0.2;
					u14.Size = 0.2;
					u14.Parent = p13.Stack1;
					v105 = Instance.new("Explosion");
					v105.Position = l__Torso__53.Position;
					v105.BlastPressure = 0;
					v105.BlastRadius = 8;
					v105.Parent = l__CurrentCamera__2;
					l__Debris__5:AddItem(v105, 1);
					if script.Parent:FindFirstChild("SoundScript") then
						v106 = Instance.new("StringValue");
						v106.Name = "Sound";
						v106.Value = "RoboticExplosion";
						v107 = Instance.new("ObjectValue");
						v107.Name = "Location";
						v107.Value = l__Torso__53;
						v107.Parent = v106;
						v106.Parent = script.Parent.SoundScript.Effects;
					end;
				end;
			end;
			local v108, v109, v110 = l__Torso__53.CFrame:toEulerAnglesXYZ();
			v92 = math.deg(v109 + math.pi / 2);
			if 0 < l__Torso__53.CFrame.lookVector.Z then
				local v111 = v92 + 180;
			else
				v111 = 180 - v92;
			end;
			l__Stats__15.RadarRotation.Value = math.ceil(v111 + 180);
		end;
	end;
	local u16 = 0;
	local u17 = 0;
	local function u18(p26)
		local v112 = l__Torso__53.BodyPosition.position.y + (u16 / 20 - 1);
		if 0.3 < u17 then
			u17 = 0;
			local v113 = l__LocalPlayer__1.Character.Torso.Position.y + (u16 / 20 - 1);
			local v114 = {};
			local v115, v116 = game.Workspace:findPartOnRay(Ray.new(l__Torso__53.Position, (Vector3.new(0, -20, 0))), p13);
			v114[1] = v116;
			local v117, v118 = game.Workspace:findPartOnRay(Ray.new(p13.LeftBoosters.Booster1.Position, (Vector3.new(0, -20, 0))), p13);
			v114[2] = v118;
			local v119, v120 = game.Workspace:findPartOnRay(Ray.new(p13.RightBoosters.Booster1.Position, (Vector3.new(0, -20, 0))), p13);
			v114[3] = v120;
			local v121 = 0;
			local v122 = #v114;
			local v123 = 1;
			while true do
				if v121 < v114[v123].y then
					v121 = v114[v123].y;
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
			local v124 = l__Torso__53.Position.y - v121;
			print(l__Torso__53.Position.y, " - ", v121, " = ", v124);
			if v124 < 6 then
				v112 = l__Torso__53.Position.y + (6 - v124);
			end;
		end;
		u17 = u17 + p26;
		if (l__LocalPlayer__1.Character.Torso.Position - l__Torso__53.Position).magnitude < 12 then
			l__Torso__53.BodyPosition.position = l__Torso__53.Position - l__Torso__53.CFrame.lookVector * p26 * 420;
		elseif 16 < (l__LocalPlayer__1.Character.Torso.Position - l__Torso__53.Position).magnitude then
			l__Torso__53.BodyPosition.position = l__Torso__53.Position + l__Torso__53.CFrame.lookVector * p26 * 420;
		else
			l__Torso__53.BodyPosition.position = l__Torso__53.Position;
		end;
		l__Torso__53.BodyPosition.position = Vector3.new(l__Torso__53.BodyPosition.position.x, v112, l__Torso__53.BodyPosition.position.z);
		u16 = u16 + 1;
		if 40 < u16 then
			u16 = 0;
		end;
	end;
	local u19 = { l__Torso__53["Saw" .. 1 .. "Weld"].C1, l__Torso__53["Saw" .. 2 .. "Weld"].C1, l__Torso__53["Saw" .. 3 .. "Weld"].C1, l__Torso__53["Saw" .. 4 .. "Weld"].C1, l__Torso__53["Saw" .. 5 .. "Weld"].C1, l__Torso__53["Saw" .. 6 .. "Weld"].C1, l__Torso__53["Saw" .. 7 .. "Weld"].C1, l__Torso__53["Saw" .. 8 .. "Weld"].C1 };
	local u20 = 0;
	local u21 = true;
	local function v125(p27)
		if l__Humanoid__52 then

		else
			return;
		end;
		l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new((l__Humanoid__52.Health - 100) / (l__Humanoid__52.MaxHealth - 100), 0, 1, 0);
		if l__LocalPlayer__1.Character then
			if l__LocalPlayer__1.Character:findFirstChild("Torso") then
				if l__Humanoid__52.Health < 1 then
					return;
				end;
			else
				return;
			end;
		else
			return;
		end;
		if not u10 then
			u18(p27);
		end;
		p13.DrillFlatJoint1.Weld.C1 = p13.DrillFlatJoint1.Weld.C1 * CFrame.Angles(0.05, 0.1, 0);
		p13.DrillFlatJoint2.Weld.C1 = p13.DrillFlatJoint2.Weld.C1 * CFrame.Angles(-0.05, 0.1, 0);
		p13.DrillFlatJoint3.Weld.C1 = p13.DrillFlatJoint3.Weld.C1 * CFrame.Angles(-0.05, -0.1, 0);
		p13.DrillFlatJoint4.Weld.C1 = p13.DrillFlatJoint4.Weld.C1 * CFrame.Angles(0.05, -0.1, 0);
		local v126 = 1;
		while true do
			local v127 = nil;
			v127 = l__Torso__53["Saw" .. v126 .. "Weld"];
			if v126 % 2 == 0 then
				v127.C1 = u19[v126] - Vector3.new(0, 0, u20 / 10);
			else
				v127.C1 = u19[v126] + Vector3.new(0, 0, u20 / 10);
			end;
			if 0 <= 1 then
				if v126 < 8 then

				else
					break;
				end;
			elseif 8 < v126 then

			else
				break;
			end;
			v126 = v126 + 1;		
		end;
		if u21 then
			u20 = u20 + 2;
			if 10 < u20 then

			else
				return;
			end;
		else
			u20 = u20 - 2;
			if u20 < -10 then
				u21 = not u21;
			end;
			return;
		end;
		u21 = not u21;
	end;
	while true do
		if p13 then

		else
			break;
		end;
		if p13.Parent then

		else
			break;
		end;
		local v128, v129 = wait();
		if p13 then

		else
			break;
		end;
		if p13.Parent then

		else
			break;
		end;
		if script.Parent:findFirstChild("LocalScript") then
			if script.Parent.LocalScript:findFirstChild("LocalPause") then
				if script.Parent.LocalScript.LocalPause.Value then
					if l__CurrentCamera__2.CameraType ~= "Scriptable" then
						if u10 then
							if l__Torso__53.Anchored then
								l__Torso__53.Anchored = false;
							end;
							runBot(v129);
							v125(v128);
							local v130 = 1 - 1;
							while true do
								wait();
								if p13 then

								else
									break;
								end;
								if p13.Parent then

								else
									break;
								end;
								v125(v128);
								if 0 <= 1 then
									if v130 < 3 then

									else
										break;
									end;
								elseif 3 < v130 then

								else
									break;
								end;
								v130 = v130 + 1;							
							end;
						else
							l__Torso__53.Anchored = true;
						end;
					else
						if l__Torso__53.Anchored then
							l__Torso__53.Anchored = false;
						end;
						runBot(v129);
						v125(v128);
						v130 = 1 - 1;
						while true do
							wait();
							if p13 then

							else
								break;
							end;
							if p13.Parent then

							else
								break;
							end;
							v125(v128);
							if 0 <= 1 then
								if v130 < 3 then

								else
									break;
								end;
							elseif 3 < v130 then

							else
								break;
							end;
							v130 = v130 + 1;						
						end;
					end;
				else
					if l__Torso__53.Anchored then
						l__Torso__53.Anchored = false;
					end;
					runBot(v129);
					v125(v128);
					v130 = 1 - 1;
					while true do
						wait();
						if p13 then

						else
							break;
						end;
						if p13.Parent then

						else
							break;
						end;
						v125(v128);
						if 0 <= 1 then
							if v130 < 3 then

							else
								break;
							end;
						elseif 3 < v130 then

						else
							break;
						end;
						v130 = v130 + 1;					
					end;
				end;
			end;
		end;	
	end;
end;
function drillFight()
	print("Drill Extractor");
	local v131 = l__GameItems__3.MasterModels.FutureDrillExtractor:clone();
	v131.Parent = l__Level__5.Parent.Map;
	v131:MakeJoints();
	v131.Humanoid.MaxHealth = v131.Stats.Health.Value;
	v131.Humanoid.Health = v131.Humanoid.MaxHealth;
	v131.Stats.State.Value = 2;
	v131.Stats.Ammo.Value = 4;
	function uncollide(p28)
		local v132 = p28:GetChildren();
		local v133 = #v132;
		local v134 = 1 - 1;
		while true do
			if v132[v134] then
				if not v132[v134]:IsA("Part") then
					if not v132[v134]:IsA("WedgePart") then
						if v132[v134]:IsA("TrussPart") then
							v132[v134].CanCollide = false;
						elseif v132[v134] then
							if v132[v134]:IsA("Model") then
								uncollide(v132[v134]);
							end;
						end;
					else
						v132[v134].CanCollide = false;
					end;
				else
					v132[v134].CanCollide = false;
				end;
			elseif v132[v134] then
				if v132[v134]:IsA("Model") then
					uncollide(v132[v134]);
				end;
			end;
			if 0 <= 1 then
				if v134 < v133 then

				else
					break;
				end;
			elseif v133 < v134 then

			else
				break;
			end;
			v134 = v134 + 1;		
		end;
	end;
	uncollide(v131);
	coroutine.resume(coroutine.create(function()
		runMainControlDrill(v131);
	end));
	wait();
	v131.Torso.CFrame = CFrame.new(600.8, 59.4, 76.5) * CFrame.Angles(0, 0, 0);
	v131.Torso.BodyPosition.position = Vector3.new(600.8, 59.4, 76.5);
	v131.Torso.BodyGyro.cframe = CFrame.new(v131.Torso.BodyPosition.position) * CFrame.Angles(0, 0, 0);
	l__Parent__1.SoundScript.Current.Value = "DetroitScuffle";
	l__Parent__1.Interface.Info.BossHealth.Visible = true;
	l__Parent__1.Interface.Info.BossHealth.HealthText.Text = "Extractor Health";
	while true do
		wait(0.9);
		if not (v131.Humanoid.Health < 101) then

		else
			break;
		end;	
	end;
	l__Parent__1.Interface.Info.BossHealth.Visible = false;
	script.Parent.LocalScript.LocalPause.Value = true;
	handleGUIs(false);
	l__Parent__1.SoundScript.Current.Value = "EverybodyLies";
	v131.Torso.CFrame = CFrame.new(368, 64, 50) * CFrame.Angles(0, 1.5707963267948966, 0);
	v131.Torso.BodyPosition.position = Vector3.new(368, 64, 50);
	v131.Torso.BodyGyro.cframe = CFrame.new(v131.Torso.BodyPosition.position) * CFrame.Angles(0, 1.5707963267948966, 0);
	if v131.Torso.Anchored then
		v131.Torso.Anchored = false;
	end;
	l__CurrentCamera__2.CameraSubject = nil;
	l__CurrentCamera__2.CameraType = "Scriptable";
	local l__CutsceneData__135 = l__Level__5.Map6Task.CutsceneData;
	local v136 = l__CutsceneData__135:GetChildren();
	l__CurrentCamera__2.CoordinateFrame = l__CutsceneData__135["1"].c1.Value;
	l__CurrentCamera__2.Focus = l__CutsceneData__135["1"].f1.Value;
	l__CurrentCamera__2.FieldOfView = l__CutsceneData__135["1"].FOV.Value;
	l__CurrentCamera__2:SetRoll(l__CutsceneData__135["1"].Roll.Value);
	l__LocalPlayer__1.Character.Torso.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
	local l__Cutscene__22 = script.Parent.Cutscene;
	coroutine.resume(coroutine.create(function()
		local v137 = 1 - 1;
		while true do
			l__Cutscene__22.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v137, 0);
			l__Cutscene__22.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v137, 0);
			wait();
			if 0 <= 1 then
				if v137 < 20 then

				else
					break;
				end;
			elseif 20 < v137 then

			else
				break;
			end;
			v137 = v137 + 1;		
		end;
	end));
	local u23 = false;
	coroutine.resume(coroutine.create(function()
		local v138 = 0;
		local v139 = 1 - 1;
		while true do
			v131.Torso.BodyPosition.position = Vector3.new(368 - v139, 72 - v139 / 240 * 4, 50 - v139 / 240 * 8);
			v131.Torso.BodyGyro.cframe = CFrame.new(v131.Torso.BodyPosition.position) * CFrame.Angles(v139 / 240 * math.pi * 5, 1.5707963267948966, 0);
			wait();
			if v139 % 30 == 0 then
				local v140 = Instance.new("Explosion");
				local v141 = v131.Head;
				if v138 == 1 then
					v141 = v131.LeftBoosters.Booster2;
				elseif v138 == 3 then
					v141 = v131.RightBoosters.Booster2;
				end;
				v140.Position = v141.Position;
				v140.BlastPressure = 0;
				v140.BlastRadius = 16;
				v140.Parent = l__CurrentCamera__2;
				l__Debris__5:AddItem(v140, 1);
				if script.Parent:FindFirstChild("SoundScript") then
					local v142 = Instance.new("StringValue");
					v142.Name = "Sound";
					v142.Value = "RoboticExplosion";
					local v143 = Instance.new("ObjectValue");
					v143.Name = "Location";
					v143.Value = v141;
					v143.Parent = v142;
					v142.Parent = script.Parent.SoundScript.Effects;
				end;
				v138 = v138 + 1;
				if 3 < v138 then
					v138 = 0;
				end;
			end;
			wait();
			if 0 <= 1 then
				if v139 < 240 then

				else
					break;
				end;
			elseif 240 < v139 then

			else
				break;
			end;
			v139 = v139 + 1;		
		end;
		v131.Humanoid.Health = 0;
		local function u24(p29)
			local v144 = p29:GetChildren();
			local v145 = #v144;
			local v146 = 1 - 1;
			while true do
				if v144[v146] then
					if not v144[v146]:IsA("Part") then
						if v144[v146]:IsA("WedgePart") then
							v144[v146].Velocity = Vector3.new(math.random(-80, 80), math.random(-80, 80), math.random(-80, 80));
						elseif v144[v146] then
							if v144[v146]:IsA("Model") then
								u24(v144[v146]);
							end;
						end;
					else
						v144[v146].Velocity = Vector3.new(math.random(-80, 80), math.random(-80, 80), math.random(-80, 80));
					end;
				elseif v144[v146] then
					if v144[v146]:IsA("Model") then
						u24(v144[v146]);
					end;
				end;
				if 0 <= 1 then
					if v146 < v145 then

					else
						break;
					end;
				elseif v145 < v146 then

				else
					break;
				end;
				v146 = v146 + 1;			
			end;
		end;
		local v147 = v131:GetChildren();
		local v148 = #v147;
		local v149 = 1;
		while true do
			if v147[v149] then
				if v147[v149]:IsA("Model") then
					u24(v147[v149]);
				else
					v147[v149]:Destroy();
				end;
			else
				v147[v149]:Destroy();
			end;
			if 0 <= 1 then
				if v149 < v148 then

				else
					break;
				end;
			elseif v148 < v149 then

			else
				break;
			end;
			v149 = v149 + 1;		
		end;
		local l__BrokenWall__150 = l__Level__5.Parent.Map.BrokenWall;
		l__BrokenWall__150.Middle:Destroy();
		l__BrokenWall__150.Bottom:Destroy();
		l__BrokenWall__150.Back:Destroy();
		l__BrokenWall__150.Left2.CFrame = l__BrokenWall__150.Left2.CFrame + Vector3.new(0, 2, 6);
		l__BrokenWall__150.Right2.CFrame = l__BrokenWall__150.Right2.CFrame - Vector3.new(0, 2, 8);
		local v151 = Instance.new("Fire");
		v151.Size = 10;
		v151.Parent = l__BrokenWall__150.Left2;
		local v152 = Instance.new("Fire");
		v152.Size = 10;
		v152.Parent = l__BrokenWall__150.Right2;
		local v153 = Instance.new("Fire");
		v153.Size = 10;
		v153.Parent = l__BrokenWall__150.Top;
		local v154 = 1 - 1;
		while true do
			local v155 = Instance.new("Explosion");
			local v156 = l__BrokenWall__150.Left1;
			if v154 == 1 then
				v156 = l__BrokenWall__150.Top;
			elseif v154 == 3 then
				v156 = l__BrokenWall__150.Right1;
			end;
			v155.Position = v156.Position;
			v155.BlastPressure = 0;
			v155.BlastRadius = 32;
			v155.Parent = l__CurrentCamera__2;
			l__Debris__5:AddItem(v155, 1);
			if v154 == 2 then
				if script.Parent:FindFirstChild("SoundScript") then
					local v157 = Instance.new("StringValue");
					v157.Name = "Sound";
					v157.Value = "RoboticExplosion";
					local v158 = Instance.new("ObjectValue");
					v158.Name = "Location";
					v158.Value = v156;
					v158.Parent = v157;
					v157.Parent = script.Parent.SoundScript.Effects;
				end;
			end;
			if 0 <= 1 then
				if v154 < 3 then

				else
					break;
				end;
			elseif 3 < v154 then

			else
				break;
			end;
			v154 = v154 + 1;		
		end;
		wait(1);
		u23 = true;
	end));
	local v159 = #v136;
	local v160 = 2 - 1;
	while true do
		local v161 = l__CutsceneData__135[tostring(v160)];
		tweenCam(v161.c1.Value, v161.f1.Value, v161.step.Value, v161.FOV.Value, v161.Roll.Value, v161.Style.Value);
		if 0 <= 1 then
			if v160 < v159 then

			else
				break;
			end;
		elseif v159 < v160 then

		else
			break;
		end;
		v160 = v160 + 1;	
	end;
	while true do
		wait(0.09);
		if not u23 then

		else
			break;
		end;	
	end;
	wait(0.06);
	handleGUIs(true);
	coroutine.resume(coroutine.create(function()
		local v162 = 1 - 1;
		while true do
			l__Cutscene__22.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v162, 0);
			l__Cutscene__22.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v162, 0);
			wait();
			if 0 <= 1 then
				if v162 < 20 then

				else
					break;
				end;
			elseif 20 < v162 then

			else
				break;
			end;
			v162 = v162 + 1;		
		end;
	end));
end;
function cavernFight()
	local function v163(p30)
		if not l__Level__5.Parent:findFirstChild("Map") then
			return;
		end;
		print("Bot");
		local v164 = l__GameItems__3.MasterModels[p30]:clone();
		v164.Parent = l__Level__5.Parent.Map;
		v164:MakeJoints();
		v164.Torso.CFrame = CFrame.new(414.3, 37, 3.8);
		if p30 == "Drone" then
			v164.Stats.Health.Value = 50;
			v164.Stats.Speed.Value = 16;
		else
			v164.Stats.Health.Value = 80;
		end;
		v164.Stats.Path:Destroy();
		l__Level__5.Map6Task.Path:Clone().Parent = v164.Stats;
		v164.Stats.OffsetMaxX.Value = 1000;
		v164.Stats.OffsetMaxZ.Value = 1000;
		v164.Stats.OffsetMinX.Value = -1000;
		v164.Stats.OffsetMinZ.Value = -1000;
		local v165 = v164.MainControlNPC:clone();
		v165.Name = "MapScript";
		v165.Parent = script.Parent;
		local v166 = Instance.new("ObjectValue");
		v166.Name = "LinkedModel";
		v166.Value = v164;
		v166.Parent = v165;
		v165.Disabled = false;
	end;
	print("Cavern Fight");
	local v167 = 1 - 1;
	while true do
		if v167 % 3 == 0 then
			v163("BlinkBot");
		else
			v163("Drone");
		end;
		waitTime(10);
		if 0 <= 1 then
			if v167 < 9 then

			else
				break;
			end;
		elseif 9 < v167 then

		else
			break;
		end;
		v167 = v167 + 1;	
	end;
end;
function map6Task()
	loadMap6();
	while true do
		wait();
		if l__Level__5.Parent.Map:findFirstChild("DrillExtractorStage") then
			if l__Level__5.Parent.Map.DrillExtractorStage:findFirstChild("BlockingPanels") then
				if not l__Level__5.Parent.Map.DrillExtractorStage.BlockingPanels:findFirstChild("DoorHandle") then

				else
					break;
				end;
			end;
		end;	
	end;
	if script.Parent:FindFirstChild("SoundScript") then
		local v168 = Instance.new("StringValue");
		v168.Name = "Sound";
		v168.Value = "MetalClang";
		local v169 = Instance.new("ObjectValue");
		v169.Name = "Location";
		v169.Value = l__Level__5.Parent.Map.DrillExtractorStage.BlockingPanels.DoorHandle;
		v169.Parent = v168;
		v168.Parent = script.Parent.SoundScript.Effects;
	end;
end;
l__Level__5.Map1Task.RoyalTrigger.Touched:connect(function(p31)
	if p31 and p31.Parent and p31.Name == "Torso" and script.Parent:findFirstChild("LocalScript") then
		l__Level__5.Map1Task.RoyalTrigger:Destroy();
		local l__Cutscene__170 = script.Parent.Cutscene;
		script.Parent.LocalScript.LocalPause.Value = true;
		handleGUIs(false);
		l__CurrentCamera__2.CameraSubject = nil;
		l__CurrentCamera__2.CameraType = "Scriptable";
		local l__CutsceneData__171 = l__Level__5.Map1Task.CutsceneData;
		local v172 = l__CutsceneData__171:GetChildren();
		l__CurrentCamera__2.CoordinateFrame = l__CutsceneData__171["1"].c1.Value;
		l__CurrentCamera__2.Focus = l__CutsceneData__171["1"].f1.Value;
		l__CurrentCamera__2.FieldOfView = l__CutsceneData__171["1"].FOV.Value;
		l__CurrentCamera__2:SetRoll(l__CutsceneData__171["1"].Roll.Value);
		p31.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
		for v173 = 1, 20 do
			l__Cutscene__170.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v173, 0);
			l__Cutscene__170.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v173, 0);
			wait();
		end;
		for v174 = 2, #v172 do
			local v175 = l__CutsceneData__171[tostring(v174)];
			if v174 == 3 then
				wait(0.06);
				l__Cutscene__170.NameText.Text = "ROYAL";
				l__Cutscene__170.NameText.Visible = true;
				wait(3);
				l__Cutscene__170.NameText.Visible = false;
			end;
			tweenCam(v175.c1.Value, v175.f1.Value, v175.step.Value, v175.FOV.Value, v175.Roll.Value, v175.Style.Value);
		end;
		(function()
			local l__Decal__176 = l__Level__5.NPC.Convo1.Royal.Face.Decal;
			local v177 = { "http://www.roblox.com/asset/?id=88427330", "http://www.roblox.com/asset/?id=88427330", "http://www.roblox.com/asset/?id=88427330" };
			local v178 = 1;
			local v179 = true;
			l__Parent__1.StoryScript.Current.Value = l__Level__5.Map1Task.Dialogue;
			while true do
				wait(0.09);
				if l__Parent__1.StoryScript.Choice.Value ~= 0 then
					l__Decal__176.Texture = v177[v178];
					if v179 then
						v178 = v178 + 1;
					else
						v178 = v178 - 1;
					end;
					if v178 > 2 or v178 < 2 then
						v179 = not v179;
					end;
				else
					l__Decal__176.Texture = "http://www.roblox.com/asset/?id=88427330";
				end;
				if not l__Parent__1.StoryScript.Busy.Value then
					break;
				end;			
			end;
			l__Decal__176.Texture = "http://www.roblox.com/asset/?id=88427330";
		end)();
		l__Level__5.Objectives.Royal:Destroy();
		p31.CFrame = CFrame.new(-52, 42.4, 46.8) * CFrame.Angles(0, -1.5707963267948966, 0);
		wait(0.06);
		script.Parent.LocalScript.LocalPause.Value = false;
		l__CurrentCamera__2.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
		l__CurrentCamera__2.CameraType = "Custom";
		l__CurrentCamera__2.FieldOfView = 70;
		handleGUIs(true);
		for v180 = 1, 20 do
			l__Cutscene__170.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v180, 0);
			l__Cutscene__170.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v180, 0);
			wait();
		end;
	end;
end);
local u25 = false;
l__Level__5.Map1Task.SpawnHH.Touched:connect(function(p32)
	if p32 and p32.Parent and p32.Name == "Torso" and (script.Parent:findFirstChild("LocalScript") and not u25) then
		if not l__Level__5.Parent:findFirstChild("Map") or l__Level__5.Parent.Map:findFirstChild("Hubris Hauteur") then
			return;
		end;
		u25 = true;
		local v181 = l__GameItems__3.MasterLevels["Level" .. l__Stats__4.Level.Value].Extras.HH1:clone();
		v181.Name = "Hubris Hauteur";
		v181.Parent = l__Level__5.Parent.Map;
		u25 = false;
	end;
end);
l__Level__5.Map1Task.RemoveHH.Touched:connect(function(p33)
	if p33 and p33.Parent and p33.Name == "Torso" and (script.Parent:findFirstChild("LocalScript") and not u25) then
		if not l__Level__5.Parent:findFirstChild("Map") or not l__Level__5.Parent.Map:findFirstChild("Hubris Hauteur") then
			return;
		end;
		u25 = true;
		local v182 = l__Level__5.Parent.Map["Hubris Hauteur"]:Destroy();
		u25 = false;
	end;
end);
l__Level__5.Map2Task.TamidTrigger.Touched:connect(function(p34)
	if p34 and p34.Parent and p34.Name == "Torso" and script.Parent:findFirstChild("LocalScript") and not l__Level__5.Objectives:findFirstChild("Offline Reactor") then
		l__Level__5.Map2Task.TamidTrigger:Destroy();
		local l__Cutscene__183 = script.Parent.Cutscene;
		script.Parent.LocalScript.LocalPause.Value = true;
		handleGUIs(false);
		l__CurrentCamera__2.CameraSubject = nil;
		l__CurrentCamera__2.CameraType = "Scriptable";
		local l__CutsceneData__184 = l__Level__5.Map2Task.CutsceneData;
		local v185 = l__CutsceneData__184:GetChildren();
		l__CurrentCamera__2.CoordinateFrame = l__CutsceneData__184["1"].c1.Value;
		l__CurrentCamera__2.Focus = l__CutsceneData__184["1"].f1.Value;
		l__CurrentCamera__2.FieldOfView = l__CutsceneData__184["1"].FOV.Value;
		l__CurrentCamera__2:SetRoll(l__CutsceneData__184["1"].Roll.Value);
		p34.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
		for v186 = 1, 20 do
			l__Cutscene__183.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v186, 0);
			l__Cutscene__183.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v186, 0);
			wait();
		end;
		for v187 = 2, #v185 do
			local v188 = l__CutsceneData__184[tostring(v187)];
			tweenCam(v188.c1.Value, v188.f1.Value, v188.step.Value, v188.FOV.Value, v188.Roll.Value, v188.Style.Value);
		end;
		wait(0.06);
		l__Cutscene__183.NameText.Text = "DR. UMAR TAMID";
		l__Cutscene__183.NameText.Visible = true;
		wait(3);
		l__Cutscene__183.NameText.Visible = false;
		(function()
			local l__Decal__189 = l__Level__5.NPC.Convo1["Dr. Umar Tamid"].Face.Decal;
			local v190 = { "http://www.roblox.com/asset/?id=88427353", "http://www.roblox.com/asset/?id=88427353", "http://www.roblox.com/asset/?id=88427353" };
			local v191 = 1;
			local v192 = true;
			l__Parent__1.StoryScript.Current.Value = l__Level__5.Map2Task.Dialogue;
			while true do
				wait(0.09);
				if l__Parent__1.StoryScript.Choice.Value ~= 0 then
					l__Decal__189.Texture = v190[v191];
					if v192 then
						v191 = v191 + 1;
					else
						v191 = v191 - 1;
					end;
					if v191 > 2 or v191 < 2 then
						v192 = not v192;
					end;
				else
					l__Decal__189.Texture = "http://www.roblox.com/asset/?id=88427353";
				end;
				if not l__Parent__1.StoryScript.Busy.Value then
					break;
				end;			
			end;
			l__Decal__189.Texture = "http://www.roblox.com/asset/?id=88427353";
		end)();
		l__Level__5.Objectives["Dr. Umar Tamid"]:Destroy();
		p34.CFrame = CFrame.new(78, 17.1, 21) * CFrame.Angles(0, 1.5707963267948966, 0);
		wait(0.06);
		script.Parent.LocalScript.LocalPause.Value = false;
		l__CurrentCamera__2.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
		l__CurrentCamera__2.CameraType = "Custom";
		l__CurrentCamera__2.FieldOfView = 70;
		handleGUIs(true);
		for v193 = 1, 20 do
			l__Cutscene__183.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v193, 0);
			l__Cutscene__183.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v193, 0);
			wait();
		end;
	end;
end);
l__Level__5.Map3Task.Trigger.Touched:connect(function(p35)
	if p35 and p35.Parent and p35.Name == "Torso" and (script.Parent:findFirstChild("LocalScript") and l__Stats__4.LoadingZone.Value == 3) then
		l__Level__5.Map3Task.Trigger:Destroy();
		local l__Cutscene__194 = script.Parent.Cutscene;
		script.Parent.LocalScript.LocalPause.Value = true;
		local l__Gate0__195 = l__Level__5.Map3Task.Gate0;
		local l__Gate1__196 = l__Level__5.Map3Task.Gate1;
		local l__Gate2__197 = l__Level__5.Map3Task.Gate2;
		handleGUIs(false);
		local function v198()
			if not l__Level__5.Parent:findFirstChild("Map") then
				return;
			end;
			print("Bot");
			l__Level__5.Map3Task.Bots.Value = l__Level__5.Map3Task.Bots.Value + 1;
			local v199 = l__GameItems__3.MasterModels.MegaBot:clone();
			v199.Parent = l__Level__5.Parent.Map;
			v199:MakeJoints();
			v199.Torso.CFrame = CFrame.new(246.2, 44, 21.4) * CFrame.Angles(0, 90, 0);
			v199.Stats.WaitTime.Value = 3;
			v199.Stats.Counter.Value = l__Level__5.Map3Task.Bots;
			v199.Stats.OffsetMaxX.Value = 2;
			v199.Stats.OffsetMaxZ.Value = 32;
			v199.Stats.OffsetMinX.Value = -82;
			v199.Stats.OffsetMinZ.Value = -32;
			local v200 = v199.MainControlNPC:clone();
			v200.Name = "MapScript";
			v200.Parent = script.Parent;
			local v201 = Instance.new("ObjectValue");
			v201.Name = "LinkedModel";
			v201.Value = v199;
			v201.Parent = v200;
			v200.Disabled = false;
		end;
		l__CurrentCamera__2.CameraSubject = nil;
		l__CurrentCamera__2.CameraType = "Scriptable";
		local l__CutsceneData__202 = l__Level__5.Map3Task.CutsceneData;
		local v203 = l__CutsceneData__202:GetChildren();
		l__CurrentCamera__2.CoordinateFrame = l__CutsceneData__202["1"].c1.Value;
		l__CurrentCamera__2.Focus = l__CutsceneData__202["1"].f1.Value;
		l__CurrentCamera__2.FieldOfView = l__CutsceneData__202["1"].FOV.Value;
		l__CurrentCamera__2:SetRoll(l__CutsceneData__202["1"].Roll.Value);
		p35.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
		for v204 = 1, 20 do
			l__Cutscene__194.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v204, 0);
			l__Cutscene__194.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v204, 0);
			wait();
		end;
		for v205 = 1, 16 do
			l__Gate2__197.CFrame = l__Gate2__197.CFrame + Vector3.new(0, -0.5, 0);
			wait();
		end;
		for v206 = 2, #v203 do
			local v207 = l__CutsceneData__202[tostring(v206)];
			if v206 == 3 then
				for v208 = 1, 16 do
					l__Gate0__195.CFrame = l__Gate0__195.CFrame + Vector3.new(0, 0, -1);
					l__Gate1__196.CFrame = l__Gate1__196.CFrame + Vector3.new(0, 0, 1);
					wait();
				end;
				v198();
			end;
			tweenCam(v207.c1.Value, v207.f1.Value, v207.step.Value, v207.FOV.Value, v207.Roll.Value, v207.Style.Value);
		end;
		wait(0.06);
		l__Cutscene__194.NameText.Text = "MEGA BOT";
		l__Cutscene__194.NameText.Visible = true;
		wait(3);
		l__Cutscene__194.NameText.Visible = false;
		p35.CFrame = CFrame.new(195, 29.5, 21) * CFrame.Angles(0, -90, 0);
		wait(0.06);
		script.Parent.LocalScript.LocalPause.Value = false;
		l__CurrentCamera__2.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
		l__CurrentCamera__2.CameraType = "Custom";
		l__CurrentCamera__2.FieldOfView = 70;
		handleGUIs(true);
		for v209 = 1, 20 do
			l__Cutscene__194.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v209, 0);
			l__Cutscene__194.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v209, 0);
			wait();
		end;
		while true do
			wait(0.3);
			if l__Level__5.Map3Task.Bots.Value < 1 then
				break;
			end;		
		end;
		wait(1.5);
		for v210 = 1, 16 do
			l__Gate0__195.CFrame = l__Gate0__195.CFrame - Vector3.new(0, 0, -1);
			l__Gate1__196.CFrame = l__Gate1__196.CFrame - Vector3.new(0, 0, 1);
			l__Gate2__197.CFrame = l__Gate2__197.CFrame - Vector3.new(0, -0.5, 0);
			wait();
		end;
		l__Level__5.Map3Task:Destroy();
	end;
end);
function typeText(p36, p37)
	local v211 = nil;
	v211 = 0;
	local v212 = string.len(p36);
	local v213 = 1 - 1;
	while true do
		p37.Text = string.sub(p36, 1, v213);
		waitTime(1);
		v211 = v211 + 1;
		if 0 <= 1 then
			if v213 < v212 then

			else
				break;
			end;
		elseif v212 < v213 then

		else
			break;
		end;
		v213 = v213 + 1;	
	end;
	return math.ceil(5);
end;
function runConversation(p38)
	coroutine.resume(coroutine.create(function()
		local v215 = p38.Dialogue.Main:getChildren();
		local v216 = 1;
		while true do
			if p38 then

			else
				break;
			end;
			if p38.Parent then

			else
				break;
			end;
			p38.Speakers[v215[v216].Change.Value].BillboardGui.Enabled = true;
			local l__Dialogue__217 = p38.Speakers[v215[v216].Change.Value].BillboardGui.Dialogue;
			local v218 = typeText(v215[v216].Value, l__Dialogue__217.Text1);
			if p38 then

			else
				break;
			end;
			if p38.Parent then

			else
				break;
			end;
			if v215[v216]:findFirstChild("Cont") then
				v218 = v218 + typeText(v215[v216].Cont.Value, l__Dialogue__217.Text2);
			else
				l__Dialogue__217.Text2.Text = "";
			end;
			waitTime(v218 * 2.5);
			if p38 then

			else
				break;
			end;
			if p38.Parent then

			else
				break;
			end;
			if p38:findFirstChild("Speakers") then

			else
				break;
			end;
			local v219 = p38.Speakers:getChildren();
			l__Dialogue__217.Text1.Text = "";
			l__Dialogue__217.Text2.Text = "";
			local v220 = #v219;
			local v221 = 1;
			while true do
				v219[v221].BillboardGui.Enabled = false;
				if 0 <= 1 then
					if v221 < v220 then

					else
						break;
					end;
				elseif v220 < v221 then

				else
					break;
				end;
				v221 = v221 + 1;			
			end;
			if v215[v216]:findFirstChild("Wait") then
				wait(v215[v216].Wait.Value);
			end;
			v216 = v216 + 1;
			if #v215 < v216 then
				v216 = 1;
			end;		
		end;
	end));
end;
runConversation(l__Level__5.NPC.ConversationLoops.Conversation1);
function reactorInPlace()
	if l__Level__5.GeneratorTask.Generator:findFirstChild("ReactorBroken") then
		l__Level__5.GeneratorTask.Generator.ReactorBroken:Destroy();
		l__Level__5.GeneratorTask.Generator.Reactor.Transparency = 0;
		l__Level__5.GeneratorTask.Generator.Reactor.PointLight.Enabled = true;
	end;
	l__Level__5.GeneratorTask.Generator.Reactor.CFrame = l__Level__5.GeneratorTask.Generator.ReactorFinal.CFrame;
	l__Level__5.GeneratorTask.Generator.ReactorFinal:Destroy();
	local v222, v223, v224 = pairs(l__Level__5.GeneratorTask.Generator.ColoredParts:GetChildren());
	while true do
		local v225, v226 = v222(v223, v224);
		if v225 then

		else
			break;
		end;
		v224 = v225;
		if v226:IsA("Part") then
			v226.BrickColor = BrickColor.new("Bright red");
			v226.Material = "Plastic";
		end;	
	end;
	l__Level__5.GeneratorTask.BlastDoor:Destroy();
	l__Level__5.NPC.Convo1:Destroy();
	l__Level__5.NPC.ConversationLoops.Conversation1:Destroy();
	runConversation(l__Level__5.NPC.ConversationLoops.Conversation2);
	runConversation(l__Level__5.NPC.ConversationLoops.Conversation3);
	l__GameItems__3.MasterLevels["Level" .. l__Stats__4.Level.Value].Extras.Convo2:clone().Parent = l__Level__5.NPC;
end;
l__Level__5.GeneratorTask.Generator.ReactorBroken.Touched:connect(function(p39)
	if p39 and p39.Parent and p39.Name == "Reactor" and (p39.Parent:IsA("Tool") and l__Stats__4.Tool.Value == "Reactor") then
		l__Stats__4.Tool.Value = "Bad Reactor";
		l__Level__5.GeneratorTask.Generator.ReactorBroken:Destroy();
		l__Level__5.GeneratorTask.Generator.Reactor.Transparency = 0;
		l__Level__5.GeneratorTask.Generator.Reactor.PointLight.Enabled = true;
		for v227 = 1, 18 do
			l__Level__5.GeneratorTask.Generator.Reactor.CFrame = l__Level__5.GeneratorTask.Generator.Reactor.CFrame + Vector3.new(-0.1, 0, 0);
			wait();
		end;
		reactorInPlace();
	end;
end);
l__Level__5.Map4Task.Trigger.Touched:connect(function(p40)
	if p40 and p40.Parent and p40.Name == "Torso" and script.Parent:findFirstChild("LocalScript") then
		l__Level__5.Map4Task.Trigger:Destroy();
		local l__Gate__228 = l__Level__5.Map4Task.Gate;
		local function v229(p41)
			if not l__Level__5.Parent:findFirstChild("Map") then
				return;
			end;
			print("Bot Upper");
			l__Level__5.Map4Task.Bots.Value = l__Level__5.Map4Task.Bots.Value + 1;
			local v230 = l__GameItems__3.MasterModels[p41]:clone();
			v230.Parent = l__Level__5.Parent.Map;
			v230:MakeJoints();
			v230.Torso.CFrame = CFrame.new(75, 47.4, -135) * CFrame.Angles(3.141592653589793, 0, 3.141592653589793);
			v230.Stats.WaitTime.Value = 0;
			if p41 == "Drone" then
				v230.Stats.Speed.Value = 16;
			end;
			v230.Stats.Counter.Value = l__Level__5.Map4Task.Bots;
			v230.Stats.OffsetMaxX.Value = 11;
			v230.Stats.OffsetMaxZ.Value = 64;
			v230.Stats.OffsetMinX.Value = -27;
			v230.Stats.OffsetMinZ.Value = 8;
			v230.Stats.Invisible.Value = true;
			local v231 = v230.MainControlNPC:clone();
			v231.Name = "MapScript";
			v231.Parent = script.Parent;
			local v232 = Instance.new("ObjectValue");
			v232.Name = "LinkedModel";
			v232.Value = v230;
			v232.Parent = v231;
			v231.Disabled = false;
			wait(0.9);
			v230.Stats.Invisible.Value = false;
			if v230:findFirstChild("Humanoid") then
				local v233 = Instance.new("ObjectValue");
				v233.Value = l__LocalPlayer__1;
				v233.Name = "creator";
				local v234 = Instance.new("StringValue");
				v234.Value = "None";
				v234.Parent = v233;
				v233.Parent = v230.Humanoid;
				l__Debris__5:AddItem(v233, 10);
			end;
		end;
		local function v235(p42)
			if not l__Level__5.Parent:findFirstChild("Map") then
				return;
			end;
			print("Bot Lower");
			l__Level__5.Map4Task.Bots.Value = l__Level__5.Map4Task.Bots.Value + 1;
			local v236 = l__GameItems__3.MasterModels[p42]:clone();
			v236.Parent = l__Level__5.Parent.Map;
			v236:MakeJoints();
			v236.Torso.CFrame = CFrame.new(24, 39.8, -94.2) * CFrame.Angles(0, -1.5707963267948966, 0);
			v236.Stats.WaitTime.Value = 0;
			if p42 == "Drone" then
				v236.Stats.Speed.Value = 16;
			end;
			v236.Stats.Path:Destroy();
			l__Level__5.Map4Task.Path:Clone().Parent = v236.Stats;
			v236.Stats.Counter.Value = l__Level__5.Map4Task.Bots;
			v236.Stats.OffsetMaxX.Value = 1000;
			v236.Stats.OffsetMaxZ.Value = 1000;
			v236.Stats.OffsetMinX.Value = -1000;
			v236.Stats.OffsetMinZ.Value = -1000;
			v236.Stats.Invisible.Value = true;
			local v237 = v236.MainControlNPC:clone();
			v237.Name = "MapScript";
			v237.Parent = script.Parent;
			local v238 = Instance.new("ObjectValue");
			v238.Name = "LinkedModel";
			v238.Value = v236;
			v238.Parent = v237;
			v237.Disabled = false;
			wait(0.9);
			v236.Stats.Invisible.Value = false;
		end;
		for v239 = 1, 16 do
			l__Gate__228.CFrame = l__Gate__228.CFrame + Vector3.new(0, -0.5, 0);
			wait();
		end;
		v229("Drone");
		v235("BlinkBot");
		while true do
			wait(0.09);
			if l__Level__5.Map4Task.Bots.Value < 1 then
				break;
			end;		
		end;
		v235("Drone");
		v229("Drone");
		wait(6);
		v235("Drone");
		v235("Drone");
		while true do
			wait(0.09);
			if l__Level__5.Map4Task.Bots.Value < 1 then
				break;
			end;		
		end;
		wait(2);
		v229("Drone");
		v235("BlinkBot");
		v235("Drone");
		wait(1);
		v235("Drone");
		while true do
			wait(0.3);
			if l__Level__5.Map4Task.Bots.Value < 1 then
				break;
			end;		
		end;
		wait(1.5);
		for v240 = 1, 16 do
			l__Gate__228.CFrame = l__Gate__228.CFrame - Vector3.new(0, -0.5, 0);
			wait();
		end;
		l__Level__5.Map4Task:Destroy();
	end;
end);
function runOverseer(p43)
	local l__Humanoid__241 = p43.Humanoid;
	local l__Torso__242 = p43.Torso;
	function recolorMainParts(p44)
		p43.Dress1.BrickColor = BrickColor.new(p44);
		p43.Dress2.BrickColor = BrickColor.new(p44);
		p43.Face.BrickColor = BrickColor.new(p44);
		p43.Head.BrickColor = BrickColor.new(p44);
		p43["Left Arm"].BrickColor = BrickColor.new(p44);
		p43["Left Leg"].BrickColor = BrickColor.new(p44);
		p43["Right Arm"].BrickColor = BrickColor.new(p44);
		p43["Right Leg"].BrickColor = BrickColor.new(p44);
		p43.Torso.BrickColor = BrickColor.new(p44);
		p43.Hair.BrickColor = BrickColor.new(p44);
	end;
	function visualDamage(p45, p46, p47)
		local v243 = Instance.new("BillboardGui");
		v243.Size = UDim2.new(1, 0, 1, 0);
		v243.StudsOffset = Vector3.new(math.random(-1, 1), 1.65, math.random(-1, 1));
		local v244 = l__GameItems__3.MasterGuis.DamageFrame:clone();
		v244.Parent = v243;
		if p46 == 0 then
			v244.TextLabel.Text = "-" .. p46;
			v244.TextLabel.TextStrokeColor3 = Color3.new(0, 0, 1);
		elseif p46 < 0 then
			v244.TextLabel.Text = "+" .. p46;
			v244.TextLabel.TextStrokeColor3 = Color3.new(0, 1, 0);
		else
			v244.TextLabel.Text = "-" .. p46;
			v244.TextLabel.TextStrokeColor3 = Color3.new(1, 0, 0);
		end;
		v243.Parent = p47;
		v243.Adornee = p47;
		local l__BillboardControl__245 = v244.BillboardControl;
		l__BillboardControl__245.Billboard.Value = v243;
		l__BillboardControl__245.Parent = script.Parent;
		l__BillboardControl__245.Disabled = false;
		l__Debris__5:AddItem(v243, 5);
	end;
	local function u26(p48)
		local l__X__246 = p48.Position.X;
		local l__Y__247 = p48.Position.Y;
		local l__Z__248 = p48.Position.Z;
		local l__X__249 = p48.Size.X;
		local l__Y__250 = p48.Size.Y;
		local l__Z__251 = p48.Size.Z;
		local v252 = p48.CFrame - p48.CFrame.p;
		p48:Destroy();
		local v253 = Instance.new("Part");
		v253.Name = "Averter";
		v253.FormFactor = 0;
		v253.Size = Vector3.new(1, 1, 1);
		v253.BrickColor = p48.BrickColor;
		v253.Shape = 1;
		v253.BottomSurface = 0;
		v253.TopSurface = 0;
		v253.Reflectance = p48.Reflectance;
		v253.Transparency = p48.Transparency;
		v253.CanCollide = false;
		local v254 = l__X__249 - 1;
		local v255 = 0 - 1;
		while true do
			local v256 = l__Y__250 - 1;
			local v257 = 0 - 1;
			while true do
				local v258 = l__Z__251 - 1;
				local v259 = 0 - 1;
				while true do
					newNP = v253:clone();
					newNP.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
					newNP.CFrame = CFrame.new(l__X__246 - (l__X__249 - 1) / 2 + v255, l__Y__247 - (l__Y__250 - 1) / 2 + v257, l__Z__248 - (l__Z__251 - 1) / 2 + v259) * v252;
					l__Debris__5:AddItem(newNP, 0.5);
					newNP.Parent = l__CurrentCamera__2;
					if 0 <= 1 then
						if v259 < v258 then

						else
							break;
						end;
					elseif v258 < v259 then

					else
						break;
					end;
					v259 = v259 + 1;				
				end;
				if 0 <= 1 then
					if v257 < v256 then

					else
						break;
					end;
				elseif v256 < v257 then

				else
					break;
				end;
				v257 = v257 + 1;			
			end;
			if 0 <= 1 then
				if v255 < v254 then

				else
					break;
				end;
			elseif v254 < v255 then

			else
				break;
			end;
			v255 = v255 + 1;		
		end;
	end;
	function normalDamage(p49, p50)
		local v260 = p49.Parent:findFirstChild("Humanoid") or p49.Parent.Parent:findFirstChild("Humanoid");
		if v260 then
			if not game.Players:findFirstChild(v260.Parent.Name) then
				if v260.Parent:findFirstChild("MainControlVRT") then
					if 0 < v260.Health then
						if not v260.Parent:findFirstChild("ForceField") then
							if v260.Parent:findFirstChild("Head") then
								local v261 = p50;
								if p49.Name == "Head" then
									v261 = math.ceil(v261 * 2);
								elseif p49.Name == "Torso" then
									v261 = math.ceil(v261 * 1.5);
								end;
								v260:TakeDamage(v261);
								visualDamage(v260, v261, v260.Parent.Head);
								return;
							end;
						end;
					end;
				else
					if p49.Name == "Glass" then
						u26(p49);
						return;
					end;
					if p49.Name == "Explosive" then
						if p49:findFirstChild("Explode") then
							p49.Explode.Value = true;
						end;
					end;
				end;
			elseif 0 < v260.Health then
				if not v260.Parent:findFirstChild("ForceField") then
					if v260.Parent:findFirstChild("Head") then
						v261 = p50;
						if p49.Name == "Head" then
							v261 = math.ceil(v261 * 2);
						elseif p49.Name == "Torso" then
							v261 = math.ceil(v261 * 1.5);
						end;
						v260:TakeDamage(v261);
						visualDamage(v260, v261, v260.Parent.Head);
						return;
					end;
				end;
			end;
		else
			if p49.Name == "Glass" then
				u26(p49);
				return;
			end;
			if p49.Name == "Explosive" then
				if p49:findFirstChild("Explode") then
					p49.Explode.Value = true;
				end;
			end;
		end;
	end;
	local v262 = Instance.new("Part");
	v262.FormFactor = Enum.FormFactor.Custom;
	v262.Size = Vector3.new(0.2, 0.2, 1);
	v262.BrickColor = BrickColor.new("Bright red");
	v262.CanCollide = false;
	v262.Anchored = true;
	v262.Transparency = 0.3;
	v262.TopSurface = Enum.SurfaceType.Smooth;
	v262.BottomSurface = Enum.SurfaceType.Smooth;
	v262.Name = "Averter";
	local u27 = false;
	local l__Stats__28 = p43.Stats;
	function onFireNormal(p51)
		u27 = true;
		l__Stats__28.Ammo.Value = l__Stats__28.Ammo.Value - 1;
		local function u29(p52, p53)
			if p52 then
				if not (1 <= p52.Transparency) then
					if string.lower(p52.Name) ~= "water" then
						if p52.Name ~= "Effect" then
							if p52.Name ~= "Rocket" then
								if p52.Name ~= "Averter" then
									if p52.Parent.ClassName ~= "Hat" then
										if p52.Parent.ClassName == "Tool" then

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
		local function u30(p54, p55, p56)
			local v263, v264 = workspace:FindPartOnRay(Ray.new(p54 + p55 * 0.01, p55 * p56), p43);
			if v263 then
				if v264 then
					local v265 = p56 - (v264 - p54).magnitude;
					--if u29(v263, v264) then
					--	if 0 < v265 then
					--		return u30(v264, p55, v265);
					--	end;
					--end;
				end;
			end;
			return v263, v264;
		end;
		local v266, v267 = u30(p51.Position, (CFrame.new(Vector3.new(0, 0, 0), p51.CFrame.lookVector) * CFrame.Angles(0, 0, math.random() * 2 * math.pi) * CFrame.Angles(math.random() * 0.5, 0, 0)).lookVector, 200);
		if script.Parent:FindFirstChild("SoundScript") then
			local v268 = Instance.new("StringValue");
			v268.Name = "Sound";
			v268.Value = "LaserShot";
			local v269 = Instance.new("ObjectValue");
			v269.Name = "Location";
			v269.Value = l__Torso__242;
			v269.Parent = v268;
			v268.Parent = script.Parent.SoundScript.Effects;
		end;
		if v267 then
			local v270 = v262:clone();
			local l__magnitude__271 = (v267 - p51.Position).magnitude;
			v270.CFrame = CFrame.new(v267, p51.Position) * CFrame.new(0, 0, -l__magnitude__271 / 2);
			local v272 = Instance.new("BlockMesh");
			v272.Scale = Vector3.new(1, 1, l__magnitude__271 - 2);
			v272.Offset = Vector3.new(0, 0, 2);
			v272.Parent = v270;
			v270.Parent = l__CurrentCamera__2;
			l__Debris__5:AddItem(v270, 0.06);
		end;
		if v266 then
			if v266.Parent then
				if v267 then
					normalDamage(v266, 8);
				end;
			end;
		end;
		waitTime(2);
		u27 = false;
	end;
	l__Humanoid__241.Died:connect(function()
		coroutine.resume(coroutine.create(function()
			waitTime(400);
			p43:Destroy();
		end));
		if p43:findFirstChild("Torso") then
			if 0 < l__Torso__242.Position.y then
				local v273 = Instance.new("Explosion");
				v273.Position = l__Torso__242.Position;
				v273.BlastPressure = 0;
				v273.BlastRadius = 16;
				v273.Parent = l__CurrentCamera__2;
				l__Debris__5:AddItem(v273, 3);
				p43:BreakJoints();
				l__Torso__242.BodyGyro:Destroy();
				l__Torso__242.BodyPosition:Destroy();
				if game.Lighting.Brightness ~= 0 then
					game.Lighting.Brightness = 0;
					game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0);
				end;
				local v274 = script.Parent:FindFirstChild("SoundScript");
				if v274 then
					v274 = Instance.new("StringValue");
					v274.Name = "Sound";
					v274.Value = "RoboticExplosion";
					local v275 = Instance.new("ObjectValue");
					v275.Name = "Location";
					v275.Value = l__Torso__242;
					v275.Parent = v274;
					v274.Parent = script.Parent.SoundScript.Effects;
				end;
				local function u31(p57)
					local v276 = p57:GetChildren();
					local v277 = #v276;
					local v278 = 1 - 1;
					while true do
						if v276[v278] then
							if v276[v278]:IsA("Part") then
								v276[v278].Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
							elseif v276[v278] then
								if v276[v278]:IsA("Model") then
									u31(v276[v278]);
								end;
							end;
						elseif v276[v278] then
							if v276[v278]:IsA("Model") then
								u31(v276[v278]);
							end;
						end;
						if 0 <= 1 then
							if v278 < v277 then

							else
								break;
							end;
						elseif v277 < v278 then

						else
							break;
						end;
						v278 = v278 + 1;					
					end;
				end;
				u31(p43);
			end;
		end;
	end);
	function followEnemy(p58)
		local l__unit__279 = (l__Torso__242.Position - p58).unit;
		l__Torso__242.BodyGyro.cframe = CFrame.new(l__Torso__242.BodyGyro.cframe.p) * CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(l__unit__279.X, 0, l__unit__279.Z))) * CFrame.Angles(math.pi, 0, math.pi);
	end;
	local u32 = false;
	local l__Head__33 = p43.Head;
	local u34 = false;
	local u35 = nil;
	local u36 = nil;
	function runBot(p59)
		if 0 < l__Humanoid__241.Health then
			local v280 = nil;
			if l__Humanoid__241.Health < 100 then
				l__Humanoid__241.Health = 100;
			end;
			if l__LocalPlayer__1.Character then
				if not l__LocalPlayer__1.Character:findFirstChild("Torso") then
					return;
				end;
			else
				return;
			end;
			l__Torso__242.Spikes.C0 = l__Torso__242.Spikes.C0 * CFrame.Angles(0, math.sin(p59), 0);
			if u32 then
				return;
			end;
			local l__DecisionParts__281 = l__Level__5.Map5Task.DecisionParts;
			local v282 = l__LocalPlayer__1.Character.Torso.Position;
			local l__magnitude__283 = (l__LocalPlayer__1.Character.Torso.Position - l__DecisionParts__281.Right1.Position).magnitude;
			local l__magnitude__284 = (l__LocalPlayer__1.Character.Torso.Position - l__DecisionParts__281.Left1.Position).magnitude;
			if l__magnitude__284 < l__magnitude__283 then
				print("Left");
				if l__magnitude__284 < (l__LocalPlayer__1.Character.Torso.Position - l__DecisionParts__281.Left3.Position).magnitude then
					if (l__Torso__242.Position - l__DecisionParts__281.Left1.Position).magnitude < (l__Torso__242.Position - l__DecisionParts__281.Left3.Position).magnitude then
						print("Same");
					else
						print("Diff");
						v282 = l__DecisionParts__281.Left2.Position;
					end;
					print("Center");
				else
					if (l__Torso__242.Position - l__DecisionParts__281.Left1.Position).magnitude < (l__Torso__242.Position - l__DecisionParts__281.Left3.Position).magnitude then
						print("Diff");
						v282 = l__DecisionParts__281.Left2.Position;
					else
						print("Same");
					end;
					print("Outside");
				end;
			else
				print("Right");
				if l__magnitude__283 < (l__LocalPlayer__1.Character.Torso.Position - l__DecisionParts__281.Right3.Position).magnitude then
					if (l__Torso__242.Position - l__DecisionParts__281.Right1.Position).magnitude < (l__Torso__242.Position - l__DecisionParts__281.Right3.Position).magnitude then
						print("Same");
					else
						print("Diff");
						v282 = l__DecisionParts__281.Right2.Position;
					end;
					print("Center");
				else
					if (l__Torso__242.Position - l__DecisionParts__281.Right1.Position).magnitude < (l__Torso__242.Position - l__DecisionParts__281.Right3.Position).magnitude then
						print("Diff");
						v282 = l__DecisionParts__281.Right2.Position;
					else
						print("Same");
					end;
					print("Outside");
				end;
			end;
			followEnemy(v282);
			if l__Humanoid__241.Health < 101 then
				u32 = true;
				p43.Sight1:Destroy();
				p43.Sight2:Destroy();
				if game.Lighting.Brightness ~= 0 then
					game.Lighting.Brightness = 0;
					game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0);
					print("Lights Off");
				end;
				local v285 = Instance.new("Explosion");
				v285.Position = l__Torso__242.Position;
				v285.BlastPressure = 0;
				v285.BlastRadius = 12;
				v285.Parent = l__CurrentCamera__2;
				l__Debris__5:AddItem(v285, 1);
				if script.Parent:FindFirstChild("SoundScript") then
					local v286 = Instance.new("StringValue");
					v286.Name = "Sound";
					v286.Value = "RoboticExplosion";
					local v287 = Instance.new("ObjectValue");
					v287.Name = "Location";
					v287.Value = l__Head__33;
					v287.Parent = v286;
					v286.Parent = script.Parent.SoundScript.Effects;
				end;
			elseif l__Humanoid__241.Health < 501 then
				if not u34 then
					u34 = true;
					local v288 = Instance.new("Explosion");
					v288.Position = l__Head__33.Position;
					v288.BlastPressure = 0;
					v288.BlastRadius = 12;
					v288.Parent = l__CurrentCamera__2;
					l__Debris__5:AddItem(v288, 1);
					local v289 = Instance.new("Fire");
					v289.Size = 10;
					v289.Parent = l__Torso__242;
					if script.Parent:FindFirstChild("SoundScript") then
						local v290 = Instance.new("StringValue");
						v290.Name = "Sound";
						v290.Value = "RoboticExplosion";
						local v291 = Instance.new("ObjectValue");
						v291.Name = "Location";
						v291.Value = l__Head__33;
						v291.Parent = v290;
						v290.Parent = script.Parent.SoundScript.Effects;
					end;
				elseif l__Humanoid__241.Health < 1001 then
					if not u35 then
						u35 = Instance.new("Smoke");
						u35.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
						u35.Opacity = 0.2;
						u35.Size = 0.2;
						u35.Parent = p43["Right Arm"];
						local v292 = Instance.new("Explosion");
						v292.Position = l__Torso__242.Position;
						v292.BlastPressure = 0;
						v292.BlastRadius = 8;
						v292.Parent = l__CurrentCamera__2;
						l__Debris__5:AddItem(v292, 1);
						if script.Parent:FindFirstChild("SoundScript") then
							local v293 = Instance.new("StringValue");
							v293.Name = "Sound";
							v293.Value = "RoboticExplosion";
							local v294 = Instance.new("ObjectValue");
							v294.Name = "Location";
							v294.Value = l__Torso__242;
							v294.Parent = v293;
							v293.Parent = script.Parent.SoundScript.Effects;
						end;
					end;
				elseif l__Humanoid__241.Health < 1251 then
					if not u36 then
						u36 = Instance.new("Smoke");
						u36.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
						u36.Opacity = 0.2;
						u36.Size = 0.2;
						u36.Parent = p43["Left Arm"];
						local v295 = Instance.new("Explosion");
						v295.Position = l__Torso__242.Position;
						v295.BlastPressure = 0;
						v295.BlastRadius = 8;
						v295.Parent = l__CurrentCamera__2;
						l__Debris__5:AddItem(v295, 1);
						if script.Parent:FindFirstChild("SoundScript") then
							local v296 = Instance.new("StringValue");
							v296.Name = "Sound";
							v296.Value = "RoboticExplosion";
							local v297 = Instance.new("ObjectValue");
							v297.Name = "Location";
							v297.Value = l__Torso__242;
							v297.Parent = v296;
							v296.Parent = script.Parent.SoundScript.Effects;
						end;
					end;
				end;
			elseif l__Humanoid__241.Health < 1001 then
				if not u35 then
					u35 = Instance.new("Smoke");
					u35.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
					u35.Opacity = 0.2;
					u35.Size = 0.2;
					u35.Parent = p43["Right Arm"];
					v292 = Instance.new("Explosion");
					v292.Position = l__Torso__242.Position;
					v292.BlastPressure = 0;
					v292.BlastRadius = 8;
					v292.Parent = l__CurrentCamera__2;
					l__Debris__5:AddItem(v292, 1);
					if script.Parent:FindFirstChild("SoundScript") then
						v293 = Instance.new("StringValue");
						v293.Name = "Sound";
						v293.Value = "RoboticExplosion";
						v294 = Instance.new("ObjectValue");
						v294.Name = "Location";
						v294.Value = l__Torso__242;
						v294.Parent = v293;
						v293.Parent = script.Parent.SoundScript.Effects;
					end;
				end;
			elseif l__Humanoid__241.Health < 1251 then
				if not u36 then
					u36 = Instance.new("Smoke");
					u36.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
					u36.Opacity = 0.2;
					u36.Size = 0.2;
					u36.Parent = p43["Left Arm"];
					v295 = Instance.new("Explosion");
					v295.Position = l__Torso__242.Position;
					v295.BlastPressure = 0;
					v295.BlastRadius = 8;
					v295.Parent = l__CurrentCamera__2;
					l__Debris__5:AddItem(v295, 1);
					if script.Parent:FindFirstChild("SoundScript") then
						v296 = Instance.new("StringValue");
						v296.Name = "Sound";
						v296.Value = "RoboticExplosion";
						v297 = Instance.new("ObjectValue");
						v297.Name = "Location";
						v297.Value = l__Torso__242;
						v297.Parent = v296;
						v296.Parent = script.Parent.SoundScript.Effects;
					end;
				end;
			end;
			local v298, v299, v300 = l__Torso__242.CFrame:toEulerAnglesXYZ();
			v280 = math.deg(v299 + math.pi / 2);
			if 0 < l__Torso__242.CFrame.lookVector.Z then
				local v301 = v280 + 180;
			else
				v301 = 180 - v280;
			end;
			l__Stats__28.RadarRotation.Value = math.ceil(v301 + 180);
		end;
	end;
	local l__Y__37 = l__Torso__242.Position.Y;
	local u38 = 0;
	local function u39(p60)
		if (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude < 8 then
			l__Torso__242.BodyPosition.position = l__Torso__242.Position - l__Torso__242.CFrame.lookVector * p60 * 300;
		elseif 10 < (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude then
			l__Torso__242.BodyPosition.position = l__Torso__242.Position + l__Torso__242.CFrame.lookVector * p60 * 300;
		else
			l__Torso__242.BodyPosition.position = l__Torso__242.Position;
		end;
		l__Torso__242.BodyPosition.position = Vector3.new(l__Torso__242.BodyPosition.position.x, l__Y__37 - u38 / 20, l__Torso__242.BodyPosition.position.z);
		u38 = u38 + 1;
		if 40 < u38 then
			u38 = 0;
		end;
	end;
	local u40 = 0;
	local u41 = 0;
	local u42 = true;
	local u43 = 0;
	local u44 = false;
	local u45 = 0;
	local function v302(p61)
		l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new((p43.Humanoid.Health - 100) / (p43.Humanoid.MaxHealth - 100), 0, 1, 0);
		if l__LocalPlayer__1.Character then
			if l__LocalPlayer__1.Character:findFirstChild("Torso") then
				if l__Humanoid__241.Health < 1 then
					return;
				end;
			else
				return;
			end;
		else
			return;
		end;
		if not u32 then
			u39(p61);
		end;
		if l__Stats__28.Ammo.Value < 1 then
			if u40 < 0.01 then
				recolorMainParts("Bright red");
			end;
			u40 = u40 + p61;
			if not (8 < u40) then
				if u34 then
					if 4 < u40 then
						recolorMainParts("Really black");
						l__Stats__28.Ammo.Value = 20;
						u40 = 0;
					end;
				end;
			else
				recolorMainParts("Really black");
				l__Stats__28.Ammo.Value = 20;
				u40 = 0;
			end;
		end;
		if not u32 then
			if (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude < p43.Sight2.Mesh.Scale.X / 2 then
				if game.Lighting.Brightness ~= 0 then
					game.Lighting.Brightness = 0;
					game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0);
					print("Lights Off");
				end;
			elseif game.Lighting.Brightness ~= 1 then
				game.Lighting.Brightness = 1;
				game.Lighting.OutdoorAmbient = Color3.new(0.4980392156862745, 0.4980392156862745, 0.4980392156862745);
				print("Lights On");
			end;
			u41 = u41 + p61;
			if 2.4 < u41 then
				if u42 then
					p43.Sight1.Mesh.Scale = p43.Sight1.Mesh.Scale + Vector3.new(1, 1, 1) * 4;
					p43.Sight2.Mesh.Scale = p43.Sight2.Mesh.Scale - Vector3.new(1, 1, 1) * 4;
					if p43.Sight2.Mesh.Scale.X < 1 then
						u41 = 0;
						u42 = false;
					end;
				else
					p43.Sight1.Mesh.Scale = p43.Sight1.Mesh.Scale - Vector3.new(1, 1, 1) * 8;
					p43.Sight2.Mesh.Scale = p43.Sight2.Mesh.Scale + Vector3.new(1, 1, 1) * 8;
					if 1000 < p43.Sight2.Mesh.Scale.X then
						u41 = 0;
						u42 = true;
					end;
				end;
			end;
		end;
		if u36 then
			u43 = u43 + p61;
			if not u44 then
				if u32 then
					if p43.Sight3.Mesh.Scale.X < 6 then
						p43.Sight3.Mesh.Scale = p43.Sight3.Mesh.Scale + Vector3.new(0.1, 0.1, 0.1);
					else
						u43 = 20;
					end;
					if (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude < p43.Sight3.Mesh.Scale.X * 2.2 then
						if not u32 then
							normalDamage(l__LocalPlayer__1.Character.Torso, 10);
						end;
						u43 = 20;
					end;
					if 2 < u43 then
						u44 = false;
						u43 = 0;
					end;
				else
					if 0.1 < p43.Sight3.Mesh.Scale.X then
						p43.Sight3.Mesh.Scale = p43.Sight3.Mesh.Scale - Vector3.new(0.1, 0.1, 0.1);
					end;
					if 4 < u43 then
						u44 = true;
						u43 = 0;
					end;
				end;
			else
				if p43.Sight3.Mesh.Scale.X < 6 then
					p43.Sight3.Mesh.Scale = p43.Sight3.Mesh.Scale + Vector3.new(0.1, 0.1, 0.1);
				else
					u43 = 20;
				end;
				if (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude < p43.Sight3.Mesh.Scale.X * 2.2 then
					if not u32 then
						normalDamage(l__LocalPlayer__1.Character.Torso, 10);
					end;
					u43 = 20;
				end;
				if 2 < u43 then
					u44 = false;
					u43 = 0;
				end;
			end;
		end;
		if l__Stats__28.Agressive.Value then
			if not u27 then
				if 0 < l__Stats__28.Ammo.Value then
					if not u32 then
						if (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude <= 40 then
							if 85 < u45 then
								coroutine.resume(coroutine.create(function()
									if math.random(1, 2) == 1 then
										onFireNormal(p43.RightJoint);
										return;
									end;
									onFireNormal(p43.LeftJoint);
								end));
							else
								u45 = u45 + 5;
							end;
						elseif 0 < u45 then
							if not (l__Stats__28.Ammo.Value < 1) then
								if 40 < (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude then
									u45 = u45 - 5;
								end;
							else
								u45 = u45 - 5;
							end;
						end;
					elseif 0 < u45 then
						if not (l__Stats__28.Ammo.Value < 1) then
							if 40 < (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude then
								u45 = u45 - 5;
							end;
						else
							u45 = u45 - 5;
						end;
					end;
				elseif 0 < u45 then
					if not (l__Stats__28.Ammo.Value < 1) then
						if 40 < (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude then
							u45 = u45 - 5;
						end;
					else
						u45 = u45 - 5;
					end;
				end;
			elseif 0 < u45 then
				if not (l__Stats__28.Ammo.Value < 1) then
					if 40 < (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude then
						u45 = u45 - 5;
					end;
				else
					u45 = u45 - 5;
				end;
			end;
		elseif 0 < u45 then
			if not (l__Stats__28.Ammo.Value < 1) then
				if 40 < (l__LocalPlayer__1.Character.Torso.Position - l__Torso__242.Position).magnitude then
					u45 = u45 - 5;
				end;
			else
				u45 = u45 - 5;
			end;
		end;
		p43.LeftJoint.Arm.C0 = p43.LeftJoint.Weld.C0 * CFrame.Angles(0, 0, -math.rad(u45)) + Vector3.new(0, u45 / 180, -u45 / 180);
		p43.RightJoint.Arm.C0 = p43.RightJoint.Weld.C0 * CFrame.Angles(0, 0, -math.rad(u45)) + Vector3.new(0, u45 / 180, -u45 / 180);
	end;
	while true do
		if p43 then

		else
			break;
		end;
		if p43.Parent then

		else
			break;
		end;
		local v303, v304 = wait();
		if p43 then

		else
			break;
		end;
		if p43.Parent then

		else
			break;
		end;
		if script.Parent:findFirstChild("LocalScript") then
			if script.Parent.LocalScript:findFirstChild("LocalPause") then
				if script.Parent.LocalScript.LocalPause.Value then
					if l__CurrentCamera__2.CameraType ~= "Scriptable" then
						if u32 then
							runBot(v304);
							v302(v303);
							local v305 = 1 - 1;
							while true do
								wait();
								if p43 then

								else
									break;
								end;
								if p43.Parent then

								else
									break;
								end;
								v302(v303);
								if 0 <= 1 then
									if v305 < 3 then

									else
										break;
									end;
								elseif 3 < v305 then

								else
									break;
								end;
								v305 = v305 + 1;							
							end;
						end;
					else
						runBot(v304);
						v302(v303);
						v305 = 1 - 1;
						while true do
							wait();
							if p43 then

							else
								break;
							end;
							if p43.Parent then

							else
								break;
							end;
							v302(v303);
							if 0 <= 1 then
								if v305 < 3 then

								else
									break;
								end;
							elseif 3 < v305 then

							else
								break;
							end;
							v305 = v305 + 1;						
						end;
					end;
				else
					runBot(v304);
					v302(v303);
					v305 = 1 - 1;
					while true do
						wait();
						if p43 then

						else
							break;
						end;
						if p43.Parent then

						else
							break;
						end;
						v302(v303);
						if 0 <= 1 then
							if v305 < 3 then

							else
								break;
							end;
						elseif 3 < v305 then

						else
							break;
						end;
						v305 = v305 + 1;					
					end;
				end;
			else
				runBot(v304);
			end;
		else
			runBot(v304);
		end;	
	end;
end;
function readyChoices(p62)
	game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1012890";
	game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1012891";
	game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1012887";
	game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889";
	game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1012888";
	game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1014449";
	local v306 = l__Level__5.Map5Task.ChoiceBoxes:GetChildren();
	local v307 = #v306;
	local v308 = 0;
	while true do
		if v306[v308] then
			if v306[v308].Parent then
				if v306[v308]:findFirstChild("Picture") then
					v306[v308].Picture.Decal.Transparency = 0;
					v306[v308].Picture.Name = "Head";
				end;
			end;
		end;
		if 0 <= 1 then
			if v308 < v307 then

			else
				break;
			end;
		elseif v307 < v308 then

		else
			break;
		end;
		v308 = v308 + 1;	
	end;
	l__Level__5.Objectives["Commander Choice"].Part.Name = "Torso";
	l__Level__5.Objectives["Tamid Choice"].Part.Name = "Torso";
	l__Level__5.Objectives["Royal Choice"].Part.Name = "Torso";
	l__Level__5.Objectives["Hubris Choice"].Part.Name = "Torso";
	p62.CFrame = CFrame.new(188, 41.4, 125) * CFrame.Angles(0, -1.5707963267948966, 0);
	game.Lighting.FogEnd = 10000;
end;
function overseerBattle(p63)
	local v309 = l__Level__5.Map5Task.ChoiceBoxes:GetChildren();
	local l__Cutscene__310 = script.Parent.Cutscene;
	local l__Background__311 = l__Parent__1.Interface.Background;
	local v312 = nil;
	
	local choiceSelect = false
	
	while true do
		RunService.Heartbeat:Wait()
		
		if l__Parent__1.StoryScript.Current.Value then
			if l__Parent__1.StoryScript.Current.Value.Value == "Dr. Umar Tamid Choice" then
				v312 = "Dr. Umar Tamid Choice"
			end;
			if l__Parent__1.StoryScript.Current.Value.Value == "Quinton Royal Choice" then
				v312 = "Quinton Royal Choice"
			end;
			if l__Parent__1.StoryScript.Current.Value.Value == "The Commander Choice" then
				v312 = "The Commander Choice"
			end;
			if l__Parent__1.StoryScript.Current.Value.Value == "Uncle Hubris Choice" then
				v312 = "Uncle Hubris Choice"
			end;
		end;	
		
		if l__Parent__1.StoryScript.Choice.Value == 2 and v312 then
			break
		end 
	end;
	
	l__Level__5.Objectives["Commander Choice"]:Destroy();
	l__Level__5.Objectives["Tamid Choice"]:Destroy();
	l__Level__5.Objectives["Royal Choice"]:Destroy();
	l__Level__5.Objectives["Hubris Choice"]:Destroy();
	local v313 = #v309;
	local v314 = 1;
	while true do
		if v309[v314] then
			if v309[v314].Parent then
				if v309[v314]:findFirstChild("Head") then
					v309[v314].Head.Decal.Transparency = 1;
					v309[v314].Head.Name = "Picture";
				end;
			end;
		end;
		if 0 <= 1 then
			if v314 < v313 then

			else
				break;
			end;
		elseif v313 < v314 then

		else
			break;
		end;
		v314 = v314 + 1;	
	end;
	if v312 == "Dr. Umar Tamid Choice" then
		l__Stats__4.VillainChoice.Value = "Tamid";
		l__Level__5.Map5Task.TheVillain.Tamid.Name = "Dialogue";
	elseif v312 == "Quinton Royal Choice" then
		l__Stats__4.VillainChoice.Value = "Royal";
		l__Level__5.Map5Task.TheVillain.Royal.Name = "Dialogue";
	elseif v312 == "The Commander Choice" then
		l__Stats__4.VillainChoice.Value = "Commander";
		l__Level__5.Map5Task.TheVillain.Commander.Name = "Dialogue";
	elseif v312 == "Uncle Hubris Choice" then
		l__Stats__4.VillainChoice.Value = "Hubris";
		l__Level__5.Map5Task.TheVillain.Hubris.Name = "Dialogue";
	end;
	if not l__Level__5.Parent:findFirstChild("Map") then
		return;
	end;
	local u46 = nil;
	local u47 = nil;
	script.Parent.LocalScript.LocalPause.Value = true;
	local v315 = 1 - 1;
	while true do
		wait();
		l__Background__311.BackgroundTransparency = 1 - v315 / 20;
		if 0 <= 1 then
			if v315 < 20 then

			else
				break;
			end;
		elseif 20 < v315 then

		else
			break;
		end;
		v315 = v315 + 1;	
	end;
	handleGUIs(false);
	if l__Parent__1.TouchedInfo.Visible then
		l__Parent__1.TouchedInfo.Visible = false;
	end;
	if l__Parent__1.AmmoInfo.Visible then
		l__Parent__1.AmmoInfo.Visible = false;
	end;
	l__CurrentCamera__2.CameraSubject = nil;
	l__CurrentCamera__2.CameraType = "Scriptable";
	local l__CutsceneData__316 = l__Level__5.Map5Task.TheVillain.CutsceneData;
	local v317 = l__CutsceneData__316:GetChildren();
	l__CurrentCamera__2.CoordinateFrame = l__CutsceneData__316["1"].c1.Value;
	l__CurrentCamera__2.Focus = l__CutsceneData__316["1"].f1.Value;
	l__CurrentCamera__2.FieldOfView = l__CutsceneData__316["1"].FOV.Value;
	l__CurrentCamera__2:SetRoll(l__CutsceneData__316["1"].Roll.Value);
	--p63.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
	
	local v318 = 1 - 1;
	while true do
		l__Cutscene__310.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v318, 0);
		l__Cutscene__310.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v318, 0);
		l__Background__311.BackgroundTransparency = 0 + v318 / 20;
		wait();
		if 0 <= 1 then
			if v318 < 20 then

			else
				break;
			end;
		elseif 20 < v318 then

		else
			break;
		end;
		v318 = v318 + 1;	
	end;
	l__Level__5.Parent.Map.Drones:Destroy();
	(function(p64, p65)
		local v319 = 1 - 1;
		while true do
			if not l__Level__5.Parent:findFirstChild("Map") then
				return;
			end;
			local v320 = l__GameItems__3.MasterModels.Drone:clone();
			v320.Parent = l__Level__5.Parent.Map;
			v320:MakeJoints();
			if v319 == 1 then
				v320.Torso.CFrame = CFrame.new(p64) * CFrame.Angles(0, 1.5707963267948966, 0);
			else
				v320.Torso.CFrame = CFrame.new(p65) * CFrame.Angles(0, 1.5707963267948966, 0);
			end;
			v320.Stats.WaitTime.Value = 0;
			v320.Stats.Speed.Value = 0;
			v320.Stats.Health.Value = 80;
			v320.Stats.OffsetMaxX.Value = 1000;
			v320.Stats.OffsetMaxZ.Value = 1000;
			v320.Stats.OffsetMinX.Value = -1000;
			v320.Stats.OffsetMinZ.Value = -1000;
			local v321 = v320.MainControlNPC:clone();
			v321.Name = "MapScript";
			v321.Parent = script.Parent;
			local v322 = Instance.new("ObjectValue");
			v322.Name = "LinkedModel";
			v322.Value = v320;
			v322.Parent = v321;
			v321.Disabled = false;
			if v319 == 1 then
				u46 = v320;
			else
				u47 = v320;
			end;
			if 0 <= 1 then
				if v319 < 2 then

				else
					break;
				end;
			elseif 2 < v319 then

			else
				break;
			end;
			v319 = v319 + 1;		
		end;
	end)(Vector3.new(193.6, 41.4, 120.6), (Vector3.new(193.6, 41.4, 129.4)));
	l__Level__5.Parent.Map["The Overseer"]:Destroy();
	local v323 = l__GameItems__3.MasterModels.Overseer:clone();
	v323.Parent = l__Level__5.Parent.Map;
	v323:MakeJoints();
	v323.Humanoid.MaxHealth = v323.Stats.Health.Value;
	v323.Humanoid.Health = v323.Humanoid.MaxHealth;
	(function(p66)
		l__Parent__1.StoryScript.Current.Value = p66;
		while true do
			wait(0.09);
			if l__Parent__1.StoryScript.Busy.Value then

			else
				break;
			end;		
		end;
	end)(l__Level__5.Map5Task.TheVillain.Dialogue);
	local v324 = 1 - 1;
	while true do
		l__Level__5.Map5Task.Gate.CFrame = l__Level__5.Map5Task.Gate.CFrame + Vector3.new(0, -0.5, 0);
		wait();
		if 0 <= 1 then
			if v324 < 16 then

			else
				break;
			end;
		elseif 16 < v324 then

		else
			break;
		end;
		v324 = v324 + 1;	
	end;
	wait(0.3);
	p63.CFrame = p63.CFrame;
	wait(0.06);
	script.Parent.LocalScript.LocalPause.Value = false;
	l__CurrentCamera__2.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
	l__CurrentCamera__2.CameraType = "Custom";
	l__CurrentCamera__2.FieldOfView = 70;
	handleGUIs(true);
	local v325 = 1 - 1;
	while true do
		l__Cutscene__310.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v325, 0);
		l__Cutscene__310.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v325, 0);
		wait();
		if 0 <= 1 then
			if v325 < 20 then

			else
				break;
			end;
		elseif 20 < v325 then

		else
			break;
		end;
		v325 = v325 + 1;	
	end;
	l__Level__5.NPC.Convo3:Destroy();
	if not l__Level__5.Parent:findFirstChild("Map") then
		return;
	end;
	if u46 then
		if u46.Parent then
			if u46:findFirstChild("Humanoid") then
				u46.Stats.Speed.Value = 16;
				local v326 = Instance.new("ObjectValue");
				v326.Value = l__LocalPlayer__1;
				v326.Name = "creator";
				local v327 = Instance.new("StringValue");
				v327.Value = "None";
				v327.Parent = v326;
				v326.Parent = u46.Humanoid;
				l__Debris__5:AddItem(v326, 10);
			end;
		end;
	end;
	if u47 then
		if u47.Parent then
			if u47:findFirstChild("Humanoid") then
				u47.Stats.Speed.Value = 16;
				local v328 = Instance.new("ObjectValue");
				v328.Value = l__LocalPlayer__1;
				v328.Name = "creator";
				local v329 = Instance.new("StringValue");
				v329.Value = "None";
				v329.Parent = v328;
				v328.Parent = u47.Humanoid;
				l__Debris__5:AddItem(v328, 10);
			end;
		end;
	end;
	l__Parent__1.Interface.Info.BossHealth.Visible = true;
	l__Parent__1.Interface.Info.BossHealth.HealthText.Text = "Overseer Health";
	coroutine.resume(coroutine.create(function()
		runOverseer(v323);
	end));
	while true do
		wait(0.9);
		if not (v323.Humanoid.Health < 1001) then

		else
			break;
		end;	
	end;
	coroutine.resume(coroutine.create(function()
		local v330 = l__Level__5.Parent.Map.OverseerStage.UncleHubris:GetChildren();
		coroutine.resume(coroutine.create(function()
			l__Parent__1.Interface.Info.AWin4rIzU.Text = "WARNING: TOXIC LIQUID LEVELS RISING!";
			l__Parent__1.Interface.Info.AWin4rIzU.Visible = true;
			wait(3);
			l__Parent__1.Interface.Info.AWin4rIzU.Visible = false;
			l__Parent__1.Interface.Info.AWin4rIzU.Text = "";
		end));
		local v331 = 1 - 1;
		while true do
			l__Level__5.Parent.Map.Poison.CFrame = l__Level__5.Parent.Map.Poison.CFrame + Vector3.new(0, 0.02, 0);
			l__Level__5.Parent.Map.DeathParts.PoisonUndertones.CFrame = l__Level__5.Parent.Map.DeathParts.PoisonUndertones.CFrame + Vector3.new(0, 0.02, 0);
			wait();
			local v332 = #v330;
			local v333 = 1;
			while true do
				if v330[v333].Name == "6" then
					if v331 % 80 < 20 then
						if 0 <= v331 % 80 then
							v330[v333].SurfaceGui.Text.Text = "TO";
						else
							v330[v333].SurfaceGui.Text.Text = "";
						end;
					else
						v330[v333].SurfaceGui.Text.Text = "";
					end;
				elseif v330[v333].Name == "7" then
					if v331 % 80 < 20 then
						if 0 <= v331 % 80 then
							v330[v333].SurfaceGui.Text.Text = "XIC";
						else
							v330[v333].SurfaceGui.Text.Text = "";
						end;
					else
						v330[v333].SurfaceGui.Text.Text = "";
					end;
				elseif v330[v333].Name == "9" then
					if v331 % 80 < 40 then
						if 20 <= v331 % 80 then
							v330[v333].SurfaceGui.Text.Text = "LIQ";
						else
							v330[v333].SurfaceGui.Text.Text = "";
						end;
					else
						v330[v333].SurfaceGui.Text.Text = "";
					end;
				elseif v330[v333].Name == "10" then
					if v331 % 80 < 40 then
						if 20 <= v331 % 80 then
							v330[v333].SurfaceGui.Text.Text = "UID";
						else
							v330[v333].SurfaceGui.Text.Text = "";
						end;
					else
						v330[v333].SurfaceGui.Text.Text = "";
					end;
				elseif v330[v333].Name == "14" then
					if v331 % 80 < 60 then
						if 40 <= v331 % 80 then
							v330[v333].SurfaceGui.Text.Text = "LEV";
						else
							v330[v333].SurfaceGui.Text.Text = "";
						end;
					else
						v330[v333].SurfaceGui.Text.Text = "";
					end;
				elseif v330[v333].Name == "15" then
					if v331 % 80 < 60 then
						if 40 <= v331 % 80 then
							v330[v333].SurfaceGui.Text.Text = "ELS";
						else
							v330[v333].SurfaceGui.Text.Text = "";
						end;
					else
						v330[v333].SurfaceGui.Text.Text = "";
					end;
				elseif v330[v333].Name == "17" then
					if v331 % 80 < 80 then
						if 60 <= v331 % 80 then
							v330[v333].SurfaceGui.Text.Text = "RIS";
						else
							v330[v333].SurfaceGui.Text.Text = "";
						end;
					else
						v330[v333].SurfaceGui.Text.Text = "";
					end;
				elseif v330[v333].Name == "18" then
					if v331 % 80 < 80 then
						if 60 <= v331 % 80 then
							v330[v333].SurfaceGui.Text.Text = "ING";
						else
							v330[v333].SurfaceGui.Text.Text = "";
						end;
					else
						v330[v333].SurfaceGui.Text.Text = "";
					end;
				elseif v330[v333]:findFirstChild("SurfaceGui") then
					if v331 % 10 < 5 then
						v330[v333].SurfaceGui.Text.Text = "!";
					else
						v330[v333].SurfaceGui.Text.Text = "?";
					end;
				end;
				if 0 <= 1 then
					if v333 < v332 then

					else
						break;
					end;
				elseif v332 < v333 then

				else
					break;
				end;
				v333 = v333 + 1;			
			end;
			if 0 <= 1 then
				if v331 < 700 then

				else
					break;
				end;
			elseif 700 < v331 then

			else
				break;
			end;
			v331 = v331 + 1;		
		end;
		local v334 = #v330;
		local v335 = 1;
		while true do
			if v330[v335]:findFirstChild("SurfaceGui") then
				if v330[v335].Name == "25" then
					v330[v335].Velocity = Vector3.new(20, 0, 0);
				end;
				v330[v335].SurfaceGui.Text.Text = "";
			end;
			if 0 <= 1 then
				if v335 < v334 then

				else
					break;
				end;
			elseif v334 < v335 then

			else
				break;
			end;
			v335 = v335 + 1;		
		end;
	end));
	local v336 = l__Level__5.Parent.Map.OverseerStage.MovingParts:GetChildren();
	local v337 = 1 - 1;
	while true do
		local v338 = #v336;
		local v339 = 1;
		while true do
			local v340 = v336[v339]:GetChildren();
			local v341 = #v340;
			local v342 = 1 - 1;
			while true do
				if v340[v342] then
					if v340[v342].Parent then
						if v340[v342]:IsA("Part") then
							if v340[v342].Parent.Name == "Right" then
								v340[v342].CFrame = v340[v342].CFrame - Vector3.new(0, 0, 0.1);
							else
								v340[v342].CFrame = v340[v342].CFrame + Vector3.new(0, 0, 0.1);
							end;
						end;
					end;
				end;
				if 0 <= 1 then
					if v342 < v341 then

					else
						break;
					end;
				elseif v341 < v342 then

				else
					break;
				end;
				v342 = v342 + 1;			
			end;
			if 0 <= 1 then
				if v339 < v338 then

				else
					break;
				end;
			elseif v338 < v339 then

			else
				break;
			end;
			v339 = v339 + 1;		
		end;
		wait();
		if 0 <= 1 then
			if v337 < 320 then

			else
				break;
			end;
		elseif 320 < v337 then

		else
			break;
		end;
		v337 = v337 + 1;	
	end;
	local v343 = 1 - 1;
	while true do
		l__Level__5.Parent.Map.OverseerStage.MovingParts.Left.Center1.CFrame = l__Level__5.Parent.Map.OverseerStage.MovingParts.Left.Center1.CFrame + Vector3.new(0.1, 0, 0);
		l__Level__5.Parent.Map.OverseerStage.MovingParts.Right.Center1.CFrame = l__Level__5.Parent.Map.OverseerStage.MovingParts.Right.Center1.CFrame + Vector3.new(0.1, 0, 0);
		l__Level__5.Parent.Map.OverseerStage.MovingParts.Left.Center2.CFrame = l__Level__5.Parent.Map.OverseerStage.MovingParts.Left.Center2.CFrame - Vector3.new(0.1, 0, 0);
		l__Level__5.Parent.Map.OverseerStage.MovingParts.Right.Center2.CFrame = l__Level__5.Parent.Map.OverseerStage.MovingParts.Right.Center2.CFrame - Vector3.new(0.1, 0, 0);
		wait();
		if 0 <= 1 then
			if v343 < 80 then

			else
				break;
			end;
		elseif 80 < v343 then

		else
			break;
		end;
		v343 = v343 + 1;	
	end;
	while true do
		wait(0.9);
		if not (v323.Humanoid.Health < 101) then

		else
			break;
		end;	
	end;
	l__Parent__1.Interface.Info.BossHealth.Visible = false;
	coroutine.resume(coroutine.create(function()
		local function v344()
			local v345 = Instance.new("Explosion");
			v345.Position = v323.Torso.Position;
			v345.BlastPressure = 0;
			v345.BlastRadius = 8;
			v345.Parent = l__CurrentCamera__2;
			l__Debris__5:AddItem(v345, 3);
			if script.Parent:FindFirstChild("SoundScript") then
				local v346 = Instance.new("StringValue");
				v346.Name = "Sound";
				v346.Value = "RoboticExplosion";
				local v347 = Instance.new("ObjectValue");
				v347.Name = "Location";
				v347.Value = v323.Torso;
				v347.Parent = v346;
				v346.Parent = script.Parent.SoundScript.Effects;
			end;
		end;
		v323.Sight3.Mesh.Scale = Vector3.new(4.02, 4.02, 4.02);
		v323.Torso.BodyPosition.D = 400;
		v323.Torso.BodyPosition.position = Vector3.new(162, 45, 165);
		v323.Torso.CFrame = CFrame.new(162, 45, 165);
		v344();
		local v348 = 1 - 1;
		while true do
			v323.Torso.BodyPosition.position = Vector3.new(162 + v348, 45, 165 - v348);
			if v348 == 40 then
				v344();
			end;
			wait();
			if 0 <= 1 then
				if v348 < 40 then

				else
					break;
				end;
			elseif 40 < v348 then

			else
				break;
			end;
			v348 = v348 + 1;		
		end;
		v323.Humanoid.Health = 0;
		local v349 = l__Level__5.Parent.Map.OverseerStage.UncleHubris:GetChildren();
		local v350 = #v349;
		local v351 = 1 - 1;
		while true do
			if v349[v351] then
				if v349[v351].Parent then
					if v349[v351]:IsA("Part") then
						v349[v351].Anchored = false;
					end;
				end;
			end;
			if 0 <= 1 then
				if v351 < v350 then

				else
					break;
				end;
			elseif v350 < v351 then

			else
				break;
			end;
			v351 = v351 + 1;		
		end;
	end));
	script.Parent.LocalScript.LocalPause.Value = true;
	l__Level__5.Parent.Map.OverseerStage.FightInvisibles:Destroy();
	handleGUIs(false);
	l__CurrentCamera__2.CameraSubject = nil;
	l__CurrentCamera__2.CameraType = "Scriptable";
	local l__CutsceneData2__352 = l__Level__5.Map5Task.TheVillain.CutsceneData2;
	local v353 = l__CutsceneData2__352:GetChildren();
	l__CurrentCamera__2.CoordinateFrame = l__CutsceneData2__352["1"].c1.Value;
	l__CurrentCamera__2.Focus = l__CutsceneData2__352["1"].f1.Value;
	l__CurrentCamera__2.FieldOfView = l__CutsceneData2__352["1"].FOV.Value;
	l__CurrentCamera__2:SetRoll(l__CutsceneData2__352["1"].Roll.Value);
	p63.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
	local v354 = 1 - 1;
	while true do
		l__Cutscene__310.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v354, 0);
		l__Cutscene__310.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v354, 0);
		wait();
		if 0 <= 1 then
			if v354 < 20 then

			else
				break;
			end;
		elseif 20 < v354 then

		else
			break;
		end;
		v354 = v354 + 1;	
	end;
	local v355 = #v353;
	local v356 = 2 - 1;
	while true do
		local v357 = l__CutsceneData2__352[tostring(v356)];
		tweenCam(v357.c1.Value, v357.f1.Value, v357.step.Value, v357.FOV.Value, v357.Roll.Value, v357.Style.Value);
		if 0 <= 1 then
			if v356 < v355 then

			else
				break;
			end;
		elseif v355 < v356 then

		else
			break;
		end;
		v356 = v356 + 1;	
	end;
	l__Level__5.Map5Task.TheVillain:Destroy();
	p63.CFrame = CFrame.new(188, 41.4, 125) * CFrame.Angles(0, -1.5707963267948966, 0);
	wait(0.06);
	script.Parent.LocalScript.LocalPause.Value = false;
	l__CurrentCamera__2.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
	l__CurrentCamera__2.CameraType = "Custom";
	l__CurrentCamera__2.FieldOfView = 70;
	handleGUIs(true);
	local v358 = 1 - 1;
	while true do
		l__Cutscene__310.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v358, 0);
		l__Cutscene__310.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v358, 0);
		wait();
		if 0 <= 1 then
			if v358 < 20 then

			else
				break;
			end;
		elseif 20 < v358 then

		else
			break;
		end;
		v358 = v358 + 1;	
	end;
	game.Lighting.OutdoorAmbient = Color3.new(0.4980392156862745, 0.4980392156862745, 0.4980392156862745);
end;
l__Level__5.Map5Task.Trigger.Touched:connect(function(p67)
	if p67 and p67.Parent and p67.Name == "Torso" and script.Parent:findFirstChild("LocalScript") then
		l__Level__5.Map5Task.Trigger:Destroy();
		local l__Cutscene__359 = script.Parent.Cutscene;
		script.Parent.LocalScript.LocalPause.Value = true;
		local l__Background__360 = l__Parent__1.Interface.Background;
		game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1012890";
		game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1012891";
		game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1012887";
		game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889";
		game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1012888";
		game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1014449";
		for v361 = 1, 20 do
			wait();
			l__Background__360.BackgroundTransparency = 1 - v361 / 20;
		end;
		handleGUIs(false);
		l__CurrentCamera__2.CameraSubject = nil;
		l__CurrentCamera__2.CameraType = "Scriptable";
		local l__CutsceneData__362 = l__Level__5.Map5Task.CutsceneData;
		local v363 = l__CutsceneData__362:GetChildren();
		l__CurrentCamera__2.CoordinateFrame = l__CutsceneData__362["1"].c1.Value;
		l__CurrentCamera__2.Focus = l__CutsceneData__362["1"].f1.Value;
		l__CurrentCamera__2.FieldOfView = l__CutsceneData__362["1"].FOV.Value;
		l__CurrentCamera__2:SetRoll(l__CutsceneData__362["1"].Roll.Value);
		p67.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
		for v364 = 1, 20 do
			l__Cutscene__359.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v364, 0);
			l__Cutscene__359.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v364, 0);
			l__Background__360.BackgroundTransparency = 0 + v364 / 20;
			wait();
		end;
		for v365 = 2, #v363 do
			local v366 = l__CutsceneData__362[tostring(v365)];
			if v365 == 6 then
				wait(0.06);
				l__Cutscene__359.NameText.Position = UDim2.new(0, 0, 0.7, 0);
				l__Cutscene__359.NameText.Text = "THE OVERSEER";
				l__Cutscene__359.NameText.Visible = true;
				wait(3);
				l__Cutscene__359.NameText.Visible = false;
				l__Cutscene__359.NameText.Position = UDim2.new(0, 0, 0.5625, 0);
			end;
			tweenCam(v366.c1.Value, v366.f1.Value, v366.step.Value, v366.FOV.Value, v366.Roll.Value, v366.Style.Value);
		end;
		(function(p68)
			l__Parent__1.StoryScript.Current.Value = p68;
			while true do
				wait(0.09);
				if not l__Parent__1.StoryScript.Busy.Value then
					break;
				end;			
			end;
		end)(l__Level__5.Map5Task.Dialogue);
		readyChoices(p67);
		wait(0.06);
		script.Parent.LocalScript.LocalPause.Value = false;
		l__CurrentCamera__2.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
		l__CurrentCamera__2.CameraType = "Custom";
		l__CurrentCamera__2.FieldOfView = 70;
		handleGUIs(true);
		for v367 = 1, 20 do
			l__Cutscene__359.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v367, 0);
			l__Cutscene__359.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v367, 0);
			wait();
		end;
		overseerBattle(p67);
	end;
end);
if l__Stats__4.LoadingZone.Value > 4 then
	l__Level__5.LoadingZones.Hallway02.Door5.Right.CFrame = l__Level__5.LoadingZones.Hallway02.Door5.Right.CFrame + Vector3.new(0, 0, 5);
	l__Level__5.LoadingZones.Hallway02.Door5.Left.CFrame = l__Level__5.LoadingZones.Hallway02.Door5.Left.CFrame - Vector3.new(0, 0, 5);
	l__Level__5.LoadingZones.Hallway02.Door2.Front.CFrame = l__Level__5.LoadingZones.Hallway02.Door2.Front.CFrame - Vector3.new(5, 0, 0);
	l__Level__5.LoadingZones.Hallway02.Door2.Back.CFrame = l__Level__5.LoadingZones.Hallway02.Door2.Back.CFrame + Vector3.new(5, 0, 0);
end;
coroutine.resume(coroutine.create(function()
	runObjectives();
end));
