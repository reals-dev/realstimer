game.ReplicatedStorage.AnnouncementSound.OnClientEvent:Connect(function()
	game:GetService("SoundService"):PlayLocalSound(game.Workspace.Notification)
end)