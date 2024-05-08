-- Decompiled with the Synapse X Luau decompiler.

wait(0.09);
local l__GameItems__1 = game.ReplicatedStorage.GameItems;
local l__Map__2 = game.Workspace.CurrentCamera.Map;
game.Lighting.FogEnd = 120;
game.Lighting:SetMinutesAfterMidnight(840);
game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0);
game.Lighting.Brightness = 0;
function playSoundEffect(p1, p2)
	if script.Parent:FindFirstChild("SoundScript") then
		local v3 = Instance.new("StringValue");
		v3.Name = "Sound";
		v3.Value = p1;
		local v4 = Instance.new("ObjectValue");
		v4.Name = "Location";
		v4.Value = p2;
		v4.Parent = v3;
		v3.Parent = script.Parent.SoundScript.Effects;
	end;
end;
local l__Stats__1 = game.Players.LocalPlayer.PlayerGui.Stats;
l__Map__2.SecretDoor.Button.Busy.Changed:connect(function()
	if l__Map__2.SecretDoor.Button.Busy.Value then
		l__Map__2.SecretDoor.Button.CFrame = l__Map__2.SecretDoor.Button.CFrame + Vector3.new(0, 0, -0.3);
		playSoundEffect("SlideOpen", l__Map__2.SecretDoor.Door);
		for v5 = 1, 20 do
			l__Map__2.SecretDoor.Door.CFrame = l__Map__2.SecretDoor.Door.CFrame + Vector3.new(0.375, 0, 0);
			wait();
		end;
		if not l__Stats__1.BadgePatOnTheBack.Value then
			l__Stats__1.BadgePatOnTheBack.Value = true;
		end;
	end;
end);
