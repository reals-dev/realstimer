local rs = game.ReplicatedStorage
local modules = rs.Modules
local icon = require(modules.Icon)
local controller = require(modules.Icon.IconController)

local icon = icon.new()
:setName('togglemusic')
:setImage(6034323679)
:setProperty('deselectWhenOtherIconSelected', false)
:setTip('Toggle the Music!')
:bindEvent('selected', function(icon)
	rs.mutemusic:FireServer()
end)
:bindEvent('deselected', function(icon)
	rs.unmutemusic:FireServer()
end)
:setRight()
:bindToggleKey(Enum.KeyCode.M)

game.ReplicatedStorage.getmusic.OnClientEvent:Connect(function(isplaying)
	if isplaying == true then
		rs.unmutemusic:FireServer()
	else
		rs.mutemusic:FireServer()
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
	local selectedOrDeselectedString = icon:getToggleState()
	
	if selectedOrDeselectedString == 'selected' then
		game.ReplicatedStorage.savemusic:FireServer(false)
	else
		game.ReplicatedStorage.savemusic:FireServer(true)
	end
end)