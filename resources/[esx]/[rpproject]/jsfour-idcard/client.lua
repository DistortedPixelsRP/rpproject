local open = false
ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do

    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    Citizen.Wait(0)
  end
end)

-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type)
	if ESX == nil then
		CancelEvent()
	end

	open = true

	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})
end)

RegisterNetEvent('jsfour-idcard:close')
AddEventHandler('jsfour-idcard:close', function( data, type )
	open = false
	SendNUIMessage({
		action = "close",
	})
end)

-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)
