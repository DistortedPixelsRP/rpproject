------------------------------------------------------------------
--                          Variables
------------------------------------------------------------------
ESX                           = nil

local showMenu = false                    
local toggleCoffre = 0
local toggleCapot = 0
local toggleLocked = 0
local playing_emote = false
local lastFrameIsOpen = false

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	end
end)

------------------------------------------------------------------
--                          Functions
------------------------------------------------------------------

-- Show crosshair (circle) when player targets entities (vehicle, pedestrian…)
function Crosshair(enable)
	SendNUIMessage({
		crosshair = enable
	})
end

-- Toggle focus (Example of Vehcile's menu)
RegisterNUICallback('disablenuifocus', function(data)
	showMenu = data.nuifocus
	SetNuiFocus(data.nuifocus, data.nuifocus)
end)

-- Toggle car trunk (Example of Vehcile's menu)
RegisterNUICallback('togglecoffre', function(data)
	if(toggleCoffre == 0)then
		SetVehicleDoorOpen(data.id, 5, false)
		exports["esx_jb_advanced_truck_inventory"].openmenuvehicle()
		toggleCoffre = 1
	else
		ESX.UI.Menu.CloseAll()
		SetVehicleDoorShut(data.id, 5, false)
		toggleCoffre = 0
	end
end)

-- Toggle car hood (Example of Vehcile's menu)
RegisterNUICallback('togglecapot', function(data)
	if(toggleCapot == 0)then
		SetVehicleDoorOpen(data.id, 4, false)
		toggleCapot = 1
	else
		SetVehicleDoorShut(data.id, 4, false)
		toggleCapot = 0
	end
end)

-- Toggle car lock (Example of Vehcile's menu)
RegisterNUICallback('togglelock', function(data)
	if(toggleLocked == 0)then
		--SetVehicleDoorsLocked(data.id, 2)
		--TriggerEvent('InteractSound_CL:PlayOnOne', 'lock', 1.0)
		exports["esx_vehiclelock"].ToggleVehicleLock()
		Citizen.Trace("Doors Locked")
		toggleLocked = 1
	else
		--SetVehicleDoorsLocked(data.id, 1)
		--Citizen.Trace("Doors Unlocked")
		--TriggerEvent('InteractSound_CL:PlayOnOne', 'unlock', 1.0)
		exports["esx_vehiclelock"].ToggleVehicleLock()
		toggleLocked = 0
	end
end)

-- Example of animation (Ped's menu)
RegisterNUICallback('cheer', function(data)
	playerPed = GetPlayerPed(-1);
		if(not IsPedInAnyVehicle(playerPed)) then
			if playerPed then
				if playing_emote == false then
					TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_CHEERING', 0, true);
					playing_emote = true
				end
			end
		end
end)

------------------------------------------------------------------
--                          Citizen
------------------------------------------------------------------
RegisterNetEvent("showPictureOfPlayer")
AddEventHandler("showPictureOfPlayer", function(playerId)
    local player = GetPlayerFromServerId(playerId)
    local headshot = RegisterPedheadshot(GetPlayerPed(player))
    while not IsPedheadshotReady(headshot) and not IsPedheadshotValid(headshot) do
        Citizen.Wait(0)
    end
    headshotString = GetPedheadshotTxdString(headshot)
end)

Citizen.CreateThread(function()
	

	while true do
		Citizen.Wait(5)
		local Ped = GetPlayerPed(-1)
		local playerPed = PlayerPedId()
		-- Get informations about what user is targeting
		-- /!\ If not working, check that you have added "target" folder to resources and server.cfg
		local Entity, farCoordsX, farCoordsY, farCoordsZ = exports.target:Target(6.0, Ped)
		local EntityType = GetEntityType(Entity)
		local coords = GetEntityCoords(playerPed)

		-- If EntityType is Vehicle
		if(EntityType == 2) then 

			if IsAnyVehicleNearPoint(coords, 3.0) then
				if not IsPedInAnyVehicle(playerPed,  false) then
					Crosshair(true)
					if IsControlJustReleased(1, 38) then -- E is pressed
						SetNuiFocus(true, true)
						SendNUIMessage({
							menu = 'vehicle',
							idEntity = Entity
						})
						showMenu = true
						lastFrameIsOpen = true
					end
				else
					print("dentro del auto")
				end
			end
			-- If EntityType = User
		elseif(EntityType == 1) then 
			--[[Crosshair(true)

			if IsControlJustReleased(1, 38) then -- E is pressed
				SetNuiFocus(true, true)
				SendNUIMessage({
					menu = 'user',
					idEntity = Entity
				})
				showMenu = true
				lastFrameIsOpen = true
			end]]--
		else
			Crosshair(false)
		end


		if showMenu == false then
			if lastFrameIsOpen == true then
				SendNUIMessage({
					menu = false
				})
				SetNuiFocus(false, false)
				
				lastFrameIsOpen = false
			end		
			
		end


		-- Stop emotes if user press E
		-- TODO: Stop emotes if user move
		if playing_emote == true then
			if IsControlPressed(1, 38) then
				ClearPedTasks(Ped)
				playing_emote = false
			end
		end

		
	end
end)