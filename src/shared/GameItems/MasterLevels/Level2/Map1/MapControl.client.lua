-- Decompiled with the Synapse X Luau decompiler.

wait(0.09);
local l__Map__1 = game.Workspace.CurrentCamera.Map;
game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset?id=58372690";
game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset?id=58372722";
game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset?id=58372742";
game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset?id=58372777";
game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset?id=58372794";
game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset?id=58372812";
game.Lighting.FogEnd = 100000;
game.Lighting.Brightness = 1;
game.Lighting.OutdoorAmbient = Color3.new(0.4980392156862745, 0.4980392156862745, 0.4980392156862745);
local v2 = l__Map__1.MapParts:getChildren();
local v3 = l__Map__1.StartParts:getChildren();
for v4 = 1, #v2 do
	if v2[v4].Name ~= "Boarder" then
		if v2[v4].Name == "Water" then
			v2[v4].Transparency = 0.4;
		else
			v2[v4].Transparency = 0;
		end;
	end;
	if v4 <= #v3 then
		l__Map__1.StartParts[tostring(v4)].Transparency = 0;
	end;
	wait();
	if v2[v4].Name ~= "Boarder" then
		v2[v4].Transparency = 1;
	end;
	if v4 <= #v3 then
		l__Map__1.StartParts[tostring(v4)].Transparency = 1;
	end;
	wait();
	if v2[v4].Name ~= "Boarder" then
		if v2[v4].Name == "Water" then
			v2[v4].Transparency = 0.4;
		else
			v2[v4].Transparency = 0;
		end;
	end;
	if v4 <= #v3 then
		l__Map__1.StartParts[tostring(v4)].Transparency = 0;
	end;
end;
wait(3);
while l__Map__1 and game.Lighting.Brightness < 2 do
	i = math.random(1, #v2);
	if v2[i].Name ~= "Boarder" then
		v2[i].Transparency = 1;
	end;
	wait();
	if v2[i].Name ~= "Boarder" then
		if v2[i].Name == "Water" then
			v2[i].Transparency = 0.4;
		else
			v2[i].Transparency = 0;
		end;
	end;
	wait(math.random(1, 10) * 0.03);
end;
if l__Map__1 then
	for v5 = 1, #v2 do
		v2[v5].BrickColor = BrickColor.new("Institutional white");
		if v5 <= #v3 then
			l__Map__1.StartParts[tostring(v5)].BrickColor = BrickColor.new("Institutional white");
		end;
	end;
end;
while l__Map__1 and game.Lighting.Brightness > 1 do
	i = math.random(1, #v2);
	if v2[i].Name ~= "Boarder" then
		v2[i].Transparency = 1;
	end;
	wait();
	if v2[i].Name ~= "Boarder" then
		if v2[i].Name == "Water" then
			v2[i].Transparency = 0.4;
		else
			v2[i].Transparency = 0;
		end;
	end;
	wait();
end;
