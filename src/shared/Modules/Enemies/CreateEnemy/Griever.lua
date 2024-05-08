local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local GameItems = ReplicatedStorage.GameItems
local Client = game.Players.LocalPlayer

return {
	enemyType = "Griever",
	
	create = function(enemyStats)
		local griever = GameItems.MasterModels.Griever:Clone();

		griever:MakeJoints()
	
		return griever
	end	
		--[[
		
		--v10.Parent = l__Level__2.Parent.Map;
		--v10:MakeJoints();
		--v10.Torso.CFrame = CFrame.new(-79.8, 104, -3500.7);
		--v10.Stats.WaitTime.Value = 1;
		--v10.Stats.OffsetMaxX.Value = 130;
		--v10.Stats.OffsetMaxZ.Value = 84;
		--v10.Stats.OffsetMinX.Value = -4;
		--v10.Stats.OffsetMinZ.Value = -64;
		--v10.Stats.Agressive.Value = true;
		--local v11 = v10.MainControlNPC:clone();
		--v11.Name = "MapScript";
		--v11.Parent = script.Parent;
		--local v12 = Instance.new("ObjectValue");
		--v12.Name = "LinkedModel";
		--v12.Value = v10;
		--v12.Parent = v11;
		--v11.Disabled = false;
		]]
}