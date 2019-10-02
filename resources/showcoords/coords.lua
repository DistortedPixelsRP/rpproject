local group = "user"
local isShowingCoords = false

function DrawTxt(text, x, y)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.0, 0.4)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		if isShowingCoords then
			x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
			
			roundx = tonumber(string.format("%.2f", x))
			roundy = tonumber(string.format("%.2f", y))
			roundz = tonumber(string.format("%.2f", z))
			
			DrawTxt("~r~X:~s~ "..roundx, 0.32, 0.10)
			DrawTxt("~r~Y:~s~ "..roundy, 0.38, 0.10)
			DrawTxt("~r~Z:~s~ "..roundz, 0.445, 0.10)

			heading = GetEntityHeading(GetPlayerPed(-1))
			roundh = tonumber(string.format("%.2f", heading))
			DrawTxt("~r~H:~s~ "..roundh, 0.50, 0.10)

			local rx,ry,rz = table.unpack(GetEntityRotation(PlayerPedId(), 1))
			DrawTxt("~r~RX:~s~ "..tonumber(string.format("%.2f", rx)), 0.38, 0.13)
			DrawTxt("~r~RY:~s~ "..tonumber(string.format("%.2f", ry)), 0.44, 0.13)
			DrawTxt("~r~RZ:~s~ "..tonumber(string.format("%.2f", rz)), 0.495, 0.13)
		
			speed = GetEntitySpeed(PlayerPedId())
			rounds = tonumber(string.format("%.2f", speed))
			DrawTxt("~r~Player Speed: ~s~"..rounds, 0.40, 0.92)

			health = GetEntityHealth(PlayerPedId())
			DrawTxt("~r~Player Health: ~s~"..health, 0.40, 0.95)

			veheng = GetVehicleEngineHealth(GetVehiclePedIsUsing(PlayerPedId()))
			vehbody = GetVehicleBodyHealth(GetVehiclePedIsUsing(PlayerPedId()))
			if IsPedInAnyVehicle(PlayerPedId(), 1) then
				vehenground = tonumber(string.format("%.2f", veheng))
				vehbodround = tonumber(string.format("%.2f", vehbody))

				DrawTxt("~r~Engine Health: ~s~"..vehenground, 0.015, 0.76)

				DrawTxt("~r~Body Health: ~s~"..vehbodround, 0.015, 0.73)

				DrawTxt("~r~Vehicle Fuel: ~s~"..tonumber(string.format("%.2f", GetVehicleFuelLevel(GetVehiclePedIsUsing(PlayerPedId())))), 0.015, 0.70)
			end
		end
    end
end)

RegisterCommand('coords', function(source, args)
--	if group ~= "user" then
		isShowingCoords = not isShowingCoords
	--end
end, false)

RegisterNetEvent('es_admin:setGroup')
AddEventHandler('es_admin:setGroup', function(g)
	--print('group setted ' .. g)
	group = g
end)
