local thirst, hunger, drink = 0, 0, 0
local PlayerData = {}
ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer) 
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job, grade)
	Citizen.Wait(100)
	ESX.PlayerData.job = job
	ESX.UI.HUD.SetDisplay(0.0)
	local hour = GetClockHours()
	local minutes = GetClockMinutes()
	SendNUIMessage({
		show = 		IsPauseMenuActive(),
		thirst = 	math.ceil(thirst),
		hunger = 	math.ceil(hunger),
		drink = 	math.ceil(drink),
		hora = 		" .",	
		label = 	ESX.PlayerData.job.label,	
		label2 = 	ESX.PlayerData.job.grade_label,

	})	
end)

Citizen.CreateThread(function() 
	while true do
		Citizen.Wait(500)
		if ESX.PlayerData.job ~= nil then
			ESX.UI.HUD.SetDisplay(0.0)
			local hour = GetClockHours()
			local minutes = GetClockMinutes()
			SendNUIMessage({
				show = 		IsPauseMenuActive(),
				thirst = 	math.ceil(thirst),
				hunger = 	math.ceil(hunger),
				drink = 	math.ceil(drink),
				hora = 		" .",	
				label = 	ESX.PlayerData.job.label,	
				label2 = 	ESX.PlayerData.job.grade_label,

			})	
		end
	end
end)
  

AddEventHandler("esx_ecologica:updateBasics", function(basics)
    hunger, thirst, drink = basics[1].percent, basics[2].percent, basics[3].percent
end)