-- Decompiled with the Synapse X Luau decompiler.

wait(0.09);
local l__CurrentCamera__1 = game.Workspace.CurrentCamera;
local l__Map__2 = l__CurrentCamera__1.Map;
while true do
	wait(0.09);
	if l__Map__2:findFirstChild("DeathParts") then
		break;
	end;
end;
if l__CurrentCamera__1:findFirstChild("Level") and l__CurrentCamera__1.Level:findFirstChild("Map5Task") and l__CurrentCamera__1.Level.Map5Task:findFirstChild("Trigger") then
	game.Lighting.FogEnd = 100;
else
	game.Lighting.FogEnd = 10000;
end;
for v3, v4 in pairs(l__Map__2.DeathParts:GetChildren()) do
	if v4:IsA("Part") then
		v4.Touched:connect(function(p1)
			if not p1 or not p1.Parent or p1.Name ~= "Torso" then
				return;
			end;
			local v5 = p1.Parent:findFirstChild("Humanoid") or p1.Parent.Parent:findFirstChild("Humanoid");
			if v5 and (game.Players:findFirstChild(v5.Parent.Name) and v5.Health > 0) and not v5.Parent:findFirstChild("ForceField") and v5.Parent:findFirstChild("Head") then
				local l__Head__6 = v5.Parent.Head;
				v5:TakeDamage(v5.Health);
			end;
		end);
	end;
end;
