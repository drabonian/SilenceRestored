-- Decompiled with the Synapse X Luau decompiler.
print("Script is running...")

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

function waitTime(p5)
	for i = 0, p5 do
		task.wait(0.03)
		if l__Parent__1.LocalScript.LocalPause.Value then
			l__Parent__1.LocalScript.LocalPause.Changed:Wait()
		end
	end
end;

function handleGUIs(p2)
	l__Parent__1.Health.Visible = p2;
	l__Parent__1.Ammo.Visible = p2;
	l__Parent__1.Power.Visible = p2;
	l__Parent__1.Reticle.Visible = p2;
	l__Parent__1.Radar.Visible = p2;
	l__Parent__1.Interface.Info.Visible = p2;
	if not p2 then
		l__Parent__1.TouchedInfo.Visible = p2;
		l__Parent__1.InRange.Visible = p2;
		l__Parent__1.AmmoInfo.Visible = p2;
	end;
end;
function playSoundEffect(p3, p4)
	if script.Parent:FindFirstChild("SoundScript") then
		local v7 = Instance.new("StringValue");
		v7.Name = "Sound";
		v7.Value = p3;
		local v8 = Instance.new("ObjectValue");
		v8.Name = "Location";
		v8.Value = p4;
		v8.Parent = v7;
		v7.Parent = script.Parent.SoundScript.Effects;
	end;
end;
local l__Debris__2 = game:GetService("Debris");
function runExplosion(p5, p6, p7)
	local v9 = Instance.new("Explosion");
	v9.Position = p5.Position;
	v9.BlastPressure = 0;
	v9.BlastRadius = p6;
	v9.Parent = l__CurrentCamera__2;
	l__Debris__2:AddItem(v9, 3);
	if p7 then
		playSoundEffect(p7, p5);
	end;
end;
local u3 = require(workspace.CFrameInterpolator);
function tweenCam(p8, p9, p10, p11, p12, p13)
	local v10
	local v11
	
	if p13 == 1 then
		v10 = 1;
		v11 = 181;
	else
		v10 = -90;
		v11 = 90;
	end;
	
	local l__Focus__12 = l__CurrentCamera__2.Focus;
	local l__FieldOfView__13 = l__CurrentCamera__2.FieldOfView;
	local v14 = l__CurrentCamera__2:GetRoll();
	local v15, v16 = u3(l__CurrentCamera__2.CoordinateFrame, p8);
	local v17 = v10 - p10;
	while true do
		l__CurrentCamera__2.CameraType = "Scriptable";
		local v18 = nil;
		if p13 == 1 then
			v18 = 0.0055248618784530384 * v17;
		elseif p13 == 2 then
			v18 = (math.sin((math.rad(v17))) + 1) / 2;
		end;
		l__CurrentCamera__2.CoordinateFrame = v16(v17 / v11);
		l__CurrentCamera__2.FieldOfView = Vector3.new(l__FieldOfView__13, 0, 0):Lerp(Vector3.new(p11, 0, 0), v18).X;
		l__CurrentCamera__2:SetRoll(Vector3.new(v14, 0, 0):Lerp(Vector3.new(p12, 0, 0), v18).X);
		wait();
		if 0 <= p10 then
			if v17 < v11 then

			else
				break;
			end;
		elseif v11 < v17 then

		else
			break;
		end;
		v17 = v17 + p10;	
	end;
end;
function handleGUIs(p14)
	l__Parent__1.Health.Visible = p14;
	l__Parent__1.Ammo.Visible = p14;
	l__Parent__1.Power.Visible = p14;
	l__Parent__1.Reticle.Visible = p14;
	l__Parent__1.Radar.Visible = p14;
	l__Parent__1.Interface.Info.Visible = p14;
	if not p14 then
		l__Parent__1.TouchedInfo.Visible = p14;
		l__Parent__1.InRange.Visible = p14;
		l__Parent__1.AmmoInfo.Visible = p14;
	end;
end;
local l__Stats__4 = l__LocalPlayer__1.Stats;
local l__GameItems__5 = game.ReplicatedStorage.GameItems;
function runObjectives()
	print("OK")
	
	local l__MissionText__19 = l__Parent__1.Interface.Info.MissionText;
	local l__Objectives__20 = l__Level__3.Objectives;
	if l__Stats__4.Progress.Value < 2 then
		l__MissionText__19.Text = "FIND A WAY OUT OF THE SUBLAYER";
		local l__Button__21 = l__Level__3.Map1Task.ExitVent.Button;
		if l__Stats__4.Progress.Value < 1 then
			l__Objectives__20["Exit Vent"].Torso.Touched:connect(function(p15)
				if p15 then
					if p15.Parent then
						if p15.Name == "Torso" then
							l__Objectives__20["Exit Vent"]:Destroy();
						end;
					end;
				end;
			end);
			while true do
				wait(0.09);
				if l__Objectives__20:findFirstChild("Exit Vent") then

				else
					break;
				end;
				if not l__Button__21.Busy.Value then

				else
					break;
				end;			
			end;
			if l__Objectives__20:findFirstChild("Exit Vent") then
				l__Objectives__20["Exit Vent"]:Destroy();
			end;
			l__Stats__4.Progress.Value = 1;
		else
			l__Objectives__20["Exit Vent"]:Destroy();
		end;
		if not l__Button__21.Busy.Value then
			l__MissionText__19.Text = "OPEN THE EXIT VENT";
			l__Objectives__20["Open Vent"].Part.Name = "Torso";
			while true do
				wait(0.09);
				if not l__Button__21.Busy.Value then

				else
					break;
				end;			
			end;
		end;
		l__Level__3.Map1Task.ExitVent.Part.BrickColor = BrickColor.new("Black");
		l__Objectives__20["Open Vent"]:Destroy();
		l__Level__3.Map1Task.ExitVent.DoubleDoorVent:Destroy();
		l__Stats__4.Progress.Value = 2;
	else
		l__Objectives__20["Exit Vent"]:Destroy();
		l__Objectives__20["Open Vent"]:Destroy();
		l__Level__3.Map1Task.ExitVent.DoubleDoorVent:Destroy();
	end;
	coroutine.resume(coroutine.create(function()
		while true do
			wait();
			if not l__Parent__1.SoundScript.Busy.Value then
				if not (1 < l__Stats__4.Checkpoint.Value) then

				else
					break;
				end;
			end;		
		end;
		if l__Stats__4.Progress.Value == 8 then
			l__Parent__1.SoundScript.Current.Value = "EverybodyLies";
			return;
		end;
		if l__Stats__4.Progress.Value == 9 then
			l__Parent__1.SoundScript.Current.Value = "DetroitScuffle";
			return;
		end;
		l__Parent__1.SoundScript.Current.Value = "EnteringTYM";
	end));
	if l__Stats__4.Progress.Value < 3 then
		l__MissionText__19.Text = "EXIT THE SUBLAYER";
		l__Objectives__20.Elevator.Part.Name = "Torso";
		l__Level__3.Map2Task.Trigger.Touched:connect(function(p16)
			if p16 then
				if p16.Parent then
					if p16.Name == "Torso" then
						l__Level__3.Map2Task.Trigger:Destroy();
					end;
				end;
			end;
		end);
		while true do
			wait(0.09);
			if l__Level__3.Map2Task:findFirstChild("Trigger") then

			else
				break;
			end;		
		end;
		l__Objectives__20.Elevator:Destroy();
		l__Stats__4.Progress.Value = 3;
	else
		l__Level__3.Map2Task.Trigger:Destroy();
		l__Objectives__20.Elevator:Destroy();
	end;
	if l__Stats__4.Progress.Value < 4 then
		l__MissionText__19.Text = "FIND ANOTHER WAY UP";
		event1();
		l__Objectives__20.Stairwell.Part.Name = "Torso";
		l__Objectives__20.Stairwell.Torso.Touched:connect(function(p17)
			if p17 then
				if p17.Parent then
					if p17.Name == "Torso" then
						l__Objectives__20.Stairwell:Destroy();
					end;
				end;
			end;
		end);
		while true do
			wait(0.09);
			if l__Objectives__20:FindFirstChild("Stairwell") then

			else
				break;
			end;		
		end;
		l__Stats__4.Progress.Value = 4;
	else
		l__Objectives__20.Stairwell:Destroy();
	end;
	if l__Stats__4.Progress.Value < 5 then
		l__MissionText__19.Text = "FIND THE SUPPLY LIFT";
		local l__Button__22 = l__Level__3.Map3Task.Button;
		l__Objectives__20["Supply Lift"].Part.Name = "Torso";
		while true do
			wait(0.09);
			if not l__Button__22.Busy.Value then

			else
				break;
			end;		
		end;
		l__Button__22:Destroy();
		l__Objectives__20["Supply Lift"]:Destroy();
		l__MissionText__19.Text = "SURVIVE UNTIL THE LIFT ARRIVES";
		l__Parent__1.SoundScript.Current.Value = "EverybodyLies";
		event2();
		l__Parent__1.SoundScript.Current.Value = "EnteringTYM";
		l__Stats__4.Progress.Value = 5;
	else
		if l__Stats__4.Checkpoint.Value == 3 then
			if l__Stats__4.Progress.Value < 6 then
				l__Level__3.Parent.Map.BlockadeDoors.Door1.CFrame = l__Level__3.Parent.Map.BlockadeDoors.Door1.CFrame - Vector3.new(0, 9, 0);
				l__Level__3.Parent.Map.BlockadeDoors.Door2.CFrame = l__Level__3.Parent.Map.BlockadeDoors.Door2.CFrame - Vector3.new(0, 9, 0);
				local l__SupplyElevator__23 = l__Level__3.Parent.Map.SupplyElevator;
				local v24 = 1 - 1;
				while true do
					l__SupplyElevator__23.ElevatorDoors.Door1.CFrame = l__SupplyElevator__23.ElevatorDoors.Door1.CFrame - Vector3.new(0, 0, 0.25);
					l__SupplyElevator__23.ElevatorDoors.Door3.CFrame = l__SupplyElevator__23.ElevatorDoors.Door3.CFrame - Vector3.new(0, 0, 0.25);
					l__SupplyElevator__23.ElevatorDoors.Door2.CFrame = l__SupplyElevator__23.ElevatorDoors.Door2.CFrame + Vector3.new(0, 0, 0.25);
					l__SupplyElevator__23.ElevatorDoors.Door4.CFrame = l__SupplyElevator__23.ElevatorDoors.Door4.CFrame + Vector3.new(0, 0, 0.25);
					wait();
					if 0 <= 1 then
						if v24 < 20 then

						else
							break;
						end;
					elseif 20 < v24 then

					else
						break;
					end;
					v24 = v24 + 1;				
				end;
			end;
		end;
		l__Level__3.Map3Task.Button:Destroy();
		l__Objectives__20["Supply Lift"]:Destroy();
	end;
	if l__Stats__4.Progress.Value < 6 then
		l__MissionText__19.Text = "EXIT THE SUBLAYER";
		local u6 = false;
		l__Level__3.Map3Task.Map3EndTrigger.Touched:connect(function(p18)
			u6 = true;
		end);
		while true do
			wait(0.09);
			if not u6 then

			else
				break;
			end;		
		end;
		l__MissionText__19.Text = "HUBRIS CALLING";
		event3();
		l__Stats__4.Progress.Value = 6;
	end;
	if l__Stats__4.Progress.Value < 7 then
		l__MissionText__19.Text = "GET TO DR. TAMID";
		local l__Button__25 = l__Level__3.Map6Task.BaredDoors.Button;
		while true do
			wait(0.09);
			if not l__Button__25.Busy.Value then

			else
				break;
			end;		
		end;
		l__Level__3.Map6Task.BaredDoors.Part.BrickColor = BrickColor.new("Black");
		if not l__Stats__4.BadgeNeverForget.Value then
			l__Stats__4.BadgeNeverForget.Value = true;
		end;
		local v26 = l__Level__3.Map6Task:GetChildren();
		local v27 = #v26;
		local v28 = 1;
		while true do
			if v26[v28].Name == "Gate" then
				coroutine.resume(coroutine.create(function()
					local v29 = 1;
					while true do
						v26[v28].CFrame = v26[v28].CFrame - Vector3.new(0, 0.25, 0);
						wait(0.03);
						if 0 <= 1 then
							if v29 < 60 then

							else
								break;
							end;
						elseif 60 < v29 then

						else
							break;
						end;
						v29 = v29 + 1;					
					end;
				end));
			end;
			if 0 <= 1 then
				if v28 < v27 then

				else
					break;
				end;
			elseif v27 < v28 then

			else
				break;
			end;
			v28 = v28 + 1;		
		end;
		l__Stats__4.Progress.Value = 7;
	else
		local v30 = l__Level__3.Map6Task:GetChildren();
		local v31 = #v30;
		local v32 = 1;
		while true do
			if v30[v32].Name == "Gate" then
				coroutine.resume(coroutine.create(function()
					v30[v32].CFrame = v30[v32].CFrame - Vector3.new(0, 15, 0);
				end));
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
	end;
	if l__Stats__4.Progress.Value < 8 then
		l__MissionText__19.Text = "TAKE DOWN DR. TAMID";
		event4();
		l__Stats__4.Progress.Value = 8;
	end;
	if l__Stats__4.Progress.Value < 9 then
		l__MissionText__19.Text = "DESTROY THE TRUTH TELLER";
		event5();
		l__Stats__4.Progress.Value = 9;
	else
		l__Level__3.Map6Task.RoofBlockade.CanCollide = true;
		l__Level__3.Map6Task.RoofGate.CFrame = l__Level__3.Map6Task.RoofGate.CFrame - Vector3.new(17, 0, 0);
	end;
	l__Level__3.LoadingZones.Hallway:Destroy();
	if l__Stats__4.Progress.Value < 10 then
		l__MissionText__19.Text = "SAVE AVERT INDUSTRIES";
		event6();
		l__Stats__4.Progress.Value = 10;
	end;
	if l__Stats__4.LoadingZone.Value < 10 then
		local v33 = l__Level__3.LoadingZones:getChildren();
		local v34 = #v33;
		local v35 = 1;
		while true do
			if v33[v35]:findFirstChild("Decontamination") then
				local l__DoorSet1__36 = v33[v35].Decontamination.DoorSet1;
				local l__DoorSet2__37 = v33[v35].Decontamination.DoorSet2;
				if v33[v35].Button.Way.Value then
					local v38 = 1 - 1;
					while true do
						l__DoorSet1__36.Door1.CFrame = l__DoorSet1__36.Door1.CFrame + (l__DoorSet1__36.ClosedPosition1.Position - l__DoorSet1__36.OpenPosition1.Position) / 8;
						l__DoorSet1__36.Door2.CFrame = l__DoorSet1__36.Door2.CFrame + (l__DoorSet1__36.ClosedPosition2.Position - l__DoorSet1__36.OpenPosition2.Position) / 8;
						wait();
						if 0 <= 1 then
							if v38 < 8 then

							else
								break;
							end;
						elseif 8 < v38 then

						else
							break;
						end;
						v38 = v38 + 1;					
					end;
				else
					local v39 = 1 - 1;
					while true do
						l__DoorSet2__37.Door1.CFrame = l__DoorSet2__37.Door1.CFrame + (l__DoorSet2__37.ClosedPosition1.Position - l__DoorSet2__37.OpenPosition1.Position) / 8;
						l__DoorSet2__37.Door2.CFrame = l__DoorSet2__37.Door2.CFrame + (l__DoorSet2__37.ClosedPosition2.Position - l__DoorSet2__37.OpenPosition2.Position) / 8;
						wait();
						if 0 <= 1 then
							if v39 < 8 then

							else
								break;
							end;
						elseif 8 < v39 then

						else
							break;
						end;
						v39 = v39 + 1;					
					end;
				end;
				v33[v35].Button.Way.Value = not v33[v35].Button.Way.Value;
				if v33[v35].Button.Way.Value then
					local v40 = 1 - 1;
					while true do
						l__DoorSet1__36.Door1.CFrame = l__DoorSet1__36.Door1.CFrame - (l__DoorSet1__36.ClosedPosition1.Position - l__DoorSet1__36.OpenPosition1.Position) / 8;
						l__DoorSet1__36.Door2.CFrame = l__DoorSet1__36.Door2.CFrame - (l__DoorSet1__36.ClosedPosition2.Position - l__DoorSet1__36.OpenPosition2.Position) / 8;
						wait();
						if 0 <= 1 then
							if v40 < 8 then

							else
								break;
							end;
						elseif 8 < v40 then

						else
							break;
						end;
						v40 = v40 + 1;					
					end;
				else
					local v41 = 1 - 1;
					while true do
						l__DoorSet2__37.Door1.CFrame = l__DoorSet2__37.Door1.CFrame - (l__DoorSet2__37.ClosedPosition1.Position - l__DoorSet2__37.OpenPosition1.Position) / 8;
						l__DoorSet2__37.Door2.CFrame = l__DoorSet2__37.Door2.CFrame - (l__DoorSet2__37.ClosedPosition2.Position - l__DoorSet2__37.OpenPosition2.Position) / 8;
						wait();
						if 0 <= 1 then
							if v41 < 8 then

							else
								break;
							end;
						elseif 8 < v41 then

						else
							break;
						end;
						v41 = v41 + 1;					
					end;
				end;
			end;
			if 0 <= 1 then
				if v35 < v34 then

				else
					break;
				end;
			elseif v34 < v35 then

			else
				break;
			end;
			v35 = v35 + 1;		
		end;
	end;
	if l__Stats__4.Progress.Value < 11 then
		l__MissionText__19.Text = "FIND THE TRUTH";
		event7();
		l__Stats__4.Progress.Value = 11;
	end;
	l__MissionText__19.Text = "LEVEL COMPLETE";
	wait(0.24);
	l__Stats__4.LoadingZone.Value = 1;
	l__Stats__4.Checkpoint.Value = 1;
	l__Stats__4.Progress.Value = 0;
	l__Parent__1.LocalScript.LocalPause.Value = true;
	local l__Background__42 = l__Parent__1.Interface.Background;
	local v43 = 1 - 1;
	while true do
		wait();
		l__Background__42.BackgroundTransparency = 1 - v43 / 20;
		if 0 <= 1 then
			if v43 < 20 then

			else
				break;
			end;
		elseif 20 < v43 then

		else
			break;
		end;
		v43 = v43 + 1;	
	end;
	local v44 = l__GameItems__5.MasterGuis.Credits:Clone();
	v44.Parent = l__Parent__1.Interface;
	v44.Visible = true;
	v44.LevelImage.ImageTransparency = 1;
	v44.LevelImage.Visible = true;
	v44.LevelImage:TweenSizeAndPosition(UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, -1, 0), "Out", "Quad", 4);
	local v45 = 1 - 1;
	while true do
		wait();
		v44.LevelImage.ImageTransparency = 1 - v45 / 120;
		if 0 <= 1 then
			if v45 < 120 then

			else
				break;
			end;
		elseif 120 < v45 then

		else
			break;
		end;
		v45 = v45 + 1;	
	end;
	v44.Title.Visible = true;
	wait(0.09);
	v44.Title.Visible = false;
	wait(0.06);
	v44.Title.Visible = true;
	wait(0.12);
	v44.Title.Visible = false;
	wait(0.06);
	v44.Title.Visible = true;
	wait(0.3);
	v44:TweenPosition(UDim2.new(0, 0, -1.4, 0), "Out", "Linear", 24, true);
	l__GameItems__5.MasterLevels.Level4.Extras.HubrisHauteur:Clone().Parent = l__CurrentCamera__2;
	while true do
		wait();
		if not (v44.Position.Y.Scale < -1.39) then

		else
			break;
		end;	
	end;
	l__LocalPlayer__1.FirstEnter.Value = true;
	l__Stats__4.Restart.Value = true;
