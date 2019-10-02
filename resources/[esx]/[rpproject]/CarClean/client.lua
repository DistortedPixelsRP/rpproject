Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        
        if car then
            local plate = GetVehicleNumberPlateText(car)
            if string.find(plate, " ") == nil then
                Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(car))
            end
        end
    end
end)