-- Decompiled with the Synapse X Luau decompiler.

local TweenService = game:GetService("TweenService")

wait(0.09);
local l__LocalPlayer__1 = game.Players.LocalPlayer;
local l__CurrentCamera__2 = game.Workspace.CurrentCamera;
local l__GameItems__3 = game.ReplicatedStorage.GameItems;
local l__Level__4 = l__CurrentCamera__2.Level;
playerStats = l__LocalPlayer__1.Stats;
if l__Level__4:findFirstChild("Ammo") then
	local v5 = l__Level__4.Ammo:GetChildren();
	for v6 = 1, #v5 do
		if v5[v6]:findFirstChild("MainPart") then
			v5[v6].MainPart.Amount.Value = math.ceil(v5[v6].MainPart.Amount.Value * playerStats.Difficulty.Value * 0.5);
			v5[v6].MainPart.SurfaceGui1.Text.Text = "" .. v5[v6].MainPart.Amount.Value;
			v5[v6].MainPart.SurfaceGui2.Text.Text = "" .. v5[v6].MainPart.Amount.Value;
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
local u2 = require(workspace.CFrameInterpolator);
function focusOnLocation(p2)
	local v7, v8 = u2(l__CurrentCamera__2.Focus, p2);
	coroutine.resume(coroutine.create(function()
		local v9 = 1 - 1;
		while true do
			l__CurrentCamera__2.Focus = v8(v9 / 32);
			wait(0.03);
			if 0 <= 1 then
				if v9 < 32 then

				else
					break;
				end;
			elseif 32 < v9 then

			else
				break;
			end;
			v9 = v9 + 1;		
		end;
	end));
	wait(0.48);
end;
function runSecretDialogue()
	while true do
		wait();
		if script.Parent.StoryScript.Number.Value == 0 then

		else
			break;
		end;	
	end;
	focusOnLocation(l__Level__4.NPC["Hubris Hauteur"].Head.CFrame);
	while true do
		wait();
		if script.Parent.StoryScript.Number.Value == 1 then

		else
			break;
		end;	
	end;
	focusOnLocation(l__Level__4.NPC.CommanderConvo.Head.CFrame);
	while true do
		wait();
		if script.Parent.StoryScript.Number.Value == 2 then

		else
			break;
		end;	
	end;
	focusOnLocation(l__Level__4.NPC["Hubris Hauteur"].Head.CFrame);
	while true do
		wait();
		if script.Parent.StoryScript.Number.Value ~= 3 then
			if script.Parent.StoryScript.Number.Value == 4 then

			else
				break;
			end;
		end;	
	end;
	focusOnLocation(l__Level__4.NPC.RoyalConvo.Head.CFrame);
	while true do
		wait();
		if script.Parent.StoryScript.Number.Value == 5 then

		else
			break;
		end;	
	end;
	focusOnLocation(l__Level__4.NPC.CommanderConvo.Head.CFrame);
	while true do
		wait();
		if script.Parent.StoryScript.Number.Value == 6 then

		else
			break;
		end;	
	end;
	focusOnLocation(l__Level__4.NPC["Hubris Hauteur"].Head.CFrame);
	while true do
		wait();
		if script.Parent.StoryScript.Number.Value == 7 then

		else
			break;
		end;	
	end;
	focusOnLocation(l__Level__4.NPC.CommanderConvo.Head.CFrame);
	while true do
		wait();
		if script.Parent.StoryScript.Busy.Value then

		else
			break;
		end;	
	end;
	local v10 = 1 - 1;
	while true do
		if l__Level__4:findFirstChild("VentGaurd") then
			l__Level__4.VentGaurd.CFrame = l__Level__4.VentGaurd.CFrame + Vector3.new(0, 0.2, 0);
		end;
		wait(0.03);
		if 0 <= 1 then
			if v10 < 19 then

			else
				break;
			end;
		elseif 19 < v10 then

		else
			break;
		end;
		v10 = v10 + 1;	
	end;
	l__Level__4.SectorDoor1:Destroy();
	l__Level__4.NPC.CommanderConvo:Destroy();
	l__Level__4.NPC.RoyalConvo:Destroy();
	l__Level__4.NPC["Hubris Hauteur"]:Destroy();
	l__Level__4.NPC["VRT - Serial 45120B"]:Destroy();
