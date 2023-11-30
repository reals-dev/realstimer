local frame = script.Parent.Frame
local songname = frame.songname
local ts = game.TweenService
local tf = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

local function movedown()
	ts:Create(frame, tf, {Position = UDim2.new(0.5, 0, 0, 0)}):Play()
end

local function moveup()
	ts:Create(frame, tf, {Position = UDim2.new(0.5, 0, -1, 0)}):Play()
end

game.ReplicatedStorage.sendsong.OnClientEvent:Connect(function(text)
	songname.Text = text
	movedown()
	wait(5)
	moveup()
end)