ESX = nil
local PlayersTransforming  = {}
local PlayersMaking     = {}
local PlayersSelling    = {}
local PlayersHarvesting = {}
local PlayersTrading 	= {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function Harvest(source, zone)
	if PlayersHarvesting[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		local action = 'harvest'
		local itemQuantity = xPlayer.getInventoryItem('wood').count

		if xPlayer.getInventoryItem('axe').count < 1 and xPlayer.getInventoryItem('chainsaw').count < 1 then
			TriggerClientEvent('esx:showNotification', source, 'No tienes un hacha o una motocierra')
			return
		end
		if 20 <= itemQuantity then
			TriggerClientEvent('esx:showNotification', source, _U('not_enough_wood_place'))
		else
			if 20 - itemQuantity <= 4 then
				local qtty = 20-itemQuantity
				TriggerClientEvent('esx:showNotification', _source, _U('wood_taken'))
				TriggerClientEvent('esx_lumberjack:waitTime', _source, qtty, action)
			else
				local qtty = 4
				TriggerClientEvent('esx:showNotification', _source, _U('wood_taken'))
				TriggerClientEvent('esx_lumberjack:waitTime', _source, qtty, action)
			end
		end
		return
	end
end

RegisterServerEvent('esx_lumberjack:startHarvest')
AddEventHandler('esx_lumberjack:startHarvest', function(zone)
	local _source = source
	PlayersHarvesting[_source] = true  
	Harvest(_source,zone)
end)


RegisterServerEvent('esx_lumberjack:stopHarvest')
AddEventHandler('esx_lumberjack:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		TriggerClientEvent('esx:showNotification', _source, 'Acabas de salir de la ~r~zona de recoleccion')
		PlayersHarvesting[_source] = false
	end
end)

function Transform(source, zone)
	if PlayersTransforming[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		local action = 'process_wood'

		-- if xPlayer.getInventoryItem('saw').count < 1 then
		-- 	TriggerClientEvent('esx:showNotification', source, 'No tienes un serrucho')
		-- 	return
		-- end

		local itemQuantity = xPlayer.getInventoryItem('log').count
		local qtty = 20 - itemQuantity
		if itemQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, _U('not_enough_wood'))
			return
		else
			TriggerClientEvent('esx:showNotification', _source, _U('cutted_wood_taken'))
			TriggerClientEvent('esx_lumberjack:waitTime', _source, itemQuantity, action)				
		end
	end	
end

RegisterServerEvent('esx_lumberjack:startTransform')
AddEventHandler('esx_lumberjack:startTransform', function(zone)
	local _source = source
	PlayersTransforming[_source] = true  
	Transform(_source,zone)
end)

RegisterServerEvent('esx_lumberjack:stopTransform')
AddEventHandler('esx_lumberjack:stopTransform', function()
	local _source = source
	
	if PlayersTransforming[_source] == true then
		TriggerClientEvent('esx:showNotification', _source, 'Acabas de salir de la ~r~zona de corte')
		PlayersTransforming[_source] = false
	end
end)

function Making(source, zone, item)
	print(item)
	if PlayersMaking[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source

		local action = nil;
		
		if item == 'pine_wood' then
			action = "pine_wood_process"
		elseif item == "cedro_wood" then
			action = "cedro_wood_process"
		elseif item == "abeto_wood" then
			action = "abeto_wood_process"
		elseif item == "roble_wood" then
			action = "roble_wood_process"
		elseif item == "wood" then
			action = "wood_process"
		end


		local itemQuantity = xPlayer.getInventoryItem(item).count
		-- local qtty = 20 - itemQuantity
		if itemQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, _U('not_enough_cutted_wood'))
			return
		else
			TriggerClientEvent('esx:showNotification', _source, _U('plank_taken'))
			TriggerClientEvent('esx_lumberjack:waitTime', _source, itemQuantity, action)	
		end
	end	
end

RegisterServerEvent('esx_lumberjack:startMaking')
AddEventHandler('esx_lumberjack:startMaking', function(zone, item)
	local _source = source
	PlayersMaking[_source] = true  
	Making(_source,zone, item)
end)

RegisterServerEvent('esx_lumberjack:stopMaking')
AddEventHandler('esx_lumberjack:stopMaking', function()
	local _source = source
	
	if PlayersMaking[_source] == true then
		TriggerClientEvent('esx:showNotification', _source, 'Acabas de salir de la ~r~zona de fabricación')
		PlayersMaking[_source] = false
	end
end)

function Trading(source, zone)
	if PlayersTrading[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		local action = 'trade_cutted_wood'
		local itemQuantity = xPlayer.getInventoryItem('plank_wood').count
		local qtty = 20 - itemQuantity
		if itemQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, _U('not_enough_cutted_wood'))
			return
		else
			TriggerClientEvent('esx:showNotification', _source, _U('coal_taken'))
			TriggerClientEvent('esx_lumberjack:waitTime', _source, itemQuantity, action)	
		end
	end	
end

RegisterServerEvent('esx_lumberjack:startTrading')
AddEventHandler('esx_lumberjack:startTrading', function(zone)
	local _source = source
	PlayersTrading[_source] = true  
	Trading(_source,zone)
end)

RegisterServerEvent('esx_lumberjack:stopTrading')
AddEventHandler('esx_lumberjack:stopTrading', function()
	local _source = source
	
	if PlayersTrading[_source] == true then
		TriggerClientEvent('esx:showNotification', _source, 'Acabas de salir de la ~r~zona de cambio')
		PlayersTrading[_source] = false
	end
end)

function Sell(source, zone, item)
	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		local action = nil

		if zone == 'SellZone' then
			if item == 'pine_plank' then
				action = 'pine_plank_sell'
				itemQuantity = xPlayer.getInventoryItem('plank_pino_wood').count
					
			end
			if item == 'cedro_plank' then
				action = 'cedro_plank_sell'
				itemQuantity = xPlayer.getInventoryItem('plank_cedro_wood').count
					
			end
			if item == 'abeto_plank' then
				action = 'abeto_plank_sell'
				itemQuantity = xPlayer.getInventoryItem('plank_abeto_wood').count
					
			end
			if item == 'roble_plank' then
				action = 'roble_plank_sell'
				itemQuantity = xPlayer.getInventoryItem('plank_roble_wood').count
					
			end
			if item == 'coal' then
				action = 'coal_sell'
				itemQuantity = xPlayer.getInventoryItem('coal').count
					
			end
		end
		if itemQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, 'No tienes suficiente cantidad de este tablón.')
			return
		else
			TriggerClientEvent('esx_lumberjack:waitTime', _source, itemQuantity, action)
		end
	end
end

RegisterServerEvent('esx_lumberjack:startSell')
AddEventHandler('esx_lumberjack:startSell', function(zone, item)
	local _source = source
	PlayersSelling[_source]=true
	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	Sell(_source, zone, item)
end)

RegisterServerEvent('esx_lumberjack:stopSell')
AddEventHandler('esx_lumberjack:stopSell', function()
	local _source = source

	if PlayersSelling[_source] == true then
		TriggerClientEvent('esx:showNotification', _source, 'Acabas de salir de la ~r~zona de venta')
		PlayersSelling[_source] = false
	end
end)

ESX.RegisterServerCallback('esx_lumberjack:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})
end)

RegisterServerEvent('esx_lumberjack:addQuantity')
AddEventHandler('esx_lumberjack:addQuantity', function(logs, pine_wood, cedro_wood, abeto_wood, roble_wood, plank_abeto_wood, plank_cedro_wood, plank_pine_wood, plank_roble_wood, plank_wood, coal, action)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	

	if action == 'harvest' then
		xPlayer.addInventoryItem('log', logs)
		TriggerClientEvent('esx_lumberjack:newMission', _source)

	elseif action == 'process_wood' then
		xPlayer.removeInventoryItem('log', logs)
		if pine_wood >= 0 then
			xPlayer.addInventoryItem('pine_wood', pine_wood)
		end
		if cedro_wood >= 0 then
			xPlayer.addInventoryItem('cedro_wood', cedro_wood)
		end
		if abeto_wood >= 0 then
			xPlayer.addInventoryItem('abeto_wood', abeto_wood)
		end
		if roble_wood >= 0 then
			xPlayer.addInventoryItem('roble_wood', roble_wood)
		end
	-- cambia madera por tablones de amdera
	elseif action == "abeto_wood_process" then
		xPlayer.removeInventoryItem('pine_wood', plank_abeto_wood)
		if plank_abeto_wood >= 0 then
			xPlayer.addInventoryItem('plank_abeto_wood', plank_abeto_wood)
		end
	elseif action == "cedro_wood_process" then
		xPlayer.removeInventoryItem('cedro_wood', plank_cedro_wood)
		if plank_cedro_wood >= 0 then
			xPlayer.addInventoryItem('plank_cedro_wood', plank_cedro_wood)
		end
	elseif action == "pine_wood_process" then
		xPlayer.removeInventoryItem('pine_wood', plank_pine_wood)
		if plank_pine_wood >= 0 then
			xPlayer.addInventoryItem('plank_pino_wood', plank_pine_wood)
		end
	elseif action == "roble_wood_process" then
		xPlayer.removeInventoryItem('roble_wood', plank_roble_wood)
		if plank_roble_wood >= 0 then
			xPlayer.addInventoryItem('plank_roble_wood', plank_roble_wood)
		end
	elseif action == "wood_process" then
		xPlayer.removeInventoryItem('wood', plank_wood)
		if plank_wood >= 0 then
			xPlayer.addInventoryItem('plank_wood', plank_wood)
		end
	-- cambia madera por carbon
	elseif action == "trade_cutted_wood" then
		xPlayer.removeInventoryItem('plank_wood', coal)
		if coal >= 0 then
			xPlayer.addInventoryItem('coal', coal)
		end
	-- vende items
	elseif action == "pine_plank_sell" then
		local pago = Config.PinePlankSell * plank_pine_wood
		xPlayer.removeInventoryItem('plank_pino_wood', plank_pine_wood)
		xPlayer.addMoney(pago)
		TriggerClientEvent('esx:showNotification', _source, 'Ganaste: ~r~$'.. pago)

	elseif action == "cedro_plank_sell" then
		local pago = Config.CedroPlankSell * plank_cedro_wood
		xPlayer.removeInventoryItem('plank_cedro_wood', plank_cedro_wood)
		xPlayer.addMoney(pago)
		TriggerClientEvent('esx:showNotification', _source, 'Ganaste: ~r~$'.. pago)

	elseif action == "roble_plank_sell" then
		local pago = Config.RoblePlankSell * plank_roble_wood
		xPlayer.removeInventoryItem('plank_roble_wood', plank_roble_wood)
		xPlayer.addMoney(pago)
		TriggerClientEvent('esx:showNotification', _source, 'Ganaste: ~r~$'.. pago)

	elseif action == "abeto_plank_sell" then
		local pago = Config.AbetoPlankSell * plank_abeto_wood
		xPlayer.removeInventoryItem('plank_abeto_wood', plank_abeto_wood)
		xPlayer.addMoney(pago)
		TriggerClientEvent('esx:showNotification', _source, 'Ganaste: ~r~$'.. pago)

	elseif action == "coal_sell" then
		local pago = Config.CoalSellPrice * coal
		xPlayer.removeInventoryItem('coal', coal)
		xPlayer.addMoney(pago)
		TriggerClientEvent('esx:showNotification', _source, 'Ganaste: ~r~$'.. pago)
	end
end)