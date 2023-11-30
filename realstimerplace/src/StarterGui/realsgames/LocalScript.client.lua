local ui = script.Parent
local text = ui.text
local ts = game.TweenService
local tf = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

local function textin()
	ts:Create(text.a, tf, {Position = UDim2.new(0.3, 0, 0.5, 0)}):Play()
	wait(0.1)
	ts:Create(text.b, tf, {Position = UDim2.new(0.4, 0, 0.5, 0)}):Play()
	wait(0.1)
	ts:Create(text.c, tf, {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
	wait(0.1)
	ts:Create(text.d, tf, {Position = UDim2.new(0.6, 0, 0.5, 0)}):Play()
	wait(0.1)
	ts:Create(text.e, tf, {Position = UDim2.new(0.7, 0, 0.5, 0)}):Play()
end

local function frameandtextout()
	for i,v in pairs(text:GetChildren()) do
		if v:IsA("TextLabel") then
			ts:Create(v, tf, {TextTransparency = 1}):Play()
		end
	end
	wait(0.5)
	ts:Create(text, tf, {Position = UDim2.new(1.5, 0, 0.5, 0)}):Play()
end

repeat wait() until game:IsLoaded()
textin()
wait(0.7)
frameandtextout()