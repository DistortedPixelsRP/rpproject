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

ESX                             = nil

local isHunter = false
local PlayerData = {}
local Blips = {
	{ name="Cazeria", id=141,x=-769.23773193359, y=5595.6215820313, z=33.48571395874},
	{ name="Vendedor Carne y cuero", id=141,x = 969.16375732422, y = -2107.9033203125, z=31.475671768188},
}
local spawnedDeers = 0 
--local AnimalPositions= {coords = vector3(-652.89, 4111.96, 159.16), name = "Animales", color = 25, sprite = 141, radius = 100.0,}  POSICION BIEN
local AnimalPositions= {
	coords = {		vector3(-1594.68, 4764.44, 51.14),
	vector3(167.58, 6834.8, 20.09),
	vector3(-1481.45, 4552.81, 58.7),	
	},
		 name = "Animales", 
		 color = 25, 
		 sprite = 141, 
		 radius = 200.0,
}

local BlipCircle = {}
local AnimalsInSession = {}
local Positions = {
	['StartHunting'] = { ['hint'] = '[E] Empezar Cazeria', ['x'] = -769.23773193359, ['y'] = 5595.6215820313, ['z'] = 33.48571395874 },
	['Sell'] = { ['hint'] = '[E] Vender', ['x'] = 969.16375732422, ['y'] = -2107.9033203125, ['z'] = 31.475671768188 },
	['SpawnATV'] = { ['x'] = -769.63067626953, ['y'] = 5592.7573242188, ['z'] = 33.48571395874 }
}
local OnGoingHuntSession = false
local HuntCar = nil











Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	end
end)
  
function IsJobTrue()
	if PlayerData ~= nil then
		local IsJobTrue = false
		if PlayerData.job ~= nil and PlayerData.job.name == 'hunter' then
			IsJobTrue = true
		end
		return IsJobTrue
	end
end
  
  
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
PlayerData.job = job
end)


function cleanPlayer(playerPed)
ClearPedBloodDamage(playerPed)
ResetPedVisibleDamage(playerPed)
ClearPedLastWeaponDamage(playerPed)
ResetPedMovementClipset(playerPed, 0)
end

  




  Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)



















Citizen.CreateThread(function()
	for _, item in pairs(Blips) do
        item.blip = AddBlipForCoord(item.x, item.y, item.z)
		SetBlipSprite(item.blip, item.id)
		SetBlipColour(item.blip, 1)
        SetBlipAsShortRange(item.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(item.name)
        EndTextCommandSetBlipName(item.blip)	
	end
end)


Citizen.CreateThread(function()
	for index, v in ipairs(Positions) do
		if index ~= 'SpawnATV' then
			local StartBlip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite(StartBlip, 442)
			SetBlipColour(StartBlip, 75)
			SetBlipScale(StartBlip, 0.7)
			SetBlipAsShortRange(StartBlip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Hunting Spot')
			EndTextCommandSetBlipName(StartBlip)
		end
	end




	LoadModel('blazer')
	LoadModel('a_c_deer')
	LoadAnimDict('amb@medic@standing@kneel@base')
	LoadAnimDict('anim@gangops@facility@servers@bodysearch@')


	while true do
		local sleep = 500
		
		local plyCoords = GetEntityCoords(PlayerPedId())

		for index, value in pairs(Positions) do
			if value.hint ~= nil then
				if OnGoingHuntSession and index == 'StartHunting' then
					value.hint = '[E] Terminar Cazeria'
				elseif not OnGoingHuntSession and index == 'StartHunting' then
					value.hint = '[E] Empezar Cazeria'
				end

				local distance = GetDistanceBetweenCoords(plyCoords, value.x, value.y, value.z, true)

				if distance < 5.0 then
					sleep = 5
					DrawM(value.hint, 27, value.x, value.y, value.z - 0.945, 255, 255, 255, 1.5, 15)
					if distance < 1.0 then
						if IsControlJustReleased(0, Keys['E']) then
							if index == 'StartHunting' then
								if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_KNIFE')  then
									if IsJobTrue() then
										StartHuntingSession()
									else
										ESX.ShowNotification('Necesita conseguir el trabajo para salir a cazar')
									end
								else 
									ESX.ShowNotification('Necesitas un cuchillo en mano para poder empezar!')
								end
							else
								SellItems()
							end
						end
					end
				end

			end
			
		end
		Citizen.Wait(sleep)
	end
end)







function StartHuntingSession()

	if OnGoingHuntSession then
		spawnedDeers = 0
		OnGoingHuntSession = false


		--RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYSNIPER"), true, true)
		--RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_KNIFE"), true, true)

		DeleteEntity(HuntCar)
		RemoveBlip(BlipCircle['circle'])
		RemoveBlip(BlipCircle['point'])
		BlipCircle = {}

		for index, value in pairs(AnimalsInSession) do
			if DoesEntityExist(value.id) then
				DeleteEntity(value.id)
			end
		end
		Citizen.Wait(4000)

	else
		OnGoingHuntSession = true
		local i = math.random(1,3)
		CreateBlipCircle(AnimalPositions.coords[i], AnimalPositions.name, AnimalPositions.radius, AnimalPositions.color, AnimalPositions.sprite)

		--Car

		HuntCar = CreateVehicle(GetHashKey('blazer'), Positions['SpawnATV'].x, Positions['SpawnATV'].y, Positions['SpawnATV'].z, 169.79, true, false)

		--GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYSNIPER"),45, true, false)
		--GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_KNIFE"),0, true, false)

		--Animals


		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(10)
				local coords = GetEntityCoords(PlayerPedId())
		
				if GetDistanceBetweenCoords(coords, AnimalPositions.coords[i], true) < 200 then
					


						while spawnedDeers < 7 do
							Citizen.Wait(0)
							local AnimalCoords = GenerateAnimalCoords( AnimalPositions.coords[i].x, AnimalPositions.coords[i].y, AnimalPositions.coords[i].z)
							Citizen.Trace(AnimalCoords)
							local Animal = CreatePed(5, GetHashKey('a_c_deer'), AnimalCoords, 0.0, true, true)
							TaskWanderStandard(Animal, true, true)
							SetEntityAsMissionEntity(Animal, true, true)
							--Blips
			
							local AnimalBlip = AddBlipForEntity(Animal)
							SetBlipSprite(AnimalBlip, 153)
							SetBlipColour(AnimalBlip, 1)
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString('Deer - Animal')
							EndTextCommandSetBlipName(AnimalBlip)
			
			
							table.insert(AnimalsInSession, {id = Animal, x = AnimalCoords.x, y = AnimalCoords.y, z = AnimalCoords.z, Blipid = AnimalBlip})
							spawnedDeers = spawnedDeers + 1
							
						end

					Citizen.Wait(500)
				else
					Citizen.Wait(500)
				end
			end
		end)



		Citizen.CreateThread(function()



			local timer = 1800  -- 1 Minuto
			while OnGoingHuntSession do
				
				if timer == 0 then
					for index, value in pairs(AnimalsInSession) do
							DeleteEntity(value.id)
							OnGoingHuntSession = false
					end
					DeleteEntity(HuntCar)
					RemoveBlip(BlipCircle['circle'])
					RemoveBlip(BlipCircle['point'])
					spawnedDeers = 0
					ESX.ShowNotification('Se te han escapado los ciervos, vuelve a intentar') --Poner lo que vean mejor
				end
				timer = timer - 1

				local sleep = 500

				for index, value in ipairs(AnimalsInSession) do
					if DoesEntityExist(value.id) then
						local AnimalCoords = GetEntityCoords(value.id)
						local PlyCoords = GetEntityCoords(PlayerPedId())
						local AnimalHealth = GetEntityHealth(value.id)
						
						local PlyToAnimal = GetDistanceBetweenCoords(PlyCoords, AnimalCoords, true)

						if AnimalHealth <= 0 then
							SetBlipColour(value.Blipid, 3)
							if PlyToAnimal < 2.0 then
								sleep = 5

								ESX.Game.Utils.DrawText3D({x = AnimalCoords.x, y = AnimalCoords.y, z = AnimalCoords.z + 1}, '[E] Carnear Animal', 0.4)

								if IsControlJustReleased(0, Keys['E']) then
									if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_KNIFE')  then
										if DoesEntityExist(value.id) then
											table.remove(AnimalsInSession, index)
											SlaughterAnimal(value.id)
										end
									else
										ESX.ShowNotification('Necesitas tener el cuchillo en mano!')
									end
								end

							end
						end
					end
				end

				Citizen.Wait(sleep)

			end
				
		end)
	end
end

function SlaughterAnimal(AnimalId)

	TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )

	Citizen.Wait(5000)

	ClearPedTasksImmediately(PlayerPedId())
	local AnimalWeight = math.random(10, 60) / 10

	ESX.ShowNotification('Carneaste al animal y recibiste carne de ' ..AnimalWeight.. 'kg')

	TriggerServerEvent('esx-qalle-hunting:reward', AnimalWeight)

	DeleteEntity(AnimalId)
