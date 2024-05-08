local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local GameItems = ReplicatedStorage.GameItems
local Client = game.Players.LocalPlayer

return {
	enemyType = "Old Bot",
	
	create = function()
		local oldBot = GameItems.MasterModels.OldBot:Clone();

		oldBot:MakeJoints()

		return oldBot
	end,
}