end;
function event1()
	local v46 = l__GameItems__5.MasterModels.Griever:clone();
	v46.Parent = l__Level__3.Parent.Map;
	v46:MakeJoints();
	v46.Torso.CFrame = CFrame.new(-215.9, 42.3, 72.5);
	v46.Stats.WaitTime.Value = 1;
	v46.Stats.OffsetMaxX.Value = 104;
	v46.Stats.OffsetMaxZ.Value = 5;
	v46.Stats.OffsetMinX.Value = -5;
	v46.Stats.OffsetMinZ.Value = -5;
	v46.Stats.Agressive.Value = true;
	local v47 = v46.MainControlNPC:clone();
	v47.Name = "MapScript";
	v47.Parent = script.Parent;
	local v48 = Instance.new("ObjectValue");
	v48.Name = "LinkedModel";
	v48.Value = v46;
	v48.Parent = v47;
	v47.Disabled = false;
end;
function event2()
	local function v49(p19, p20)
		local v50 = l__GameItems__5.MasterModels[p19]:clone();
		v50.Parent = l__Level__3.Parent.Map;
		v50:MakeJoints();
		v50.Torso.CFrame = p20;
		l__Level__3.Map3Task.Bots.Value = l__Level__3.Map3Task.Bots.Value + 1;
		v50.Stats.Counter.Value = l__Level__3.Map3Task.Bots;
		if p19 == "Drone" then
			v50.Stats.Path:Destroy();
			l__Level__3.Map3Task.Path:Clone().Parent = v50.Stats;
			if p20.p.x < -300 then
				v50.Stats.Path.Value = 1;
			end;
			v50.Stats.Speed.Value = 16;
		elseif p19 == "Griever" then
			v50.Stats.Path:Destroy();
			l__Level__3.Map3Task.Path:Clone().Parent = v50.Stats;
			v50.Stats.Path.Value = 9;
		end;
		v50.Stats.WaitTime.Value = 1;
		v50.Stats.OffsetMaxX.Value = 1000;
		v50.Stats.OffsetMaxZ.Value = 1000;
		v50.Stats.OffsetMinX.Value = -1000;
		v50.Stats.OffsetMinZ.Value = -1000;
		local v51 = v50.MainControlNPC:clone();
		v51.Name = "MapScript";
		v51.Parent = script.Parent;
		local v52 = Instance.new("ObjectValue");
		v52.Name = "LinkedModel";
		v52.Value = v50;
		v52.Parent = v51;
		v51.Disabled = false;
	end;
	l__Level__3.Parent.Map.BlockadeDoors.Door1.CFrame = l__Level__3.Parent.Map.BlockadeDoors.Door1.CFrame - Vector3.new(0, 9, 0);
	l__Level__3.Parent.Map.BlockadeDoors.Door2.CFrame = l__Level__3.Parent.Map.BlockadeDoors.Door2.CFrame - Vector3.new(0, 9, 0);
	l__Parent__1.Interface.Info.BossHealth.Visible = true;
	l__Parent__1.Interface.Info.BossHealth.HealthText.Text = "LIFT DISTANCE";
	l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new(1, 0, 1, 0);
	local v53 = { CFrame.new(-171.7, 121.5, -18.3), CFrame.new(-326.3, 121.5, -160.1), CFrame.new(-181.1, 121.5, -34.7), CFrame.new(-214.3, 91.5, -64.9), CFrame.new(-280.1, 101.5, 7.1) };
	local v54 = 1;
	local v55 = 2;
	v49("Griever", v53[4]);
	wait();
	v49("MegaBot", v53[5]);
	local v56 = 1 - 1;
	while true do
		if v56 % 8 == 0 then
			v54 = v54 + 1;
			if 3 < v54 then
				v54 = 1;
			end;
			v49("Repressilator", v53[v54]);
		elseif v56 % 4 == 0 then
			if l__Level__3.Map3Task.Bots.Value < 4 then
				v55 = v55 + 1;
				if 2 < v55 then
					v55 = 1;
				end;
				v49("Drone", v53[v55]);
			elseif 70 < v56 then
				if v56 <= 88 then
					if l__Level__3.Map3Task.Bots.Value < 6 then
						v55 = v55 + 1;
						if 2 < v55 then
							v55 = 1;
						end;
						v49("Drone", v53[v55]);
					end;
				end;
			end;
		elseif 70 < v56 then
			if v56 <= 88 then
				if l__Level__3.Map3Task.Bots.Value < 6 then
					v55 = v55 + 1;
					if 2 < v55 then
						v55 = 1;
					end;
					v49("Drone", v53[v55]);
				end;
			end;
		end;
		local v57 = 1 - 1;
		while true do
			local v58 = 0 + 0.02 * v57;
			l__Level__3.Map3Task.ElevatorSign.SurfaceGui.Text1.TextStrokeColor3 = Color3.new(0.5 + v58, 0.5 - v58, 0.5 - v58);
			l__Level__3.Map3Task.ElevatorSign.SurfaceGui.Text2.TextStrokeColor3 = Color3.new(0.5 + v58, 0.5 - v58, 0.5 - v58);
			waitTime(1);
			if 0 <= 1 then
				if v57 < 25 then

				else
					break;
				end;
			elseif 25 < v57 then

			else
				break;
			end;
			v57 = v57 + 1;		
		end;
		local v59 = 25 - -1;
		while true do
			local v60 = 0 + 0.02 * v59;
			l__Level__3.Map3Task.ElevatorSign.SurfaceGui.Text1.TextStrokeColor3 = Color3.new(0.5 + v60, 0.5 - v60, 0.5 - v60);
			l__Level__3.Map3Task.ElevatorSign.SurfaceGui.Text2.TextStrokeColor3 = Color3.new(0.5 + v60, 0.5 - v60, 0.5 - v60);
			waitTime(1);
			if 0 <= -1 then
				if v59 < 1 then

				else
					break;
				end;
			elseif 1 < v59 then

			else
				break;
			end;
			v59 = v59 + -1;		
		end;
		waitTime(1);
		l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new((90 - v56) / 90, 0, 1, 0);
		if 0 <= 1 then
			if v56 < 90 then

			else
				break;
			end;
		elseif 90 < v56 then

		else
			break;
		end;
		v56 = v56 + 1;	
	end;
	l__Parent__1.Interface.Info.BossHealth.Visible = false;
	local l__SupplyElevator__61 = l__Level__3.Parent.Map.SupplyElevator;
	local v62 = 1 - 1;
	while true do
		l__SupplyElevator__61.ElevatorDoors.Door1.CFrame = l__SupplyElevator__61.ElevatorDoors.Door1.CFrame - Vector3.new(0, 0, 0.25);
		l__SupplyElevator__61.ElevatorDoors.Door3.CFrame = l__SupplyElevator__61.ElevatorDoors.Door3.CFrame - Vector3.new(0, 0, 0.25);
		l__SupplyElevator__61.ElevatorDoors.Door2.CFrame = l__SupplyElevator__61.ElevatorDoors.Door2.CFrame + Vector3.new(0, 0, 0.25);
		l__SupplyElevator__61.ElevatorDoors.Door4.CFrame = l__SupplyElevator__61.ElevatorDoors.Door4.CFrame + Vector3.new(0, 0, 0.25);
		waitTime(1);
		if 0 <= 1 then
			if v62 < 20 then

			else
				break;
			end;
		elseif 20 < v62 then

		else
			break;
		end;
		v62 = v62 + 1;	
	end;