end;
local l__Stats__3 = l__LocalPlayer__1.Stats;
function runObjectives()
	local l__MissionText__11 = l__Parent__1.Interface.Info.MissionText;
	local l__LevelComplete__12 = l__Parent__1.Interface.LevelComplete;
	local l__Objectives__13 = l__Level__4.Objectives;
	l__MissionText__11.Text = "EXPLORE THE CORE COMPLEX";
	if l__Stats__3.LoadingZone.Value < 3 then
		while true do
			wait();
			if script.Parent.StoryScript.Current.Value then
				if script.Parent.StoryScript.Current.Value.Value ~= "Secret Conversation" then

				else
					break;
				end;
			end;		
		end;
		runSecretDialogue();
		l__MissionText__11.Text = "GET LAB ACCESS";
		while true do
			wait();
			if script.Parent.StoryScript.Current.Value then
				if script.Parent.StoryScript.Current.Value.Value ~= "Commander" then

				else
					break;
				end;
			end;		
		end;
		while true do
			wait(0.09);
			if script.Parent.StoryScript.Busy.Value then

			else
				break;
			end;		
		end;
		l__Level__4.OffsetDoors:Destroy();
	else
		l__Level__4.SectorDoor1:Destroy();
		l__Level__4.OffsetDoors:Destroy();
		l__Level__4.NPC.CommanderConvo:Destroy();
		l__Level__4.NPC.RoyalConvo:Destroy();
		l__Level__4.NPC["Hubris Hauteur"]:Destroy();
		l__Level__4.NPC["VRT - Serial 45120B"]:Destroy();
		l__Level__4.Dialogue.Head.Dialogue:Destroy();
		l__Level__4.NPC.Commander.Head.Dialogue:Destroy();
		local v14 = 1 - 1;
		while true do
			if l__Level__4:findFirstChild("VentGaurd") then
				l__Level__4.VentGaurd.CFrame = l__Level__4.VentGaurd.CFrame + Vector3.new(0, 0.2, 0);
			end;
			wait();
			if 0 <= 1 then
				if v14 < 19 then

				else
					break;
				end;
			elseif 19 < v14 then

			else
				break;
			end;
			v14 = v14 + 1;		
		end;
	end;
	l__MissionText__11.Text = "GO TO THE UPPER LAB";
	while true do
		wait();
		if script.Parent.StoryScript.Current.Value then
			if script.Parent.StoryScript.Current.Value.Value ~= "Royal" then

			else
				break;
			end;
		end;	
	end;
	while true do
		wait(0.09);
		if script.Parent.StoryScript.Busy.Value then

		else
			break;
		end;	
	end;
	l__Objectives__13.VizSim.Part.Name = "Torso";
	l__MissionText__11.Text = "GO INTO THE VIZSIM";
	l__Objectives__13.VizSim.Torso.Touched:connect(function(p3)
		if p3 then
			if p3.Parent then
				if p3.Name == "Torso" then
					if script.Parent:findFirstChild("LocalScript") then
						l__Objectives__13.VizSim:Destroy();
					end;
				end;
			end;
		end;
	end);
	while true do
		wait();
		if l__Objectives__13:findFirstChild("VizSim") then

		else
			break;
		end;	
	end;
	l__MissionText__11.Text = "LEVEL COMPLETE";
	wait(0.24);
	l__Stats__3.LoadingZone.Value = 1;
	l__Stats__3.Checkpoint.Value = 1;
	l__Stats__3.Progress.Value = 0;
	l__Parent__1.LocalScript.LocalPause.Value = true;
	local l__Background__15 = l__Parent__1.Interface.Background;
	local v16 = 1 - 1;
	while true do
		wait();
		l__Background__15.BackgroundTransparency = 1 - v16 / 20;
		if 0 <= 1 then
			if v16 < 20 then

			else
				break;
			end;
		elseif 20 < v16 then

		else
			break;
		end;
		v16 = v16 + 1;	
	end;
	l__LevelComplete__12.LevelNumberDone.Text = "::LEVEL 1 COMPLETE::";
	l__LevelComplete__12.LevelNumberNext.Text = "::NEXT : LEVEL 2 : TRUTH::";
	l__LevelComplete__12.LevelImage.Image = "http://www.roblox.com/asset/?id=122598847";
	l__LevelComplete__12.Visible = true;
	wait(0.09);
	l__LevelComplete__12.Visible = false;
	wait(0.06);
	l__LevelComplete__12.Visible = true;
	wait(0.12);
	l__LevelComplete__12.Visible = false;
	wait(0.06);
	l__LevelComplete__12.Visible = true;
	local l__NextButton__17 = l__LevelComplete__12.NextButton;
	local l__RedoButton__18 = l__LevelComplete__12.RedoButton;
	local l__LoadingText__4 = l__Parent__1.Interface.LoadingText;
	function startLoading()
		l__LevelComplete__12.Visible = false;
		l__Parent__1.LocalScript.LocalPause.Value = false;
		l__Parent__1.CanPause.Value = false;
		l__LoadingText__4.Visible = true;
		wait(0.12);
		l__LoadingText__4.Visible = false;
		wait(0.06);
		l__LoadingText__4.Visible = true;
	end;
	local u5 = false;
	l__NextButton__17.MouseButton1Click:connect(function()
		if u5 then
			return;
		end;
		u5 = true;
		startLoading();
		l__Stats__3.Level.Value = l__Stats__3.Level.Value + 1;
	end);
	l__RedoButton__18.MouseButton1Click:connect(function()
		if u5 then
			return;
		end;
		u5 = true;
		startLoading();
		local v19 = l__LocalPlayer__1.Character:findFirstChild("Humanoid");
		if v19 then
			v19.Health = 0;
		end;
	end);
	wait(0.09);
	l__NextButton__17.Visible = true;
	wait(0.09);
	l__RedoButton__18.Visible = true;
