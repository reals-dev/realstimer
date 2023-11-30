local ui = script.Parent
local mainframe = script.Parent.text
local plr = game.Players.LocalPlayer
local ts = game.TweenService

function animateText(text : string, instance : TextLabel)
	for i = 1, #text do
		instance.Text = string.sub(text, 1, i)
		wait()
	end
end

function initiate()
	animateText('hey '..plr.DisplayName..'!', script.Parent.text.TextLabel)
	wait(3)
	animateText('how can i help you today?', script.Parent.text.TextLabel)
	wait(2)
	for i,v in pairs(script.Parent.text:GetChildren()) do
		if v:IsA('TextButton') then
			ts:Create(v, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
			ts:Create(v, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
			ts:Create(v.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 0}):Play()
		end
	end
end

function remove()
	for i,v in pairs(script.Parent.text:GetChildren()) do
		if v:IsA('TextButton') then
			ts:Create(v, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
			ts:Create(v, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
			ts:Create(v.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 1}):Play()
		end
	end
	ts:Create(script.Parent.text.TextLabel, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
end

repeat wait() until script.Parent.Enabled == true
initiate()

script.Parent.text.schedule.MouseButton1Click:Connect(function()
	animateText('good choice! let me get set on that right away.', script.Parent.text.TextLabel)
	wait(2)
	remove()
	ts:Create(script.Parent.text, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(56, 179, 255)}):Play()
	wait(1)
	script.Parent.timetable.Visible = true
	script.Parent.text.Visible = false
	script.Parent.text.BackgroundColor3 = Color3.fromRGB(150, 2, 255)
end)

script.Parent.text.homework.MouseButton1Click:Connect(function()
	animateText('okay! i will intiate that right away.', script.Parent.text.TextLabel)
	wait(2)
	remove()
	ts:Create(script.Parent.text, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(56, 179, 255)}):Play()
	wait(1)
	script.Parent.text.Visible = false
	script.Parent.homework.Visible = true
end)