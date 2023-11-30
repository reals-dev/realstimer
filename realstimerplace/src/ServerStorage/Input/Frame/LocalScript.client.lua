local ReplicatedStorage = game:GetService("ReplicatedStorage")
local REText = ReplicatedStorage:WaitForChild("ClientToServerText")
local Player = script.Parent.Parent.Parent
local TextBox = script.Parent.Input
wait(1)
	
script.Parent.Submit.MouseButton1Click:Connect(function()
	REText:FireServer(TextBox.Text)
end)