end;
coroutine.resume(coroutine.create(function()
	runObjectives();
end));
function event1()
	while true do
		wait();
		if l__Parent__1:findFirstChild("LocalScript") then
			if not l__LocalPlayer__1.Character:findFirstChild("Torso") then

			else
				break;
			end;
		end;	
	end;
	local l__Cutscene__20 = script.Parent.Cutscene;
	handleGUIs(false);
	local function v21(p4, p5, p6, p7, p8, p9)
		local v22
		local v23
		
		if p9 == 1 then
			v22 = 1;
			v23 = 181;
		else
			v22 = -90;
			v23 = 90;
		end;
		
		local l__CoordinateFrame__24 = l__CurrentCamera__2.CoordinateFrame;
		local l__Focus__25 = l__CurrentCamera__2.Focus;
		local l__FieldOfView__26 = l__CurrentCamera__2.FieldOfView;
		local v27 = l__CurrentCamera__2:GetRoll();
		local v28 = v22 - p6;
		while true do
			l__CurrentCamera__2.CameraType = "Scriptable";
			local v29 = nil;
			if p9 == 1 then
				v29 = 0.0055248618784530384 * v28;
			elseif p9 == 2 then
				v29 = (math.sin((math.rad(v28))) + 1) / 2;
			end;
			l__CurrentCamera__2.CoordinateFrame = CFrame.new(l__CoordinateFrame__24.p:lerp(p4.p, v29));
			l__CurrentCamera__2.Focus = CFrame.new(l__Focus__25.p:lerp(p5.p, v29));
			l__CurrentCamera__2.FieldOfView = Vector3.new(l__FieldOfView__26, 0, 0):Lerp(Vector3.new(p7, 0, 0), v29).X;
			l__CurrentCamera__2:SetRoll(Vector3.new(v27, 0, 0):Lerp(Vector3.new(p8, 0, 0), v29).X);
			l__CurrentCamera__2.CoordinateFrame = CFrame.new(l__CurrentCamera__2.CoordinateFrame.p, l__CurrentCamera__2.Focus.p);
			wait();
			if 0 <= p6 then
				if v28 < v23 then

				else
					break;
				end;
			elseif v23 < v28 then

			else
				break;
			end;
			v28 = v28 + p6;		
		end;
	end;
	l__CurrentCamera__2.CameraSubject = nil;
	l__CurrentCamera__2.CameraType = "Scriptable";
	local l__CutsceneData__30 = l__Level__4.Map1Task.CutsceneData;
	local v31 = l__CutsceneData__30:GetChildren();
	l__CurrentCamera__2.CoordinateFrame = l__CutsceneData__30["1"].c1.Value;
	l__CurrentCamera__2.Focus = l__CutsceneData__30["1"].f1.Value;
	l__CurrentCamera__2.FieldOfView = l__CutsceneData__30["1"].FOV.Value;
	l__CurrentCamera__2:SetRoll(l__CutsceneData__30["1"].Roll.Value);
	l__Level__4.Parent.Map.GarageDoor.CFrame = l__Level__4.Parent.Map.GarageDoor.CFrame + Vector3.new(0, 17, 0);
	while true do
		wait();
		if not l__Parent__1.CanPause.Value then

		else
			break;
		end;	
	end;
	l__Parent__1.LocalScript.LocalPause.Value = true;
	local l__p__32 = l__LocalPlayer__1.Character.Torso.CFrame.p;
	--l__LocalPlayer__1.Character.Torso.CFrame = CFrame.new(math.random(-4, 4), math.random(-4, 4) + 10, math.random(-4, 4) - 500);
	wait(0.12);
	local v33 = 1 - 1;
	while true do
		l__Cutscene__20.Bar1.Position = UDim2.new(0, 0, -0.125 + 0.00625 * v33, 0);
		l__Cutscene__20.Bar2.Position = UDim2.new(0, 0, 1 - 0.00625 * v33, 0);
		wait();
		if 0 <= 1 then
			if v33 < 20 then

			else
				break;
			end;
		elseif 20 < v33 then

		else
			break;
		end;
		v33 = v33 + 1;	
	end;
	wait();
	(function()
		l__Parent__1.StoryScript.Current.Value = l__Level__4.Map1Task.Dialogue;
		while true do
			wait(0.09);
			if l__Parent__1.StoryScript.Busy.Value then

			else
				break;
			end;		
		end;
	end)();
	wait(0.12);
	local l__FutureTownCarWelded__6 = l__Level__4.FutureTownCarWelded;

	local v34 = l__FutureTownCarWelded__6:GetDescendants();
	
	local info = TweenInfo.new(1)
	
	for _,window in v34 do
		if window.Name == "Window" then
			local tween = TweenService:Create(window, info, {
				Transparency = 0
			})
			tween:Play()
		end
	end
		
	local currentPath = l__FutureTownCarWelded__6.Base.Position + Vector3.new(100, 2, 0);
	coroutine.resume(coroutine.create(function()
		while true do
			l__FutureTownCarWelded__6.Base.BodyPosition.position = l__FutureTownCarWelded__6.Base.BodyPosition.position + (Vector3.new(currentPath.x, currentPath.y, currentPath.z) - l__FutureTownCarWelded__6.Base.Position).unit;
			l__FutureTownCarWelded__6.Base.BodyGyro.cframe = CFrame.new(l__FutureTownCarWelded__6.Base.Position, l__FutureTownCarWelded__6.Base.BodyPosition.position + Vector3.new(-100, 0, 0));
			wait(0.12);
			if not ((l__FutureTownCarWelded__6.Base.Position - Vector3.new(currentPath.x, l__FutureTownCarWelded__6.Base.Position.y, currentPath.z)).magnitude < 4) then

			else
				break;
			end;		
		end;
		currentPath = l__FutureTownCarWelded__6.Base.Position + Vector3.new(-80, 100, 0);
		while true do
			l__FutureTownCarWelded__6.Base.BodyPosition.position = l__FutureTownCarWelded__6.Base.BodyPosition.position + (Vector3.new(currentPath.x, currentPath.y, currentPath.z) - l__FutureTownCarWelded__6.Base.Position).unit;
			l__FutureTownCarWelded__6.Base.BodyGyro.cframe = CFrame.new(l__FutureTownCarWelded__6.Base.Position, l__FutureTownCarWelded__6.Base.BodyPosition.position + Vector3.new(-100, 100, 0));
			wait(0.12);
			if not ((l__FutureTownCarWelded__6.Base.Position - Vector3.new(currentPath.x, l__FutureTownCarWelded__6.Base.Position.y, currentPath.z)).magnitude < 4) then

			else
				break;
			end;		
		end;
		l__FutureTownCarWelded__6:Destroy();
	end));
	wait(2);
	local v38 = #v31;
	local v39 = 2 - 1;
	while true do
		local v40 = l__CutsceneData__30[tostring(v39)];
		v21(v40.c1.Value, v40.f1.Value, v40.step.Value, v40.FOV.Value, v40.Roll.Value, v40.Style.Value);
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
	wait(3);
	print("Door");
	local v41 = l__Level__4.Parent.Map.GarageDoor:clone();
	v41.Transparency = 1;
	v41.CFrame = l__Level__4.Parent.Map.GarageDoor.CFrame - Vector3.new(0, 17, 0);
	v41.Parent = l__Level__4;
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
	l__LocalPlayer__1.Character.Torso.CFrame = CFrame.new(l__p__32.X, l__p__32.Y, l__p__32.Z) * CFrame.Angles(0, 0, 0);
	wait(0.3);
	script.Parent.LocalScript.LocalPause.Value = false;
	l__CurrentCamera__2.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
	l__CurrentCamera__2.CameraType = "Custom";
	l__CurrentCamera__2.FieldOfView = 70;
	handleGUIs(true);
	local v44 = 1 - 1;
	while true do
		l__Cutscene__20.Bar1.Position = UDim2.new(0, 0, 0 - 0.00625 * v44, 0);
		l__Cutscene__20.Bar2.Position = UDim2.new(0, 0, 0.875 + 0.00625 * v44, 0);
		wait();
		if 0 <= 1 then
			if v44 < 20 then

			else
				break;
			end;
		elseif 20 < v44 then

		else
			break;
		end;
		v44 = v44 + 1;	
	end;
	local v45 = 1 - 1;
	while true do
		wait();
		l__Background__42.BackgroundTransparency = 0 + v45 / 20;
		if 0 <= 1 then
			if v45 < 20 then

			else
				break;
			end;
		elseif 20 < v45 then

		else
			break;
		end;
		v45 = v45 + 1;	
	end;
	l__Level__4.Map1Task:Destroy();
	wait(10);
	local v46 = 1 - 1;
	while true do
		if l__Level__4.Parent.Map:findFirstChild("GarageDoor") then
			l__Level__4.Parent.Map.GarageDoor.CFrame = l__Level__4.Parent.Map.GarageDoor.CFrame - Vector3.new(0, 0.5, 0);
		end;
		wait(0.06);
		if 0 <= 1 then
			if v46 < 34 then

			else
				break;
			end;
		elseif 34 < v46 then

		else
			break;
		end;
		v46 = v46 + 1;	
	end;
	if v41 then
		v41:Destroy();
	end;