end;
function addMap(p2, p3)
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
				addMap(item, newModel)
			end
		else
			item:Clone().Parent = p3
		end
	end;
end;
function spawnNextMap(p23)
	l__Level__3.Parent.Map:Destroy();
	wait();
	local v68 = Instance.new("Model");
	v68.Name = "Map";
	v68.Parent = l__CurrentCamera__2;
	coroutine.resume(coroutine.create(function()
		addMap(p23, v68);
	end));
end;
function event3()
	while true do
		wait();
		if not l__Parent__1.CanPause.Value then

		else
			break;
		end;	
	end;
	local l__Background__69 = l__Parent__1.Interface.Background;
	local v70 = 1 - 1;
	while true do
		wait();
		l__Background__69.BackgroundTransparency = 1 - v70 / 20;
		if 0 <= 1 then
			if v70 < 20 then

			else
				break;
			end;
		elseif 20 < v70 then

		else
			break;
		end;
		v70 = v70 + 1;	
	end;
	spawnNextMap(l__GameItems__5.MasterLevels.Level4.Map4);
	l__Parent__1.Interface.Info.MissionTitle.Text = "FLASHBACK:";
	l__GameItems__5.MasterGuis.Vintage:clone().Parent = l__Parent__1;
	local l__Cutscene__71 = script.Parent.Cutscene;
	script.Parent.LocalScript.LocalPause.Value = true;
	local l__Character__72 = l__LocalPlayer__1.Character;
	local l__Torso__73 = l__Character__72.Torso;
	handleGUIs(false);
	l__Parent__1.Interface.Info.Visible = true;
	l__CurrentCamera__2.CameraSubject = nil;
	l__CurrentCamera__2.CameraType = "Scriptable";
	local l__CutsceneData__74 = l__Level__3.Map4Task.CutsceneData;
	local v75 = l__CutsceneData__74:GetChildren();
	l__CurrentCamera__2.CoordinateFrame = l__CutsceneData__74["1"].c1.Value;
	l__CurrentCamera__2.Focus = l__CutsceneData__74["1"].f1.Value;
	l__CurrentCamera__2.FieldOfView = l__CutsceneData__74["1"].FOV.Value;
	l__CurrentCamera__2:SetRoll(l__CutsceneData__74["1"].Roll.Value);
	l__Torso__73.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
	wait(1.2);
	local v76 = 1 - 1;
	while true do
		l__Cutscene__71.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v76, 0);
		l__Cutscene__71.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v76, 0);
		l__Background__69.BackgroundTransparency = 0 + v76 / 20;
		wait();
		if 0 <= 1 then
			if v76 < 20 then

			else
				break;
			end;
		elseif 20 < v76 then

		else
			break;
		end;
		v76 = v76 + 1;	
	end;
	local l__Map__77 = l__Level__3.Parent.Map;
	local v78 = #v75;
	local v79 = 2 - 1;
	while true do
		local v80 = l__CutsceneData__74[tostring(v79)];
		if v79 == 2 then
			local v81 = 1 - 1;
			while true do
				playSoundEffect("MetalKnock", l__Map__77.SpecialSlidingDoor.SlidingDoor);
				wait(0.15);
				if 0 <= 1 then
					if v81 < 3 then

					else
						break;
					end;
				elseif 3 < v81 then

				else
					break;
				end;
				v81 = v81 + 1;			
			end;
		elseif v79 == 4 then
			coroutine.resume(coroutine.create(function()
				local v82 = 1 - 1;
				while true do
					playSoundEffect("MetalKnock", l__Map__77.SpecialSlidingDoor.SlidingDoor);
					wait(0.15);
					if 0 <= 1 then
						if v82 < 3 then

						else
							break;
						end;
					elseif 3 < v82 then

					else
						break;
					end;
					v82 = v82 + 1;				
				end;
			end));
		elseif v79 == 6 then
			coroutine.resume(coroutine.create(function()
				local v83 = 1 - 1;
				while true do
					playSoundEffect("MetalKnock", l__Map__77.SpecialSlidingDoor.SlidingDoor);
					wait(0.3);
					if 0 <= 1 then
						if v83 < 3 then

						else
							break;
						end;
					elseif 3 < v83 then

					else
						break;
					end;
					v83 = v83 + 1;				
				end;
			end));
		end;
		tweenCam(v80.c1.Value, v80.f1.Value, v80.step.Value, v80.FOV.Value, v80.Roll.Value, v80.Style.Value);
		if 0 <= 1 then
			if v79 < v78 then

			else
				break;
			end;
		elseif v78 < v79 then

		else
			break;
		end;
		v79 = v79 + 1;	
	end;
	playSoundEffect("SlideOpen", l__Map__77.SpecialSlidingDoor.SlidingDoor);
	local v84 = 1 - 1;
	while true do
		l__Map__77.SpecialSlidingDoor.SlidingDoor.CFrame = l__Map__77.SpecialSlidingDoor.SlidingDoor.CFrame - Vector3.new(0.3333, 0, 0);
		wait(0.03);
		if 0 <= 1 then
			if v84 < 12 then

			else
				break;
			end;
		elseif 12 < v84 then

		else
			break;
		end;
		v84 = v84 + 1;	
	end;
	(function(p24)
		l__Parent__1.StoryScript.Current.Value = p24;
		while true do
			wait(0.09);
			if l__Parent__1.StoryScript.Busy.Value then

			else
				break;
			end;		
		end;
	end)(l__Level__3.Map4Task.Dialogue);
	playSoundEffect("SlideClosed", l__Map__77.SpecialSlidingDoor.SlidingDoor);
	local v85 = 1 - 1;
	while true do
		l__Map__77.SpecialSlidingDoor.SlidingDoor.CFrame = l__Map__77.SpecialSlidingDoor.SlidingDoor.CFrame + Vector3.new(0.3333, 0, 0);
		wait(0.03);
		if 0 <= 1 then
			if v85 < 12 then

			else
				break;
			end;
		elseif 12 < v85 then

		else
			break;
		end;
		v85 = v85 + 1;	
	end;
	local v86 = 1 - 1;
	while true do
		wait();
		l__Background__69.BackgroundTransparency = 1 - v86 / 20;
		l__Cutscene__71.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v86, 0);
		l__Cutscene__71.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v86, 0);
		if 0 <= 1 then
			if v86 < 20 then

			else
				break;
			end;
		elseif 20 < v86 then

		else
			break;
		end;
		v86 = v86 + 1;	
	end;
	spawnNextMap(l__GameItems__5.MasterLevels.Level4.Map5);
	wait(1.2);
	l__Torso__73.CFrame = l__GameItems__5.MasterLevels.Level4.Map5.SpawnPosition.Value;
	wait(0.06);
	script.Parent.LocalScript.LocalPause.Value = false;
	l__CurrentCamera__2.CameraSubject = l__Character__72.Humanoid;
	l__CurrentCamera__2.CameraType = "Custom";
	l__CurrentCamera__2.FieldOfView = 70;
	handleGUIs(true);
	l__Parent__1.Interface.Info.MissionTitle.Text = "MISSION:";
	if l__Parent__1:findFirstChild("Vintage") then
		l__Parent__1.Vintage:Destroy();
	end;
	l__Stats__4.Checkpoint.Value = 5;
	local v87 = 1 - 1;
	while true do
		wait();
		l__Background__69.BackgroundTransparency = 0 + v87 / 20;
		if 0 <= 1 then
			if v87 < 20 then

			else
				break;
			end;
		elseif 20 < v87 then

		else
			break;
		end;
		v87 = v87 + 1;	
	end;
end;
local v88 = Instance.new("Part");
v88.FormFactor = Enum.FormFactor.Custom;
v88.Size = Vector3.new(0.2, 0.2, 1);
v88.BrickColor = BrickColor.new("Bright red");
v88.CanCollide = false;
v88.Anchored = true;
v88.Transparency = 0.3;
v88.TopSurface = Enum.SurfaceType.Smooth;
v88.BottomSurface = Enum.SurfaceType.Smooth;
v88.Name = "Averter";
function RayIgnoreCheck(p25, p26)
	if p25 then
		if not (1 <= p25.Transparency) then
			if string.lower(p25.Name) ~= "water" then
				if p25.Name ~= "Effect" then
					if p25.Name ~= "Rocket" then
						if p25.Name ~= "Averter" then
							if p25.Parent.ClassName ~= "Hat" then
								if p25.Parent.ClassName == "Tool" then

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
function RayCast(p27, p28, p29)
	local v89, v90 = workspace:FindPartOnRay(Ray.new(p27 + p28 * 0.01, p28 * p29), l__Level__3.Parent.Map);
	if v89 then
		if v90 then
			local v91 = p29 - (v90 - p27).magnitude;
			--if RayIgnoreCheck(v89, v90) then
			--	if 0 < v91 then
			--		return RayCast(v90, p28, v91);
			--	end;
			--end;
		end;
	end;
	return v89, v90;
