--[[WARNING!!! MAKE SURE THIS MODULE IS IN SERVER STORAGE OR SERVER SCRIPT SERVICE]]

-- This module was created by LuaScape (Roblox: Snawrk)
-- Proxy Created By LewisTehMinerz
-- DO NOT Edit the code below unless you know what you're doing!
---------------------------------------------------------------------------------------

local webhookService = {}

local https = game:GetService("HttpService")


function webhookService:createMessage(url, message : string)
	local data = {
		["content"] = message
	}
	local finalData = https:JSONEncode(data)
	local finalUrl = string.gsub(url, "discord.com", "webhook.lewisakura.moe")
	local finalBackupUrl = string.gsub(url, "discord.com", "webhook.newstargeted.com")
	local good, bad = pcall(function()
		https:PostAsync(finalUrl, finalData)
	end)
	if good then
		print("Webhook Request Success!")
	else
		print("Webhook Request Failed " .. bad .. " Trying backup URL")
		https:PostAsync(finalBackupUrl, finalData)
		print("Attempted request with backup URL, if webhook does not send then both URLS are down or you have a bad request.")
	end
end


function webhookService:createEmbed(url, title : string, message :string , fields, image)
	local data = {
		['content'] = "",
		['embeds'] = {{
			["image"] = {["url"] = image},
			['title'] = "**"..title.."**",
			['description'] = message,
			['type'] = "rich",
			["color"] = tonumber(0xffffff),
			['fields'] = fields

		},
		},
	}
	local finalData = https:JSONEncode(data)
	local finalUrl = string.gsub(url, "discord.com", "webhook.lewisakura.moe")
	local finalBackupUrl = string.gsub(url, "discord.com", "webhook.newstargeted.com")
	
	local good, bad = pcall(function()
		https:PostAsync(finalUrl, finalData)
	end)
	if good then
		print("Webhook Request Success!")
	else
		print("Webhook Request Failed " .. bad .. " Trying backup URL")
		https:PostAsync(finalBackupUrl, finalData)
		print("Attempted request with backup URL, if webhook does not send then both URLS are down or you have a bad request.")
		
	end
end


function webhookService:createAuthorEmbed(url, authorName : string, description : string)
	local data = {
		["embeds"] = {{
			["author"] = {
				["name"] = authorName,
			},
			["description"] = description,
			["color"] = tonumber(0x00FF00),
			
			
		}},
	}
	
	local finalData = https:JSONEncode(data)
	local finalUrl = string.gsub(url, "discord.com", "webhook.lewisakura.moe")
	local finalBackupUrl = string.gsub(url, "discord.com", "webhook.newstargeted.com")
	
	local good, bad = pcall(function()
		https:PostAsync(finalUrl, finalData)
	end)
	if good then
		print("Webhook Request Success!")
	else
		print("Webhook Request Failed " .. bad .. " Trying backup URL")
		https:PostAsync(finalBackupUrl, finalData)
		print("Attempted request with backup URL, if webhook does not send then both URLS are down or you have a bad request.")
	end
end


return webhookService
