local MessagingService = game:GetService("MessagingService")

game.ReplicatedStorage.ClientToServerText.OnServerEvent:Connect(function(player, text)
wait(1)
	print("activated")
	MessagingService:PublishAsync("Announcement",text)
	MessagingService:PublishAsync("DevName",script.Parent.Parent.Parent.Parent.DisplayName)
end)