end;
function event4()
	local function u7(p30, p31)
		local v92 = (p31.Position - p30.Position).unit;
		if p31.Name ~= "Glass" then
			v92 = (CFrame.new(Vector3.new(0, 0, 0), v92) * CFrame.Angles(0, 0, math.random() * 2 * math.pi) * CFrame.Angles(math.random() * 0.2, 0, 0)).lookVector;
		end;
		local v93, v94 = RayCast(p30.Position, v92, 32);
		playSoundEffect("LaserShot", p30.Parent.Parent.Parent.Torso);
		if v94 then
			local v95 = v88:clone();
			local l__magnitude__96 = (v94 - p30.Position).magnitude;
			v95.CFrame = CFrame.new(v94, p30.Position) * CFrame.new(0, 0, -l__magnitude__96 / 2);
			local v97 = Instance.new("BlockMesh");
			v97.Scale = Vector3.new(1, 1, l__magnitude__96 - 2);
			v97.Offset = Vector3.new(0, 0, 2);
			v97.Parent = v95;
			v95.Parent = l__CurrentCamera__2;
			l__Debris__2:AddItem(v95, 0.06);
		end;
	end;
	local l__Character__98 = l__LocalPlayer__1.Character;
	local l__Torso__99 = l__Character__98.Torso;
	while true do
		wait(0.3);
		if not ((l__Torso__99.Position - l__Level__3.Map6Task.Screen.Position).magnitude < 50) then

		else
			break;
		end;	
	end;
	local l__Cutscene__100 = script.Parent.Cutscene;
	script.Parent.LocalScript.LocalPause.Value = true;
	handleGUIs(false);
	l__CurrentCamera__2.CameraSubject = nil;
	l__CurrentCamera__2.CameraType = "Scriptable";
	local l__CutsceneData0__101 = l__Level__3.Map6Task.CutsceneData0;
	local v102 = l__CutsceneData0__101:GetChildren();
	l__Torso__99.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
	local v103 = 1 - 1;
	while true do
		l__Cutscene__100.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v103, 0);
		l__Cutscene__100.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v103, 0);
		wait();
		if 0 <= 1 then
			if v103 < 20 then

			else
				break;
			end;
		elseif 20 < v103 then

		else
			break;
		end;
		v103 = v103 + 1;	
	end;
	local l__Bar__104 = l__Level__3.Map6Task.Screen.SurfaceGui.LoadingBar.Bar;
	coroutine.resume(coroutine.create(function()
		for i in v102 do
			local v107 = l__CutsceneData0__101[tostring(i)];
			tweenCam(v107.c1.Value, v107.f1.Value, v107.step.Value, v107.FOV.Value, v107.Roll.Value, v107.Style.Value);
		end
	end));
	local v108 = 1 - 1;
	while true do
		l__Bar__104.Size = UDim2.new(0 + v108 / 180, 0, 1, 0);
		wait(0.03);
		if 0 <= 1 then
			if v108 < 180 then

			else
				break;
			end;
		elseif 180 < v108 then

		else
			break;
		end;
		v108 = v108 + 1;	
	end;
	l__Level__3.Map6Task.Screen.SurfaceGui.LoadingBar.Visible = false;
	l__Level__3.Map6Task.Screen.SurfaceGui.Text.Visible = false;
	local v109 = 1 - 1;
	while true do
		l__Level__3.Map6Task.Screen.SurfaceGui.Frame.BackgroundTransparency = 0 + v109 / 20;
		wait(0.03);
		if 0 <= 1 then
			if v109 < 20 then

			else
				break;
			end;
		elseif 20 < v109 then

		else
			break;
		end;
		v109 = v109 + 1;	
	end;
	l__Cutscene__100.NameText.Text = "BEAUMONT";
	l__Cutscene__100.NameText.Visible = true;
	wait(3);
	l__Cutscene__100.NameText.Visible = false;
	(function(p32)
		l__Parent__1.StoryScript.Current.Value = p32;
		while true do
			wait();
			if not script.Parent.StoryScript.Current.Value then

			else
				break;
			end;		
		end;
		while true do
			wait();
			if not (3 <= script.Parent.StoryScript.Number.Value) then

			else
				break;
			end;		
		end;
		local l__CutsceneData1__110 = l__Level__3.Map6Task.CutsceneData1;
		local v111 = l__CutsceneData1__110:GetChildren();
		l__CurrentCamera__2.CoordinateFrame = l__CutsceneData1__110["1"].c1.Value;
		l__CurrentCamera__2.Focus = l__CutsceneData1__110["1"].f1.Value;
		while true do
			wait();
			if not (4 <= script.Parent.StoryScript.Number.Value) then

			else
				break;
			end;		
		end;
		local l__CutsceneData0__112 = l__Level__3.Map6Task.CutsceneData0;
		local v113 = l__CutsceneData0__112:GetChildren();
		l__CurrentCamera__2.CoordinateFrame = l__CutsceneData0__112["3"].c1.Value;
		l__CurrentCamera__2.Focus = l__CutsceneData0__112["3"].f1.Value;
		while true do
			wait();
			if not (5 <= script.Parent.StoryScript.Number.Value) then

			else
				break;
			end;		
		end;
		l__Level__3.Map6Task["Dr. Umar Tamid"].Face.Decal.Texture = "http://www.roblox.com/asset/?id=85037798";
		local l__CutsceneData1__114 = l__Level__3.Map6Task.CutsceneData1;
		local v115 = l__CutsceneData1__114:GetChildren();
		l__CurrentCamera__2.CoordinateFrame = l__CutsceneData1__114["1"].c1.Value;
		l__CurrentCamera__2.Focus = l__CutsceneData1__114["1"].f1.Value;
		while true do
			wait();
			if not (6 <= script.Parent.StoryScript.Number.Value) then

			else
				break;
			end;		
		end;
		local l__CutsceneData0__116 = l__Level__3.Map6Task.CutsceneData0;
		local v117 = l__CutsceneData0__116:GetChildren();
		l__CurrentCamera__2.CoordinateFrame = l__CutsceneData0__116["1"].c1.Value;
		l__CurrentCamera__2.Focus = l__CutsceneData0__116["1"].f1.Value;
		local l__CFrame__118 = l__Level__3.Map6Task["Dr. Umar Tamid"].Torso.CFrame;
		l__Level__3.Map6Task["Dr. Umar Tamid"]:Destroy();
		local v119 = l__GameItems__5.MasterLevels.Level4.Extras["Dr. Umar Tamid"]:Clone();
		v119.Parent = l__Level__3.Parent.Map;
		v119:MakeJoints();
		v119.Torso.CFrame = l__CFrame__118;
		v119.Humanoid.AutoRotate = false;
		v119.Torso.BodyGyro.cframe = l__CFrame__118;
		local v120 = l__GameItems__5.MasterScripts.AnimateNPC:Clone();
		local v121 = Instance.new("ObjectValue");
		v121.Name = "LinkedModel";
		v121.Value = v119;
		v121.Parent = v120;
		v120.Parent = script.Parent;
		v120.Disabled = false;
		local v122 = Instance.new("Part");
		v122.Name = "NewHome";
		v122.Anchored = true;
		v122.CanCollide = false;
		v122.Transparency = 1;
		v122.CFrame = CFrame.new(-107.8, 208.5, -74.3);
		v122.Parent = v119.Parent;
		local v123 = l__GameItems__5.MasterModels.TruthTeller:Clone();
		v123.Parent = l__Level__3.Parent.Map;
		v123:MakeJoints();
		v123.Torso.CFrame = CFrame.new(-121.6, 202.6, -77.8) * CFrame.Angles(0, -90, 0);
		v123.Humanoid.AutoRotate = false;
		local v124 = Instance.new("BodyPosition");
		v124.maxForce = Vector3.new(1500000, 1500000, 1500000);
		v124.P = 1250;
		v124.D = 1500;
		v124.position = v123.Torso.Position;
		v124.Parent = v123.Torso;
		local v125 = Instance.new("BodyGyro");
		v125.P = 16000;
		v125.D = 120;
		v125.maxTorque = Vector3.new(6, -6, 6) * 1000;
		v125.cframe = CFrame.new(v123.Torso.Position, (Vector3.new(v122.Position.x - 20, v123.Torso.Position.y, v123.Torso.Position.z)));
		v125.Parent = v123.Torso;
		while true do
			wait();
			if not (7 <= script.Parent.StoryScript.Number.Value) then

			else
				break;
			end;		
		end;
		l__Parent__1.SoundScript.Current.Value = "EverybodyLies";
		local l__CutsceneData1__126 = l__Level__3.Map6Task.CutsceneData1;
		l__CurrentCamera__2.CoordinateFrame = l__CutsceneData1__126["1"].c1.Value;
		l__CurrentCamera__2.Focus = l__CutsceneData1__126["1"].f1.Value;
		local u8 = l__CutsceneData1__126:GetChildren();
		local u9 = l__CutsceneData1__126;
		local u10 = true;
		coroutine.resume(coroutine.create(function()
			for i in u8 do
				local v107 = u9[tostring(i)];
				tweenCam(v107.c1.Value, v107.f1.Value, v107.step.Value, v107.FOV.Value, v107.Roll.Value, v107.Style.Value);
			end
			u10 = false;
		end));
		v119.Humanoid.WalkSpeed = 6;
		v119.Humanoid:MoveTo(v122.Position, v122);
		v119.Head.WalkSound:Play();
		local u11 = true;
		coroutine.resume(coroutine.create(function()
			while true do
				wait(0.09);
				v119.Head.WalkSound.Pitch = math.random(99.99999999999999, 179.99999999999997) / 100;
				if not ((v119.Torso.Position - v122.Position).magnitude < 3) then

				else
					break;
				end;			
			end;
			v119.Head.WalkSound:Stop();
			while true do
				wait();
				if u10 then

				else
					break;
				end;			
			end;
			u9 = l__Level__3.Map6Task.CutsceneData2;
			u8 = u9:GetChildren();
			l__CurrentCamera__2.CoordinateFrame = u9["1"].c1.Value;
			l__CurrentCamera__2.Focus = u9["1"].f1.Value;
			local v130 = Instance.new("BodyPosition");
			v130.maxForce = Vector3.new(1500000, 1500000, 1500000);
			v130.P = 1250;
			v130.D = 1500;
			v130.position = v119.Torso.Position + Vector3.new(0, 0.1, 0);
			v130.Parent = v119.Torso;
			v119.Torso.BodyGyro.cframe = CFrame.new(v119.Torso.Position, (Vector3.new(-107.8, v119.Torso.Position.y, -80.3)));
			wait(0.6);
			v119.Torso.BodyGyro.cframe = CFrame.new(v119.Torso.Position, (Vector3.new(v123.Torso.Position.x, v119.Torso.Position.y, v123.Torso.Position.z)));
			wait(1.5);
			u11 = false;
		end));
		while true do
			wait(0.09);
			if not ((v119.Torso.Position - v122.Position).magnitude < 5) then

			else
				break;
			end;		
		end;
		local l__Weld__131 = v123.Main.RightHip.Weld;
		local l__Weld__132 = v123.Main.LeftHip.Weld;
		local l__Weld__133 = v123.RightLeg.Upper.Knee.Weld;
		local l__Weld__134 = v123.LeftLeg.Upper.Knee.Weld;
		local l__C1__12 = l__Weld__131.C1;
		local l__C1__13 = l__Weld__132.C1;
		local l__C1__14 = l__Weld__133.C1;
		local l__C1__15 = l__Weld__134.C1;
		coroutine.resume(coroutine.create(function()
			local v135 = 1 - 1;
			while true do
				l__Weld__131.C1 = l__C1__12 * CFrame.Angles(0, 0, -v135 * 0.04);
				l__Weld__132.C1 = l__C1__13 * CFrame.Angles(0, 0, -v135 * 0.04);
				l__Weld__133.C1 = l__C1__14 * CFrame.Angles(0, 0, v135 * 0.06);
				l__Weld__134.C1 = l__C1__15 * CFrame.Angles(0, 0, v135 * 0.06);
				wait(0.03);
				if 0 <= 1 then
					if v135 < 20 then

					else
						break;
					end;
				elseif 20 < v135 then

				else
					break;
				end;
				v135 = v135 + 1;			
			end;
		end));
		playSoundEffect("SlideClosed", v123.Torso);
		v125.cframe = CFrame.new(v123.Torso.Position, (Vector3.new(v122.Position.x, v123.Torso.Position.y, v122.Position.z - 1)));
		v124.position = v123.Torso.Position + Vector3.new(0, 8, 0);
		if l__Parent__1.Cutscene.Continue.Visible then
			l__Parent__1.Cutscene.Continue.Visible = false;
		end;
		while true do
			wait(0.06);
			if u11 then

			else
				break;
			end;		
		end;
		u9 = l__Level__3.Map6Task.CutsceneData3;
		u8 = u9:GetChildren();
		l__CurrentCamera__2.CoordinateFrame = u9["1"].c1.Value;
		l__CurrentCamera__2.Focus = u9["1"].f1.Value;
		local l__Cutscene__136 = script.Parent.Cutscene;
		l__Cutscene__136.NameText.Text = "TRUTH TELLER";
		l__Cutscene__136.NameText.Visible = true;
		wait(3);
		l__Cutscene__136.NameText.Visible = false;
		--coroutine.resume(coroutine.create(function()
		--	local v137 = #u8;
		--	local v138 = 2 - 1;
		--	while true do
		--		local v139 = u9[tostring(v138)];
		--		tweenCam(v139.c1.Value, v139.f1.Value, v139.step.Value, v139.FOV.Value, v139.Roll.Value, v139.Style.Value);
		--		if 0 <= 1 then
		--			if v138 < v137 then

		--			else
		--				break;
		--			end;
		--		elseif v137 < v138 then

		--		else
		--			break;
		--		end;
		--		v138 = v138 + 1;			
		--	end;
		--end));
		local l__Weld__140 = v123.RightArm.Wrist.Weld;
		v123.Head.StartSpin:Play();
		coroutine.resume(coroutine.create(function()
			wait(v123.Head.StartSpin.TimeLength - 0.02);
			v123.Head.KeepSpin:Play();
		end));
		local u16 = true;
		local u17 = 0;
		local u18 = 0;
		local l__C1__19 = l__Weld__140.C1;
		coroutine.resume(coroutine.create(function()
			while true do
				if u16 then

				else
					break;
				end;
				u17 = u17 + 0.1 * u18;
				if u18 < 4 then
					u18 = u18 + 0.1;
				end;
				if math.pi * 2 < u17 then
					u17 = u17 - math.pi * 2;
				end;
				l__Weld__140.C1 = l__C1__19 * CFrame.Angles(u17, 0, 0);
				wait(0.03);			
			end;
			v123.Head.KeepSpin:Stop();
			v123.Head.StopSpin:Play();
		end));
		while true do
			wait(0.03);
			if not (4 <= u18) then

			else
				break;
			end;		
		end;
		local v141 = 1 - 1;
		while true do
			if v141 == 10 then
				playSoundEffect("Died", v119.Head);
			end;
			u7(v123.RightArm.Hand["Chaingun" .. math.random(1, 3)], v119.Torso);
			wait(0.06);
			if 0 <= 1 then
				if v141 < 20 then

				else
					break;
				end;
			elseif 20 < v141 then

			else
				break;
			end;
			v141 = v141 + 1;		
		end;
		u16 = false;
		wait(0.3);
	end)(l__Level__3.Map6Task.Screen.Dialogue);
	l__Level__3.Map6Task.Screen.SurfaceGui.ImageLabel.Image = "http://www.roblox.com/asset/?id=73827812";
	local v142 = 1 - 1;
	while true do
		wait();
		l__Cutscene__100.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v142, 0);
		l__Cutscene__100.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v142, 0);
		if 0 <= 1 then
			if v142 < 20 then

			else
				break;
			end;
		elseif 20 < v142 then

		else
			break;
		end;
		v142 = v142 + 1;	
	end;
	l__Torso__99.CFrame = CFrame.new(-59.9, 209.4, -85.9) * CFrame.Angles(-math.pi, 0, -math.pi);
	wait(0.06);
	script.Parent.LocalScript.LocalPause.Value = false;
	l__CurrentCamera__2.CameraSubject = l__Character__98.Humanoid;
	l__CurrentCamera__2.CameraType = "Custom";
	l__CurrentCamera__2.FieldOfView = 70;
	handleGUIs(true);
