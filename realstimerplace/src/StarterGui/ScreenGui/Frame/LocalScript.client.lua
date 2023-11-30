local plr = game.Players.LocalPlayer

local frame = script.Parent

local answerContainer = frame.answerContainer
local calcContainer = frame.calcContainer

local numberContainer = calcContainer.numberContainer
local symbolsContainer = calcContainer.symbolsContainer

local currentequation

local dp = script:GetAttribute('dp') -- default is 10

local textlabel = answerContainer.TextLabel

for i,v in pairs(numberContainer:GetChildren()) do
	if v:IsA('TextButton') then
		v.MouseButton1Click:Connect(function()
			print(v.t)
		end)
	end
end