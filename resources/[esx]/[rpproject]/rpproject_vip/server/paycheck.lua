rpproject_StartPayCheck = function()

	function payCheck()
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local identifier     = xPlayer.identifier
            local datavips  = vipslist[identifier]

			if datavips ~= nil then
				if datavips.paycheck > 0 then
					if datavips.id_grado > 0 then -- VIPS
						xPlayer.addAccountMoney('bank', datavips.paycheck)
						TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, _U('bank'), datavips.nombre_pack, _U('received_salary', datavips.paycheck), 'CHAR_AMMUNATION', 9)
					end
				end
				if datavips.packfundador > 0 then
					xPlayer.addAccountMoney('bank', Config.packFundadorSalario)
					TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, "Pack Fundador", " ", _U('received_salary', Config.packFundadorSalario), 'CHAR_AMMUNATION', 9)
				end
			end

		end

		SetTimeout(Config.PaycheckInterval, payCheck)

	end

	SetTimeout(Config.PaycheckInterval, payCheck)

end