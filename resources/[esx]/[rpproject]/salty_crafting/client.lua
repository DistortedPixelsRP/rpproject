ESX = nil
local display = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function isWeapon(item)
	local weaponList = ESX.GetWeaponList()
	for i=1, #weaponList, 1 do
		if weaponList[i].label == item then
			return true
		end
	end
	return false
end

local function craftItem(name)
	--local ingredientsPrepped = {}
	--for name, count in pairs(ingredients) do
	--	if count > 0 then
	--		table.insert(ingredientsPrepped, { item = name , quantity = count})
		--end
	--end
	TriggerServerEvent('salty_crafting:craftItem', name)
end

RegisterNetEvent('salty_crafting:openMenu')
AddEventHandler('salty_crafting:openMenu', function(playerInventory)
	SetNuiFocus(true,true)
	local preppedInventory = {}
	for i=1, #playerInventory, 1 do
		if playerInventory[i].count > 0 and not isWeapon(playerInventory[i].label) then
			table.insert(preppedInventory, playerInventory[i])
		end
	end

	local array = {}
	for k,v in pairs(Config.Recipes) do
		local ingre = {}
		for i=1, #v.ingredients do
			table.insert(ingre, {name = v.ingredients[i].name, item = v.ingredients[i].item, quantity = v.ingredients[i].quantity})
		end
		table.insert(array, {value = k, name = v.name, ingredients = ingre})
	end


	--for i = 1, #array do
	--	Citizen.Trace('nombre del item: ' .. array[i].name)
	--	for u = 1,#array[i].ingredients do
	--		Citizen.Trace('nombre del ingrediente: '.. array[i].ingredients[u].item)
	--		Citizen.Trace(array[i].ingredients[u].quantity)
	--	end
	--end


	SendNUIMessage({
		inventory = preppedInventory,
		display = true,
		recipes = array
	})
	display = true
end)

RegisterNUICallback('craftItemNUI', function(data, cb)
	craftItem(data)
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	SendNUIMessage({
		display = false
	})
	display = false
end)

if Config.Keyboard.useKeyboard then
	-- Handle menu input
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if IsControlJustReleased(1, Config.Keyboard.keyCode) and GetLastInputMethod(2) then
				TriggerServerEvent('salty_crafting:getPlayerInventory')
			end
		end
	end)
end

if Config.Shop.useShop then
	local inDrawingRange = false
	local function isPlayerInRange(coords1, coords2, range)	
		return (Vdist2(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z) < range)
	end
	
	--[[Citizen.CreateThread(function()
		local blip = AddBlipForCoord(Config.Shop.shopCoordinates.x, Config.Shop.shopCoordinates.y, Config.Shop.shopCoordinates.z)
		SetBlipSprite (blip, Config.Shop.shopBlipID)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Shop.shopName)
		EndTextCommandSetBlipName(blip)
		
		while true do
			Citizen.Wait(250)
			inDrawingRange = isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates, 100)
		end
	end)
	]]--
		
	Citizen.CreateThread(function()		
		while true do
			Citizen.Wait(0)
			if inDrawingRange then
				DrawMarker(1, Config.Shop.shopCoordinates.x, Config.Shop.shopCoordinates.y, Config.Shop.shopCoordinates.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Shop.zoneSize.x, Config.Shop.zoneSize.y, Config.Shop.zoneSize.z, Config.Shop.zoneColor.r, Config.Shop.zoneColor.g, Config.Shop.zoneColor.b, Config.Shop.zoneColor.a, false, true, 2, false, false, false, false)
				if not display and isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates, Config.Shop.zoneSize.x) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Presiona ~INPUT_CONTEXT~ para craftear un item")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(1, 38) then
						TriggerServerEvent('salty_crafting:getPlayerInventory')
					end
				end
			end
		end
	end)
end


if Config.Shop2.useShop then
	local inDrawingRange = false
	local function isPlayerInRange(coords1, coords2, range)	
		return (Vdist2(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z) < range)
	end
	
	--[[Citizen.CreateThread(function()
		local blip = AddBlipForCoord(Config.Shop.shopCoordinates.x, Config.Shop.shopCoordinates.y, Config.Shop.shopCoordinates.z)
		SetBlipSprite (blip, Config.Shop.shopBlipID)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.Shop.shopName)
		EndTextCommandSetBlipName(blip)
		
		while true do
			Citizen.Wait(250)
			inDrawingRange = isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop.shopCoordinates, 100)
		end
	end)
	]]--
		
	Citizen.CreateThread(function()		
		while true do
			Citizen.Wait(0)
			if inDrawingRange then
				DrawMarker(1, Config.Shop2.shopCoordinates.x, Config.Shop2.shopCoordinates.y, Config.Shop2.shopCoordinates.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Shop2.zoneSize.x, Config.Shop2.zoneSize.y, Config.Shop2.zoneSize.z, Config.Shop2.zoneColor.r, Config2.Shop.zoneColor.g, Config2.Shop.zoneColor.b, Config.Shop2.zoneColor.a, false, true, 2, false, false, false, false)
				if not display and isPlayerInRange(GetEntityCoords(PlayerPedId()), Config.Shop2.shopCoordinates, Config.Shop2.zoneSize.x) then
					SetTextComponentFormat('STRING')
					AddTextComponentString("Presiona ~INPUT_CONTEXT~ para craftear un item")
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustReleased(1, 38) then
						TriggerServerEvent('salty_crafting:getPlayerInventory')
					end
				end
			end
		end
	end)
end