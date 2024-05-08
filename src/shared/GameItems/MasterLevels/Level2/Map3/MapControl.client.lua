-- Decompiled with the Synapse X Luau decompiler.

wait(0.09);
local l__GameItems__1 = game.ReplicatedStorage.GameItems;
local l__Stats__2 = game.Players.LocalPlayer.PlayerGui.Stats;
local l__Map__3 = game.Workspace.CurrentCamera.Map;
while true do
	wait(0.09);
	if l__Map__3:findFirstChild("DeathParts") then
		break;
	end;
end;
game.Lighting.FogEnd = 140;
for v4, v5 in pairs(l__Map__3.DeathParts:GetChildren()) do
	if v5:IsA("Part") then
		v5.Touched:connect(function(p1)
			if not p1 or not p1.Parent then
				return;
			end;
			local v6 = p1.Parent:findFirstChild("Humanoid") or p1.Parent.Parent:findFirstChild("Humanoid");
			if v6 and (game.Players:findFirstChild(v6.Parent.Name) and v6.Health > 0) and not v6.Parent:findFirstChild("ForceField") and v6.Parent:findFirstChild("Head") then
				local l__Head__7 = v6.Parent.Head;
				v6:TakeDamage(v6.Health);
			end;
		end);
	end;
end;
