
ESX                           = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterNetEvent('rpproject:vip:giveCar')
AddEventHandler('rpproject:vip:giveCar', function(vehicleModel)

    local playerped = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerped)

    ESX.Game.SpawnVehicle(vehicleModel, coords, 270.0, function (vehicle)
        local newPlate     = exports['esx_vehicleshop']:GeneratePlate()
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        vehicleProps.plate = newPlate
        SetVehicleNumberPlateText(vehicle, newPlate)
        TriggerServerEvent('esx_vehicleshop:setVehicleOwned', vehicleProps)
        TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, false)
        TaskWarpPedIntoVehicle(playerped, vehicle, -1)
        --ESX.Game.DeleteVehicle(vehicle)

        ESX.ShowNotification('Le has dado un vehículo al jugador.')
    end)
end)
