local ui = script.Parent
local startframe = ui.startframe
local createflashcardframe = ui.createflashcardframe
local viewflashcardframe = ui.viewflashcardframe
local categoryflashcardframe = ui.categoryflashcardframe
local ts = game.TweenService
local tf1 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local categoryclicked = ''
local currentflashcard = 1

function animateText(text : string)
	for i = 1, #text do
		startframe.TextLabel.Text = string.sub(text, 1, i)
		wait()
	end
end

function flashcardsIntro()
	ts:Create(startframe, tf1, {BackgroundTransparency = 0}):Play()
	wait(1)
	animateText('would you like to create or view your flashcards?')
	for i,v in pairs(startframe:GetChildren()) do
		if v:IsA('TextButton') then
			ts:Create(v, tf1, {BackgroundTransparency = 0}):Play()
			ts:Create(v, tf1, {TextTransparency = 0}):Play()
			ts:Create(v.UIStroke, tf1, {Transparency = 0}):Play()
			wait(0.5)
		end
	end
end

function createFlashcards()
	for i,v in pairs(startframe:GetChildren()) do
		if v:IsA('TextButton') then
			ts:Create(v, tf1, {BackgroundTransparency = 1}):Play()
			ts:Create(v, tf1, {TextTransparency = 1}):Play()
			ts:Create(v.UIStroke, tf1, {Transparency = 1}):Play()
			wait(0.5)
		end
	end
	startframe.Visible = false
	createflashcardframe.Visible = true
end

function editFlashcards(front: boolean)
	if front then
		local fronttext = createflashcardframe.fronttext.Text
		createflashcardframe.flashcardtemplate.front.TextLabel.Text = fronttext
		createflashcardframe.flashcardtemplate.front.Visible = true
		createflashcardframe.flashcardtemplate.back.Visible = false
	else
		local backtext = createflashcardframe.backtext.Text
		createflashcardframe.flashcardtemplate.back.TextLabel.Text = backtext
		createflashcardframe.flashcardtemplate.front.Visible = false
		createflashcardframe.flashcardtemplate.back.Visible = true
	end
end

function resetFlashcard()
	--createflashcardframe.category.Text = ''
	createflashcardframe.fronttext.Text = ''
	createflashcardframe.backtext.Text = ''
end

function submitFlashcard()
	local data = {
		['CATEGORY'] = '',
		['BACKTEXT'] = '',
		['FRONTTEXT'] = '',
	}
	if createflashcardframe.category.Text == nil or createflashcardframe.fronttext.Text == nil or createflashcardframe.backtext.Text == nil then
		game.ReplicatedStorage.sendsong:FireServer('Please put a category, front text or back text!')
	else
		data.CATEGORY = createflashcardframe.category.Text
		data.FRONTTEXT = createflashcardframe.fronttext.Text
		data.BACKTEXT = createflashcardframe.backtext.Text
		game.ReplicatedStorage.submitflashcard:FireServer(data)
		resetFlashcard()
	end
end

function createCategories(index, value)
	startframe.Visible = false
	viewflashcardframe.Visible = true
	if index == 'CATEGORY' then
		if not viewflashcardframe:FindFirstChild(value) then
			local newcategory = game.ReplicatedStorage.categorytemplate:Clone()
			newcategory.Parent = viewflashcardframe
			newcategory.Text = value
			newcategory.Name = value
		end
	end
end

function flashcardNumberChecker()
	for i,v in pairs(categoryflashcardframe:GetChildren()) do
		if v:IsA('CanvasGroup') then
			if v.Name == tostring(currentflashcard) then
				v.Visible = true
			else
				v.Visible = false
			end
		end
	end
end

function findHighestAmount()
	local highestamount = 0
	for i,v in pairs(categoryflashcardframe:GetChildren()) do
		highestamount += 1
		if not categoryflashcardframe:FindFirstChild(highestamount) then
			return highestamount
		end
	end
end

