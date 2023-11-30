local bs = game:GetService("BadgeService")


game.Players.PlayerAdded:Connect(function(plr) 
	bs:AwardBadge(plr.UserId, 2146592654)
end)