end;
if l__Stats__3.LoadingZone.Value == 1 then
	event1();
	return;
end;
l__Level__4.Map1Task:Destroy();
l__Level__4.FutureTownCarWelded:Destroy();
if l__Stats__3.LoadingZone.Value > 2 then
	local v47 = l__Level__4.LoadingZones:getChildren();
	for v48 = 1, #v47 do
		if v47[v48]:findFirstChild("Decontamination") then
			local l__DoorSet1__49 = v47[v48].Decontamination.DoorSet1;
			local l__DoorSet2__50 = v47[v48].Decontamination.DoorSet2;
			if v47[v48].Button.Way.Value then
				for v51 = 1, 8 do
					l__DoorSet1__49.Door1.CFrame = l__DoorSet1__49.Door1.CFrame + (l__DoorSet1__49.ClosedPosition1.Position - l__DoorSet1__49.OpenPosition1.Position) / 8;
					l__DoorSet1__49.Door2.CFrame = l__DoorSet1__49.Door2.CFrame + (l__DoorSet1__49.ClosedPosition2.Position - l__DoorSet1__49.OpenPosition2.Position) / 8;
					wait();
				end;
			else
				for v52 = 1, 8 do
					l__DoorSet2__50.Door1.CFrame = l__DoorSet2__50.Door1.CFrame + (l__DoorSet2__50.ClosedPosition1.Position - l__DoorSet2__50.OpenPosition1.Position) / 8;
					l__DoorSet2__50.Door2.CFrame = l__DoorSet2__50.Door2.CFrame + (l__DoorSet2__50.ClosedPosition2.Position - l__DoorSet2__50.OpenPosition2.Position) / 8;
					wait();
				end;
			end;
			v47[v48].Button.Way.Value = not v47[v48].Button.Way.Value;
			if v47[v48].Button.Way.Value then
				for v53 = 1, 8 do
					l__DoorSet1__49.Door1.CFrame = l__DoorSet1__49.Door1.CFrame - (l__DoorSet1__49.ClosedPosition1.Position - l__DoorSet1__49.OpenPosition1.Position) / 8;
					l__DoorSet1__49.Door2.CFrame = l__DoorSet1__49.Door2.CFrame - (l__DoorSet1__49.ClosedPosition2.Position - l__DoorSet1__49.OpenPosition2.Position) / 8;
					wait();
				end;
			else
				for v54 = 1, 8 do
					l__DoorSet2__50.Door1.CFrame = l__DoorSet2__50.Door1.CFrame - (l__DoorSet2__50.ClosedPosition1.Position - l__DoorSet2__50.OpenPosition1.Position) / 8;
					l__DoorSet2__50.Door2.CFrame = l__DoorSet2__50.Door2.CFrame - (l__DoorSet2__50.ClosedPosition2.Position - l__DoorSet2__50.OpenPosition2.Position) / 8;
					wait();
				end;
			end;
		end;
	end;
end;
