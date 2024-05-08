local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local GameItems = ReplicatedStorage.GameItems
local Client = game.Players.LocalPlayer

return {
	enemyType = "Blink Bot",
	
	create = function()
		local blinkBot = GameItems.MasterModels.BlinkBot:Clone();

		blinkBot:MakeJoints()

		return blinkBot
	end,
}