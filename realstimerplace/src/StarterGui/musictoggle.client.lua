game.ReplicatedStorage.mutemusic.OnClientEvent:Connect(function()
	local tf = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	game.TweenService:Create(script.Parent.music, tf, {Volume = 0}):Play()
end)

game.ReplicatedStorage.unmutemusic.OnClientEvent:Connect(function()
	local tf = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	game.TweenService:Create(script.Parent.music, tf, {Volume = 0.5}):Play()
end)