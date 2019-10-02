
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
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local JobBlips                = {}
local publicBlip = false
local mission = false
local count = 0
local isMiner = false
ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function TeleportFadeEffect(entity, coords)

	Citizen.CreateThread(function()

		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(0)
		end

		ESX.Game.Teleport(entity, coords, function()
			DoScreenFadeIn(800)
		end)

	end)
end

function OpenCloakroomMenu()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'cloakroom',
		{
			title    = _U('cloakroom'),
			align    = 'top-left',
			elements = {
				{label = _U('citizen_wear'), value = 'citizen_wear'},
				{label = _U('job_wear'), value = 'job_wear'},
			},
		},
		function(data, menu)

			menu.close()

			if data.current.value == 'citizen_wear' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					TriggerEvent('skinchanger:loadSkin', skin)
					isMiner = false
				end)
			end

			if data.current.value == 'job_wear' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
					else
						TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
					end
				end)
				isMiner = true
			end

			CurrentAction     = 'miner_action_menu'
			CurrentActionMsg  = 'Abrir menu'
			CurrentActionData = {}
		end,
		function(data, menu)
			menu.close()
		end
	)

end



function OpenVehicleSpawnerMenu()

	ESX.UI.Menu.CloseAll()
		local elements = {
			{label = 'Vehiculo de Trabajo',  value = 'rubble'},
		}
		
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vehicle_spawner',
			{
				title    = _U('veh_menu'),
				align    = 'top-left',
				elements = elements,
			},
			function(data, menu)

				menu.close()

				local model = data.current.value
		
				ESX.Game.SpawnVehicle(model, Config.Zones.VehicleSpawnPoint.Pos, 56.326, function(vehicle)
					local playerPed = GetPlayerPed(-1)
					TaskWarpPedIntoVehicle(playerPed,  vehicle,  -1)
					exports["LegacyFuel"]:SetFuel(vehicle, 100)
				end)
			end,
			function(data, menu)

				menu.close()

				CurrentAction     = 'vehicle_spawner_menu'
				CurrentActionMsg  = _U('spawn_veh')
				CurrentActionData = {}

			end
		)
end










RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	blips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	deleteBlips()
	blips()
end)

AddEventHandler('esx_minerjob:hasEnteredMarker', function(zone)
	if zone == 'Mine' and PlayerData.job ~= nil and PlayerData.job.name == 'miner'  then
		CurrentAction     = 'mining'
		CurrentActionMsg  = 'Comenzar trabajo'
		CurrentActionData = {zone= zone}
	end

	if (zone == 'Stone1' or zone == 'Stone2' or zone == 'Stone3' or zone == 'Stone4' or zone == 'Stone5') and PlayerData.job ~= nil and PlayerData.job.name == 'miner'  then
		CurrentAction     = 'picking'
		CurrentActionMsg  = 'Picar piedra'
		CurrentActionData = {zone= zone}
	end


		
	if zone == 'StoneWash' and PlayerData.job ~= nil and PlayerData.job.name == 'miner'  then
		CurrentAction     = 'stone_washing'
		CurrentActionMsg  = 'Presione E para lavar'
		CurrentActionData = {zone= zone}
	end		
		
	if zone == 'Foundry' and PlayerData.job ~= nil and PlayerData.job.name == 'miner'  then
		CurrentAction     = 'stone_melting'
		CurrentActionMsg  = 'Presione E para fundir'
		CurrentActionData = {zone = zone}
	end
		
	if zone == 'SellZone' and PlayerData.job ~= nil and PlayerData.job.name == 'miner'  then
		CurrentAction     = 'sell'
		CurrentActionMsg  = 'Presione E para vender'
		CurrentActionData = {zone = zone}
	end

	if zone == 'DiamondDelivery' and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		CurrentAction     = 'diamond_sell'
		CurrentActionMsg  = 'Presione E para vender'
		CurrentActionData = {zone = zone}
	end


	if zone == 'VehicleSpawner' and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		CurrentAction     = 'vehicle_spawner_menu'
		CurrentActionMsg  = _U('spawn_veh')
		CurrentActionData = {}
	end
		
	if zone == 'CloakRoom' and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		CurrentAction     = 'miner_action_menu'
		CurrentActionMsg  = _U('cloakroom')
		CurrentActionData = {}
	end
		
	if zone == 'VehicleDeletePoint' and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then

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
				CurrentActionMsg  = _U('store_veh')
				CurrentActionData = {vehicle = vehicle}

			end
		end
	end
end)

AddEventHandler('esx_minerjob:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	if (zone == 'Mine') and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		TriggerServerEvent('esx_minerjob:stopMining')
	end  
	if (zone == 'StoneWash' or zone == 'TraitementJus') and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		TriggerServerEvent('esx_minerjob:stopWashing')
	end
	if (zone == 'Foundry') and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		TriggerServerEvent('esx_minerjob:stopMelting')
	end
	if (zone == 'CopperDelivery') and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		TriggerServerEvent('esx_minerjob:stopSell')
	end
	if (zone == 'IronDelivery') and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		TriggerServerEvent('esx_minerjob:stopSell')
	end
	if (zone == 'GoldDelivery') and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		TriggerServerEvent('esx_minerjob:stopSell')
	end
	if (zone == 'DiamondDelivery') and PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
		TriggerServerEvent('esx_minerjob:stopSell')
	end
	CurrentAction = nil
	CurrentActionData = nil
end)



