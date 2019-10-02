-- CONFIG --

-- AFK Kick Time Limit (in seconds)
secondsUntilKick = 1800 -- 10 min

-- Warn players if 3/4 of the Time Limit ran up
kickWarning = true

--
hasAlreadyJoined = false
isdeadPlayer = false
-- CODE --

time = 0

AddEventHandler('playerSpawned', function(spawn)
	isdeadPlayer = false
	if(not hasAlreadyJoined) then
		hasAlreadyJoined = true
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isdeadPlayer = true
	time = time + 600
end)



Citizen.CreateThread(function()

	local playerPed = GetPlayerPed(-1)
	if GetEntityHealth(playerPed) then
		hasAlreadyJoined = true
	end

	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if hasAlreadyJoined then
			if playerPed then
				currentPos = GetEntityCoords(playerPed, true)

				if currentPos == prevPos then

					if time > 0 then
						
						if kickWarning and time == math.ceil(secondsUntilKick / 4) then
							TriggerEvent("chatMessage", "ATENCION", {255, 0, 0}, "^1Seras kickeado en " .. time .. " segundos por estar AFK!")
						end

						time = time - 1
					else
						TriggerServerEvent("kickForBeingAnAFKDouchebag")
					end
				else
					time = secondsUntilKick
				end

				prevPos = currentPos
			end
		end
	end
end)