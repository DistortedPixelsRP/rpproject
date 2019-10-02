ESX						= nil
local GUI				= {}
local PlayerData		= {}
local playervehiclesplates = {}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	end
    Citizen.Wait(3000)
	ESX.TriggerServerCallback('getplatelist', function(platelist)
		playervehiclesplates = platelist
	end)
end)


function savevehtofile(vehicle)

	local player = PlayerId() --GetPlayerServerId(PlayerId())
	local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
	local plate        = vehicleProps.plate

	if playervehiclesplates[plate] and not string.find(plate, "WAL") then
		local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
		local model = vehicleProps.model
		local x,y,z = table.unpack(GetEntityCoords(vehicle))
		local heading = GetEntityHeading(vehicle)
	
		local netID = NetworkGetNetworkIdFromEntity(vehicle)
		TriggerServerEvent('esx_jb_stopvehicledespawn:savevehicle', player ,netID, model, x, y, z, heading, vehicleProps)
	end

end


if saveOnEnter then
	Citizen.CreateThread(function()
		local inVehicle = false
		while true do
			local playerPed = GetPlayerPed(-1)
			-- if IsPedInAnyVehicle(playerPed) then
				-- local vehicle =GetVehiclePedIsIn(playerPed,false)
				-- if GetPedInVehicleSeat(vehicle, -1) == playerPed then
					-- if not inVehicle then
						-- savevehtofile(vehicle)
						-- inVehicle = true
					-- end
				-- else
					-- inVehicle = false
				-- end
				
			-- else
				-- inVehicle = false
			-- end
			Citizen.Wait(1000)
			local vehicle = GetVehiclePedIsTryingToEnter(playerPed)
			if vehicle ~= 0 then
				if GetSeatPedIsTryingToEnter(playerPed) == -1 then
					savevehtofile(vehicle)
				end
				Citizen.Wait(3000)
			end
		end
	end)
end

Citizen.CreateThread(function()
	local vehicle = 0
	local inVeh = false
	while true do
		local playerPed = GetPlayerPed(-1)
		if IsPedInAnyVehicle(playerPed) then
			local vehicle =GetVehiclePedIsIn(playerPed,false)
			if GetPedInVehicleSeat(vehicle, -1) == playerPed then
				inVeh = true
				savevehtofile(vehicle)
				--SetNetworkIdExistsOnAllMachines(vehicle,true)
				--SetVehicleHasBeenOwnedByPlayer(vehicle, true)
			else
				inVeh = false
			end
		elseif saveOnExit then
			if inVeh then
				local vehicle = GetVehiclePedIsIn(playerPed, true)
				savevehtofile(vehicle)
				inVeh = false
			end
		end
		Citizen.Wait(intervals.save*1000)
	end
end)



RegisterNetEvent('esx_jb_stopvehicledespawn:vehiclecheck')
AddEventHandler('esx_jb_stopvehicledespawn:vehiclecheck', function(vehiclelist)

	local player = PlayerId()
	for vehicleid, vehicle in pairs(vehiclelist) do
		local vehicleid = tonumber(vehicleid)
		local networkvehicleid = NetworkGetEntityFromNetworkId(vehicleid)
		
		if tonumber(player) == tonumber(vehicle.ownerid) then

			local veh = NetToVeh(vehicleid)
			if not DoesEntityExist(veh) then
				
				if NetworkIsHost() then
					DeleteEntity(networkvehicleid)
					TriggerServerEvent('esx_jb_stopvehicledespawn:deleteFromListAndPutInPound', vehicleid)
					--TriggerServerEvent('esx_jb_stopvehicledespawn:MakeNewNetworkedCar',vehicleid)
				end
				--local playerid = GetPlayerServerId(NetworkGetEntityOwner(networkvehicleid))
				--ESX.ShowHelpNotification("Se te incauto el auto")
				
			elseif GetVehicleBodyHealth_2(networkvehicleid) == 0.0 and GetVehicleBodyHealth(networkvehicleid) == 0.0  then
					--print(GetVehicleBodyHealth_2(networkvehicleid))
					--print(GetVehicleBodyHealth(networkvehicleid))
					print('vehicle deleted!')
				if NetworkIsHost() then
					-- if  NetworkIsHost() then
						print('vehicle deleted!2')
						DeleteEntity(networkvehicleid)
						TriggerServerEvent('esx_jb_stopvehicledespawn:deleteFromListAndPutInPound', vehicleid)
					-- end
				end
			end
		end
	end
end)


RegisterNetEvent('esx_jb_stopvehicledespawn:SpawnNewNetworkedCar')
AddEventHandler('esx_jb_stopvehicledespawn:SpawnNewNetworkedCar', function(vehicle)
	ESX.Game.SpawnVehicle(vehicle.model, {
		x = vehicle.x,
		y = vehicle.y,
		z = vehicle.z + 1
	}, vehicle.heading, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle.vehicleProps)
		SetVehRadioStation(callback_vehicle, "OFF")
		SetVehicleHasBeenOwnedByPlayer(callback_vehicle, true)
		SetEntityAsNoLongerNeeded(callback_vehicle, true)
		savevehtofile(callback_vehicle)
	end)
end)

Citizen.CreateThread(function()
	while true do
		
		if NetworkIsHost() then
			TriggerServerEvent('esx_jb_stopvehicledespawn:getvehicletable')
		end
		Citizen.Wait(intervals.check*1000)
	end
end)

-- Citizen.CreateThread(function()
	-- while true do
		 -- if IsControlJustPressed(0, 38) then
			-- local playerPed = GetPlayerPed(-1)
			 -- local coords    = GetEntityCoords(playerPed)
             -- local vehicle   = GetClosestVehicle(coords.x,  coords.y,  coords.z,  3.0,  0,  71)
			 -- print(GetVehicleBodyHealth_2(vehicle))
			 -- print(GetVehicleBodyHealth(vehicle))
			 -- networkid = NetworkGetNetworkIdFromEntity(vehicle)
			  -- print(networkid)
			 -- networkvehicleid = NetworkGetEntityFromNetworkId(networkid)
			 -- print(networkvehicleid)
			 -- DeleteEntity(networkvehicleid)
		 -- end
		 -- Citizen.Wait(0)
	-- end
-- end)

AddEventHandler("playerSpawned", function(spawnInfo)
	if GetNumberOfPlayers() == 1 then
		Citizen.Wait(3000)
    TriggerServerEvent("esx_jb_stopvehicledespawn:getallvehicles")
  end
end)


function Chat(t)
	TriggerEvent("chatMessage", '', { 0, 0x99, 255}, "" .. tostring(t))
end

function dump(o, nb)
  if nb == nil then
    nb = 0
  end
   if type(o) == 'table' then
      local s = ''
      for i = 1, nb + 1, 1 do
        s = s .. "    "
      end
      s = '{\n'
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
          for i = 1, nb, 1 do
            s = s .. "    "
          end
         s = s .. '['..k..'] = ' .. dump(v, nb + 1) .. ',\n'
      end
      for i = 1, nb, 1 do
        s = s .. "    "
      end
      return s .. '}'
   else
      return tostring(o)
   end
end


