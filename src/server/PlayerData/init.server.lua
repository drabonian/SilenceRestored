local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local ProfileService = require(ServerStorage.Packages.profileservice)
local Profiles = require(script.Profiles)

local PROFILE_TEMPLATE = {
    Level = 1;
    Checkpoint = 0;
}

local ProfileStore = ProfileService.GetProfileStore(
    "PlayerData",
    PROFILE_TEMPLATE
)

local SendPlayerData = ReplicatedStorage.Events.SendPlayerData

local function DoSomethingWithALoadedProfile(player, profile)
    SendPlayerData:FireClient(player, profile.Data)
end

local function PlayerAdded(player)
    local profile = ProfileStore:LoadProfileAsync("Player_" .. player.UserId)
    if profile ~= nil then
        profile:AddUserId(player.UserId)
        profile:Reconcile()
        profile:ListenToRelease(function()
            Profiles[player] = nil
            player:Kick()
        end)
        if player:IsDescendantOf(Players) == true then
            Profiles[player] = profile
            DoSomethingWithALoadedProfile(player, profile)
        else
            profile:Release()
        end
    else
        player:Kick()
    end
end

for _, player in (Players:GetPlayers()) do
    task.spawn(PlayerAdded, player)
end

Players.PlayerAdded:Connect(PlayerAdded)

Players.PlayerRemoving:Connect(function(player)
    local profile = Profiles[player]
    if profile ~= nil then
        profile:Release()
    end
end)