-- Decompiled with the Synapse X Luau decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local CreateEnemy = require(ReplicatedStorage.Modules.CreateEnemy)

local SPAWN_POSITION = CFrame.new(-89.8, 104, -3500.7) * CFrame.Angles(0, 0, 0)

local l__CurrentCamera__1 = game.Workspace.CurrentCamera;
local l__GameItems__2 = game.ReplicatedStorage.GameItems;
local l__Stats__3 = game.Players.LocalPlayer.Stats;
local l__Parent__1 = script.Parent;

function handleGUIs(p1)
	l__Parent__1.Health.Visible = p1;
	l__Parent__1.Ammo.Visible = p1;
	l__Parent__1.Power.Visible = p1;
	l__Parent__1.Reticle.Visible = p1;
	l__Parent__1.Radar.Visible = p1;
	l__Parent__1.Interface.Info.Visible = p1;
end;

local l__Level__2 = l__CurrentCamera__1.Level;

function runObjectives()
	local l__MissionText__4 = l__Parent__1.Interface.Info.MissionText;
	local l__Objectives__5 = l__Level__2.Objectives;
	l__MissionText__4.Text = "STAHP TEH LAGGZ";
	
	task.wait(3);
	
	while true do
		task.wait();
		if not l__CurrentCamera__1:findFirstChild("Map") then

		else
			break;
		end;	
	end;
	
	while true do
		task.wait(1.2)
		if #CollectionService:GetTagged("ActiveEnemies") == 0 then
			break
		end
	end
	
	l__MissionText__4.Text = "LEVEL COMPLETE (Press 'k' for next level)";
end;

if not l__Level__2.Parent:findFirstChild("Map") then
	return;
end;

--local megaBot = CreateEnemy("Mega Bot", {
--	WaitTime = 3;
--	OffsetMaxX = 33;
--	OffsetMaxZ = 33;
--	OffsetMinX = 22;
--	OffsetMinZ = 22;
--})

--megaBot:PivotTo(SPAWN_POSITION)

--megaBot.Parent = l__Level__2.Parent.Map


for i = 1, 1 do
	local blinkBot = CreateEnemy("Blink Bot", {
		Health = 80 + math.random(0, 2) * 10;
		WaitTime = 1;
		OffsetMaxX = 130,
		OffsetMaxZ = 84,
		OffsetMinX = -4,
		OffsetMinZ = -64,
		Agressive = true;
		Tool = "Pistol";
	})

	blinkBot:PivotTo(SPAWN_POSITION)

	blinkBot.Parent = l__Level__2.Parent.Map
end

--for i = 1, 1 do
--	local drone = CreateEnemy("Drone", {
--		WaitTime = 1,
--		OffsetMaxX = 130,
--		OffsetMaxZ = 84,
--		OffsetMinX = -4,
--		OffsetMinZ = -64,
--		Agressive = true
--	})
	
--	drone:PivotTo(SPAWN_POSITION)
	
--	drone.Parent = l__Level__2.Parent.Map
--end

--task.wait(4)

--print("Griever")

--local griever = CreateEnemy("Griever", {
--	WaitTime = 1;
--	OffsetMaxX = 130;
--	OffsetMaxZ = 84;
--	OffsetMinX = -4;
--	OffsetMinZ = -64;
--})

--griever:PivotTo(SPAWN_POSITION)

--griever.Parent = l__Level__2.Parent.Map

--local v10 = l__GameItems__2.MasterModels.Griever:clone();
--v10.Parent = l__Level__2.Parent.Map;
--v10:MakeJoints();
--v10.Torso.CFrame = CFrame.new(-79.8, 104, -3500.7);
--v10.Stats.WaitTime.Value = 1;
--v10.Stats.OffsetMaxX.Value = 130;
--v10.Stats.OffsetMaxZ.Value = 84;
--v10.Stats.OffsetMinX.Value = -4;
--v10.Stats.OffsetMinZ.Value = -64;
--v10.Stats.Agressive.Value = true;
--local v11 = v10.MainControlNPC:clone();
--v11.Name = "MapScript";
--v11.Parent = script.Parent;
--local v12 = Instance.new("ObjectValue");
--v12.Name = "LinkedModel";
--v12.Value = v10;
--v12.Parent = v11;
--v11.Disabled = false;
--wait(4);
--local v13 = l__GameItems__2.MasterModels.Repressilator:clone();
--v13.Parent = l__Level__2.Parent.Map;
--v13:MakeJoints();
--v13.Torso.CFrame = CFrame.new(-89.8, 104, -3500.7);
--v13.Stats.WaitTime.Value = 1;
--v13.Stats.OffsetMaxX.Value = 130;
--v13.Stats.OffsetMaxZ.Value = 84;
--v13.Stats.OffsetMinX.Value = -4;
--v13.Stats.OffsetMinZ.Value = -64;
--v13.Stats.Agressive.Value = true;
--local v14 = v13.MainControlNPC:clone();
--v14.Name = "MapScript";
--v14.Parent = script.Parent;
--local v15 = Instance.new("ObjectValue");
--v15.Name = "LinkedModel";
--v15.Value = v13;
--v15.Parent = v14;
--v14.Disabled = false;

task.spawn(function()
	runObjectives()
end)
