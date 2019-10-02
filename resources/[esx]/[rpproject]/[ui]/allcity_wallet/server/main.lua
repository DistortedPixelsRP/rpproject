-----------------------------------
--        Credit for Kalu / Kashnars      --
-----------------------------------
ESX               = nil

----CONFIG----

--END CONFIG--

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money

end


RegisterServerEvent('allcity_wallet:getMoneys')
AddEventHandler('allcity_wallet:getMoneys', function()

	local _source = source

	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer ~= nil then
		local wallet 		= getMoneyFromUser(_source)
		local bank 			= getBankFromUser(_source)
		local black_money 	= getBlackMoneyFromUser(_source)

		local society 		= nil
		local society2 		= nil

		local grade_name 	= xPlayer.job.grade_name
		local job_name 		= xPlayer.job.name

		local grade2_name 	= xPlayer.job2.grade_name
		local job2_name 	= xPlayer.job2.name

		if grade_name == 'boss' then
	 		local mySociety = nil
			TriggerEvent('esx_society:getSociety', job_name, function(_society)
				mySociety = _society
			end)

	  		if mySociety ~= nil then

		    	TriggerEvent('esx_addonaccount:getSharedAccount', mySociety.account, function(account)
		    		society = account.money
		    	end)
		  	end
		end
		if grade2_name == 'boss' then
			local mySociety = nil
		   TriggerEvent('esx_society2:getSociety', job2_name, function(_society)
			   mySociety = _society
		   end)

			 if mySociety ~= nil then

			   TriggerEvent('esx_addonaccount:getSharedAccount', mySociety.account, function(account)
				   society2 = account.money
			   end)
			 end
	   end
	    TriggerClientEvent("allcity_wallet:setValues", _source, wallet, bank, black_money, society, society2)
	end

end)




