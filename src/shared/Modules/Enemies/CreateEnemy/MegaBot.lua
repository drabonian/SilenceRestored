local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local GameItems = ReplicatedStorage.GameItems
local Client = game.Players.LocalPlayer

return {
	enemyType = "Mega Bot",
	
	create = function()
		local megaBot = GameItems.MasterModels.MegaBot:Clone();

		megaBot:MakeJoints()

		return megaBot
	end,
}