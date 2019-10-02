ESX = nil
local shopItems = {}
local GunShopPrice = Config.EnableClip.GunShop.Price
local GunShopLabel = Config.EnableClip.GunShop.Label
local BlackWeashopPrice = Config.EnableClip.BlackWeashop.Price
local BlackWeashopLabel = Config.EnableClip.BlackWeashop.Label

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()

	MySQL.Async.fetchAll('SELECT * FROM weashops', {}, function(result)
		for i=1, #result, 1 do
			if shopItems[result[i].zone] == nil then
				shopItems[result[i].zone] = {}
			end

			table.insert(shopItems[result[i].zone], {
				item  = result[i].item,
				price = result[i].price,
				label = ESX.GetWeaponLabel(result[i].item)
			})

		end

		if Config.EnableClipGunShop == true then
			table.insert(shopItems["GunShop"], {
				item  = "clip",
				price = GunShopPrice,--Config.EnableClip.GunShop.Price,
				label = GunShopLabel--Config.EnableClip.GunShop.label
			})
		end
			
		if Config.EnableClipBlackWeashop == true then
			table.insert(shopItems["BlackWeashop"], {
				item  = "clip",
				price = BlackWeashopPrice,--Config.EnableClip.BlackWeashop.Price,
				label = BlackWeashopLabel--Config.EnableClip.BlackWeashop.label
			})
		end

		TriggerClientEvent('esx_weaponshop:sendShop', -1, shopItems)
	end)

end)

ESX.RegisterServerCallback('esx_weaponshop:getShop', function(source, cb)
	cb(shopItems)
end)

ESX.RegisterServerCallback('esx_weaponshop:buyLicense', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.LicensePrice then
		xPlayer.removeMoney(Config.LicensePrice)

		TriggerEvent('esx_license:addLicense', source, 'weapon', function()
			cb(true)
		end)
	else
		TriggerClientEvent('esx:showNotification', source, _U('not_enough'))
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_weaponshop:buyWeapon', function(source, cb, weaponName, zone)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = 0

	if weaponName == "clip" then
		price = GunShopPrice
	else
		price = GetPrice(weaponName, zone)
	end

	if price == 0 then
		print(('esx_weaponshop: %s attempted to buy a unknown weapon!'):format(xPlayer.identifier))
		cb(false)
	end

	if weaponName == "clip" then
		
		if zone == 'BlackWeashop' then

			if xPlayer.getAccount('black_money').money >= price then
				xPlayer.addInventoryItem(weaponName, 1)
				xPlayer.removeAccountMoney('black_money', price)
				TriggerClientEvent('esx:showNotification', source, _U('buy') .. "Cargador")
				cb(true)
			else
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_black'))
				cb(false)
			end

		else

			if xPlayer.getMoney() >= price then
				xPlayer.addInventoryItem(weaponName, 1)
				xPlayer.removeMoney(price)
				TriggerClientEvent('esx:showNotification', source, _U('buy') .. "Cargador")
				
				cb(true)
			else
				TriggerClientEvent('esx:showNotification', source, _U('not_enough'))
				cb(false)
			end
	
		end

	else

		if xPlayer.hasWeapon(weaponName) then
			TriggerClientEvent('esx:showNotification', source, _U('already_owned'))
			cb(false)
		else
			if zone == 'BlackWeashop' then

				if xPlayer.getAccount('black_money').money >= price then
					xPlayer.removeAccountMoney('black_money', price)
					xPlayer.addWeapon(weaponName, 42)
	
					cb(true)
				else
					TriggerClientEvent('esx:showNotification', source, _U('not_enough_black'))
					cb(false)
				end

			else

				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price)
					xPlayer.addWeapon(weaponName, 42)
	
					cb(true)
				else
					TriggerClientEvent('esx:showNotification', source, _U('not_enough'))
					cb(false)
				end
		
			end
		end


	end
end)
-- thx to Pandorina for script
RegisterServerEvent('esx_weaponshop:remove')
AddEventHandler('esx_weaponshop:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('esx_weaponshop:clipcli', source)
end)

function GetPrice(weaponName, zone)
	local price = MySQL.Sync.fetchScalar('SELECT price FROM weashops WHERE zone = @zone AND item = @item', {
		['@zone'] = zone,
		['@item'] = weaponName
	})

	if price then
		return price
	else
		return 0
	end
end
