local ds = game:GetService('DataStoreService')
local test = ds:GetDataStore('music')

game.Players.PlayerAdded:Connect(function(plr)
	local a = test:GetAsync(plr.UserId)
	if a == nil or a == true then
		test:SetAsync(plr.UserId, true)
		game.ReplicatedStorage.getmusic:FireClient(plr, true)
	else
		game.ReplicatedStorage.getmusic:FireClient(plr, false)
	end
end)

game.ReplicatedStorage.savemusic.OnServerEvent:Connect(function(plr, hason)
	if hason then
		test:SetAsync(plr.UserId, true)
	else
		test:SetAsync(plr.UserId, false)
	end
end)