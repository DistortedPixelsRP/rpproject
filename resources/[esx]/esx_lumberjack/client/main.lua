local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local isInService               = true
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local JobBlips                	= {}
local publicBlip 				= false
local destination = nil
local mission = false
ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	refreshBlips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	deleteBlips()
	refreshBlips()
end)

function OpenCloakroomMenu()
    ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title    = _U('lj_locker_room'),
			align    = 'top-left',
			elements = {
                {label = _U('lumberjack_wear'), value = 'lumberjack_wear'},
                {label = _U('citizen_wear'), value = 'citizen_wear'}
            }
		},
		function(data, menu)

			menu.close()

            if data.current.value == 'citizen_wear' then
                isInService = false
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

            if data.current.value == 'lumberjack_wear' then
                isInService = true
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
					else
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
					end
				end)
			end

		end,
		function(data, menu)
			menu.close()
		end
	)
end

function MenuVehicleSpawner()
	local elements = {}

	for i=1, #Config.Vehicles, 1 do
		table.insert(elements, {label = GetLabelText(GetDisplayNameFromVehicleModel(Config.Vehicles[i])), value = Config.Vehicles[i]})
    end
    
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehiclespawner',
		{
			title    = _U('job_vehiclespawner'),
			elements = elements
		},
        function(data, menu)
            if ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
                ESX.Game.SpawnVehicle(data.current.value, Config.Zones.VehicleSpawnPoint.Pos, 270.0, function(vehicle)
                    SetVehicleCustomPrimaryColour(vehicle, 37, 3, 75)
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)   
                end)
            else
                ESX.ShowNotification(_U('spawn_blocked'))
            end
		
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenSellingMenu()
	ESX.UI.Menu.CloseAll()
	local elements = {
		{label = 'Vender tablón de madera de pino', value = 'pine'},
		{label = 'Vender tablón de madera de cedro', value = 'cedro'},
		{label = 'Vender tablón de madera de abeto', value = 'abeto'},
		{label = 'Vender tablón de madera de roble', value = 'roble'},
		{label = 'Vender carbón', value = 'coal'}
	}
	
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'selling',
		{
			title = 'Opciones de venta',
			align = 'top-left',
			elements = elements,
		},
		function(data, menu)
			menu.close()
			local model = data.current.value
			if model == 'pine' then
				TriggerServerEvent('esx_lumberjack:startSell', CurrentActionData.zone, 'pine_plank')
			elseif model == 'cedro' then
				TriggerServerEvent('esx_lumberjack:startSell', CurrentActionData.zone, 'cedro_plank')
			elseif model == 'abeto' then
				TriggerServerEvent('esx_lumberjack:startSell', CurrentActionData.zone, 'abeto_plank')
			elseif model == 'roble' then
				TriggerServerEvent('esx_lumberjack:startSell', CurrentActionData.zone, 'roble_plank')
			else
				TriggerServerEvent('esx_lumberjack:startSell', CurrentActionData.zone, 'coal')
			end
		end,
		function(data, menu)
			menu.close()

			CurrentAction     = 'selling_menu'
			CurrentActionMsg  = 'Opciones de venta'
			CurrentActionData = {}
		end
	)
end

function OpenTransformMenu()
	ESX.UI.Menu.CloseAll()
	local elements = {
		{label = 'Tablón de madera de pino', value = 'plank_pine'},
		{label = 'Tablón de madera de cedro', value = 'plank_cedro'},
		{label = 'Tablón de madera de abeto', value = 'plank_abeto'},
		{label = 'Tablón de madera de roble', value = 'plank_roble'},
		{label = 'Tablón de madera', value = 'plank_wood'}
	}
	
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'selling',
		{
			title = 'Leñador',
			align = 'top-left',
			elements = elements,
		},
		function(data, menu)
			menu.close()
			local model = data.current.value
			if model == 'plank_pine' then
				TriggerServerEvent('esx_lumberjack:startMaking', CurrentActionData.zone, 'pine_wood')
			elseif model == 'plank_cedro' then
				TriggerServerEvent('esx_lumberjack:startMaking', CurrentActionData.zone, 'cedro_wood')
			elseif model == 'plank_abeto' then
				TriggerServerEvent('esx_lumberjack:startMaking', CurrentActionData.zone, 'abeto_wood')
			elseif model == 'plank_roble' then
				TriggerServerEvent('esx_lumberjack:startMaking', CurrentActionData.zone, 'roble_wood')
			elseif model == 'plank_wood' then
				TriggerServerEvent('esx_lumberjack:startMaking', CurrentActionData.zone, 'wood')
			end
		end,
		function(data, menu)
			menu.close()

			CurrentAction     = 'selling_menu'
			CurrentActionMsg  = 'Opciones de venta'
			CurrentActionData = {}
		end
	)
