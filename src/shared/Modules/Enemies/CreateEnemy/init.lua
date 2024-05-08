local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local GameGui = PlayerGui:WaitForChild("GameGui")

local loadedModules = {}

for _,mod in script:GetChildren() do
	local ret = require(mod)
	loadedModules[ret.enemyType] = ret
end

return function(enemyType, enemyStats)
	if loadedModules[enemyType] then
		local enemy = loadedModules[enemyType].create()
		
		local npcScript = enemy.MainControlNPC:Clone()
		npcScript.Name = "MapScript";
		
		npcScript.Parent = GameGui
		
		local LinkedModel = Instance.new("ObjectValue")
		LinkedModel.Name = "LinkedModel";
		LinkedModel.Value = enemy
		LinkedModel.Parent = npcScript
		
		if enemyStats then
			for stat, value in enemyStats do
				local enemyStat = enemy.Stats:FindFirstChild(stat)
				
				enemyStat.Value = value 
			end
		end
		
		npcScript.Enabled = true
		
		enemy.Humanoid.Died:Connect(function()
			enemy:RemoveTag("ActiveEnemies")	
		end)
		
		enemy:AddTag("ActiveEnemies")
		
		return enemy
	end
	
	error("No module loaded for enemy named: " .. enemyType)
end