function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
		RemoveBlip(JobBlips[i])
		JobBlips[i] = nil
		end
	end
end

-- Create Blips
function blips()
	if publicBlip == false then
		local blip = AddBlipForCoord(Config.Zones.CloakRoom.Pos.x, Config.Zones.CloakRoom.Pos.y, Config.Zones.CloakRoom.Pos.z)
		SetBlipSprite (blip, 85)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.5)
		SetBlipColour (blip, 19)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Mineria")
		EndTextCommandSetBlipName(blip)
		publicBlip = true
	end
	
    if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then

		for k,v in pairs(Config.Zones)do
			if v.Marker == 1 then
				local blip2 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip2, 85)
				SetBlipDisplay(blip2, 4)
				SetBlipScale  (blip2, 1.5)
				SetBlipColour (blip2, 5)
				SetBlipAsShortRange(blip2, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip2)
				table.insert(JobBlips, blip2)
			end
		end
	end
end


 --Display markers
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
				if v.Marker ~= -1 then
					if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
						DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
					end
				end
			end
		end

		if mission == true then
			for k,v in pairs(Config.Stones) do
				if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then
					if(GetDistanceBetweenCoords(coords, destination.Pos.x, destination.Pos.y, destination.Pos.z, true) < Config.DrawDistance) then
						DrawMarker(destination.Marker, destination.Pos.x, destination.Pos.y, destination.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, destination.Size.x, destination.Size.y, destination.Size.z, destination.Color.r, destination.Color.g, destination.Color.b, 100, false, true, 2, false, false, false, false)
					end
				end
			end
		end
	end
end)


-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do

		Wait(0)

		if PlayerData.job ~= nil and PlayerData.job.name == 'miner' then

			local coords      = GetEntityCoords(GetPlayerPed(-1))
			local isInMarker  = false
			local currentZone = nil

				for k,v in pairs(Config.Stones) do
					if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
						isInMarker  = true
						currentZone = k
					end
				end

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
					isInMarker  = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_minerjob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_minerjob:hasExitedMarker', LastZone)
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		if CurrentAction ~= nil then
			if CurrentAction ~= 'picking' then	
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			elseif CurrentAction == 'picking' and mission == true then
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
 
			if IsControlPressed(0,  Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'miner' and (GetGameTimer() - GUI.Time) > 300 then
				if CurrentAction == 'mining' then
					if isMiner == true then
						TriggerEvent('esx_minerjob:newMission')
					else
						ESX.ShowNotification('No tienes puesta la ropa de trabajo')
					end
				end

				if CurrentAction == 'picking' then
					TriggerServerEvent('esx_minerjob:startMining', CurrentActionData.zone)
				end
				if CurrentAction == 'stone_washing' then
					TriggerServerEvent('esx_minerjob:startWashing', CurrentActionData.zone)
				end
				if CurrentAction == 'stone_melting' then
					OpenMeltingMenu()
				end
				if CurrentAction == 'sell' then
					OpenSellingMenu()
				end

				if CurrentAction == 'diamond_sell' then
					TriggerServerEvent('esx_minerjob:startSell', CurrentActionData.zone)
				end

				if CurrentAction == 'miner_action_menu' then
					OpenCloakroomMenu()
				end
				if CurrentAction == 'vehicle_spawner_menu' then
					OpenVehicleSpawnerMenu()
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





function OpenMeltingMenu()
	ESX.UI.Menu.CloseAll()
		local elements = {
			{label = 'Fundir hierro', value = 'iron'},
			{label = 'Fundir cobre', value = 'copper'},
			{label = 'Fundir oro', value = 'gold'},
			{label = 'Fundir azufre', value = 'sulfur'},

		}
		
		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'melting',
			{
				title = 'Opciones de fundicion',
				align = 'top-left',
				elements = elements,
			},
			function(data, menu)

				menu.close()
				local model = data.current.value
				if model == 'iron' then
					TriggerServerEvent('esx_minerjob:startMelting', CurrentActionData.zone, 'iron_rock')
				elseif model == 'copper' then
					TriggerServerEvent('esx_minerjob:startMelting', CurrentActionData.zone, 'copper_rock')
				elseif model == 'gold' then
					TriggerServerEvent('esx_minerjob:startMelting', CurrentActionData.zone, 'gold_rock')
				else
					TriggerServerEvent('esx_minerjob:startMelting', CurrentActionData.zone, 'sulfur_rock')
				end

			end,
			function(data, menu)
				menu.close()

				CurrentAction     = 'melting_menu'
				CurrentActionMsg  = 'Opciones de fundicion'
				CurrentActionData = {}
			end

		)
end




