local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["P"] = 79, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
local ESX = nil
local PlayerData = nil
local playerJobMarkers = nil
local isInMarker = false
local isOnDuty  = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    PlayerData = ESX.GetPlayerData()
    isOnDuty = not string.match(PlayerData.job.name, "_off")
    playerJobMarkers = Config.Markers[PlayerData.job.name:gsub('%_off', '')]

    if isOnDuty and playerJobMarkers then
        TriggerServerEvent('player:serviceOn', PlayerData.job.name)
    end
end)

-- Draw Markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        while not PlayerData do
            Citizen.Wait(10)
        end
        
        if PlayerData.job ~= nil and playerJobMarkers then
            for i,marker in pairs(playerJobMarkers) do
                local coords = GetEntityCoords(PlayerPedId())

                if GetDistanceBetweenCoords(coords, marker.Coords.x, marker.Coords.y, marker.Coords.z, true) < Config.DrawDistance then
                    DrawMarker(marker.Sprite, marker.Coords.x, marker.Coords.y, marker.Coords.z, 0.0, 0.0, 0.0, marker.Rotation.x, marker.Rotation.y, marker.Rotation.z, 1.0, 1.0, 1.0, marker.Color.r, marker.Color.g, marker.Color.b, 200, false, false, 2, false, false, false, false)
                end
            end
        else
            while PlayerData.job == nil or not playerJobMarkers do
                Citizen.Wait(500)
            end
        end
    end
end)

-- Show Helper message
Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(0)
        local letSleep
        local coords      = GetEntityCoords(PlayerPedId())

        while not PlayerData do
            Citizen.Wait(10)
        end

        if PlayerData.job ~= nil and playerJobMarkers then
            isInMarker  = false

            for i, marker in pairs(playerJobMarkers) do
                local coords      = GetEntityCoords(PlayerPedId())
                
                if(GetDistanceBetweenCoords(coords, marker.Coords.x, marker.Coords.y, marker.Coords.z, true) < Config.MarkerSize.x) then
                    isInMarker  = true
                    letSleep = true
                end
            end

            if letSleep then
                Citizen.Wait(500)
            end
        end
    end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do

        Citizen.Wait(0)
        
        while not PlayerData or isOnDuty == nil do
            Citizen.Wait(10)
        end

        if isInMarker then
            local message = ''
            if isOnDuty then
                message = Config.OffDutyText
            else
                message = Config.OnDutyText
            end

            ESX.ShowHelpNotification(message)

            if IsControlJustReleased(0, Keys['E']) then
                if isOnDuty then
                    TriggerServerEvent('player:serviceOff', PlayerData.job.name)
                    TriggerServerEvent('rpproject:setOffDutyJob', PlayerData.job.name .. '_off')
                else
                    local originalJobName = PlayerData.job.name:gsub('%_off', '')
                    TriggerServerEvent('player:serviceOn', originalJobName)
                    TriggerServerEvent('rpproject:setOnDutyJob', originalJobName)
                end
            end
		end
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    isOnDuty = not string.match(PlayerData.job.name, "_off")
    playerJobMarkers = Config.Markers[PlayerData.job.name:gsub('%_off', '')]

    if isOnDuty and playerJobMarkers then
        TriggerServerEvent('player:serviceOn', PlayerData.job.name)
    end
end)