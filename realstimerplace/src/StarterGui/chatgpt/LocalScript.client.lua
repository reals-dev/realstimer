local ui = script.Parent
local frame = ui.main
local textbox = frame.TextBox
local submit = frame.TextButton
local gptframe = frame.Frame
local gpttext = gptframe.TextLabel

local rs = game.ReplicatedStorage

local db = ui.db

rs.messageresponse.OnClientEvent:Connect(function(msg)
	gpttext.Text = msg
end)

submit.MouseButton1Click:Connect(function()
	if db.Value == false then
		rs.messagerecieved:FireServer(textbox.Text)
	end
end)