local ui = script.Parent
local frame = ui.Frame
local image = frame.ImageLabel
local tl = frame.TextLabel

local ts = game:GetService("TweenService")
local tf3 = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

local function spin()
	while true do
		ts:Create(image, tf3, {Rotation = 360}):Play()
		wait(2)
		ts:Create(image, tf3, {Rotation = 360}):Play()
	end
end

ui.Parent.main.Frame.sorryrobloxagain.MouseButton1Click:Connect(spin)