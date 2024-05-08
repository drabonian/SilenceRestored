-- Decompiled with the Synapse X Luau decompiler.

wait(0.09);
local l__Map__1 = game.Workspace.CurrentCamera.Map;
while true do
	wait(0.09);
	if l__Map__1:findFirstChild("DeathParts") then
		break;
	end;
end;
for v2, v3 in pairs(l__Map__1.DeathParts:GetChildren()) do
	if v3:IsA("Part") then
		v3.Touched:connect(function(p1)
			if not p1 or not p1.Parent then
				return;
			end;
			local v4 = p1.Parent:findFirstChild("Humanoid") or p1.Parent.Parent:findFirstChild("Humanoid");
			if v4 and (game.Players:findFirstChild(v4.Parent.Name) and v4.Health > 0) and not v4.Parent:findFirstChild("ForceField") and v4.Parent:findFirstChild("Head") then
				local l__Head__5 = v4.Parent.Head;
				v4:TakeDamage(v4.Health);
			end;
		end);
	end;
end;
local l__GameItems__1 = game.ReplicatedStorage.GameItems;
function botSpawn(p2, p3)
	if not l__Map__1 then
		return;
	end;
	print("Bot");
	script.BotsRemaining.Value = script.BotsRemaining.Value + 1;
	local v6 = l__GameItems__1.MasterModels[p2]:clone();
	v6.Parent = l__Map__1;
	v6:MakeJoints();
	local v7 = CFrame.new(71.4, 80.3, 47.8);
	if p3 == 1 then
		v7 = CFrame.new(98.4, 80.3, 19.8);
	elseif p3 == 2 then
		v7 = CFrame.new(71.4, 80.3, -5.2);
	elseif p3 == 3 then
		v7 = CFrame.new(47.4, 80.3, 19.8);
	elseif p3 == 4 then
		v7 = CFrame.new(70.6, 80.3, 3.9);
	elseif p3 == 5 then
		v7 = CFrame.new(56.9, 80.3, 23.1);
	end;
	v6.Torso.CFrame = v7;
	if p2 == "Drone" then
		v6.Stats.Health.Value = 50;
		v6.Stats.Speed.Value = 16;
	else
		v6.Stats.Health.Value = 80;
	end;
	v6.Stats.Counter.Value = script.BotsRemaining;
	v6.Stats.OffsetMaxX.Value = 1000;
	v6.Stats.OffsetMaxZ.Value = 1000;
	v6.Stats.OffsetMinX.Value = -1000;
	v6.Stats.OffsetMinZ.Value = -1000;
	local v8 = v6.MainControlNPC:clone();
	v8.Name = "MapScript";
	v8.Parent = script.Parent;
	local v9 = Instance.new("ObjectValue");
	v9.Name = "LinkedModel";
	v9.Value = v6;
	v9.Parent = v8;
	v8.Disabled = false;
end;
botSpawn("BlinkBot", 0);
wait(0.18);
botSpawn("Drone", 1);
wait(0.18);
botSpawn("Drone", 2);
wait(0.18);
botSpawn("Drone", 3);
wait(0.18);
botSpawn("Drone", 4);
wait(0.18);
while script:FindFirstChild("BotsRemaining") and l__Map__1 do
	if script.BotsRemaining.Value < 3 then
		wait(1.2);
		botSpawn("Drone", math.random(0, 2));
		botSpawn("Drone", math.random(3, 5));
		wait(0.18);
		botSpawn("BlinkBot", math.random(0, 5));
	end;
	wait(3);
end;
