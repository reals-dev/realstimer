

--[[ SERVICES ]]--

local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

--[[ TWEENS/LOCALS ]]--

local LoadingImage = script.Parent.ImageLabel

--[[ TOP BAR DISABLER ]]--

StarterGui:SetCore("TopbarEnabled",false)
StarterGui:SetCoreGuiEnabled("All",false)

--[[ TWEENING ]]--

local ts = game:GetService("TweenService")
local ring = script.Parent.ImageLabel

local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In,-1)

local tween = ts:Create(ring, ti, {Rotation = 360})
tween:Play()

wait(5)

local function textShortFadeIn()
	game.TweenService:Create(script.Parent.pleasewait,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
end

local function frameout()
	game.TweenService:Create(script.Parent,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut), {BackgroundTransparency = 1}):Play()
end

textShortFadeIn()


wait(3)
script.Parent.ImageLabel:Destroy()
script.Parent["Message!"]:Destroy()
script.Parent.pleasewait:Destroy()
wait(1)
StarterGui:SetCore("TopbarEnabled",true)
StarterGui:SetCoreGuiEnabled("All",true)
frameout()