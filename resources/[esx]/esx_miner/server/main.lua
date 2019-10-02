
ESX = nil
local PlayersMining = {}
local PlayersWashing  = {}
local PlayersMelting = {}
local PlayersSelling       = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)





local function Mining(source, zone)
	if PlayersMining[source] == true then


		local _source = source
		local xPlayer  = ESX.GetPlayerFromId(_source)
		local action = 'mining'

		if xPlayer.getInventoryItem('neumatic_hammer').count < 1 then
			TriggerClientEvent('esx:showNotification', source, 'No tienes un martillo neumatico')
			return
		end

		if (zone == 'Stone1' or zone == 'Stone2' or zone == 'Stone3' or zone == 'Stone4' or zone == 'Stone5') then
			local itemQuantity = xPlayer.getInventoryItem('stone').count
			if 100 <= itemQuantity then
				TriggerClientEvent('esx:showNotification', source, 'No puedes cargar mas piedras')
			else
				if 100 - itemQuantity <= 20 then
					local qtty = 100-itemQuantity
					TriggerClientEvent('esx_minerjob:waitTime', _source, qtty, action)
				else
					local qtty = 20
					TriggerClientEvent('esx_minerjob:waitTime', _source, qtty, action)
				end
			end
			return
			
		end
	end
end


RegisterServerEvent('esx_minerjob:startMining')
AddEventHandler('esx_minerjob:startMining', function(zone)
	local _source = source
	
	PlayersMining[_source]=true
	Mining(_source,zone)
	TriggerClientEvent('esx:showNotification', _source, 'Comienza el proceso de ~r~extraccion')
end)


RegisterServerEvent('esx_minerjob:stopMining')
AddEventHandler('esx_minerjob:stopMining', function()
	local _source = source
	
	PlayersMining[_source]=false
	TriggerClientEvent('esx:showNotification', _source, 'Acabas de salir de la ~r~zona')
end)




local function Wash(source, zone)

	if PlayersWashing[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		
		if zone == "StoneWash" then
			local action = 'stone_washing'
			local itemQuantity = xPlayer.getInventoryItem('stone').count
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'No tienes suficientes piedras')
				return
			else
				TriggerClientEvent('esx_minerjob:waitTime', _source, itemQuantity, action)				
			end
		end
	end
end

RegisterServerEvent('esx_minerjob:startWashing')
AddEventHandler('esx_minerjob:startWashing', function(zone)
	local _source = source

	PlayersWashing[_source]=true
	Wash(_source,zone)
	TriggerClientEvent('esx:showNotification', _source, 'Comienza el proceso de ~r~lavado')
end)

RegisterServerEvent('esx_minerjob:stopWashing')
AddEventHandler('esx_minerjob:stopWashing', function()

	local _source = source
	
	if PlayersWashing[_source] == true then
		PlayersWashing[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Acabas de salir de la ~r~zona')
	end
end)




local function Melt(source, zone, item)

	if PlayersMelting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		local itemQuantity = 0
		local action = nil
		
		if zone == "Foundry" then
			
			if item == 'iron_rock' then
				action = 'iron_melting'
				itemQuantity = xPlayer.getInventoryItem('iron_rock').count
			elseif item == 'copper_rock' then
				action = 'copper_melting'
				itemQuantity = xPlayer.getInventoryItem('copper_rock').count
			elseif item == 'gold_rock' then
				action = 'gold_melting'
				itemQuantity = xPlayer.getInventoryItem('gold_rock').count
			else
				action = 'sulfur_melting'
				itemQuantity = xPlayer.getInventoryItem('sulfur_rock').count
			end

			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'No tienes suficiente cantidad de esta piedra')
				return
			else
				TriggerClientEvent('esx_minerjob:waitTime', _source, itemQuantity, action)				
			end
		end
	end
end

RegisterServerEvent('esx_minerjob:startMelting')
AddEventHandler('esx_minerjob:startMelting', function(zone, item)
	local _source = source
  	
	PlayersMelting[_source]=true
	TriggerClientEvent('esx:showNotification', _source, 'Comienza el proceso de ~r~fundicion')
	Melt(_source,zone, item)
end)

RegisterServerEvent('esx_minerjob:stopMelting')
AddEventHandler('esx_minerjob:stopMelting', function()

	local _source = source
	
	PlayersMelting[_source]=false
	
end)





