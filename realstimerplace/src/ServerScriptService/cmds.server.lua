local isopen = false
local mps = game:GetService("MarketplaceService")

game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if msg == "/secret" then
			if isopen == false then
				isopen = true
				plr.PlayerGui.main.Enabled = false
				plr.PlayerGui.secret.Enabled = true
			else
				isopen = false
				plr.PlayerGui.main.Enabled = true
				plr.PlayerGui.secret.Enabled = false
			end

		end
	end)
	plr.Chatted:Connect(function(msg)
		if msg == '/secret2' then
			if isopen == false then
				isopen = true
				plr.PlayerGui.main.Enabled = false
				plr.PlayerGui.secret2.Enabled = true
			else
				isopen = false
				plr.PlayerGui.main.Enabled = true
				plr.PlayerGui.secret2.Enabled = false
			end
		end
	end)
	plr.Chatted:Connect(function(msg)
		if msg == '/skip' then
			plr.PlayerGui.music.Playing = false
			plr.PlayerGui.musicscript.Enabled = false
			wait(0.01)
			plr.PlayerGui.musicscript.Enabled = true
		end
	end)
	plr.Chatted:Connect(function(msg)
		if msg == '/gpt' then
			if mps:UserOwnsGamePassAsync(plr.UserId, 184244162) then
				if isopen == false then
					isopen = true
					plr.PlayerGui.chatgpt.Enabled = true
					plr.PlayerGui.main.Enabled = false
				else
					isopen = false
					plr.PlayerGui.chatgpt.Enabled = false
					plr.PlayerGui.main.Enabled = true
				end
			else
				mps:PromptGamePassPurchase(plr, 184244162)
			end
		end
	end)
	plr.Chatted:Connect(function(msg)
		if msg == '/private' then
			if plr.UserId == 206307806 then
				plr.PlayerGui.privateschedule.Enabled = true
			end
		end
	end)
	plr.Chatted:Connect(function(msg)
		if msg == '/flashcards' or msg == '/fc' or msg == '/f' then
			plr.PlayerGui.flashcards.Enabled = true
			game.ReplicatedStorage.flashcards:FireAllClients()
		end
	end)
	plr.Chatted:Connect(function(msg)
		local split = string.split(msg, ' ')
		if split[1] == '/add' then
			if split[2] == nil then
				print('no number')
			else
				game.ReplicatedStorage.Minutes.Value += tonumber(split[2])
			end
		elseif split[1] == '/remove' then
			if split[2] == nil then
				print('no number')
			else
				game.ReplicatedStorage.Minutes.Value -= tonumber(split[2])
			end
		end
	end)
end)