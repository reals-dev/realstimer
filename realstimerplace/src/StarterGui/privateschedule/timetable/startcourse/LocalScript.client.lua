game.ReplicatedStorage.confirmation.OnClientEvent:Connect(function(name)
	script.Parent.Visible = true
	script.Parent.TextLabel.Text = 'Are you sure you want to study '..name..'?'
end)

script.Parent.yes.MouseButton1Click:Connect(function()
	print('activated')
	script.Parent.Parent.Parent.Enabled = false
	game.ReplicatedStorage.domainstuff:FireServer(25)
end)

script.Parent.no.MouseButton1Click:Connect(function()
	script.Parent.Visible = false
end)