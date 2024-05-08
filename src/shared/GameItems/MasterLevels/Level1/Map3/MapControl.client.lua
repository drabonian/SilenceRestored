-- Decompiled with the Synapse X Luau decompiler.

wait(0.09);
local v1 = game.Workspace.CurrentCamera.Map.Lights:getChildren();
for v2 = 1, #v1 do
	for v3 = 1, 20 do
		v1[v2].PointLight.Brightness = 0 + 0.025 * v3;
	end;
	wait(0.06);
end;
script:Destroy();
