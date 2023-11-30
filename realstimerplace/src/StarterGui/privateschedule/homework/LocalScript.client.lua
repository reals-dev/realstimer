local ts = game.TweenService

for i,v in pairs(script.Parent:GetChildren()) do
	if v:IsA('TextButton') then
		v.MouseButton1Click:Connect(function()
			for i,v in pairs(script.Parent:GetChildren()) do
				if v:IsA('TextButton') then
					ts:Create(v, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
					ts:Create(v, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
					ts:Create(v.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 1}):Play()
				end
			end
			ts:Create(script.Parent, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()
			wait(1)
			game.ReplicatedStorage.domainstuff:FireServer(tonumber(v.Name))
			script.Parent.Parent.Enabled = false
		end)
	end
end