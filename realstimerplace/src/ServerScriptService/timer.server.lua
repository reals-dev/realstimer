rs = game.ReplicatedStorage
timeLeft = rs.TimeLeft
minutes = rs.Minutes
seconds = rs.Seconds
local db = false



rs.start.OnServerEvent:Connect(function(plr, mins)
	if rs.donormal.Value == true then
		timeLeft.Value = tonumber(mins) * 60
	else
		timeLeft.Value = (tonumber(mins) * 60) / 5
	end
	for i = timeLeft.Value, 0, -1 do
		if rs.pause.Value == true then
			repeat wait() until rs.pause.Value == false
		end
		timeLeft.Value = i
		minutes.Value = math.floor(timeLeft.Value / 60)
		seconds.Value = math.floor(timeLeft.Value % 60)
		wait(1)
	end
end)