end;
function event5()
	local v143 = l__Level__3.Map6Task:GetChildren();
	local v144 = #v143;
	local v145 = 1;
	while true do
		if v143[v145].Name == "Gate" then
			coroutine.resume(coroutine.create(function()
				v143[v145].CFrame = v143[v145].CFrame + Vector3.new(0, 15, 0);
			end));
		end;
		if 0 <= 1 then
			if v145 < v144 then

			else
				break;
			end;
		elseif v144 < v145 then

		else
			break;
		end;
		v145 = v145 + 1;	
	end;
	if l__Level__3.Parent.Map:findFirstChild("TruthTeller") then
		l__Level__3.Parent.Map.TruthTeller:Destroy();
	end;
	if l__Level__3.Parent.Map:findFirstChild("Dr. Umar Tamid") then
		l__Level__3.Parent.Map["Dr. Umar Tamid"]:Destroy();
	end;
	if l__Level__3.Map6Task:findFirstChild("Dr. Umar Tamid") then
		l__Level__3.Map6Task["Dr. Umar Tamid"]:Destroy();
	end;
	local v146 = l__GameItems__5.MasterLevels.Level4.Extras["Dr. Umar Tamid Dead"]:Clone();
	v146.Name = "Dr. Umar Tamid";
	v146.Parent = l__Level__3.Parent.Map;
	l__Level__3.Map6Task.Screen.SurfaceGui.LoadingBar.Visible = false;
	l__Level__3.Map6Task.Screen.SurfaceGui.Text.Visible = false;
	l__Level__3.Map6Task.Screen.SurfaceGui.Frame.BackgroundTransparency = 1;
	l__Level__3.Map6Task.Screen.SurfaceGui.ImageLabel.Image = "http://www.roblox.com/asset/?id=73827812";
	local v147 = (function(p33, p34)
		local v148 = l__GameItems__5.MasterModels[p33]:Clone();
		v148.Parent = l__Level__3.Parent.Map;
		v148:MakeJoints();
		v148.Torso.CFrame = p34;
		l__Level__3.Map6Task.Bots.Value = l__Level__3.Map6Task.Bots.Value + 1;
		v148.Stats.Counter.Value = l__Level__3.Map6Task.Bots;
		v148.Stats.WaitTime.Value = 1;
		if p33 == "TruthTeller" then
			v148.Stats.OffsetMaxX.Value = 56;
			v148.Stats.OffsetMaxZ.Value = 28;
			v148.Stats.OffsetMinX.Value = -60;
			v148.Stats.OffsetMinZ.Value = -28;
		else
			v148.Stats.OffsetMaxX.Value = 1000;
			v148.Stats.OffsetMaxZ.Value = 1000;
			v148.Stats.OffsetMinX.Value = -1000;
			v148.Stats.OffsetMinZ.Value = -1000;
		end;
		local v149 = v148.MainControlNPC:clone();
		v149.Name = "MapScript";
		v149.Parent = script.Parent;
		local v150 = Instance.new("ObjectValue");
		v150.Name = "LinkedModel";
		v150.Value = v148;
		v150.Parent = v149;
		v149.Disabled = false;
		return v148;
	end)("TruthTeller", CFrame.new((Vector3.new(-174.8, 202.5, -75.5))));
	l__Parent__1.Interface.Info.BossHealth.Visible = true;
	l__Parent__1.Interface.Info.BossHealth.HealthText.Text = "TRUTHTELLER";
	l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new(1, 0, 1, 0);
	while true do
		if 0 < v147.Humanoid.Health then

		else
			break;
		end;
		l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new(v147.Humanoid.Health / v147.Humanoid.MaxHealth, 0, 1, 0);
		wait(0.09);	
	end;
	l__Parent__1.Interface.Info.BossHealth.Visible = false;
	l__Parent__1.Interface.Info.MissionText.Text = "GET TO THE ROOF";
	local v151 = 1 - 1;
	while true do
		l__Level__3.Map6Task.StairsGate.CFrame = l__Level__3.Map6Task.StairsGate.CFrame - Vector3.new(0, 0.25, 0);
		wait(0.03);
		if 0 <= 1 then
			if v151 < 80 then

			else
				break;
			end;
		elseif 80 < v151 then

		else
			break;
		end;
		v151 = v151 + 1;	
	end;
	while true do
		wait();
		if not (233.5 < l__LocalPlayer__1.Character.Torso.Position.y) then

		else
			break;
		end;	
	end;
	l__Level__3.Map6Task.RoofBlockade.CanCollide = true;
	local v152 = 1 - 1;
	while true do
		l__Level__3.Map6Task.RoofGate.CFrame = l__Level__3.Map6Task.RoofGate.CFrame - Vector3.new(0.25, 0, 0);
		wait(0.03);
		if 0 <= 1 then
			if v152 < 68 then

			else
				break;
			end;
		elseif 68 < v152 then

		else
			break;
		end;
		v152 = v152 + 1;	
	end;
