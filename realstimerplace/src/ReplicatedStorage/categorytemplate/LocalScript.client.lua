script.Parent.MouseButton1Click:Connect(function()
	print('hi')
	game.ReplicatedStorage.sendflashcard2:FireServer(script.Parent.Name)
end)