game.ReplicatedStorage.sendsong.OnServerEvent:Connect(function(plr, text)
	game.ReplicatedStorage.sendsong:FireClient(plr, text)
end)