--[[
----------------------------------------------------------------------------
____________________________________________________________________________
                        
                        AUTHOR : ReedY

            Régule le trafic pnj
            FixTrafic - double cars
        

____________________________________________________________________________
                        
---------------------------------------------------------------------------
]]--
 
Citizen.CreateThread(function()
    while true
        do
            -- 1.

        SetVehicleDensityMultiplierThisFrame(0.0)
        SetPedDensityMultiplierThisFrame(0.5)
        SetRandomVehicleDensityMultiplierThisFrame(0.0)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
        SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
        --SetVehicleDensityMultiplierThisFrame(0.1)
        --SetPedDensityMultiplierThisFrame(0.2)
        --SetRandomVehicleDensityMultiplierThisFrame(0.1)
        --SetParkedVehicleDensityMultiplierThisFrame(1.0)
        --SetScenarioPedDensityMultiplierThisFrame(2.0, 2.0)
       
        local playerPed = GetPlayerPed(-1)
        local pos = GetEntityCoords(playerPed)
        RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
       
       
        -- 2.
        --SetGarbageTrucks(0)
        --SetRandomBoats(0)
        --SetRandomBus(0)
        Citizen.Wait(1)
    end
 
end)