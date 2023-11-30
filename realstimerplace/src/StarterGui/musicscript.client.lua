local soundids = {
	9043887091,
	9047053092,
	9047050075,
	9048042682,
	9048510043,
	9048039902,
	9047049362,
	9047104336,
	13119735599
}
local text = ""

local music = script.Parent.music

local first = 0

local oldid = 0
local id = 0

id = soundids[math.random(1, #soundids)]
oldid = id
while wait(0.1) do
	if id ~= oldid then
		oldid = id
		if id == 9043887091 then
			text = "Lofi Chill A - Hip Hop Shop"
		elseif id == 9047053092 then
			text = "Flex Hip Hop Lofi - Red Line"
		elseif id == 9047050075 then
			text = "Lofi Dreams - Red Line"
		elseif id == 9048042682 then
			text = "Smooth Lofi - Kosinus"
		elseif id == 9048510043 then
			text = "Neon Sky - Afro Musique"
		elseif id == 9048039902 then
			text = "Kaleidoscope - Kosinus"
		elseif id == 9047049362 then
			text = "Fresh Lo-fi HipHop - Red Line"
		elseif id == 9047104336 then
			text = "Sunday In Bed - Afro Dizzy"
		elseif id == 13119735599 then
			text = "Arcane Dreams - Reals_Dev"
		end
		music.TimePosition = 0
		music.SoundId = "rbxassetid://"..id
		music.Playing = true
		game.ReplicatedStorage.sendsong:FireServer(text)
		repeat wait() until music.Playing == false
		id = soundids[math.random(1, #soundids)]
	else
		id = soundids[math.random(1, #soundids)]
	end
end