end;
function runMainControlFlagship(p35)
	local l__Humanoid__153 = p35.Humanoid;
	local l__Head__154 = p35.Head;
	local u20 = Vector3.new(-147.8, 233, -75.6);
	local u21 = Vector3.new();
	local function v155()
		local v156 = nil;
		while true do
			local v157 = math.random() * math.pi * 2;
			v156 = u20 + Vector3.new(math.cos(v157) * 80, 60, math.sin(v157) * 80);
			wait();
			if not (50 < (v156 - u21).magnitude) then

			else
				break;
			end;		
		end;
		u21 = v156;
	end;
	v155();
	local function v158(p36, p37)
		local v159 = p36:GetChildren();
		for _,part in v159 do
			if part:IsA("Part") then
				if not part:IsA("WedgePart") then
					if not part:IsA("UnionOperation") then
						if part.Name ~= "Beam" then
							part.BrickColor = BrickColor.new(p37)
						end
					end
				elseif part.Name ~= "Beam" then
					part.BrickColor = BrickColor.new(p37)
				end
			end
		end
	end;
	v158(p35.Flames, "Black");
	v158(p35.GaussCannon1, "White");
	v158(p35.GaussCannon2, "White");
	v158(p35.GaussCannon3, "White");
	v158(p35.GaussCannon4, "White");
	local function u22(p38, p39, p40)
		local v162 = Instance.new("BillboardGui");
		v162.Size = UDim2.new(1, 0, 1, 0);
		v162.StudsOffset = Vector3.new(math.random(-1, 1), 1.65, math.random(-1, 1));
		local v163 = l__GameItems__5.MasterGuis.DamageFrame:clone();
		v163.Parent = v162;
		if p39 == 0 then
			v163.TextLabel.Text = "-" .. p39;
			v163.TextLabel.TextStrokeColor3 = Color3.new(0, 0, 1);
		elseif p39 < 0 then
			v163.TextLabel.Text = "+" .. p39;
			v163.TextLabel.TextStrokeColor3 = Color3.new(0, 1, 0);
		else
			v163.TextLabel.Text = "-" .. p39;
			v163.TextLabel.TextStrokeColor3 = Color3.new(1, 0, 0);
		end;
		v162.Parent = p40;
		v162.Adornee = p40;
		local l__BillboardControl__164 = v163.BillboardControl;
		l__BillboardControl__164.Billboard.Value = v162;
		l__BillboardControl__164.Parent = script.Parent;
		l__BillboardControl__164.Disabled = false;
		l__Debris__2:AddItem(v162, 5);
	end;
	local function u23(p41)
		local l__X__165 = p41.Position.X;
		local l__Y__166 = p41.Position.Y;
		local l__Z__167 = p41.Position.Z;
		local l__X__168 = p41.Size.X;
		local l__Y__169 = p41.Size.Y;
		local l__Z__170 = p41.Size.Z;
		local v171 = p41.CFrame - p41.CFrame.p;
		p41:Destroy();
		local v172 = Instance.new("Part");
		v172.Name = "Averter";
		v172.FormFactor = 0;
		v172.Size = Vector3.new(1, 1, 1);
		v172.BrickColor = p41.BrickColor;
		v172.Material = p41.Material;
		v172.Shape = 1;
		v172.BottomSurface = 0;
		v172.TopSurface = 0;
		v172.Reflectance = p41.Reflectance;
		v172.Transparency = p41.Transparency;
		v172.CanCollide = false;
		local v173 = 0;
		local v174 = l__X__168 - 1;
		local v175 = 0 - 1;
		while true do
			local v176 = l__Y__169 - 1;
			local v177 = 0 - 1;
			while true do
				local v178 = l__Z__170 - 1;
				local v179 = 0 - 1;
				while true do
					newNP = v172:clone();
					newNP.Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
					newNP.CFrame = CFrame.new(l__X__165 - (l__X__168 - 1) / 2 + v175, l__Y__166 - (l__Y__169 - 1) / 2 + v177, l__Z__167 - (l__Z__170 - 1) / 2 + v179) * v171;
					l__Debris__2:AddItem(newNP, 0.5);
					newNP.Parent = l__CurrentCamera__2;
					v173 = v173 + 1;
					if 16 < v173 then
						return;
					end;
					if 0 <= 1 then
						if v179 < v178 then

						else
							break;
						end;
					elseif v178 < v179 then

					else
						break;
					end;
					v179 = v179 + 1;				
				end;
				if 0 <= 1 then
					if v177 < v176 then

					else
						break;
					end;
				elseif v176 < v177 then

				else
					break;
				end;
				v177 = v177 + 1;			
			end;
			if 0 <= 1 then
				if v175 < v174 then

				else
					break;
				end;
			elseif v174 < v175 then

			else
				break;
			end;
			v175 = v175 + 1;		
		end;
	end;
	local v180 = Instance.new("Part");
	v180.FormFactor = Enum.FormFactor.Custom;
	v180.Size = Vector3.new(0.2, 0.2, 1);
	v180.BrickColor = BrickColor.new("Bright red");
	v180.CanCollide = false;
	v180.Anchored = true;
	v180.Transparency = 0.3;
	v180.TopSurface = Enum.SurfaceType.Smooth;
	v180.BottomSurface = Enum.SurfaceType.Smooth;
	v180.Name = "Averter";
	local l__Torso__24 = p35.Torso;
	local function u25(p42, p43)
		local v181 = p42.Parent:findFirstChild("Humanoid") or p42.Parent.Parent:findFirstChild("Humanoid");
		if v181 then
			if p42.Name == "Torso" then
				if not game.Players:findFirstChild(v181.Parent.Name) then
					if v181.Parent:findFirstChild("MainControlVRT") then
						if 0 < v181.Health then
							if not v181.Parent:findFirstChild("ForceField") then
								if v181.Parent:findFirstChild("Head") then
									local v182 = p43;
									if p42.Name == "Head" then
										v182 = math.ceil(v182 * 2);
									elseif p42.Name == "Torso" then
										v182 = math.ceil(v182 * 1.5);
									end;
									v181:TakeDamage(v182);
									u22(v181, v182, v181.Parent.Head);
									return;
								else
									return;
								end;
							else
								return;
							end;
						else
							return;
						end;
					elseif p42.Name ~= "Glass" then
						if p42.Name == "Breakable" then

						else
							if p42.Name == "Explosive" then
								if p42:findFirstChild("Explode") then
									p42.Explode.Value = true;
								else
									return;
								end;
							end;
							return;
						end;
					end;
				elseif 0 < v181.Health then
					if not v181.Parent:findFirstChild("ForceField") then
						if v181.Parent:findFirstChild("Head") then
							v182 = p43;
							if p42.Name == "Head" then
								v182 = math.ceil(v182 * 2);
							elseif p42.Name == "Torso" then
								v182 = math.ceil(v182 * 1.5);
							end;
							v181:TakeDamage(v182);
							u22(v181, v182, v181.Parent.Head);
							return;
						else
							return;
						end;
					else
						return;
					end;
				else
					return;
				end;
			elseif p42.Name ~= "Glass" then
				if p42.Name == "Breakable" then

				else
					if p42.Name == "Explosive" then
						if p42:findFirstChild("Explode") then
							p42.Explode.Value = true;
						else
							return;
						end;
					end;
					return;
				end;
			end;
		elseif p42.Name ~= "Glass" then
			if p42.Name == "Breakable" then

			else
				if p42.Name == "Explosive" then
					if p42:findFirstChild("Explode") then
						p42.Explode.Value = true;
					else
						return;
					end;
				end;
				return;
			end;
		end;
		u23(p42);
	end;
	l__Humanoid__153.Died:connect(function()
		coroutine.resume(coroutine.create(function()
			waitTime(400);
			p35:Destroy();
		end));
		if p35:findFirstChild("Torso") then
			if 0 < l__Torso__24.Position.y then
				local v183 = Instance.new("Explosion");
				v183.Position = l__Torso__24.Position;
				v183.BlastPressure = 0;
				v183.BlastRadius = 16;
				v183.Parent = l__CurrentCamera__2;
				l__Debris__2:AddItem(v183, 3);
				p35:BreakJoints();
				l__Torso__24.BodyGyro:Destroy();
				l__Torso__24.BodyPosition:Destroy();
				local v184 = script.Parent:FindFirstChild("SoundScript");
				if v184 then
					v184 = Instance.new("StringValue");
					v184.Name = "Sound";
					v184.Value = "RoboticExplosion";
					local v185 = Instance.new("ObjectValue");
					v185.Name = "Location";
					v185.Value = l__Torso__24;
					v185.Parent = v184;
					v184.Parent = script.Parent.SoundScript.Effects;
				end;
				local function u26(p44)
					local v186 = p44:GetChildren();
					local v187 = #v186;
					local v188 = 1;
					while true do
						if v186[v188] then
							if v186[v188]:IsA("Part") then
								v186[v188].Velocity = Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20));
							elseif v186[v188] then
								if v186[v188]:IsA("Model") then
									u26(v186[v188]);
								end;
							end;
						elseif v186[v188] then
							if v186[v188]:IsA("Model") then
								u26(v186[v188]);
							end;
						end;
						if 0 <= 1 then
							if v188 < v187 then

							else
								break;
							end;
						elseif v187 < v188 then

						else
							break;
						end;
						v188 = v188 + 1;					
					end;
				end;
				u26(p35);
			end;
		end;
	end);
	local u27 = "None";
	local u28 = false;
	local function u29(p45)
		if u27 == "Laser" then

		elseif u27 == "Bomb" then
			l__Torso__24.BodyGyro.cframe = CFrame.new(l__Torso__24.Position, u21);
			return;
		else
			l__Torso__24.BodyGyro.cframe = CFrame.new(l__Torso__24.Position, l__LocalPlayer__1.Character.Torso.Position - Vector3.new(0, 2, 0));
			return;
		end;
		l__Torso__24.BodyGyro.cframe = CFrame.new(l__Torso__24.Position, (Vector3.new(l__LocalPlayer__1.Character.Torso.Position.x, l__Torso__24.Position.y, l__LocalPlayer__1.Character.Torso.Position.z)));
		l__Torso__24.BodyGyro.cframe = l__Torso__24.BodyGyro.cframe * CFrame.Angles(-math.pi / 2, 0, 0);
	end;
	local l__Stats__30 = p35.Stats;
	local function v189(p46)
		if 0 < l__Humanoid__153.Health then
			local v190 = nil;
			if l__Humanoid__153.Health < 100 then
				l__Humanoid__153.Health = 100;
			end;
			if l__LocalPlayer__1.Character then
				if not l__LocalPlayer__1.Character:findFirstChild("Torso") then
					return;
				end;
			else
				return;
			end;
			if u28 then
				return;
			end;
			if l__Humanoid__153.Health < 401 then
				u28 = true;
				return;
			end;
			u29(l__LocalPlayer__1.Character.Torso.Position);
			local v191, v192, v193 = l__Torso__24.CFrame:toEulerAnglesXYZ();
			v190 = math.deg(v192 + math.pi / 2);
			
			local v194
			
			if 0 < l__Torso__24.CFrame.lookVector.Z then
				v194 = v190 + 180;
			else
				v194 = 180 - v190;
			end;
			l__Stats__30.RadarRotation.Value = math.ceil(v194 + 180);
		end;
	end;
	local u31 = 2;
	local u32 = "Laser";
	local u33 = false;
	local u34 = 0;
	local v195 = 1;
	
	print("OK")
	
	local parts = {}
	
	p35["GaussCannon" .. v195].Beam.Touched:Connect(function(hit)
		local didHit = false
		
		if hit.Name == "Torso" then
			table.insert(parts, hit)
			
			u25(hit, 4)
			
			waitTime(3)
			
			for _,part in parts do
				if part == hit then
					didHit = true
				end
			end
			
		end
		
		if didHit then
			print("OK?")
		end
	end)
	
	
	--while true do
	--	local u35 = { nil };
	--	local u36 = v195;
	--	p35["GaussCannon" .. v195].Beam.Touched:connect(function(p47)
	--		if p47.Name ~= "Torso" then
	--			if p47.Name == "Breakable" then
	--				table.insert(u35, p47);
	--				local v196 = true;
	--				while true do
	--					if v196 then

	--					else
	--						break;
	--					end;
	--					if p47 then

	--					else
	--						break;
	--					end;
	--					if p47.Parent then

	--					else
	--						break;
	--					end;
	--					if p35:findFirstChild("GaussCannon" .. u36) then

	--					else
	--						break;
	--					end;
	--					if p35["GaussCannon" .. u36].Beam.Transparency < 1 then

	--					else
	--						break;
	--					end;
	--					u25(p47, 4);
	--					waitTime(3);
	--					local v197 = #u35;
	--					local v198 = 1;
	--					while true do
	--						if u35[v198] == p47 then
	--							v196 = true;
	--							break;
	--						end;
	--						if 0 <= 1 then
	--							if v198 < v197 then

	--							else
	--								break;
	--							end;
	--						elseif v197 < v198 then

	--						else
	--							break;
	--						end;
	--						v198 = v198 + 1;						
	--					end;					
	--				end;
	--			else
	--				--break;
	--			end;
	--		else
	--			table.insert(u35, p47);
	--			v196 = true;
	--			while true do
	--				if v196 then

	--				else
	--					break;
	--				end;
	--				if p47 then

	--				else
	--					break;
	--				end;
	--				if p47.Parent then

	--				else
	--					break;
	--				end;
	--				if p35:findFirstChild("GaussCannon" .. u36) then

	--				else
	--					break;
	--				end;
	--				if p35["GaussCannon" .. u36].Beam.Transparency < 1 then

	--				else
	--					break;
	--				end;
	--				u25(p47, 4);
	--				waitTime(3);
	--				local v197 = #u35;
	--				local v198 = 1;
	--				while true do
	--					if u35[v198] == p47 then
	--						v196 = true;
	--						break;
	--					end;
	--					if 0 <= 1 then
	--						if v198 < v197 then

	--						else
	--							break;
	--						end;
	--					elseif v197 < v198 then

	--					else
	--						break;
	--					end;
	--					v198 = v198 + 1;					
	--				end;				
	--			end;
	--		end;
	--	end);
	--	p35["GaussCannon" .. u36].Beam.TouchEnded:connect(function(p48)
	--		if p48.Name ~= "Torso" then
	--			if p48.Name == "Breakable" then
	--				local v199 = #u35;
	--				local v200 = 1;
	--				while true do
	--					if u35[v200] == p48 then
	--						table.remove(u35, v200);
	--						return;
	--					end;
	--					if 0 <= 1 then
	--						if v200 < v199 then

	--						else
	--							break;
	--						end;
	--					elseif v199 < v200 then

	--					else
	--						break;
	--					end;
	--					v200 = v200 + 1;					
	--				end;
	--			else
	--				--break;
	--			end;
	--		else
	--			local v199 = #u35;
	--			local v200 = 1;
	--			while true do
	--				if u35[v200] == p48 then
	--					table.remove(u35, v200);
	--					return;
	--				end;
	--				if 0 <= 1 then
	--					if v200 < v199 then

	--					else
	--						break;
	--					end;
	--				elseif v199 < v200 then

	--				else
	--					break;
	--				end;
	--				v200 = v200 + 1;				
	--			end;
	--		end;
	--	end);
	--	if 0 <= 1 then
	--		if u36 < 4 then

	--		else
	--			break;
	--		end;
	--	elseif 4 < u36 then

	--	else
	--		break;
	--	end;
	--	u36 = u36 + 1;	
	--end;
	local function u37(p49)
		local v201 = 0
		
		local u21 = Vector3.new(p35.Torso.Position.X, l__LocalPlayer__1.Character.Torso.Position.y + 60, p35.Torso.Position.Z);
		
		if (u21 - l__Torso__24.Position).magnitude < 5 then
			
		else
			if u27 == "Bomb" then
				v201 = 300;
			else
				v201 = 600;
			end;
			l__Torso__24.BodyPosition.position = l__Torso__24.Position + (u21 - l__Torso__24.Position).unit * p49 * v201;
			return;
		end;
		u31 = u31 - 1;
		if u31 < 1 then
			if u32 == "None" then
				local v202 = 1;
				while true do
					if p35:findFirstChild("GaussCannon" .. v202) then
						p35["GaussCannon" .. v202].Beam.Transparency = 1;
						p35["GaussCannon" .. v202].PartialBeam.Transparency = 1;
					end;
					if 0 <= 1 then
						if v202 < 4 then

						else
							break;
						end;
					elseif 4 < v202 then

					else
						break;
					end;
					v202 = v202 + 1;				
				end;
				u27 = u32;
				if u33 then
					u32 = "Laser";
				else
					u32 = "Bomb";
				end;
				u31 = 2;
			elseif u32 == "Bomb" then
				local v203 = 1;
				while true do
					if p35:findFirstChild("GaussCannon" .. v203) then
						p35["GaussCannon" .. v203].Beam.Transparency = 1;
						p35["GaussCannon" .. v203].PartialBeam.Transparency = 1;
					end;
					if 0 <= 1 then
						if v203 < 4 then

						else
							break;
						end;
					elseif 4 < v203 then

					else
						break;
					end;
					v203 = v203 + 1;				
				end;
				u27 = u32;
				u32 = "None";
				u31 = 3;
			else
				u34 = 0;
				local v204 = 1;
				while true do
					if p35:findFirstChild("GaussCannon" .. v204) then
						p35["GaussCannon" .. v204].PartialBeam.Transparency = 0.3;
					end;
					if 0 <= 1 then
						if v204 < 4 then

						else
							break;
						end;
					elseif 4 < v204 then

					else
						break;
					end;
					v204 = v204 + 1;				
				end;
				u27 = u32;
				u32 = "None";
				u31 = 1;
			end;
		end;
		v155();
	end;
	local function u38(p50)
		local v205 = Instance.new("BillboardGui");
		local v206 = Instance.new("Frame");
		v206.Size = UDim2.new(0, 50, 0, 50);
		v206.BackgroundTransparency = 1;
		v206.Parent = v205;
		local v207 = Instance.new("ImageLabel");
		v207.Size = UDim2.new(0, 50, 0, 50);
		v207.BackgroundTransparency = 1;
		v207.ImageTransparency = 0.9;
		v207.Image = "http://www.roblox.com/asset/?id=97435923";
		v207.Parent = v206;
		v205.Name = "TrackingGui";
		v205.Adornee = p50;
		v205.AlwaysOnTop = true;
		v205.Size = UDim2.new(0, 50, 0, 50);
		v205.Parent = p50;
	end;
	local u39 = 0;
	local function v208(p51)
		l__Parent__1.Interface.Info.BossHealth.HealthBar.Size = UDim2.new((p35.Humanoid.Health - 400) / (p35.Humanoid.MaxHealth - 400), 0, 1, 0);
		if l__LocalPlayer__1.Character then
			if l__LocalPlayer__1.Character:findFirstChild("Torso") then
				if l__Humanoid__153.Health < 1 then
					return;
				end;
			else
				return;
			end;
		else
			return;
		end;
		if u28 then
			return;
		end;
		if l__Humanoid__153.Health < 401 then
			u28 = true;
			return;
		end;
		u37(p51);
		if u33 then
			local v209 = 1;
			while true do
				if p35:findFirstChild("GaussCannon" .. v209) then
					if p35["GaussCannon" .. v209].Health.Value < 1 then
						p35["GaussCannon" .. v209].Beam.Transparency = 1;
						p35["GaussCannon" .. v209].PartialBeam.Transparency = 1;
						p35["GaussCannon" .. v209].PartialBeam.TrackingGui:Destroy();
						runExplosion(p35["GaussCannon" .. v209].PartialBeam, 12, "ExplodeSound");
						l__Debris__2:AddItem(p35["GaussCannon" .. v209], 1);
						p35["GaussCannon" .. v209]:BreakJoints();
						local v210 = p35["GaussCannon" .. v209]:GetChildren();
						local v211 = #v210;
						local v212 = 1;
						while true do
							if not v210[v212]:IsA("Part") then
								if v210[v212]:IsA("UnionOperation") then
									v210[v212].Velocity = Vector3.new(math.random(-40, 40), math.random(0, 40), math.random(-40, 40));
								end;
							else
								v210[v212].Velocity = Vector3.new(math.random(-40, 40), math.random(0, 40), math.random(-40, 40));
							end;
							if 0 <= 1 then
								if v212 < v211 then

								else
									break;
								end;
							elseif v211 < v212 then

							else
								break;
							end;
							v212 = v212 + 1;						
						end;
						p35["GaussCannon" .. v209].Name = "DestroyedCannon";
						l__Humanoid__153.Health = l__Humanoid__153.Health - 700;
					end;
				end;
				if 0 <= 1 then
					if v209 < 4 then

					else
						break;
					end;
				elseif 4 < v209 then

				else
					break;
				end;
				v209 = v209 + 1;			
			end;
			if l__Humanoid__153.Health < 1201 then
				u33 = false;
				while true do
					if p35.Flames:FindFirstChild("MainFire") then

					else
						break;
					end;
					u38(p35.Flames.MainFire);
					p35.Flames.MainFire.Name = "Fire";				
				end;
				v158(p35.Flames, "Bright orange");
			end;
		end;
		local v213 = p35.Flames:GetChildren();
		local v214 = #v213;
		local v215 = 1;
		--while true do
		--	if v213[v215].Name == "Fire" then
		--		if v213[v215].Health.Value < 1 then
		--			if v213[v215]:FindFirstChild("TrackingGui") then
		--				v213[v215].TrackingGui:Destroy();
		--			end;
		--			runExplosion(v213[v215], 8, "ExplodeSound");
		--			v213[v215].BrickColor = BrickColor.new("Black");
		--			v213[v215].Fire:Destroy();
		--			local v216 = Instance.new("Smoke");
		--			v216.Color = Color3.new(0.3176470588235294, 0.3176470588235294, 0.3176470588235294);
		--			v216.Opacity = 0.2;
		--			v216.Size = 0.2;
		--			v216.Parent = v213[v215];
		--			v213[v215].Name = "Smoke";
		--			l__Humanoid__153.Health = l__Humanoid__153.Health - 150;
		--		end;
		--	end;
		--	if 0 <= 1 then
		--		if v215 < v214 then

		--		else
		--			break;
		--		end;
		--	elseif v214 < v215 then

		--	else
		--		break;
		--	end;
		--	v215 = v215 + 1;		
		--end;
		if u27 == "Laser" then
			u34 = u34 + 1;
			if 20 < u34 then
				local v217 = 1;
				while true do
					if p35:findFirstChild("GaussCannon" .. v217) then
						p35["GaussCannon" .. v217].Beam.Transparency = 0.3;
					end;
					if 0 <= 1 then
						if v217 < 4 then

						else
							break;
						end;
					elseif 4 < v217 then

					else
						break;
					end;
					v217 = v217 + 1;				
				end;
			end;
		end;
		if u27 == "Bomb" then
			u39 = u39 + 1;
			if not (40 < u39) then
				if l__Humanoid__153.Health < 800 then
					if 20 < u39 then
						u39 = 0;
						local v218 = l__GameItems__5.MasterLevels.Level4.Extras.Bomb:Clone();
						v218.CFrame = l__Torso__24.CFrame;
						v218.Parent = p35.Parent;
						coroutine.resume(coroutine.create(function()
							local v219 = 6;
							while true do
								if 0 < v219 then

								else
									break;
								end;
								local v220 = 1 - 1;
								while true do
									if not v218.Parent then
										return;
									end;
									v218.PointLight.Enabled = false;
									v218.Mesh.TextureId = "";
									waitTime(v219);
									if not v218.Parent then
										return;
									end;
									v218.PointLight.Enabled = true;
									v218.Mesh.TextureId = "http://www.roblox.com/asset/?id=91443246";
									waitTime(v219);
									if 0 <= 1 then
										if v220 < 2 then

										else
											break;
										end;
									elseif 2 < v220 then

									else
										break;
									end;
									v220 = v220 + 1;								
								end;
								v219 = v219 - 1;							
							end;
							local v221 = Instance.new("Explosion");
							v221.Position = v218.Position;
							v221.BlastPressure = 0;
							v221.BlastRadius = 12;
							local u40 = true;
							v221.Hit:connect(function(p52, p53)
								if p52.Name == "Breakable" then
									if p53 < 6 then
										u25(p52, 4);
										return;
									end;
								end;
								if not u40 then
									return;
								end;
								u40 = true;
								local l__Humanoid__222 = p52.Parent:FindFirstChild("Humanoid");
								if l__Humanoid__222 then
									if l__Humanoid__222 == l__LocalPlayer__1.Character.Humanoid then
										u25(p52, (math.floor(50 * (1 - p53 / v221.BlastRadius))));
									end;
								end;
							end);
							v221.Parent = l__CurrentCamera__2;
							l__Debris__2:AddItem(v221, 3);
							v218:Destroy();
							playSoundEffect("ExplodeSound", v218);
						end));
					end;
				end;
			else
				u39 = 0;
				v218 = l__GameItems__5.MasterLevels.Level4.Extras.Bomb:Clone();
				v218.CFrame = l__Torso__24.CFrame;
				v218.Parent = p35.Parent;
				coroutine.resume(coroutine.create(function()
					v219 = 6;
					while true do
						if 0 < v219 then

						else
							break;
						end;
						v220 = 1 - 1;
						while true do
							if not v218.Parent then
								return;
							end;
							v218.PointLight.Enabled = false;
							v218.Mesh.TextureId = "";
							waitTime(v219);
							if not v218.Parent then
								return;
							end;
							v218.PointLight.Enabled = true;
							v218.Mesh.TextureId = "http://www.roblox.com/asset/?id=91443246";
							waitTime(v219);
							if 0 <= 1 then
								if v220 < 2 then

								else
									break;
								end;
							elseif 2 < v220 then

							else
								break;
							end;
							v220 = v220 + 1;						
						end;
						v219 = v219 - 1;					
					end;
					v221 = Instance.new("Explosion");
					v221.Position = v218.Position;
					v221.BlastPressure = 0;
					v221.BlastRadius = 12;
					u40 = true;
					v221.Hit:connect(function(p52, p53)
						if p52.Name == "Breakable" then
							if p53 < 6 then
								u25(p52, 4);
								return;
							end;
						end;
						if not u40 then
							return;
						end;
						u40 = true;
						l__Humanoid__222 = p52.Parent:FindFirstChild("Humanoid");
						if l__Humanoid__222 then
							if l__Humanoid__222 == l__LocalPlayer__1.Character.Humanoid then
								u25(p52, (math.floor(50 * (1 - p53 / v221.BlastRadius))));
							end;
						end;
					end);
					v221.Parent = l__CurrentCamera__2;
					l__Debris__2:AddItem(v221, 3);
					v218:Destroy();
					playSoundEffect("ExplodeSound", v218);
				end));
			end;
		end;
	end;
	coroutine.resume(coroutine.create(function()
		while true do
			wait();
			if not (u31 < 2) then

			else
				break;
			end;		
		end;
		v158(p35.GaussCannon1, "Bright orange");
		v158(p35.GaussCannon2, "Bright orange");
		v158(p35.GaussCannon3, "Bright orange");
		v158(p35.GaussCannon4, "Bright orange");
		u38(p35.GaussCannon1.PartialBeam);
		u38(p35.GaussCannon2.PartialBeam);
		u38(p35.GaussCannon3.PartialBeam);
		u38(p35.GaussCannon4.PartialBeam);
		u33 = true;
	end));
	wait(0.15);
	l__Torso__24.Anchored = false;
	while true do
		if p35 then

		else
			break;
		end;
		if p35.Parent then

		else
			break;
		end;
		local v223, v224 = wait();
		if p35 then

		else
			break;
		end;
		if p35.Parent then

		else
			break;
		end;
		if script.Parent:findFirstChild("LocalScript") then
			if script.Parent.LocalScript:findFirstChild("LocalPause") then
				if script.Parent.LocalScript.LocalPause.Value then
					if l__CurrentCamera__2.CameraType ~= "Scriptable" then
						if u28 then
							v189(v224);
							v208(v223);
							local v225 = 1 - 1;
							while true do
								wait();
								if p35 then

								else
									break;
								end;
								if p35.Parent then

								else
									break;
								end;
								v208(v223);
								if 0 <= 1 then
									if v225 < 3 then

									else
										break;
									end;
								elseif 3 < v225 then

								else
									break;
								end;
								v225 = v225 + 1;							
							end;
						end;
					else
						v189(v224);
						v208(v223);
						v225 = 1 - 1;
						while true do
							wait();
							if p35 then

							else
								break;
							end;
							if p35.Parent then

							else
								break;
							end;
							v208(v223);
							if 0 <= 1 then
								if v225 < 3 then

								else
									break;
								end;
							elseif 3 < v225 then

							else
								break;
							end;
							v225 = v225 + 1;						
						end;
					end;
				else
					v189(v224);
					v208(v223);
					v225 = 1 - 1;
					while true do
						wait();
						if p35 then

						else
							break;
						end;
						if p35.Parent then

						else
							break;
						end;
						v208(v223);
						if 0 <= 1 then
							if v225 < 3 then

							else
								break;
							end;
						elseif 3 < v225 then

						else
							break;
						end;
						v225 = v225 + 1;					
					end;
				end;
			else
				v189(v224);
			end;
		else
			v189(v224);
		end;	
	end;
