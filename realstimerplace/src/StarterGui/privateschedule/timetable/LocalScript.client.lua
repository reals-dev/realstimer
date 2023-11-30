local timetable = script.Parent
local week1 = timetable.week1
local week2 = timetable.week2
local currentday = os.date('%A')

local subjectswithdays = {
	['Monday'] = {
		week1['1'],
		week1['6'],
		week1['999']
	},
	
	['Tuesday'] = {
		week1['2'],
		week1['7'],
		week1['9999']
	},
	
	['Wednesday'] = {
		week1['3'],
		week1['8'],
		week1['99999']
	},
	
	['Thursday'] = {
		week1['4'],
		week1['9'],
		week1['999999']
	},
	
	['Friday'] = {
		week1['5'],
		week1['99'],
		week1['9999999']
	},
	
}

function printtable()
	for i,v in pairs(subjectswithdays) do
		print(i)
		print(v)
	end
end


function day()
	for i,v in pairs(subjectswithdays[currentday]) do
		v.BackgroundColor3 = Color3.fromRGB(104, 255, 93)
	end
	
	script.Parent.weekdays[currentday].BackgroundColor3 = Color3.fromRGB(104, 255, 93)
end

--printtable()
day()

for i,v in pairs(week1:GetChildren()) do
	if v:IsA('TextButton') then
		v.MouseButton1Click:Connect(function()
			print(v.Text..' confirmation prompt')
			game.ReplicatedStorage.confirmation:FireServer(v.Text)
		end)
	end
end

