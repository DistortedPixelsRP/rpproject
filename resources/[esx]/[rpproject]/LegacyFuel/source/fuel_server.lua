ESX = nil
local stations = {}

if Config.UseESX then

	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	function loadStock()
		stations = {}

		MySQL.Async.fetchAll('SELECT * FROM legacy_fuel', {}, function(identifier)
			for i=1, #identifier, 1 do
				table.insert(stations, {name = identifier[i].station_name, stock = identifier[i].stock})
			end
		end)
	end

	MySQL.ready(function()
		loadStock()
	end)

	RegisterServerEvent('fuel:reStock')
	AddEventHandler('fuel:reStock', function(source, stationname, cantidad)
		for i=1, #stations, 1 do
			MySQL.Sync.execute("UPDATE legacy_fuel SET stock = @cantidad WHERE station_name = @estacion", {['@estacion'] = stations[i].name, ['@cantidad'] = stations[i].stock})
		end


		MySQL.Sync.execute("UPDATE legacy_fuel SET stock = @cantidad + stock WHERE station_name = @estacion", {['@estacion'] = stationname, ['@cantidad'] = cantidad})
		loadStock()
	end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price, stationame)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)
		if price > 0 then
			xPlayer.removeMoney(amount)
			--MySQL.Sync.execute("UPDATE legacy_fuel SET stock = stock - 1 WHERE station_name = @estacion", {['@estacion'] = stationame})
			
			for i=1, #stations, 1 do
				if stations[i].name == stationame then
					stations[i].stock = stations[i].stock - 20
				end
			end

			--print(stations[2].stock)
			TriggerClientEvent('fuel:getClientStock', xPlayer.source, stationame)
		end
	end)

	ESX.RegisterServerCallback('fuel:getStock', function(source, cb, stationname)
		for i=1, #stations, 1 do
			if stations[i].name == stationname then
				cb(stations[i].stock)			
			end
		end
	end)

	ESX.RegisterServerCallback('fuel:getAllStock', function(source, cb)
		cb(stations)
	end)
	
end
