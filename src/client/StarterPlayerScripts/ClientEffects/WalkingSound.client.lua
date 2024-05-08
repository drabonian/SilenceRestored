-- Decompiled with the Synapse X Luau decompiler.

local player = game.Players.LocalPlayer;
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid");

for _, obj in pairs(player.Character:GetDescendants()) do
	if obj:IsA("Sound") then
		obj:Destroy();
	end;
end;

local soundData = {
	current = nil, 
	list = {
		fsBrick = { "rbxasset://sounds/grassstone3.ogg", 1.4, 0.45, true }, 
		fsCobblestone = { "rbxasset://sounds/grassstone3.ogg", 1.5, 0.4, true }, 
		fsConcrete = { "rbxasset://sounds/grassstone2.ogg", 1.4, 0.4, true }, 
		fsCorrodedMetal = { "rbxasset://sounds/metalgrass.ogg", 1.4, 0.3, true }, 
		fsDiamondPlate = { "rbxasset://sounds/metalgrass3.ogg", 1.4, 0.3, true }, 
		fsFabric = { "http://www.roblox.com/asset/?id=133705377", 1.65, 0.6, true }, 
		fsFoil = { "rbxasset://sounds/metal3.ogg", 1.4, 0.3, true }, 
		fsGranite = { "rbxasset://sounds/grassstone3.ogg", 1.35, 0.35, true }, 
		fsGrass = { "http://www.roblox.com/asset/?id=16720281", 1.8, 0.4, true }, 
		fsIce = { "rbxasset://sounds/icestone.ogg", 1.4, 0.5, true }, 
		fsMarble = { "rbxasset://sounds/grassstone2.ogg", 1.55, 0.38, true }, 
		fsMetal = { "rbxasset://sounds/metalgrass3.ogg", 1.4, 0.3, true }, 
		fsPebble = { "http://www.roblox.com/asset/?id=133761546", 1.5, 0.3, true }, 
		fsPlastic = { "http://www.roblox.com/asset/?id=121293429", 1.8, 0.3, true }, 
		fsSmoothPlastic = { "http://www.roblox.com/asset/?id=121293429", 1.8, 0.3, true }, 
		fsSand = { "http://www.roblox.com/asset/?id=131245944", 1.6, 0.2, true }, 
		fsSlate = { "rbxasset://sounds/grassstone3.ogg", 1.35, 0.4, true }, 
		fsWood = { "rbxasset://sounds/woodgrass3.ogg", 1.4, 0.5, true }, 
		fsWoodPlanks = { "rbxasset://sounds/woodgrass3.ogg", 1.4, 0.5, true }, 
		fsWater = { "http://www.roblox.com/asset/?id=130778103", 1.8, 0.4, true }, 
		fsSnow = { "http://www.roblox.com/asset/?id=19326880", 1.2, 0.5, true }, 
		fsAir = { "", 1, 0, false }, 
		fsJump = { "http://www.roblox.com/asset/?id=130778269", 1, 0.3, false }, 
		fsDied = { "rbxassetid://5143383166", 1, 0.9, false }
	}
};
math.randomseed(tick());
for name, soundStuff in pairs(soundData.list) do
	local s = Instance.new("Sound", char.Head);
	s.Name = name;
	s.SoundId = soundStuff[1];
	s.Pitch = soundStuff[2];
	s.Volume = soundStuff[3] * 0.4;
	s.Looped = soundStuff[4];
	soundData.list[name] = {s, soundStuff[2]};
end;

local rays = {
	part = nil,
	position = nil
}

rays.detect = function()
	if player.Character:FindFirstChild("Torso") then
		local part, pos = workspace:FindPartOnRayWithIgnoreList(Ray.new(player.Character.Torso.Position, (Vector3.new(0, -6, 0))), { player.Character });
		rays.part = part;
		rays.position = pos;
	end;
end


local running = false;
hum.Running:connect(function(speed)
	if speed > 1 then
		running = true;
		return;
	end;
	running = false;
end);

hum.Jumping:connect(function(active)
	if not script:FindFirstChild("last_jumped") then
		local val = Instance.new("BoolValue", script);
		val.Name = "last_jumped";
		game.Debris:AddItem(val, 0.5);
		if active then
			player.Character.Head.fsJump.Pitch = math.random((soundData.list.fsJump[2] - 0.075) * 100, (soundData.list.fsJump[2] + 0.075) * 100) / 100;
			soundData.list.fsJump[1]:Play();
		end;
	end;
end);

hum.Died:connect(function()
	soundData.list.fsDied[1].TimePosition = .5
	soundData.list.fsDied[1]:Play();
end);

while task.wait() do
	rays.detect();
	if running and rays.part and hum.WalkSpeed > 0.1 then
		if rays.part.Name == "Water" or rays.part.Name == "Snow" or rays.part.Name == "Air" then
			local hitName = rays.part.Name;
		elseif rays.part.Name == "Poison" then
			hitName = "Water";
		else
			hitName = string.gsub(string.sub(tostring(rays.part.Material), 15), "%s+", "");
		end;
		if soundData.current ~= soundData.list["fs" .. hitName][1] then
			if soundData.current then
				soundData.current:Stop();
			end;
			soundData.current = soundData.list["fs" .. hitName][1];
			soundData.current:Play();
		end;
		soundData.current.Pitch = math.random((soundData.list["fs" .. hitName][2] - 0.4) * 100, (soundData.list["fs" .. hitName][2] + 0.4) * 100) / 100;
		soundData.current.Pitch = soundData.current.Pitch / (24 / hum.WalkSpeed);
	elseif soundData.current then
		soundData.current:Pause();
		soundData.current = nil;
	end;
end;
