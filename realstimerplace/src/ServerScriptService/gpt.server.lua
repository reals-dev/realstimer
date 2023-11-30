local url = "https://api.openai.com/v1/chat/completions"
local HTTP = game:GetService("HttpService")
local rs = game.ReplicatedStorage
local headers = {
	["Authorization"] = "Bearer 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",
}
local webhook = require(rs.Modules.webhook)
local ds = game:GetService("DataStoreService")
local pastgpt = ds:GetDataStore("GPT-USES")
local webhookurl = 'https://discord.com/api/webhooks/1114155635152519188/eHYaJ6_3eWqu5ZETDmepZx4JIXeXPE9_AfGwHSNSvGv8UoAM5thoIEh8nSamhImSO5i7'

rs.messagerecieved.OnServerEvent:Connect(function(plr, text)
	local body = HTTP:JSONEncode({
		model = "gpt-3.5-turbo",
		messages = {{
			role = "user",
			content = text
		}}
	})

	local response = HTTP:PostAsync(url, body, Enum.HttpContentType.ApplicationJson, nil, headers)

	local decoded = HTTP:JSONDecode(response) 
	print(response)
	
	local message = decoded["choices"][1]["message"]["content"]
	print(message)
	pastgpt:SetAsync(plr.UserId, "INPUT: "..text.."OUTPUT: "..message)
	rs.messageresponse:FireAllClients(message)
	webhook:createAuthorEmbed(webhookurl, plr.Name.." ("..plr.UserId..")".." has used ChatGPT", "Input: "..text.."\n\n Output: "..message)
	plr.PlayerGui.chatgpt.db.Value = false
end)