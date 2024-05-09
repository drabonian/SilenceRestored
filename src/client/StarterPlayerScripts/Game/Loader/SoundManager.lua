local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

local PlayerData = require(ReplicatedStorage.Stats.PlayerData)

local gameItems = ReplicatedStorage.GameItems
local masterSounds = gameItems.MasterSounds

local audioStats = PlayerData.Audio

local module = {}

local currentlyPlayingSound = nil

module.Settings = {
	Current = "ImaginaryFriends",
	Effects = false,
}

function module.RunSoundWithName(name: string)
	if currentlyPlayingSound then
		currentlyPlayingSound:Destroy()
		currentlyPlayingSound = nil
	end

	local sound = masterSounds:FindFirstChild(name)

	assert(sound, "No sound with that name could be found.")

	sound = sound:Clone()
	sound.Volume = audioStats.MusicVolume
	sound.Parent = SoundService
	sound:Play()

	currentlyPlayingSound = sound
end

function module.RunEffectWithName(name: string, parent: Instance)
	parent = parent or SoundService

	local sound = masterSounds:FindFirstChild(name)

	if sound then
		sound = sound:Clone()
		sound.Parent = parent
		sound:Play()
		Debris:AddItem(sound, 3)
	end

	if name == "LaserShot" then
		local gunshot = masterSounds.GunShot:Clone()
		local laser = masterSounds.LaserBewp:Clone()

		gunshot.Volume = 0.2
		laser.Volume = 1

		gunshot.Name = "SoundEffect"
		laser.Name = "SoundEffect"

		gunshot.Parent = parent
		laser.Parent = parent

		gunshot:Play()
		laser:Play()

		Debris:AddItem(gunshot, 3)
		Debris:AddItem(laser, 3)
	end
end

return module
