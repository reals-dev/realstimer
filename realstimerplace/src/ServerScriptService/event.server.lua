local rs = game.ReplicatedStorage

rs.dontdonormal.OnServerEvent:Connect(function()
	rs.donormal.Value = false
end)

rs.unpauseev.OnServerEvent:Connect(function()
	rs.pause.Value = false
end)

rs.acdonormal.OnServerEvent:Connect(function()
	rs.donormal.Value = true
end)

rs.pauseev.OnServerEvent:Connect(function()
	rs.pause.Value = true
end)

rs.confirmation.OnServerEvent:Connect(function(plr, txt)
	rs.confirmation:FireAllClients(txt)
end)

rs.domainstuff.OnServerEvent:Connect(function(plr, timee)
	rs.domainstuff:FireAllClients(timee)
end)