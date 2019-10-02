
 local pedindex = {}
 
 -- saca los servicio npc de policia etc y no deja armas en el piso de los npc.
Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 12 do
			Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
        SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)

        -- No deja armas en el piso de los npc.
        DisablePlayerVehicleRewards(PlayerId())

        -- Desabilita los weapon en los NPC
        SetWeaponDrops()
	end
end)

Citizen.CreateThread(function()

    local player = PlayerPedId()

    while true do
            -- 1.
        Citizen.Wait(0)

        SetVehicleDensityMultiplierThisFrame(0.0)
        SetPedDensityMultiplierThisFrame(0.0)
        SetRandomVehicleDensityMultiplierThisFrame(0.0)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)

        RemovePeskyVehicles(player, 5000.0)
        SetPedNonCreationArea(-6000.0, -6000.0, -6000.0, 10000.0, 10000.0, 8000.0)
       
        -- a partir de aca bestia... no toques nada.
        
        local playerPed = GetPlayerPed(-1)
        local pos = GetEntityCoords(playerPed)
        RemoveVehiclesFromGeneratorsInArea(pos['x'] - 900.0, pos['y'] - 900.0, pos['z'] - 900.0, pos['x'] + 900.0, pos['y'] + 900.0, pos['z'] + 900.0);
       
        if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then

            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1),false),-1) == GetPlayerPed(-1) then
                SetVehicleDensityMultiplierThisFrame(0.1)
                SetParkedVehicleDensityMultiplierThisFrame(0.0)
            else
                SetVehicleDensityMultiplierThisFrame(0.0)
                SetParkedVehicleDensityMultiplierThisFrame(0.1)
            end
        else
          SetParkedVehicleDensityMultiplierThisFrame(0.0)
          SetVehicleDensityMultiplierThisFrame(0.1)
        end
        
        
    end
 
end)



--[[Citizen.CreateThread(function()
	while true do
		local handle, veh = FindFirstVehicle()
		local finished = false -- FindNextPed will turn the first variable to false when it fails to find another ped in the index
		repeat
			if GetEntityHealth(veh) == 0 then
				SetEntityAsNoLongerNeeded(veh)
				model = GetEntityModel(veh)
				SetModelAsNoLongerNeeded(model)
				SetEntityAsMissionEntity(veh,true,true)
				DeleteEntity(veh)
				Citizen.Trace("Deleted exploded vehicle")
			end
			local finished, veh = FindNextVehicle(handle) -- first param returns true while entities are found
			if GetEntityHealth(veh) == 0 then
				SetEntityAsMissionEntity(veh,true,true)
				SetEntityAsNoLongerNeeded(veh)
				model = GetEntityModel(veh)
				SetModelAsNoLongerNeeded(model)
				SetEntityAsMissionEntity(veh,true,true)
				DeleteEntity(veh)
				Citizen.Trace("Deleted exploded vehicle")
			end
		until not finished
		EndFindVehicle(handle)
		Citizen.Wait(160000)
    end
end)]]--

-- Desabilita los weapon en los NPC


function SetWeaponDrops() -- This function will set the closest entity to you as the variable entity.
    local handle, ped = FindFirstPed()
    local finished = false -- FindNextPed will turn the first variable to false when it fails to find another ped in the index
    repeat 
        if not IsEntityDead(ped) then
                pedindex[ped] = {}
        end
        finished, ped = FindNextPed(handle) -- first param returns true while entities are found
    until not finished
    EndFindPed(handle)

    for peds,_ in pairs(pedindex) do
        if peds ~= nil then -- set all peds to not drop weapons on death.
            SetPedDropsWeaponsWhenDead(peds, false) 
        end
    end
end

function RemovePeskyVehicles(player, range)
    local pos = GetEntityCoords(playerPed) 

    RemoveVehiclesFromGeneratorsInArea(
        pos.x - range, pos.y - range, pos.z - range, 
        pos.x + range, pos.y + range, pos.z + range
    );
end