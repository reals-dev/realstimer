timerGui = script.Parent
timerLabel = timerGui.Frame.time

rs = game.ReplicatedStorage
timeLeft = rs.TimeLeft
minutes = rs.Minutes
seconds = rs.Seconds
local ts = game:GetService("TweenService")
local tf = TweenInfo.new(0.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
local tf2 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local tf3 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local mins = script.Parent.Frame.mins
local isbreak = false
local ispaused = false
local tps = game:GetService("TeleportService")
local plr = game.Players.LocalPlayer

local function firststart()
	if not tonumber(script.Parent.Frame.mins.Text) then
		script.Parent.Frame.mins.Text = 'Please put in a number!'
	else
		if script.Parent.Frame.mins.Text == nil or script.Parent.Frame.mins.Text == " " or script.Parent.Frame.mins.Text == "" or tonumber(script.Parent.Frame.mins.Text) < 0.4 then
			script.Parent.Frame.mins.Text = 'Make sure you put a number larger than 0.4!'
		else
			game.ReplicatedStorage.acdonormal:FireServer()
			wait(0.1)
			game.ReplicatedStorage.start:FireServer(mins.Text)
			script.Parent.Frame.start.Text = "good luck :)"
			script.Parent.Frame.mins.Visible = false
			ts:Create(script.Parent.Frame, tf3, {BackgroundColor3 = Color3.fromRGB(25,100,255)}):Play()
			wait(2)
			ts:Create(script.Parent.Frame.start, tf3, {BackgroundTransparency = 1}):Play()
			ts:Create(script.Parent.Frame.start, tf3, {TextTransparency = 1}):Play()
			ts:Create(script.Parent.Frame.sorryrobloxagain, tf3, {BackgroundTransparency = 0}):Play()
			ts:Create(script.Parent.Frame.sorryrobloxagain, tf3, {TextTransparency = 0}):Play()
			ts:Create(script.Parent.Frame.pause, tf3, {BackgroundTransparency = 0}):Play()
			ts:Create(script.Parent.Frame.pause, tf3, {TextTransparency = 0}):Play()
			wait(2)
			script.Parent.Frame.start:Destroy()
		end
	end
end
local function normalstart()
	game.ReplicatedStorage.acdonormal:FireServer()
	wait(0.1)
	game.ReplicatedStorage.start:FireServer(mins.Text)
	script.Parent.Frame.mins.Visible = false
	ts:Create(script.Parent.Frame, tf3, {BackgroundColor3 = Color3.fromRGB(25,100,255)}):Play()
end

local function timerended()
	ts:Create(script.Parent.Frame, tf3, {BackgroundColor3 = Color3.fromRGB(0,255,0)}):Play()
	if isbreak == false then
		isbreak = true
		ts:Create(script.Parent.Frame.sorryroblox, tf2, {TextTransparency = 1}):Play()
		wait(1)
		script.Parent.Frame.sorryroblox.Text = "good job :D, time for your break!"
		ts:Create(script.Parent.Frame.sorryroblox, tf2, {TextTransparency = 0}):Play()
		game.ReplicatedStorage.dontdonormal:FireServer()
		game.ReplicatedStorage.start:FireServer(mins.Text)
	else
		isbreak = false
		ts:Create(script.Parent.Frame.sorryroblox, tf2, {TextTransparency = 1}):Play()
		wait(1)
		script.Parent.Frame.sorryroblox.Text = "focus"
		ts:Create(script.Parent.Frame.sorryroblox, tf2, {TextTransparency = 0}):Play()
		game.ReplicatedStorage.acdonormal:FireServer()
		game.ReplicatedStorage.start:FireServer(mins.Text)
		normalstart()
	end
	
end

local function transitionDefault(timee)
	game.ReplicatedStorage.acdonormal:FireServer()
	wait(0.1)
	game.ReplicatedStorage.start:FireServer(timee)
	script.Parent.Frame.start.Text = "good luck :)"
	script.Parent.Frame.mins.Visible = false
	ts:Create(script.Parent.Frame, tf3, {BackgroundColor3 = Color3.fromRGB(25,100,255)}):Play()
	wait(2)
	ts:Create(script.Parent.Frame.start, tf3, {BackgroundTransparency = 1}):Play()
	ts:Create(script.Parent.Frame.start, tf3, {TextTransparency = 1}):Play()
	ts:Create(script.Parent.Frame.sorryrobloxagain, tf3, {BackgroundTransparency = 0}):Play()
	ts:Create(script.Parent.Frame.sorryrobloxagain, tf3, {TextTransparency = 0}):Play()
	ts:Create(script.Parent.Frame.pause, tf3, {BackgroundTransparency = 0}):Play()
	ts:Create(script.Parent.Frame.pause, tf3, {TextTransparency = 0}):Play()
	wait(2)
	script.Parent.Frame.start:Destroy()
end

rs.domainstuff.OnClientEvent:Connect(function(timee)
	transitionDefault(timee)
	mins.Text = tostring(timee)
end)

seconds.Changed:Connect(function()
	timerLabel.Text = (string.format("%02d:%02d", minutes.Value, seconds.Value))
		if timeLeft.Value == 0 then
			timerGui.Parent.endtimer.Looped = true
			timerGui.Parent.endtimer:Play()
			wait(5)
			timerGui.Parent.endtimer.Looped = false
			timerended()
	end
	
end)
	
timerGui.Frame.start.MouseButton1Click:Connect(firststart)
timerGui.Frame.pause.MouseButton1Click:Connect(function()
	if ispaused == false then
		ispaused = true
		game.ReplicatedStorage.pauseev:FireServer()
		timerGui.Frame.pause.Text = "Unpause"
	else
		ispaused = false
		game.ReplicatedStorage.unpauseev:FireServer()
		timerGui.Frame.pause.Text = "Pause"
	end
end)

timerGui.Frame.sorryrobloxagain.MouseButton1Click:Connect(function()
	timerGui.Parent.rejoining.Enabled = true
	tps:Teleport(13597927140, plr)
end)