end

function IsJobLumberjack()
	local isJobLumberjack = false
	if PlayerData ~= nil then

		if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' then
			isJobLumberjack = true
		end
		return isJobLumberjack
	end
	return isJobLumberjack
end

AddEventHandler('esx_lumberjack:hasEnteredMarker', function(zone)
	local playerPed = GetPlayerPed(-1)

	if IsJobLumberjack() then

		if zone == 'CloakRoom' then
			OpenCloakroomMenu()
		end


		if zone == 'Wood' then
			CurrentAction     = 'harvest'
			CurrentActionMsg  = _U('lj_wood_pickup')
			CurrentActionData = {zone= zone}
		elseif (zone == 'Tree1' or zone == 'Tree2' or zone == 'Tree3' or zone == 'Tree4' or zone == 'Tree5') then
			CurrentAction     = 'picking'
			CurrentActionMsg  = 'Talar madera'
			CurrentActionData = {zone= zone}
		elseif zone == 'CuttedWood' then
			CurrentAction     = 'process_wood'
			CurrentActionMsg  = _U('lj_cutwood_button')
			CurrentActionData = {zone= zone}
		elseif zone == 'Planks' then
			CurrentAction     = 'process_cutted_wood'
			CurrentActionMsg  = _U('lj_pick_boards')
			CurrentActionData = {zone= zone}
		elseif zone == 'Coal' then
			CurrentAction     = 'trade_cutted_wood'
			CurrentActionMsg  = _U("lj_coal_button")
			CurrentActionData = {zone= zone}
		elseif zone == 'SellZone' then
			CurrentAction     = 'sell'
			CurrentActionMsg  = _U('press_sell_wood')
			CurrentActionData = {zone = zone}
		elseif zone == 'VehicleSpawner' then
			CurrentAction     = 'vehicle_spawner_menu'
			CurrentActionMsg  = _U('spawn_veh')
			CurrentActionData = {}
		elseif zone == 'PaletBox' then
			CurrentAction = "paletbox"
			CurrentActionMsg = 'Presiona ~INPUT_PICKUP~ para abrir las opciones.'
			CurrentActionData = { zone = zone}
		end

		if zone == 'VehicleDeletePoint' then
			local playerPed = GetPlayerPed(-1)
			local coords    = GetEntityCoords(playerPed)
			
			if IsPedInAnyVehicle(playerPed,  false) then

				local vehicle, distance = ESX.Game.GetClosestVehicle({
					x = coords.x,
					y = coords.y,
					z = coords.z
				})

				if distance ~= -1 and distance <= 1.0 then
					CurrentAction     = 'delete_vehicle'
					CurrentActionMsg  = _U('return_vh_button')
					CurrentActionData = {vehicle = vehicle}
				end
			end
		end
	end
end)

AddEventHandler('esx_lumberjack:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	if (zone == 'Wood') and IsJobLumberjack() then
		TriggerServerEvent('esx_lumberjack:stopHarvest')
	end  
	if (zone == 'CuttedWood') and IsJobLumberjack() then
		TriggerServerEvent('esx_lumberjack:stopTransform')
	end
	if (zone == 'Planks') and IsJobLumberjack() then
		TriggerServerEvent('esx_lumberjack:stopMaking')
	end
	if (zone == 'Coal') and IsJobLumberjack() then
		TriggerServerEvent('esx_lumberjack:stopTrading')
	end
	if (zone == 'SellZone') and IsJobLumberjack() then
		TriggerServerEvent('esx_lumberjack:stopSell')
	end
	CurrentAction = nil
end)

function deleteBlips()
    if JobBlips[1] ~= nil then
        for i=1, #JobBlips, 1 do
            RemoveBlip(JobBlips[i])
            JobBlips[i] = nil
        end
    end
end

