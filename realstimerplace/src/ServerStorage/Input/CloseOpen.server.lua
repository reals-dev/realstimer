script.Parent.Parent.Parent.Chatted:Connect(function(msg)
	if msg == "/open" then
		game:GetService("TweenService"):Create(script.Parent.Frame,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 0}):Play()
		game:GetService("TweenService"):Create(script.Parent.Frame.Input,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 0}):Play()
		game:GetService("TweenService"):Create(script.Parent.Frame.Input,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{TextTransparency = 0}):Play()
		game:GetService("TweenService"):Create(script.Parent.Frame.Submit,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 0}):Play()
		game:GetService("TweenService"):Create(script.Parent.Frame.Submit,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{TextTransparency = 0}):Play()
		script.Parent.Frame.Input.Visible = true
		script.Parent.Frame.Submit.Visible = true
	elseif msg == "/close" then
		game:GetService("TweenService"):Create(script.Parent.Frame,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 1}):Play()
		game:GetService("TweenService"):Create(script.Parent.Frame.Input,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 1}):Play()
		game:GetService("TweenService"):Create(script.Parent.Frame.Input,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{TextTransparency = 1}):Play()
		game:GetService("TweenService"):Create(script.Parent.Frame.Submit,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 1}):Play()
		game:GetService("TweenService"):Create(script.Parent.Frame.Submit,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{TextTransparency = 1}):Play()
		script.Parent.Frame.Input.Visible = false
		script.Parent.Frame.Submit.Visible = false
	end

end)

