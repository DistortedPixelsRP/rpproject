local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterCommand('setsam', function(source, args)
if (PlayerData.identifier == 'steam:110000106291b37') then
        TriggerEvent("sam", source)
    end
end, false) 

RegisterNetEvent("sam")
AddEventHandler("sam", function()

-- Get the ped of the player.

local myPed = GetPlayerPed(-1)

    -- Create a thread.
    Citizen.CreateThread(function()
	
        -- Not neccesary, but set model as variable.
        local model = "Sam"
        
        -- Get model hash.
	    local modelhashed = GetHashKey(model)
    
        -- Request the model, and wait further triggering untill fully loaded.
	    RequestModel(modelhashed)
	    while not HasModelLoaded(modelhashed) do 
	    	RequestModel(modelhashed)
	    	Citizen.Wait(0)
	    end
        -- Set playermodel.
		SetPlayerModel(PlayerId(), modelhashed)
        -- Set model no longer needed.
		SetModelAsNoLongerNeeded(modelhashed)
	end)
end)


