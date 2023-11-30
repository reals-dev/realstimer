local MessagingService = game:GetService("MessagingService")
local TweenService = game:GetService("TweenService")
MessagingService:SubscribeAsync("Announcement",function(msg)
	print(msg.Data)
	local data = msg.Data
	script.Parent.Frame.Message.Text = data
	wait(3)
	TweenService:Create(script.Parent.Frame,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 0}):Play()
	TweenService:Create(script.Parent.Frame.Message,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 0}):Play()
	TweenService:Create(script.Parent.Frame.Message,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{TextTransparency = 0}):Play()
	TweenService:Create(script.Parent.Frame.DevName,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{TextTransparency = 0}):Play()
	game.ReplicatedStorage.AnnouncementSound:FireAllClients()
	wait(10)
	--TweenService:Create(script.Parent.Frame.UIStroke,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{Transparency = 0}):Play()
	TweenService:Create(script.Parent.Frame,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 1}):Play()
	TweenService:Create(script.Parent.Frame.Message,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{BackgroundTransparency = 1}):Play()
	TweenService:Create(script.Parent.Frame.Message,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{TextTransparency = 1}):Play()
	TweenService:Create(script.Parent.Frame.DevName,TweenInfo.new(1,Enum.EasingStyle.Cubic,Enum.EasingDirection.InOut),{TextTransparency = 1}):Play()
	end)
MessagingService:SubscribeAsync("DevName",function(msg)
	print(msg.Data)
	local data = msg.Data
	script.Parent.Frame.DevName.Text = data
end)