end;
function event6()
	local function v226(p54, p55)
		local v227 = l__GameItems__5.MasterModels[p54]:clone();
		v227.Parent = l__Level__3.Parent.Map;
		v227:MakeJoints();
		v227.Torso.CFrame = p55;
		l__Level__3.Map7Task.Bots.Value = l__Level__3.Map7Task.Bots.Value + 1;
		v227.Stats.Counter.Value = l__Level__3.Map7Task.Bots;
		if p54 == "Drone" then
			v227.Stats.Speed.Value = 16;
		end;
		v227.Stats.WaitTime.Value = 1;
		v227.Stats.OffsetMaxX.Value = 1000;
		v227.Stats.OffsetMaxZ.Value = 1000;
		v227.Stats.OffsetMinX.Value = -1000;
		v227.Stats.OffsetMinZ.Value = -1000;
		local v228 = v227.MainControlNPC:clone();
		v228.Name = "MapScript";
		v228.Parent = script.Parent;
		local v229 = Instance.new("ObjectValue");
		v229.Name = "LinkedModel";
		v229.Value = v227;
		v229.Parent = v228;
		v228.Disabled = false;
	end;
	local v230 = { CFrame.new(-214.5, 236, -42.4), CFrame.new(-189.9, 236, -24.6), CFrame.new(-203, 246, -33), CFrame.new(-88.14, 236, -46.4), CFrame.new(-226.4, 236, -87.1), CFrame.new(-174, 236, -133), CFrame.new(-163.8, 246, -129), CFrame.new(-153.5, 236, -129.2) };
	l__Level__3.Map6Task.Bots.Value = 0;
	local v231 = l__GameItems__5.MasterModels.Flagship:clone();
	v231.Parent = l__Level__3.Parent.Map;
	v231:MakeJoints();
	v231.Humanoid.MaxHealth = v231.Stats.Health.Value;
	v231.Humanoid.Health = v231.Humanoid.MaxHealth;
	v231.Stats.State.Value = 2;
	v231.Stats.Ammo.Value = 4;
	l__Parent__1.Interface.Info.BossHealth.Visible = true;
	l__Parent__1.Interface.Info.BossHealth.HealthText.Text = "Flagship Health";
	v226("Drone", v230[2]);
	v226("Drone", v230[4]);
	v226("Drone", v230[6]);
	v226("Drone", v230[8]);
	coroutine.resume(coroutine.create(function()
		runMainControlFlagship(v231);
	end));
	wait();
	v231.Torso.CFrame = CFrame.new(-336.5, 490, -78.4) * CFrame.Angles(-1.5707963267948966, -1.3089969389957472, -1.5707963267948966);
	v231.Torso.BodyPosition.position = Vector3.new(-336.5, 243.2, -78.4);
	v231.Torso.BodyGyro.cframe = CFrame.new(v231.Torso.BodyPosition.position) * CFrame.Angles(-1.5707963267948966, -1.3089969389957472, -1.5707963267948966);
	while true do
		wait();
		if l__Parent__1.SoundScript.Busy.Value then

		else
			break;
		end;	
	end;
	l__Parent__1.SoundScript.Current.Value = "DetroitScuffle";
	v231.Stats.Agressive.Value = true;
	local l__MissionText__232 = l__Parent__1.Interface.Info.MissionText;
	l__MissionText__232.Text = "DESTROY THE FLAGSHIP'S GUNS";
	while true do
		waitTime(4);
		if not (v231.Humanoid.Health < 1601) then

		else
			break;
		end;	
	end;
	l__MissionText__232.Text = "DESTROY THE FLAGSHIP'S STABILIZERS";
	while true do
		waitTime(4);
		if not (v231.Humanoid.Health < 401) then

		else
			break;
		end;	
	end;
	v231.Stats.Agressive.Value = false;
	l__Parent__1.Interface.Info.BossHealth.Visible = false;
	runExplosion(v231.Head, 12, "ExplodeSound");
	runExplosion(v231.Torso, 12, "ExplodeSound");
	v231.Torso.BodyGyro:Destroy();
	v231.Torso.BodyPosition:Destroy();
	v231.Torso.BodyVelocity:Destroy();
	l__MissionText__232.Text = "%%U#@**E*###F #@# # R@@#&&A**";
	l__Parent__1.SoundScript.Current.Value = "DetroitAmbient";
	game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1012890";
	game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1012891";
	game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1012887";
	game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889";
	game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1012888";
	game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1014449";
	game.Lighting.OutdoorAmbient = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
	game.Lighting.Brightness = 1;
	game.Lighting:SetMinutesAfterMidnight(840);
	local u41 = l__Level__3.Parent.Map.MegaCore:GetChildren();
	coroutine.resume(coroutine.create(function()
		local v233 = #u41;
		local v234 = 1 - 4;
		while true do
			local u42 = nil;
			local v235 = 0 - 1;
			while true do
				u42 = v234;
				local u43 = v235;
				coroutine.resume(coroutine.create(function()
					if u41[u42 + u43] then
						if u41[u42 + u43].Parent then
							if not u41[u42 + u43]:IsA("Part") then
								if not u41[u42 + u43]:IsA("WedgePart") then
									if u41[u42 + u43]:IsA("UnionOperation") then
										u41[u42 + u43].Transparency = 1;
										waitTime(1);
										u41[u42 + u43].Transparency = 0;
										waitTime(1);
										u41[u42 + u43].Transparency = 1;
									end;
								else
									u41[u42 + u43].Transparency = 1;
									waitTime(1);
									u41[u42 + u43].Transparency = 0;
									waitTime(1);
									u41[u42 + u43].Transparency = 1;
								end;
							else
								u41[u42 + u43].Transparency = 1;
								waitTime(1);
								u41[u42 + u43].Transparency = 0;
								waitTime(1);
								u41[u42 + u43].Transparency = 1;
							end;
						end;
					end;
				end));
				if 0 <= 1 then
					if u43 < 3 then

					else
						break;
					end;
				elseif 3 < u43 then

				else
					break;
				end;
				u43 = u43 + 1;			
			end;
			waitTime(2);
			if 0 <= 4 then
				if u42 < v233 then

				else
					break;
				end;
			elseif v233 < u42 then

			else
				break;
			end;		
		end;
	end));
	waitTime(20);
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
	waitTime(12);
	game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1012890";
	game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1012891";
	game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1012887";
	game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889";
	game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1012888";
	game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1014449";
	game.Lighting.OutdoorAmbient = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
	game.Lighting.Brightness = 1;
	waitTime(8);
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
	local l__LoadingText__236 = l__Parent__1.Interface.LoadingText;
	l__LoadingText__236.Text = "SIMULATION COMPLETE/";
	l__LoadingText__236.Visible = true;
	waitTime(100);
	l__LoadingText__236.Text = "LOADING_/";
	l__LoadingText__236.Visible = false;
	local v237 = Instance.new("Model");
	v237.Name = "Map";
	v237.Parent = l__CurrentCamera__2;
	local l__Map8__44 = l__GameItems__5.MasterLevels.Level4.Map8;
	coroutine.resume(coroutine.create(function()
		addMap(l__Map8__44, v237);
	end));
	local v238 = Instance.new("BoolValue");
	v238.Name = "ForceField";
	v238.Parent = l__LocalPlayer__1.Character;
	while true do
		waitTime(3);
		if not v237:findFirstChild("SpawnPosition") then

		else
			break;
		end;	
	end;
	if l__Stats__4.Tool.Value ~= "None" then
		l__Stats__4.Tool.Value = "None";
	end;
	l__Stats__4.Mode.Value = true;
	l__Stats__4.LoadingZone.Value = 8;
	l__Stats__4.Checkpoint.Value = 8;
	local l__Value__239 = l__Map8__44.SpawnPosition.Value;
	l__Stats__4.Location.Value = l__Value__239;
	script.Parent.LocalScript.LocalCanSwitch.Value = false;
	script.Parent.LocalScript.LocalTheIncident.Value = false;
	script.Parent.LocalScript.LocalRestart.Value = true;
	local l__Torso__240 = l__LocalPlayer__1.Character.Torso;
	local l__CFrame__241 = l__Torso__240.CFrame;
	l__Torso__240.CFrame = l__Value__239;
	waitTime(7);
	l__Torso__240.CFrame = l__CFrame__241;
	waitTime(9);
	l__Torso__240.CFrame = l__Value__239;
	waitTime(7);
	l__Torso__240.CFrame = l__CFrame__241;
	waitTime(8);
	l__Torso__240.CFrame = l__Value__239;
	waitTime(6);
	l__Torso__240.CFrame = l__CFrame__241;
	waitTime(5);
	l__Torso__240.CFrame = l__Value__239;
	if l__Parent__1:findFirstChild("MapControl") then
		l__Parent__1.MapControl:Destroy();
	end;
	wait();
	l__Level__3.Parent.Map:Destroy();
	v237.Name = "Map";
	wait();
	v238:Destroy();
