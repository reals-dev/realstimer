local url = "https://api.openai.com/v1/chat/completions"
local HTTP = game:GetService("HttpService")
local rs = game.ReplicatedStorage
local headers = {
	["Authorization"] = [REDACTED],
}
local webhook = require(rs.Modules.webhook)
local ds = game:GetService("DataStoreService")
local pastgpt = ds:GetDataStore("GPT-USES")
local webhookurl = [REDACTED]

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
