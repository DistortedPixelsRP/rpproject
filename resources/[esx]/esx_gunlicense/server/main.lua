ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function AddLicense(target, type, cb)
	local identifier = GetPlayerIdentifier(target, 0)

	MySQL.Async.execute('INSERT INTO user_gunlicenses (type, owner) VALUES (@type, @owner)', {
		['@type']  = type,
		['@owner'] = identifier
	}, function(rowsChanged)
		if cb ~= nil then
			cb()
		end
	end)
end

function RemoveLicense(target, type, cb)
	local identifier = GetPlayerIdentifier(target, 0)

	MySQL.Async.execute('DELETE FROM user_gunlicenses WHERE type = @type AND owner = @owner', {
		['@type']  = type,
		['@owner'] = identifier
	}, function(rowsChanged)
		if cb ~= nil then
			cb()
		end
	end)
end

function GetLicense(type, cb)
	MySQL.Async.fetchAll('SELECT * FROM gunlicenses WHERE type = @type', {
		['@type'] = type
	}, function(result)
		local data = {
			type  = type,
			label = result[1].label
		}

		cb(data)
	end)
end

function GetLicenses(target, cb)
	local identifier = GetPlayerIdentifier(target, 0)

	MySQL.Async.fetchAll('SELECT * FROM user_gunlicenses WHERE owner = @owner', {
		['@owner'] = identifier
	}, function(result)
		local licenses   = {}
		local asyncTasks = {}

		for i=1, #result, 1 do

			local scope = function(type)
				table.insert(asyncTasks, function(cb)
					MySQL.Async.fetchAll('SELECT * FROM gunlicenses WHERE type = @type', {
						['@type'] = type
					}, function(result2)
						table.insert(licenses, {
							type  = type,
							label = result2[1].label
						})

						cb()
					end)
				end)
			end

			scope(result[i].type)

		end

		Async.parallel(asyncTasks, function(results)
			cb(licenses)
		end)

	end)
end

function CheckLicense(target, type, cb)
	local identifier = GetPlayerIdentifier(target, 0)

	MySQL.Async.fetchAll('SELECT COUNT(*) as count FROM user_gunlicenses WHERE type = @type AND owner = @owner', {
		['@type']  = type,
		['@owner'] = identifier
	}, function(result)
		if tonumber(result[1].count) > 0 then
			cb(true)
		else
			cb(false)
		end

	end)
end

function GetLicensesList(cb)
	MySQL.Async.fetchAll('SELECT * FROM gunlicenses', {
		['@type'] = type
	}, function(result)
		local licenses = {}

		for i=1, #result, 1 do
			table.insert(licenses, {
				type  = result[i].type,
				label = result[i].label
			})
		end

		cb(licenses)
	end)
end

RegisterNetEvent('esx_gunlicense:addLicense')
AddEventHandler('esx_gunlicense:addLicense', function(target, type, cb)
	AddLicense(target, type, cb)
end)

RegisterNetEvent('esx_gunlicense:removeLicense')
AddEventHandler('esx_gunlicense:removeLicense', function(target, type, cb)
	RemoveLicense(target, type, cb)
end)

AddEventHandler('esx_gunlicense:getLicense', function(type, cb)
	GetLicense(type, cb)
end)

AddEventHandler('esx_gunlicense:getLicenses', function(target, cb)
	GetLicenses(target, cb)
end)

AddEventHandler('esx_gunlicense:checkLicense', function(target, type, cb)
	CheckLicense(target, type, cb)
end)

AddEventHandler('esx_gunlicense:getLicensesList', function(cb)
	GetLicensesList(cb)
end)

ESX.RegisterServerCallback('esx_gunlicense:getLicense', function(source, cb, type)
	GetLicense(type, cb)
end)

ESX.RegisterServerCallback('esx_gunlicense:getLicenses', function(source, cb, target)
	GetLicenses(target, cb)
end)

ESX.RegisterServerCallback('esx_gunlicense:checkLicense', function(source, cb, target, type)
	CheckLicense(target, type, cb)
end)

ESX.RegisterServerCallback('esx_gunlicense:getLicensesList', function(source, cb)
	GetLicensesList(cb)
end)