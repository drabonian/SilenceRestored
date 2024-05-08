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