end;
function event7()
	l__Stats__4.Tool.Value = "None";
	l__Stats__4.Mode.Value = true;
	script.Parent.LocalScript.LocalCanSwitch.Value = false;
	script.Parent.LocalScript.LocalTheIncident.Value = false;
	script.Parent.LocalScript.LocalRestart.Value = true;
	while true do
		wait();
		if l__Parent__1.SoundScript.Busy.Value then

		else
			break;
		end;	
	end;
	l__Parent__1.SoundScript.Current.Value = "EnteringTYM";
	if l__Stats__4.Checkpoint.Value < 9 then
		while true do
			wait();
			if l__Parent__1.StoryScript.Current.Value then
				if l__Parent__1.StoryScript.Current.Value.Value ~= "Commander" then

				else
					break;
				end;
			end;		
		end;
		l__Level__3.Parent.Map.nUnlockedDoubleDoor.Name = "UnlockedDoubleDoor";
	end;
	while true do
		wait();
		if not (8 < l__Stats__4.Checkpoint.Value) then

		else
			break;
		end;	
	end;
	l__Level__3.NPC.Commander:Destroy();
	while true do
		wait();
		if not l__Level__3.Map11Task.Button.Busy.Value then

		else
			break;
		end;	
	end;
	l__Level__3.Map11Task.Button:Destroy();
	local l__Background__242 = l__Parent__1.Interface.Background;
	local v243 = 1 - 1;
	while true do
		wait();
		l__Background__242.BackgroundTransparency = 1 - v243 / 20;
		if 0 <= 1 then
			if v243 < 20 then

			else
				break;
			end;
		elseif 20 < v243 then

		else
			break;
		end;
		v243 = v243 + 1;	
	end;
	local l__Cutscene__244 = script.Parent.Cutscene;
	script.Parent.LocalScript.LocalPause.Value = true;
	handleGUIs(false);
	l__CurrentCamera__2.CameraSubject = nil;
	l__CurrentCamera__2.CameraType = "Scriptable";
	local l__CutsceneData__245 = l__Level__3.Map11Task.CutsceneData;
	local v246 = l__CutsceneData__245:GetChildren();
	l__CurrentCamera__2.CoordinateFrame = l__CutsceneData__245["1"].c1.Value;
	l__CurrentCamera__2.Focus = l__CutsceneData__245["1"].f1.Value;
	l__CurrentCamera__2.FieldOfView = l__CutsceneData__245["1"].FOV.Value;
	l__CurrentCamera__2:SetRoll(l__CutsceneData__245["1"].Roll.Value);
	l__LocalPlayer__1.Character.Torso.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
	local v247 = 1 - 1;
	while true do
		l__Background__242.BackgroundTransparency = 0 + v247 / 20;
		l__Cutscene__244.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v247, 0);
		l__Cutscene__244.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v247, 0);
		wait();
		if 0 <= 1 then
			if v247 < 20 then

			else
				break;
			end;
		elseif 20 < v247 then

		else
			break;
		end;
		v247 = v247 + 1;	
	end;
	coroutine.resume(coroutine.create(function()
		for i in v246 do
			local v250 = l__CutsceneData__245[tostring(i)];
			tweenCam(v250.c1.Value, v250.f1.Value, v250.step.Value, v250.FOV.Value, v250.Roll.Value, v250.Style.Value);
		end
	end));
	
	(function(p56)
		coroutine.resume(coroutine.create(function()
			wait(0.42);
			local l__Face__251 = l__Level__3.Parent.Map.FutureTownCar.Beaumont.Head.Face;
			local l__C1__252 = l__Level__3.Parent.Map.FutureTownCar.Beaumont.Head.Face.C1;
			local v253 = 1 - 1;
			while true do
				l__Face__251.C1 = l__C1__252 * CFrame.Angles(0, -math.rad(2 * v253), 0);
				wait();
				if 0 <= 1 then
					if v253 < 30 then

					else
						break;
					end;
				elseif 30 < v253 then

				else
					break;
				end;
				v253 = v253 + 1;			
			end;
		end));
		l__Parent__1.StoryScript.Current.Value = p56;
		while true do
			wait();
			if not script.Parent.StoryScript.Current.Value then

			else
				break;
			end;		
		end;
		while true do
			wait();
			if not (3 <= script.Parent.StoryScript.Number.Value) then

			else
				break;
			end;		
		end;
		coroutine.resume(coroutine.create(function()
			wait(0.6);
			local l__Face__254 = l__Level__3.Parent.Map.FutureTownCar.Beaumont.Head.Face;
			local l__C1__255 = l__Level__3.Parent.Map.FutureTownCar.Beaumont.Head.Face.C1;
			local v256 = 1 - 1;
			while true do
				l__Face__254.C1 = l__C1__255 * CFrame.Angles(0, math.rad(2 * v256), 0);
				wait();
				if 0 <= 1 then
					if v256 < 40 then

					else
						break;
					end;
				elseif 40 < v256 then

				else
					break;
				end;
				v256 = v256 + 1;			
			end;
		end));
		while true do
			wait(0.09);
			if l__Parent__1.StoryScript.Busy.Value then

			else
				break;
			end;		
		end;
	end)(l__Level__3.Map11Task.Dialogue);
	wait(0.06);
	handleGUIs(true);
	coroutine.resume(coroutine.create(function()
		local v257 = 1 - 1;
		while true do
			l__Cutscene__244.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v257, 0);
			l__Cutscene__244.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v257, 0);
			wait();
			if 0 <= 1 then
				if v257 < 20 then

				else
					break;
				end;
			elseif 20 < v257 then

			else
				break;
			end;
			v257 = v257 + 1;		
		end;
	end));
end;
coroutine.resume(coroutine.create(function()
	runObjectives();
end));
