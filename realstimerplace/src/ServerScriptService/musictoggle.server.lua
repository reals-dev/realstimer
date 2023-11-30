game.ReplicatedStorage.mutemusic.OnServerEvent:Connect(function(plr)
	game.ReplicatedStorage.mutemusic:FireClient(plr)
end)

game.ReplicatedStorage.unmutemusic.OnServerEvent:Connect(function(plr)
	game.ReplicatedStorage.unmutemusic:FireClient(plr)
end)