local dss = game:GetService('DataStoreService'):GetDataStore('flashcards')
--[[
function doStuff(index, value)
	print(index, value)
end

function recurseTable(tbl, func)
	for index, value in pairs(tbl) do
		if type(value) == 'table' then
			recurseTable(value, func)
		else
			func(index, value)
		end
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	local targetTable = dss:GetAsync(plr.UserId)
	recurseTable(targetTable, doStuff)
end)
]]--

game.ReplicatedStorage.submitflashcard.OnServerEvent:Connect(function(plr, data)
	if dss:GetAsync(plr.UserId) == nil then
		local sync = {
			data
		}
		dss:SetAsync(plr.UserId, sync)
	else
		local sync = dss:GetAsync(plr.UserId)
		table.insert(sync, data)
		dss:SetAsync(plr.UserId, sync)
	end
end)

game.ReplicatedStorage.sendflashcard.OnServerEvent:Connect(function(plr)
	local data = dss:GetAsync(plr.UserId)
	game.ReplicatedStorage.sendflashcard:FireClient(plr, data)
end)

game.ReplicatedStorage.sendflashcard2.OnServerEvent:Connect(function(plr, categoryname)
	print('sent')
	local data = dss:GetAsync(plr.UserId)
	game.ReplicatedStorage.sendflashcard2:FireClient(plr, data, categoryname)
end)

game.ReplicatedStorage.flipflashcard.OnServerEvent:Connect(function(plr)
	game.ReplicatedStorage.flipflashcard:FireClient(plr)
end)