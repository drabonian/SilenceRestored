local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local GameItems = ReplicatedStorage.GameItems
local Client = game.Players.LocalPlayer

return {
	enemyType = "Drone",
	
	create = function()
		local drone = GameItems.MasterModels.Drone:Clone();

		drone:MakeJoints()

		return drone
	end,
}