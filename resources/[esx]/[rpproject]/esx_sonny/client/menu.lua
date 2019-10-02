    
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
local previousMenu = {}
local selectedDocument = nil

ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if IsControlJustReleased(0, Keys['F1']) and IsInputDisabled(0) and not (ESX.UI.Menu.IsOpen('default2', GetCurrentResourceName(), 'menubasico') or ESX.UI.Menu.IsOpen('default2', GetCurrentResourceName(), 'menubasico_sub')) then
			OpenMenuPrincipal()
		end

	end
end)


function OpenMenuPrincipal()
	local elements = {}

	for i=1, #Config.Menu, 1 do
		if not Config.Menu[i].isSubMenu then
			table.insert(elements, {label = Config.Menu[i].label, value = Config.Menu[i].name})
		end
	end

	ESX.UI.Menu.Open('default2', GetCurrentResourceName(), 'menubasico',
	{
		title    = 'Menu',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		OpenSubMenu(data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end


function OpenSubMenu(menu)
	local title    = nil
	local elements = {}

	for i=1, #Config.Menu, 1 do
		if Config.Menu[i].name == menu then
			title = Config.Menu[i].label

			for j=1, #Config.Menu[i].items, 1 do
				table.insert(elements, {
					label = Config.Menu[i].items[j].label,
					value = Config.Menu[i].items[j].value,
					parent = Config.Menu[i].name
				})
			end

			break

		end
	end

	ESX.UI.Menu.Open('default2', GetCurrentResourceName(), 'menubasico_sub',
	{
		title    = title,
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		local parent = data.current.parent
		local value  = data.current.value
		
		if parent == 'servicios' then
			servicios(value)
		elseif parent == 'documentos' then
			OpenSubMenu('documentos_accion')
			table.insert(previousMenu, parent)
			selectedDocument = value
		elseif parent == 'documentos_accion' then
			ShowDocument(value)
		elseif parent == 'vehiculos' then
			table.insert(previousMenu, parent)
			OpenSubMenu(value)
		elseif parent == 'puertas' then
			VehicleDoorToggle(value)
		elseif parent == 'personaje' then
			if value == "skills" then
				exports["gamz-skillsystem"]:SkillMenu()
			end
		end
	end, function(data, menu)
		menu.close()
		if #previousMenu > 0 then
			OpenSubMenu(table.remove(previousMenu, #previousMenu))
		end
	end)
end


function servicios(servicio)
	local playerPed = PlayerPedId()
	PedPosition		= GetEntityCoords(playerPed)
	
	local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }

	local messageSend = ''
	local messageNotif = ''

	AddTextEntry('FMMC_KEY_TIP1', "Ingrese el Mensaje (Max 120 caracteres)")
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", "", "", "", "", 120)
  	while (UpdateOnscreenKeyboard() == 0) do
      DisableAllControlActions(0);
      Wait(0);
  	end
  	
	if servicio == 'police' then
		messageSend = ''
		messageNotif = '¡La señal ha sido enviada a las unidades disponibles!'
	elseif servicio == 'ambulance' then
		messageSend = 'Atención médica requerida: ciudadano inconsciente.'
		messageNotif = '¡La señal de socorro ha sido enviada a las unidades disponibles!'
	elseif servicio == 'taxi' then
		messageSend = ''
		messageNotif = '¡La señal ha sido enviada a las unidades disponibles!'
	elseif servicio == 'mechanic' then
		messageSend = ''
		messageNotif = '¡La señal ha sido enviada a las unidades disponibles!'
	elseif servicio == 'fire' then
		messageSend = ''
		messageNotif = '¡La señal ha sido enviada a las unidades disponibles!'
	else
		messageSend = ''
		messageNotif = ''
	end

	if (GetOnscreenKeyboardResult()) then
		messageSend = GetOnscreenKeyboardResult()
	end
	
	--ESX.ShowNotification(messageNotif)
	if messageSend ~= '' then
		local playerIdMsg = '[' ..tostring(GetPlayerServerId(PlayerId())).. '] '
		messageSend = tostring(playerIdMsg).. messageSend
		TriggerServerEvent("call:makeCall", servicio, PlayerCoords, messageSend, GetPlayerServerId(player))
	end

    --TriggerServerEvent('esx_addons_gcphone:startCall', servicio, messageSend, PlayerCoords, {
	--	PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
	--})

end

function ShowDocument(to)
	local showToPlayerId = PlayerId()
	local canShow = true

	if to == 'show_other' then
		local distance
		showToPlayerId, distance = ESX.Game.GetClosestPlayer()

		if showToPlayerId == -1 or distance > 3.0 then
			ESX.ShowNotification('No hay personas cerca')
			canShow = false
		end
	end

	if canShow then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(showToPlayerId), selectedDocument)
	end
end

function VehicleDoorToggle(doorsToToggle)
	local vehicle = GetVehiclePedIsIn(PlayerPedId())
	if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
		for i=1,#doorsToToggle do
			local door = doorsToToggle[i]

			if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then 
				SetVehicleDoorShut(vehicle, door, false)
			else
				SetVehicleDoorOpen(vehicle, door, false)
			end	
		end
	else
		ESX.ShowNotification('Tienes que ser el conductor para controlar las puertas')
	end
end