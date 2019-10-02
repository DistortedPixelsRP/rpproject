DensityMultiplier = 0.1
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing
		
		SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetPedDensityMultiplierThisFrame(DensityMultiplier)
	    SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)


		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
	
		--local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		--ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		--RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
		
	end
end)

Citizen.CreateThread(function()
    while true do
            -- 1.
        Citizen.Wait(1)
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

Citizen.CreateThread(function()
	local playerID = PlayerId()
    while true do
        DisablePlayerVehicleRewards(playerID)
        SetWeaponDrops() -- desabhilita las armas que caen al suelo de los npc
        Citizen.Wait(500)
    end
end)

function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finished = false 
    repeat 
        if not IsEntityDead(ped) then
            SetPedDropsWeaponsWhenDead(ped, false) 
        end
        finished, ped = FindNextPed(handle)
    until not finished

    EndFindPed(handle)
end