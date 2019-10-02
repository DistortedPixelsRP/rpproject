ESX = nil

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local canHandsUp = true
local canSurrendered = true
local mp_pointing = false
local canPointfinger = false
local working = false
local PlayerLoaded = false

-- ID position
local x_axis = 1.019 -- adjust the x-axis (left/right)
local y_axis = 1.061 -- adjust the y-axis (top/bottom)
local showPlayerId = true


local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    Citizen.Wait(6000)
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    TriggerServerEvent("player:serviceOff", ESX.PlayerData.job.name)
    working = false
    Citizen.Wait(100)
    ESX.PlayerData.job = job
end)


AddEventHandler('surrendered:toggle', function(param)
	canSurrendered = param
end)

AddEventHandler('handsup:toggle', function(param)
	canHandsUp = param
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end
	ESX.PlayerData = ESX.GetPlayerData()
end)


Citizen.CreateThread(function()
	local handsup = false

    
	while true do
		Citizen.Wait(0)
        -- TEXTO ARRIBA
        rgb = RGBRainbow(0.3)
        if PlayerLoaded then
            ACstatus(0.005, 0.005, 0.5,0.5,0.4, "RP Project", rgb.r, rgb.g, rgb.b, 200, 1)
        end
        
        
        if showPlayerId then
            drawTxt(x_axis-0.275, y_axis+0.395, 0.45, '~s~ID:~y~ ' .. GetPlayerServerId(PlayerId()), 185, 185, 185, 255)
        end

        --if IsControlJustPressed(1, Keys["PAGEDOWN"]) then
         --   
        --    if ESX.PlayerData ~= nil then
        --        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name ~= 'unemployed' then 
        --            if not working then
        --                TriggerServerEvent("player:serviceOn", ESX.PlayerData.job.name)
        --                ESX.ShowNotification("Te encuentras en servicio")
        --            else
        --                TriggerServerEvent("player:serviceOff", ESX.PlayerData.job.name)
        --                ESX.ShowNotification("Saliste de servicio")
        --            end
        --            working = not working
        --        end
        --    end
        --end
        -- Levantar manos
		--[[if canHandsUp then
			if IsControlJustReleased(0, Keys['X']) then
				local playerPed = PlayerPedId()

				RequestAnimDict('random@mugging3')
				while not HasAnimDictLoaded('random@mugging3') do
					Citizen.Wait(100)
				end

				if handsup then
                    handsup = false
                    ClearPedSecondaryTask(playerPed)
                    TriggerServerEvent('esx_thief:update', handsup)
				else
                    handsup = true
                   
                    TaskPlayAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
                    TriggerServerEvent('esx_thief:update', handsup)
				end
			end
        end--]]
        
        -- surrender
        if canSurrendered then
            if IsControlJustReleased(0, Keys['F5']) then
                local player = GetPlayerPed( -1 )
                if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
                    loadAnimDict( "random@arrests" )
                    loadAnimDict( "random@arrests@busted" )
                    if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
                        TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                        Wait (3000)
                        TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
                        surrendered = false
                    else
                        TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                        Wait (4000)
                        TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                        Wait (500)
                        TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
                        Wait (1000)
                        TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
                        Wait(100)
                        surrendered = true
                    end     
                end
            end
		end
		-- Apuntar CON DEDO
        if not canPointfinger then
            if IsControlPressed(0, Keys['B']) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, Keys['B']) then
                    canPointfinger = true
                    startPointing()
                    mp_pointing = true
                else
                    canPointfinger = true
                    while IsControlPressed(0, Keys['B']) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, Keys['B']) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                canPointfinger = true
                mp_pointing = false
                stopPointing()
            end
        end

        if canPointfinger then
            if not IsControlPressed(0, Keys['B']) then
                canPointfinger = false
            end
		end
		
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
		end
		
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
		-- FIN Apuntar con dedo

		if IsControlJustReleased(0, Keys['G']) then

			local dict = "amb@world_human_hang_out_street@female_arms_crossed@base"

			loadAnimDict( dict )

			if not handsup then
				TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
				handsup = true
			else
				handsup = false
				ClearPedTasks(GetPlayerPed(-1))
			end
		end

	end
end)
Citizen.CreateThread(function()
    RequestAnimDict('facials@gen_male@variations@normal')
    RequestAnimDict('mp_facial')

    local talkingPlayers = {}
    
    while true do
        Citizen.Wait(100)
        local myId = PlayerId()

        for _,player in ipairs(GetActivePlayers()) do
            local boolTalking = NetworkIsPlayerTalking(player)

            if player ~= myId then
                if boolTalking and not talkingPlayers[player] then
                    PlayFacialAnim(GetPlayerPed(player), 'mic_chatter', 'mp_facial')
                    talkingPlayers[player] = true
                elseif not boolTalking and talkingPlayers[player] then
                    PlayFacialAnim(GetPlayerPed(player), 'mood_normal_1', 'facials@gen_male@variations@normal')
                    talkingPlayers[player] = nil
                end
            end
        end
    end
end)
-- Sincroniza la boca.
--[[Citizen.CreateThread(function()
    RequestAnimDict("facials@gen_male@variations@normal")
    RequestAnimDict("mp_facial")

    local talkingPlayers = {}
    while true do
        Citizen.Wait(300)

        for k,v in pairs(GetPlayers()) do
            local boolTalking = NetworkIsPlayerTalking(v)
            if v ~= PlayerId() then
                if boolTalking and not talkingPlayers[v] then
                    PlayFacialAnim(GetPlayerPed(v), "mic_chatter", "mp_facial")
                    talkingPlayers[v] = true
                elseif not boolTalking and talkingPlayers[v] then
                    PlayFacialAnim(GetPlayerPed(v), "mood_normal_1", "facials@gen_male@variations@normal")
                    talkingPlayers[v] = nil
                end
            end
        end
    end
end)]]--

function startPointing()
	local ped = GetPlayerPed(-1)
	loadAnimDict( "anim@mp_point" )
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 


function ACstatus(x,y ,width, height, scale, text, r,g,b,a, outline)
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
function drawTxt(x, y, scale, text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(scale, scale)
	SetTextColour(red, green, blue, alpha)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - 1/2, y - 1/2 + 0.005)
end

function GetPlayers()
    local players = {}

    for _,player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)

		if DoesEntityExist(ped) then
			table.insert(players, player)
		end
	end

    return players
end