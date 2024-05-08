-- Decompiled with the Synapse X Luau decompiler.

wait(0.09);
local l__GameItems__1 = game.ReplicatedStorage.GameItems;
local l__Stats__2 = game.Players.LocalPlayer.PlayerGui.Stats;
local l__Map__3 = game.Workspace.CurrentCamera.Map;
game.Lighting.FogEnd = 200;
game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?version=1&id=1012890";
game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?version=1&id=1012891";
game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?version=1&id=1012887";
game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?version=1&id=1012889";
game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?version=1&id=1012888";
game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?version=1&id=1014449";
game.Lighting:SetMinutesAfterMidnight(1105);
game.Lighting.OutdoorAmbient = Color3.new(0.19215686274509805, 0.19215686274509805, 0.19215686274509805);
game.Lighting.Brightness = 0.5;
while true do
	wait(0.09);
	if l__Map__3:findFirstChild("DeathParts") then
		break;
	end;
end;
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