-- CREATE BLIPS
Citizen.CreateThread(function()
	if publicBlip == false then
		local blip = AddBlipForCoord(Config.Zones.CloakRoom.Pos.x, Config.Zones.CloakRoom.Pos.y, Config.Zones.CloakRoom.Pos.z)
		SetBlipSprite (blip, Config.BlipInfos.Sprite)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.2)
		SetBlipColour (blip, 3)
		SetBlipColour  (blip, Config.BlipInfos.Color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Leñador")
		EndTextCommandSetBlipName(blip)
		publicBlip = true
	end
end)

function refreshBlips()
    if IsJobLumberjack() then
		for zoneKey,zoneValues in pairs(Config.Zones) do
			if zoneValues.Type ~= 'cloakroom' and zoneValues.Blip then
				local blip = AddBlipForCoord(zoneValues.Pos.x, zoneValues.Pos.y, zoneValues.Pos.z)
				SetBlipSprite  (blip, Config.BlipInfos.Sprite)
				SetBlipDisplay (blipfalse, 4)
				SetBlipScale   (blip, 1.2)
				SetBlipCategory(blip, 3)
				SetBlipColour  (blip, Config.BlipInfos.Color)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(zoneValues.Name)
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
    end
end

-- Display markers
Citizen.CreateThread(function()
    while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if IsJobLumberjack() then
				if isInService or v.Type == "cloakroom" then
					if(v.Marker ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
						DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
					end
				end
			end
		end

		if mission then
			if IsJobLumberjack() then
				if(GetDistanceBetweenCoords(coords, destination.Pos.x, destination.Pos.y, destination.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(destination.Marker, destination.Pos.x, destination.Pos.y, destination.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, destination.Size.x, destination.Size.y, destination.Size.z, destination.Color.r, destination.Color.g, destination.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
			
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Wait(0)

		if IsJobLumberjack() then
			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			for k,v in pairs(Config.Trees) do
				if mission and destination == v then
					if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
						isInMarker  = true
						currentZone = k
					end
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_lumberjack:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_lumberjack:hasExitedMarker', LastZone)
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil and isInService then
			if CurrentAction ~= 'picking' then	
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			elseif CurrentAction == 'picking' and mission == true then
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end

			if IsControlPressed(0,  Keys['E']) and IsJobLumberjack() then
				if CurrentAction == 'harvest' and isInService then
					TriggerEvent('esx_lumberjack:newMission')
				end
				
				if CurrentAction == 'picking' then
					TriggerServerEvent('esx_lumberjack:startHarvest', CurrentActionData.zone)
                end
                
				if CurrentAction == 'process_wood' then
					TriggerServerEvent('esx_lumberjack:startTransform', CurrentActionData.zone)
                end

                if CurrentAction == 'process_cutted_wood' then
					-- TriggerServerEvent('esx_lumberjack:startMaking', CurrentActionData.zone)
					OpenTransformMenu()
				end
				
				if CurrentAction == 'trade_cutted_wood' then
					TriggerServerEvent('esx_lumberjack:startTrading', CurrentActionData.zone)
				end
				
				if CurrentAction == 'sell' then
					OpenSellingMenu()
				end

				if CurrentAction == 'paletbox' then
					OpenSellingMenu()
				end
                
				if CurrentAction == 'vehicle_spawner_menu' then
					MenuVehicleSpawner()
                end
                
				if CurrentAction == 'delete_vehicle' then
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				end

				CurrentAction = nil
				GUI.Time      = GetGameTimer()

			end
		end
	end
end)

-- RegisterNetEvent('esx_lumberjack:waitTime')
-- AddEventHandler('esx_lumberjack:waitTime', function(qtty, action, item)
-- 	local player = PlayerId()
-- 	local ped = PlayerPedId()

-- 	local max_maderas = 20
-- 	local doing = true

-- 	FreezeEntityPosition(ped, true)
-- 	if action == 'harvest' then
-- 		--TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BBQ', 1, true)
-- 		exports['progressBars']:startUI(Config.Time, _U('wood_taken'))
-- 		Citizen.Wait(Config.Time)
-- 		ESX.ShowNotification('Maderas taladas: 20')
-- 	elseif action == 'process_wood' then
-- 		exports['progressBars']:startUI(Config.Time, _U('cutted_wood_taken'))
-- 		Citizen.Wait(Config.Time)
-- 		ESX.ShowNotification('Maderas cortadas: 20')
-- 	elseif action == 'process_cutted_wood' then
-- 		exports['progressBars']:startUI(Config.Time, _U('plank_taken'))
-- 		Citizen.Wait(Config.Time)
-- 		ESX.ShowNotification('Tablones creados: 20')
-- 	elseif action == 'trade_cutted_wood' then
-- 		exports['progressBars']:startUI(Config.Time, _U('coal_taken'))
-- 		Citizen.Wait(Config.Time)
-- 		ESX.ShowNotification('Carbon tradeado: 20')
-- 	end
-- 	FreezeEntityPosition(ped, false)
-- 	ClearPedTasks(GetPlayerPed(-1))
-- 	TriggerServerEvent('esx_lumberjack:addQuantity', max_maderas, action)
-- end)

-- VENDER COSAS
-- if data.current.value == 'withdraw_society_money' then

-- 	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'withdraw_society_money_amount_' .. society, {
-- 		title = _U('withdraw_amount')
-- 	}, function(data, menu)

-- 		local amount = tonumber(data.value)

-- 		if amount == nil then
-- 			ESX.ShowNotification(_U('invalid_amount'))
-- 		else
-- 			menu.close()
-- 			TriggerServerEvent('esx_society:withdrawMoney', society, amount)
-- 		end

-- 	end, function(data, menu)
-- 		menu.close()
-- 	end)
-- end

RegisterNetEvent('esx_lumberjack:waitTime')
AddEventHandler('esx_lumberjack:waitTime', function(qtty, action)
	local player = PlayerId()
	local ped = PlayerPedId()

	local doing = true
	local log = 0
	local pine_wood = 0
	local cedro_wood = 0
	local abeto_wood = 0
	local roble_wood = 0
	local coal = 0
	local index = 1
	local aux = 0
	local wood = 0

	-- tipos de tablones
	local plank_pine_wood = 0
	local plank_cedro_wood = 0
	local plank_abeto_wood = 0
	local plank_roble_wood = 0
	local plank_wood = 0

	FreezeEntityPosition(ped, true)
	while aux < qtty and doing == true do
		Citizen.Wait(0)

		if IsControlPressed(0,  Keys['Z']) then
			doing = false
		else
			index = index + 1
		end

		if index % Config.Time == 0 then

			if action == 'harvest' then
				aux = aux + 1
				logs = aux
				ESX.ShowNotification('Troncos talados: ' .. logs)
			end	
			
			if action == 'process_wood' then
				local random = math.random(0,100)
				aux = aux + 1
				logs = aux
				
				if random >= 0 and random <= 30 then
					wood = wood + 1
					ESX.ShowNotification('Madera de pino: ' .. pine_wood)
				end
				if random >= 31 and random <= 50 then
					pine_wood = pine_wood + 1
					ESX.ShowNotification('Madera de pino: ' .. pine_wood)
				end
				if random >= 51 and random <= 80 then
					cedro_wood = cedro_wood + 1
					ESX.ShowNotification('Madera de cedro: ' .. cedro_wood)
				end
				if random >= 81 and random <= 95 then
					abeto_wood = abeto_wood + 1
					ESX.ShowNotification('Madera de abeto: ' .. abeto_wood)
				end
				if random >= 96 and random <= 100 then
					roble_wood = roble_wood + 1
					ESX.ShowNotification('Madera de roble: ' .. roble_wood)
				end
			end

			-- Cambiar madera por carbon
			if action == 'trade_cutted_wood' then
				aux = aux + 1
				coal = coal + 1
				ESX.ShowNotification('Carbon: ' .. coal)
			end


			-- Cambiar madera por tablones
			if action == 'pine_wood_process' then
				aux = aux + 1
				plank_pine_wood = plank_pine_wood + 1
				ESX.ShowNotification('Tablon de Pino: ' .. plank_pine_wood)
			end

			
			if action == 'cedro_wood_process' then
				aux = aux + 1
				plank_cedro_wood = plank_cedro_wood + 1
				ESX.ShowNotification('Tablon de Cedro: ' .. plank_cedro_wood)
			end

			if action == 'abeto_wood_process' then
				aux = aux + 1
				plank_abeto_wood = plank_abeto_wood + 1
				ESX.ShowNotification('Tablon de Abeto: ' .. plank_abeto_wood)
			end

			if action == 'roble_wood_process' then
				aux = aux + 1
				plank_roble_wood = plank_roble_wood + 1
				ESX.ShowNotification('Tablon de Roble: ' .. plank_roble_wood)
			end

			if action == 'wood_process' then
				aux = aux + 1
				plank_wood = plank_wood + 1
				ESX.ShowNotification('Tablon de Madera: ' .. plank_wood)
			end

			-- Vender
			if action == 'pine_plank_sell' then
				aux = aux + 1
				plank_pine_wood = plank_pine_wood + 1
				ESX.ShowNotification('Tablon de Pino: ' .. plank_pine_wood)
			end

			if action == 'cedro_plank_sell' then
				aux = aux + 1
				plank_cedro_wood = plank_cedro_wood + 1
				ESX.ShowNotification('Tablon de Cedro: ' .. plank_cedro_wood)
			end

			if action == 'abeto_plank_sell' then
				aux = aux + 1
				plank_abeto_wood = plank_abeto_wood + 1
				ESX.ShowNotification('Tablon de Abeto: ' .. plank_abeto_wood)
			end

			if action == 'roble_plank_sell' then
				aux = aux + 1
				plank_roble_wood = plank_roble_wood + 1
				ESX.ShowNotification('Tablon de Roble: ' .. plank_roble_wood)
			end

			if action == 'coal_sell' then
				aux = aux + 1
				coal = coal + 1
				ESX.ShowNotification('Carbon: ' .. coal)
			end


			-- if action == 'iron_melting' or action == 'copper_melting' or action == 'gold_melting' or action == 'sulfur_melting' then
			-- 	aux = aux + 1
			-- 	stone = aux	
			-- 	if action == 'iron_melting' then
			-- 		iron = iron + 1
			-- 		ESX.ShowNotification('Lingotes de hierro: ' .. iron)
			-- 	end
			-- 	if action == 'copper_melting' then
			-- 		copper = copper + 1
			-- 		ESX.ShowNotification('Lingotes de cobre: ' .. copper)
			-- 	end
			-- 	if action == 'gold_melting' then
			-- 		gold = gold + 1
			-- 		ESX.ShowNotification('Lingotes de oro: ' .. gold)
			-- 	end
			-- 	if action == 'sulfur_melting' then
			-- 		sulfur = sulfur + 1
			-- 		ESX.ShowNotification('Lingotes de azufre: ' .. sulfur)
			-- 	end

			-- end

			-- if action == 'iron_sell' or action == 'copper_sell' or action == 'gold_sell' or action == 'sulfur_sell' then

			-- 	aux = aux + 1
			-- 	if action == 'iron_sell' then
			-- 		iron = iron + 1
			-- 		ESX.ShowNotification('Lingotes de hierro vendidos: ' .. iron)
			-- 	end
			-- 	if action == 'copper_sell' then
			-- 		copper = copper + 1
			-- 		ESX.ShowNotification('Lingotes de cobre vendidos: ' .. copper)
			-- 	end
			-- 	if action == 'gold_sell' then
			-- 		gold = gold + 1
			-- 		ESX.ShowNotification('Lingotes de oro vendidos: ' .. gold)
			-- 	end
			-- 	if action == 'sulfur_sell' then
			-- 		sulfur = sulfur + 1
			-- 		ESX.ShowNotification('Lingotes de azufre vendidos: ' .. sulfur)
			-- 	end

			-- end

			-- if action == 'diamond_sell' then
			-- 	aux = aux + 1
			-- 	diamond = diamond + 1
			-- 	ESX.ShowNotification('Diamantes vendidos: ' .. diamond)
			-- end

		end
	end
	FreezeEntityPosition(ped, false)
	if action == 'harvest' then
		ClearPedTasks(GetPlayerPed(-1))
	end

	TriggerServerEvent('esx_lumberjack:addQuantity', logs, pine_wood, cedro_wood, abeto_wood, roble_wood, plank_abeto_wood, plank_cedro_wood, plank_pine_wood, plank_roble_wood, plank_wood, coal, action)
end)

local count = 0
RegisterNetEvent('esx_lumberjack:newMission')
AddEventHandler('esx_lumberjack:newMission', function()
	local MissionNum = math.random(1, 5)
	mission = true
	if MissionNum == 1 then destination = Config.Trees.Tree1 end
	if MissionNum == 2 then destination = Config.Trees.Tree2 end
	if MissionNum == 3 then destination = Config.Trees.Tree3 end
	if MissionNum == 4 then destination = Config.Trees.Tree4 end
	if MissionNum == 5 then destination = Config.Trees.Tree5 end
	if count >= 5 then
		mission = false
		count = 0
	end 
end)