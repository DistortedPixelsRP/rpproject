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
local HasAlreadyEnteredMarker = false
local CurrentActionMsg  = ''
local isInShop = false
local isInMarker = false
local playerShops = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

-- Draw Markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        while not PlayerData do
            Citizen.Wait(10)
        end
        playerShops = Config.Shops[PlayerData.job.name]

        if PlayerData.job ~= nil and playerShops then
            for i,marker in pairs(playerShops) do
                local coords = GetEntityCoords(PlayerPedId())

                if GetDistanceBetweenCoords(coords, marker.Coords.x, marker.Coords.y, marker.Coords.z, true) < Config.DrawDistance then
                    DrawMarker(marker.Sprite, marker.Coords.x, marker.Coords.y, marker.Coords.z, 0.0, 0.0, 0.0, marker.Rotation.x, marker.Rotation.y, marker.Rotation.z, 1.0, 1.0, 1.0, marker.Color.r, marker.Color.g, marker.Color.b, 200, false, false, 2, false, false, false, false)
                end
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
        
        playerShops = Config.Shops[PlayerData.job.name]

        if PlayerData.job ~= nil and playerShops then
            isInMarker  = false

            for i, marker in pairs(playerShops) do
                local coords      = GetEntityCoords(PlayerPedId())
                
                if(GetDistanceBetweenCoords(coords, marker.Coords.x, marker.Coords.y, marker.Coords.z, true) < Config.MarkerSize.x) then
                    isInMarker  = true
                    ShopItems   = Config.Documents[i]
                    letSleep = true
                end
            end

            if isInMarker and not HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = true
                CurrentActionMsg  = 'Presionar ~INPUT_CONTEXT~ para acceder a los documentos'
            end

            if not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                CurrentActionMsg = ''
                isInShop = false
                ESX.UI.Menu.CloseAll()
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

		if isInMarker and not isInShop then
			ESX.ShowHelpNotification(CurrentActionMsg)

            if IsControlJustReleased(0, Keys['E']) then
                isInShop = true
                local playerPed = GetPlayerPed(-1)
    
                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open(
                    'default', GetCurrentResourceName(), 'documents',
                    {
                        title    = 'Documentos',
                        align    = 'bottom-right',
                        elements = Config.Documents[PlayerData.job.name]
                    },
                    function(data, menu)
                        local players      = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
                        local foundPlayers = false
                        local elements     = {}
                    
                        for i=1, #players, 1 do
                            --if players[i] ~= PlayerId() then
                                foundPlayers = true

                                table.insert(elements, {
                                    label = GetPlayerName(players[i]),
                                    player = players[i]
                                })
                           -- end
                        end

                        if not foundPlayers then
                            ESX.ShowNotification('No hay nadie cerca')
                            return
                        end

                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_item_to',
                        {
                            title    = 'Dar a',
                            align    = 'bottom-right',
                            elements = elements
                        }, function(data2, menu2)

                            local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)

                            for i=1, #players, 1 do
                                if players[i] ~= PlayerId() then
                                    
                                    if players[i] == data2.current.player then
                                        foundPlayers = true
                                        nearbyPlayer = players[i]
                                        break
                                    end
                                end
                            end

                            if not foundPlayers then
                                ESX.ShowNotification('No hay nadie cerca')
                                menu2.close()
                                return
                            else
                                menu2.close()
                                TriggerServerEvent('lirianer_document_shops:giveDocument', GetPlayerServerId(nearbyPlayer), data.current.value)
                            end
                        end, function(data2, menu2)
                            --print("TODO LESTO AMEO")
                            menu2.close()
                        end)
                    end,
                    function(data, menu)
                        isInShop = false
                        menu.close()
                    end
                )
				
				CurrentAction = nil
			end
		end
	end
end)