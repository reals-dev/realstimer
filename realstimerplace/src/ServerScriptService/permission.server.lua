game.Players.PlayerAdded:Connect(function(player)
	--If you need a version that only goes on player names, please respond to the devforum post. This is group rank based.
	if player.UserId == 206307806 then
		local clone = game.ServerStorage.Input:Clone()
		clone.Parent = player.PlayerGui
	end
end)