local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerData = require(ReplicatedStorage.Stats.PlayerData)

local SendPlayerData = ReplicatedStorage.Events.SendPlayerData

-- Wait for player data to be flushed out.
local Data = SendPlayerData.OnClientEvent:Wait()
print(Data)

-- TODO: Update PlayerData

-- Load modules
for _,module in script:GetChildren() do
	if module:IsA("ModuleScript") then
		local execute = require(module)
		if execute.Init then
			execute.Init()
		end
	end
end