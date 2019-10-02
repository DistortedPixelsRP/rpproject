-----------------------------------------
-- Created and modify by L'ile Légale RP
-- SenSi and Kaminosekai
-----------------------------------------

ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local vine = 1
local jus = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'vigne', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'vigne', _U('vigneron_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'vigne', 'Vigneron', 'society_vigne', 'society_vigne', 'society_vigne', {type = 'private'})
local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		local action = 'harvest'
		if zone == "RaisinFarm" then
			local itemQuantity = xPlayer.getInventoryItem('raisin').count
			local qtty = 100 - itemQuantity
			if qtty <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place'))
			else
				TriggerClientEvent('esx_vigneronjob:waitTime', _source, qtty, action)
			end
			return
			
		end
	end
end

RegisterServerEvent('esx_vigneronjob:startHarvest')
AddEventHandler('esx_vigneronjob:startHarvest', function(zone)
	local _source = source
  	
	if PlayersHarvesting[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, 'No estas en la zona')
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('raisin_taken'))  
		Harvest(_source,zone)
	end
end)


RegisterServerEvent('esx_vigneronjob:stopHarvest')
AddEventHandler('esx_vigneronjob:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Acabas de salir de la ~r~zona')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Puedes ~g~recolectar')
		PlayersHarvesting[_source]=true
	end
end)


local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		
		if zone == "TraitementVin" then
			local action = 'process_wine'
			local itemQuantity = xPlayer.getInventoryItem('raisin').count
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else
				TriggerClientEvent('esx_vigneronjob:waitTime', _source, itemQuantity, action)				
			end
			

		elseif zone == "TraitementJus" then
			local action = 'process_juice'
			local itemQuantity = xPlayer.getInventoryItem('raisin').count
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin'))
				return
			else
				TriggerClientEvent('esx_vigneronjob:waitTime', _source, itemQuantity, 'process_juice')	
			end
		end
	end	
end

RegisterServerEvent('esx_vigneronjob:startTransform')
AddEventHandler('esx_vigneronjob:startTransform', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, 'No estas en la zona')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		Transform(_source,zone)
	end
end)

RegisterServerEvent('esx_vigneronjob:stopTransform')
AddEventHandler('esx_vigneronjob:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Saliste de la ~r~zona')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Puedes ~g~ procesar uvas')
		PlayersTransforming[_source]=true
		
	end
end)

local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		local _source = source
		
		if zone == 'SellFarm' then
			if xPlayer.getInventoryItem('vine').count <= 4 then
				vine = 0
			else
				vine = 1
			end
			
			if xPlayer.getInventoryItem('jus_raisin').count <= 4 then
				jus = 0
			else
				jus = 1
			end
		
			if vine == 0 and jus == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('vine').count <= 4 and jus == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_vin_sale'))
				vine = 0
				return
			elseif xPlayer.getInventoryItem('jus_raisin').count <= 4 and vine == 0then
				TriggerClientEvent('esx:showNotification', source, _U('no_jus_sale'))
				jus = 0
				return
			else
				if (jus == 1) then
					--local societyAccount = nil
					--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
					--	societyAccount = account
					--end)
					local itemQuantity = xPlayer.getInventoryItem('jus_raisin').count
					if itemQuantity >= 0 then
						--if societyAccount ~= nil then
							local action = 'selling_jus_raisin'
						--	xPlayer.removeInventoryItem('jus_raisin', itemQuantity)
							--societyAccount.addMoney(70*itemQuantity)
							--TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned').. 70*itemQuantity)	
							TriggerClientEvent('esx_vigneronjob:waitTime', _source, itemQuantity, action)
						--end
					else
						TriggerClientEvent('esx:showNotification', source, _U('not_enough_jus_raisin'))
					end
				elseif (vine == 1) then
					--local societyAccount = nil
					--TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
					--	societyAccount = account
					--end)
					local itemQuantity = xPlayer.getInventoryItem('vine').count
					if itemQuantity >= 0 then
					--	if societyAccount ~= nil then
							local action = 'selling_wine'
					--		xPlayer.removeInventoryItem('vine', itemQuantity)
					--		societyAccount.addMoney(125*itemQuantity)
					--		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. 125*itemQuantity)
							TriggerClientEvent('esx_vigneronjob:waitTime', _source, itemQuantity, action)
					--	end	
					else
						TriggerClientEvent('esx:showNotification', source, _U('not_enough_vine'))
					end			
				end
				
			end
		end
	end
end

RegisterServerEvent('esx_vigneronjob:startSell')
AddEventHandler('esx_vigneronjob:startSell', function(zone)

	local _source = source
	
	if PlayersSelling[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'No estas en la zona ~w~')
		PlayersSelling[_source]=false
	else
		PlayersSelling[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sell(_source, zone)
	end

end)

RegisterServerEvent('esx_vigneronjob:stopSell')
AddEventHandler('esx_vigneronjob:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Saliste de la ~r~zona')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Podes ~g~vender')
		PlayersSelling[_source]=true
	end

end)

RegisterServerEvent('esx_vigneronjob:getStockItem')
AddEventHandler('esx_vigneronjob:getStockItem', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_vigneronjob:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('esx_vigneronjob:putStockItems')
AddEventHandler('esx_vigneronjob:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

	end)
end)

ESX.RegisterServerCallback('esx_vigneronjob:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)


ESX.RegisterUsableItem('jus_raisin', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jus_raisin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 40000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jus'))

end)

ESX.RegisterUsableItem('grand_cru', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grand_cru', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_grand_cru'))

end)



RegisterServerEvent('esx_vigneronjob:addQuantity')
AddEventHandler('esx_vigneronjob:addQuantity', function(loot, action)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	if action == 'harvest' then
		xPlayer.addInventoryItem('raisin', loot)
	elseif action == 'process_wine' then
		xPlayer.removeInventoryItem('raisin', loot)
		xPlayer.addInventoryItem('vine', loot)
		local oldWine = math.floor(loot/25)
		xPlayer.addInventoryItem('grand_cru', oldWine)
	elseif action == 'process_juice' then
		xPlayer.removeInventoryItem('raisin', loot)
		xPlayer.addInventoryItem('jus_raisin', loot)
	elseif action == 'selling_jus_raisin' then
		local societyAccount = nil
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
			societyAccount = account
		end)
			if societyAccount ~= nil then
				xPlayer.removeInventoryItem('jus_raisin', loot)
				societyAccount.addMoney(Config.SellJuice*loot)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. Config.SellJuice*loot)
			end			
	else
		local societyAccount = nil
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
			societyAccount = account
		end)
		print(loot)
			if societyAccount ~= nil then
				xPlayer.removeInventoryItem('vine', loot)
				societyAccount.addMoney(Config.SellWine*loot)
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. Config.SellWine*loot)
			end			
		
	end
end)