local function Sell(source, zone, item)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		local itemQuantity = 0
		local action = nil
		if zone == 'SellZone' then

		
			if item == 'iron_ingot' then
				action = 'iron_sell'
				itemQuantity = xPlayer.getInventoryItem('iron_ingot').count
					
			end
			if item == 'copper_ingot' then
				action = 'copper_sell'
				itemQuantity = xPlayer.getInventoryItem('copper_ingot').count
					
			end
			if item == 'gold_ingot' then
				action = 'gold_sell'
				itemQuantity = xPlayer.getInventoryItem('gold_ingot').count
					
			end
			if item == 'sulfur_ingot' then
				action = 'sulfur_sell'
				itemQuantity = xPlayer.getInventoryItem('sulfur_ingot').count
					
			end
	
		end
		print(zone)
		if zone == 'DiamondDelivery' then
			action = 'diamond_sell'
			itemQuantity = xPlayer.getInventoryItem('diamond_rock').count
		end


		if itemQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, 'No tienes suficiente cantidad de esta piedra')
			return
		else
			TriggerClientEvent('esx_minerjob:waitTime', _source, itemQuantity, action)				
		end


	end
end





RegisterServerEvent('esx_minerjob:startSell')
AddEventHandler('esx_minerjob:startSell', function(zone, item)

	local _source = source
	PlayersSelling[_source]=true
	Sell(_source, zone, item)
	

end)

RegisterServerEvent('esx_minerjob:stopSell')
AddEventHandler('esx_vigneronjob:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Saliste de la ~r~zona')
	end

end)






ESX.RegisterServerCallback('esx_minerjob:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)







RegisterServerEvent('esx_minerjob:addQuantity')
AddEventHandler('esx_minerjob:addQuantity', function(stones, iron, copper, gold, sulfur, diamond, action)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	if action == 'mining' then
		xPlayer.addInventoryItem('stone', stones)
		TriggerClientEvent('esx_minerjob:newMission', _source)

	elseif action == 'stone_washing' then
		xPlayer.removeInventoryItem('stone', stones)
		if iron >= 0 then
			xPlayer.addInventoryItem('iron_rock', iron)
		end
		if copper >= 0 then
			xPlayer.addInventoryItem('copper_rock', copper)
		end
		if gold >= 0 then
			xPlayer.addInventoryItem('gold_rock', gold)
		end
		if sulfur >= 0 then
			xPlayer.addInventoryItem('sulfur_rock', gold)
		end
		if diamond >= 0 then
			xPlayer.addInventoryItem('diamond_rock', diamond)
		end

	elseif action == 'iron_melting' or action == 'copper_melting' or action == 'gold_melting' or action == 'sulfur_melting' then
		if iron >= 0 then
			xPlayer.removeInventoryItem('iron_rock', iron)
			xPlayer.addInventoryItem('iron_ingot', iron)
		end
		if copper >= 0 then
			xPlayer.removeInventoryItem('copper_rock', copper)
			xPlayer.addInventoryItem('copper_ingot', copper)
		end
		if gold >= 0 then
			xPlayer.removeInventoryItem('gold_rock', gold)
			xPlayer.addInventoryItem('gold_ingot', gold)
		end
		if sulfur >= 0 then
			xPlayer.removeInventoryItem('sulfur_rock', sulfur)
			xPlayer.addInventoryItem('sulfur_ingot', sulfur)
		end
	
	elseif action == 'iron_sell' or action == 'copper_sell' or action == 'gold_sell' or action == 'sulfur_sell' then

		if iron >= 0 then
			xPlayer.removeInventoryItem('iron_ingot', iron)
			xPlayer.addMoney(iron*Config.IronSellPrice)
		end
		if copper >= 0 then
			xPlayer.removeInventoryItem('copper_ingot', copper)
			xPlayer.addMoney(copper*Config.CopperSellPrice)
		end
		if gold >= 0 then
			xPlayer.removeInventoryItem('gold_ingot', gold)
			xPlayer.addMoney(gold*Config.GoldSellPrice)
		end
		if sulfur >= 0 then
			xPlayer.removeInventoryItem('sulfur_ingot', sulfur)
			xPlayer.addMoney(sulfur*Config.SulfurSellPrice)
		end


		if action == 'iron_sell' then   
			TriggerClientEvent('esx:showNotification', _source, 'Has cobrado: $' .. iron*Config.IronSellPrice)
		end
		if action == 'copper_sell' then
			TriggerClientEvent('esx:showNotification', _source, 'Has cobrado: $' .. copper*Config.CopperSellPrice)
		end
		if action == 'gold_sell' then
			TriggerClientEvent('esx:showNotification', _source, 'Has cobrado: $' .. gold*Config.GoldSellPrice)
		end
		if action == 'sulfur_sell' then
			TriggerClientEvent('esx:showNotification', _source, 'Has cobrado: $' .. sulfur*Config.SulfurSellPrice)
		end

	elseif action == 'diamond_sell' then
		if diamond >= 0 then
			xPlayer.removeInventoryItem('diamond_rock', diamond)
			xPlayer.addMoney(diamond*Config.DiamondSellPrice)
		end
		TriggerClientEvent('esx:showNotification', _source, 'Has cobrado: $' .. diamond*Config.DiamondSellPrice)

	end

end)