function onCategoryButtonClick(data, categoryname)
	print('attempted')
	viewflashcardframe.Visible = false
	categoryflashcardframe.Visible = true
	categoryclicked = categoryname
	local count = 0
	for _,v in pairs(data) do
		local fronttext
		local backtext
		for k,v2 in pairs(v) do
			print(k)
			if k == 'CATEGORY' then
				print('it found the category')
				if v2 == categoryclicked then
					print('same category')
					for i3,v3 in pairs(v) do
						print(i3)
						print(v3)
						if i3 == 'FRONTTEXT' then
							print('found fronttext '..v3)
							fronttext = v3
						elseif i3 == 'BACKTEXT' then
							print('found backtext '..v3)
							backtext = v3
						end
					end
				else
					print('unfound')
				end
			end
		end
		if backtext == nil then
			print('wont do')
		else
			count += 1
			local newflashcard = game.ReplicatedStorage.categoryflashtemplate:Clone()
			newflashcard.Name = tostring(count)
			newflashcard.Parent = categoryflashcardframe
			newflashcard.flashcardtemplate.back.TextLabel.Text = backtext
			newflashcard.flashcardtemplate.front.TextLabel.Text = fronttext
		end
	end
	
	for i,v in pairs(categoryflashcardframe:GetChildren()) do
		if v.Name == '1' then
			v.Visible = true
		else
			v.Visible = false
		end
	end
	
	for i,v in pairs(categoryflashcardframe:GetChildren()) do
		if v:IsA('TextButton') then
			v.Visible = true
		end
	end
end

function onNextClick()
	currentflashcard += 1
	if not categoryflashcardframe:FindFirstChild(currentflashcard) then
		currentflashcard = 1
		flashcardNumberChecker()
	else
		flashcardNumberChecker()
	end
end

function onLastClick()
	currentflashcard -= 1
	if currentflashcard < 1 then
		currentflashcard = findHighestAmount()
		flashcardNumberChecker()
	else
		flashcardNumberChecker()
	end
end

function onFlipButton()
	for i,v in pairs(categoryflashcardframe:GetChildren()) do
		if v:IsA('CanvasGroup') then
			if v.Visible == true then
				v.flashcardtemplate.back.Visible = not v.flashcardtemplate.back.Visible
				v.flashcardtemplate.front.Visible = not v.flashcardtemplate.front.Visible
			end
		end
	end
end

function recurseTable(tbl, func)
	for index, value in pairs(tbl) do
		if type(value) == 'table' then
			recurseTable(value, func)
		else
			func(index, value)
		end
	end
end

game.ReplicatedStorage.flashcards.OnClientEvent:Connect(flashcardsIntro)
startframe.createflashcards.MouseButton1Click:Connect(createFlashcards)
startframe.viewflashcards.MouseButton1Click:Connect(function()
	game.ReplicatedStorage.sendflashcard:FireServer()
end)
createflashcardframe.backtext.Changed:Connect(function()
	editFlashcards(false)
end)
createflashcardframe.fronttext.Changed:Connect(function()
	editFlashcards(true)
end)
createflashcardframe.TextButton.MouseButton1Click:Connect(submitFlashcard)
categoryflashcardframe.last.MouseButton1Click:Connect(onLastClick)
categoryflashcardframe.next.MouseButton1Click:Connect(onNextClick)
game.ReplicatedStorage.sendflashcard.OnClientEvent:Connect(function(data)
	recurseTable(data, createCategories)
end)
game.ReplicatedStorage.sendflashcard2.OnClientEvent:Connect(function(data, categoryname)
	onCategoryButtonClick(data, categoryname)
	print('recieved')
end)
game.ReplicatedStorage.flipflashcard.OnClientEvent:Connect(onFlipButton)

game:GetService('UserInputService').InputBegan:Connect(function(object)
	if object == Enum.KeyCode.KeypadEnter then
		submitFlashcard()
	end
end)