function OpenSellingMenu()
	ESX.UI.Menu.CloseAll()
		local elements = {
			{label = 'Vender lingote de hierro', value = 'iron'},
			{label = 'Vender lingote de cobre', value = 'copper'},
			{label = 'Vender lingote de oro', value = 'gold'},
			{label = 'Vender lingote de azufre', value = 'sulfur'},

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
				if model == 'iron' then
					TriggerServerEvent('esx_minerjob:startSell', CurrentActionData.zone, 'iron_ingot')
				elseif model == 'copper' then
					TriggerServerEvent('esx_minerjob:startSell', CurrentActionData.zone, 'copper_ingot')
				elseif model == 'gold' then
					TriggerServerEvent('esx_minerjob:startSell', CurrentActionData.zone, 'gold_ingot')
				else
					TriggerServerEvent('esx_minerjob:startSell', CurrentActionData.zone, 'sulfur_ingot')
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












RegisterNetEvent('esx_minerjob:waitTime')
AddEventHandler('esx_minerjob:waitTime', function(qtty, action)
	local player = PlayerId()
	local ped = PlayerPedId()


	local doing = true
	local stones = 0
	local iron = 0
	local copper = 0
	local gold = 0
	local sulfur = 0
	local diamond = 0
	local index = 1
	local aux = 0

	if action == 'mining' then
		TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CONST_DRILL", 0, false)
	end

	if action ~= 'mining' and action ~= nil then
		TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)
	end

	while aux < qtty and doing == true do
		Citizen.Wait(0)

		if IsControlPressed(0,  Keys['Z']) or IsControlPressed(0, Keys['G']) then
			doing = false
		else
			index = index + 1
		end

		if index % Config.Time == 0 then
		
			if action == 'mining' then
				aux = aux + 1
				stones = aux
				ESX.ShowNotification('Piedras minadas: ' .. stones)
			end	

			
			if action == 'stone_washing' then
				local random = math.random(0,100)
				aux = aux + 1
				stones = aux
				if random >= 0 and random <= 50 then
					iron = iron + 1
					ESX.ShowNotification('Menas de hierro: ' .. iron)
				end
				if random >= 51 and random <= 70 then
					copper = copper + 1
					ESX.ShowNotification('Menas de cobre: ' .. copper)
				end
				if random >= 71 and random <= 85 then
					gold = gold + 1
					ESX.ShowNotification('Menas de oro: ' .. gold)
				end
				if random >= 86 and random <= 97 then
					sulfur = sulfur + 1
					ESX.ShowNotification('Menas de azufre: ' .. sulfur)
				end
				if random >= 98 and random <= 100 then
					diamond = diamond + 1
					ESX.ShowNotification('Diamantes en bruto: ' .. diamond)
				end
			end

			if action == 'iron_melting' or action == 'copper_melting' or action == 'gold_melting' or action == 'sulfur_melting' then
				aux = aux + 1
				stone = aux	
				if action == 'iron_melting' then
					iron = iron + 1
					ESX.ShowNotification('Lingotes de hierro: ' .. iron)
				end
				if action == 'copper_melting' then
					copper = copper + 1
					ESX.ShowNotification('Lingotes de cobre: ' .. copper)
				end
				if action == 'gold_melting' then
					gold = gold + 1
					ESX.ShowNotification('Lingotes de oro: ' .. gold)
				end
				if action == 'sulfur_melting' then
					sulfur = sulfur + 1
					ESX.ShowNotification('Lingotes de azufre: ' .. sulfur)
				end

			end

			if action == 'iron_sell' or action == 'copper_sell' or action == 'gold_sell' or action == 'sulfur_sell' then

				aux = aux + 1
				if action == 'iron_sell' then
					iron = iron + 1
					ESX.ShowNotification('Lingotes de hierro vendidos: ' .. iron)
				end
				if action == 'copper_sell' then
					copper = copper + 1
					ESX.ShowNotification('Lingotes de cobre vendidos: ' .. copper)
				end
				if action == 'gold_sell' then
					gold = gold + 1
					ESX.ShowNotification('Lingotes de oro vendidos: ' .. gold)
				end
				if action == 'sulfur_sell' then
					sulfur = sulfur + 1
					ESX.ShowNotification('Lingotes de azufre vendidos: ' .. sulfur)
				end

			end

			if action == 'diamond_sell' then
				aux = aux + 1
				diamond = diamond + 1
				ESX.ShowNotification('Diamantes vendidos: ' .. diamond)
			end

		end

	end


	if action ~= nil then
		ClearPedTasks(GetPlayerPed(-1))
	end


	TriggerServerEvent('esx_minerjob:addQuantity', stones, iron, copper, gold, sulfur, diamond, action)
end)





RegisterNetEvent('esx_minerjob:newMission')
AddEventHandler('esx_minerjob:newMission', function()

	local MissionNum = math.random(1, 5)
	mission = true
	if MissionNum == 1 then destination = Config.Stones.Stone1 end
	if MissionNum == 2 then destination = Config.Stones.Stone2 end
	if MissionNum == 3 then destination = Config.Stones.Stone3 end
	if MissionNum == 4 then destination = Config.Stones.Stone4 end
	if MissionNum == 5 then destination = Config.Stones.Stone5 end
	if count >= 5 then
		mission = false
		count = 0
	end 

end)
