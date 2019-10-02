-- Density values from 0.0 to 1.0.
DensityMultiplier = 0.01
Citizen.CreateThread(function()
	while true do
	    Citizen.Wait(0)
	    SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetPedDensityMultiplierThisFrame(0.1)
	    SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
	    SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
        SetScenarioPedDensityMultiplierThisFrame(0.1, 0.1)
        SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
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