end

function SellItems()
	TriggerServerEvent('esx-qalle-hunting:sell')
end

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end    
end

function LoadModel(model)
    while not HasModelLoaded(model) do
          RequestModel(model)
          Citizen.Wait(10)
    end
end

function GenerateAnimalCoords(x,y,z)
	while true do
		Citizen.Wait(1)

		local AnimalCoordX, AnimalCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-170, 170)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-170, 170)


		AnimalCoordX = x + modX
		AnimalCoordY = y + modY


		local coordZ = GetCoordZ(AnimalCoordX, AnimalCoordY, z)
		local coord = vector3(AnimalCoordX, AnimalCoordY, coordZ)

		if ValidateAnimalCoord(coord) then
			return coord
		end
	end
end


function ValidateAnimalCoord(AnimCoord)

	local validate = true
	
	for index, value in ipairs(AnimalsInSession) do
		if DoesEntityExist(value.id) then
			local AnimalCoords = GetEntityCoords(value.id)
			local PlyToAnimal = GetDistanceBetweenCoords(AnimCoord, AnimalCoords, true)
			if PlyToAnimal <5  then
			validate = false
			end
		end
		
	end
	return validate
end


function GetCoordZ(x, y)

	for i=1.0, 9999.0 do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, i)

		if foundGround then
			return z
		end
	end

	return 100.0
end

function DrawM(hint, type, x, y, z)
	--ESX.Game.Utils.DrawText3D({x = x, y = y, z = z + 1.0}, hint, 0.4)
	DrawMarker(type, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
end


function CreateBlipCircle(coords, text, radius, color, sprite)
    BlipCircle['circle'] = AddBlipForRadius(coords, radius)

    SetBlipHighDetail( BlipCircle['circle'], true)
    SetBlipColour( BlipCircle['circle'], 1)
    SetBlipAlpha ( BlipCircle['circle'], 128)

    -- create a blip in the middle
    BlipCircle['point'] = AddBlipForCoord(coords)

    SetBlipHighDetail(BlipCircle['point'], true)
    SetBlipSprite (BlipCircle['point'], sprite)
    SetBlipScale  (BlipCircle['point'], 1.0)
    SetBlipColour (BlipCircle['point'], color)
    SetBlipAsShortRange(BlipCircle['point'], true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(BlipCircle['point'])
end


