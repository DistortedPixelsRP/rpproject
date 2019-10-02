------------------------------------------------------------------
--                          Variables
------------------------------------------------------------------
ESX                           = nil
local PlayerData              = {}
local showHud = true                          -- Boolean to show / hide HUD
local faim                                    -- Init hunger's variable. Set to 100 for development. 
local soif   
local urlavatar = nil


Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
  end

  while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
  end
  PlayerData = ESX.GetPlayerData()
end)
------------------------------------------------------------------
--                          Functions
------------------------------------------------------------------

function updateHungerThirstHUD(faim, soif)
  SendNUIMessage({
    update = true,
    faim = faim,
    soif = soif,
    --url = urlavatar,
    job = PlayerData.job.label.." - "..PlayerData.job.grade_label,
    job2 = PlayerData.job2.label.." - "..PlayerData.job2.grade_label
  })
end

------------------------------------------------------------------
--                          Events
------------------------------------------------------------------

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)

  PlayerData = xPlayer
  if PlayerData ~= nil then
    Citizen.Wait(5000)
    --urlavatar = exports["mugshot"]:getMugshotUrl(GetPlayerPed(-1))
  end
  
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    Citizen.Wait(100)
    PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job)
    Citizen.Wait(100)
    PlayerData.job2 = job
end)

-- Hunger Thirst

RegisterNetEvent("esx_hungerthirt:PlayerHungerThirst")
AddEventHandler("esx_hungerthirt:PlayerHungerThirst", function(basics)
  hunger, thirst, drink = basics[1].percent, basics[2].percent, basics[3].percent
  
  updateHungerThirstHUD(hunger, thirst)
end)

-- Update value if used from inventory
RegisterNetEvent("UpdateFoodDrink")
AddEventHandler("UpdateFoodDrink", function(newFaim, newSoif)
  faim = faim + newFaim
  soif = soif + newSoif

  if faim > 100 then faim = 100 end
  if soif > 100 then soif = 100 end
end)

RegisterNetEvent('esx_hungerthirt:updateWeight')
AddEventHandler('esx_hungerthirt:updateWeight', function(weight,maximo)
  weightprc = (weight/maximo)*100
  SendNUIMessage({action = "updateWeight", weight = weightprc})
end)

------------------------------------------------------------------
--                          Citizen
------------------------------------------------------------------
