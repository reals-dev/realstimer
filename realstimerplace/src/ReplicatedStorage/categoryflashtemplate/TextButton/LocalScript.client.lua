script.Parent.MouseButton1Click:Connect(function()
	print('flipped')
	game.ReplicatedStorage.flipflashcard:FireServer()
end)