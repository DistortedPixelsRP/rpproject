Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(597560325407113216)
		SetDiscordRichPresenceAsset('rp_project_redondo')
        SetDiscordRichPresenceAssetText('RPProject')
        SetDiscordRichPresenceAssetSmall('info')
        SetDiscordRichPresenceAssetSmallText('https://rpproject.net')
		Citizen.Wait(60000)
	end
end)
Citizen.CreateThread(function()
	while true do
		local pId = GetPlayerServerId(PlayerId())
		local pName = GetPlayerName(PlayerId())
		SetRichPresence("["..GetPlayers().."/128]" .. " ID: "..pId.." | "..pName)
		Citizen.Wait(15000)
	end
end)

function GetPlayers()
    local players = {}
    for _,player in ipairs(GetActivePlayers()) do
		table.insert(players, player)
	end
    return #players
end