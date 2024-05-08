print("Optimizer");
local RunService = game:GetService("RunService")

local debris = game:GetService("Debris");
local starterGui = game:GetService("StarterGui");
local player = game.Players.LocalPlayer;


local char = player.Character or player.CharacterAdded:Wait();

char:WaitForChild("Humanoid");
local humanoid = char.Humanoid;
local backpack = player.Backpack;
for _, v9 in pairs({ 0, 1, 2 }) do
	starterGui:SetCoreGuiEnabled(v9, false);
end;

function CheckObj(obj)
	RunService.Heartbeat:Wait()
	if obj:IsA("Accoutrement") then
		obj:Destroy()
	end;
end;

char.ChildAdded:connect(CheckObj);

for _, obj in pairs(char:GetChildren()) do
	if obj.Name == "Head" then
		for _, v19 in pairs(obj:GetChildren()) do
			CheckObj(v19);
		end;
	else
		CheckObj(obj);
	end;
end;