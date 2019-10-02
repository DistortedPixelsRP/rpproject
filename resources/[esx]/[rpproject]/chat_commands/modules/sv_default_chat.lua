AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', "^3" .. command_args[1] .. "^0 no es un comando valido" } })
end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		if SETTINGS.use_framework_name then name = GetCharacterName(source) end

		local xPlayer = ESX.GetPlayerFromId(source)
		local group = xPlayer.getGroup()
		
		if group == "admin" or group == "superadmin" then
			messageM = { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(163, 0, 40, 0.7); border-radius: 3px;"><i class="fas fa-crown"></i> {0}:<br> {1}<br></div>',
				args = { "Admin | " .. name, message }, 
			}
		elseif group == "moderator" or group == "mod" then
			messageM = { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 57, 162, 0.7); border-radius: 3px;"><i class="fas fa-user-secret"></i> {0}:<br> {1}<br></div>',
				args = { "Moderador | " .. name, message }, 
			}
        else
			messageM = { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 165, 0, 0.3); border-radius: 3px;"><i class="fas fa-user"></i> {0}:<br> {1}<br></div>',
				args = { "Civil | " .. name, message }, 
			}
		end
		TriggerClientEvent('chat:addMessage', -1, messageM)
	end
end)

function has_value (table, val)
	for i=1,#table do
		if table[i] == val then 
		   return true
		end
	end
    return false
end

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		return ('%s %s'):format(result[1].firstname, result[1].lastname)
	else
		return GetPlayerName(source)
	end
end