local ESX = nil
-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Open ID card
RegisterServerEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function(ID, targetID, type)
	local xPlayer 	 = ESX.GetPlayerFromId(ID)
	local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source 	 = ESX.GetPlayerFromId(targetID).source
	local show       = false
	local licenseItemName, item = nil, nil

	MySQL.Async.fetchAll('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = @identifier', {['@identifier'] = identifier},
	function (user)
		if (user[1] ~= nil) then
			MySQL.Async.fetchAll('SELECT type FROM user_licenses WHERE owner = @identifier', {['@identifier'] = identifier},
			function (licenses)
				if type ~= nil then
					for i=1, #licenses, 1 do
						if type == 'driver' then
							if licenses[i].type == 'drive' or licenses[i].type == 'drive_bike' or licenses[i].type == 'drive_truck' then
								show = true
								licenseItemName = 'drive_card'
							end
						elseif type =='weapon' then
							if licenses[i].type == 'weapon' then
								show = true
								licenseItemName = 'weapon_card'
							end
						elseif type =='health' then
							if licenses[i].type == 'health_license' then
								show = true
								licenseItemName = 'health_card'
							end
						end
					end
				else
					show = true
					licenseItemName = 'identification'
				end

				if show then
					item = xPlayer.getInventoryItem(licenseItemName)

					if item.count > 0 then
						local array = {
							user = user,
							licenses = licenses
						}
						TriggerClientEvent('jsfour-idcard:open', _source, array, type)
					else
						TriggerClientEvent('esx:showNotification', _source, "No tienes este documento en el inventario")
					end
				else
					TriggerClientEvent('esx:showNotification', _source, "No tienes este documento")
				end
			end)
		end
	end)
end)
