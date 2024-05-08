-- Decompiled with the Synapse X Luau decompiler.

print("Sound Script Running");
local gameGui = script.Parent;
local player = game.Players.LocalPlayer
local torso = player.Character.Torso;
local camera = workspace.CurrentCamera;
local debris = game:GetService("Debris");
script.Busy.Value = true;
local gameItems = game.ReplicatedStorage.GameItems;
local stat = player.Stats;
function runMusic()
	if not gameItems.MasterSounds:findFirstChild(script.Current.Value) then
		return;
	end;
	if script.FadeIn.Value then

	else
		if gameGui:findFirstChild("CurrentMusic") then
			gameGui.CurrentMusic:Stop();
			gameGui.CurrentMusic:Destroy();
		end;
		local sound = gameItems.MasterSounds[script.Current.Value]:Clone();
		sound.Volume = stat.MusicVolume.Value / 10;
		sound.Parent = gameGui;
		sound.Name = "CurrentMusic";
		sound:Play();
		return;
	end;
	local sound = gameItems.MasterSounds[script.Current.Value]:Clone();
	sound.Volume = 0;
	sound.Parent = gameGui;
	sound:Play();
	sound.Name = "NewMusic";
	while true do
		if sound.Volume < stat.MusicVolume.Value / 10 then

		else
			break;
		end;
		sound.Volume = sound.Volume + 0.02;
		if gameGui:findFirstChild("CurrentMusic") then
			if 0 < gameGui.CurrentMusic.Volume then
				gameGui.CurrentMusic.Volume = gameGui.CurrentMusic.Volume - 0.02;
			end;
		end;
		wait();	
	end;
	if gameGui:findFirstChild("CurrentMusic") then
		gameGui.CurrentMusic:Stop();
		gameGui.CurrentMusic:Destroy();
	end;
	sound.Name = "CurrentMusic";
end;
runMusic();
function runEffect()
	local effectSound = script.Effects:FindFirstChild("Sound");
	if not effectSound then
		return;
	end;
	effectSound.Name = "Playing";
	if gameItems.MasterSounds:findFirstChild(effectSound.Value) then
		local v8 = gameItems.MasterSounds[effectSound.Value]:Clone();
		if effectSound:FindFirstChild("Location") then
			if effectSound.Location.Value then
				v8.Parent = effectSound.Location.Value;
			else
				v8.Parent = gameGui;
			end;
		else
			v8.Parent = gameGui;
		end;
		v8.Name = "SoundEffect";
		v8:Play();
		debris:AddItem(v8, 3);
	elseif effectSound.Value == "LaserShot" then
		local gunshot = gameItems.MasterSounds.GunShot:Clone();
		local laser = gameItems.MasterSounds.LaserBewp:Clone();
		if effectSound:FindFirstChild("Location") then
			if effectSound.Location.Value then
				gunshot.Parent = effectSound.Location.Value;
				laser.Parent = effectSound.Location.Value;
			else
				gunshot.Parent = gameGui;
				laser.Parent = gameGui;
			end;
		else
			gunshot.Parent = gameGui;
			laser.Parent = gameGui;
		end;
		gunshot.Volume = 0.2;
		laser.Volume = 1;
		gunshot.Name = "SoundEffect";
		laser.Name = "SoundEffect";
		gunshot:Play();
		laser:Play();
		debris:AddItem(gunshot, 3);
		debris:AddItem(laser, 3);
	end;
	debris:AddItem(effectSound, 0.3);
end;
stat.MusicVolume.Changed:connect(function()
	gameGui.CurrentMusic.Volume = stat.MusicVolume.Value / 10;
end);
script.Current.Changed:connect(function()
	if script.Current.Value and not script.Busy.Value then
		script.Busy.Value = true;
		runMusic();
		script.Busy.Value = false;
	end;
end);
script.Effects.ChildAdded:connect(function()
	runEffect();
end);
script.Busy.Value = false;
