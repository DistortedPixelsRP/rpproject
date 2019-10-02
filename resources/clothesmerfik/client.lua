ESX                     = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('smerfikubrania:koszulka')
AddEventHandler('smerfikubrania:koszulka', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 15, ['torso_2'] = 0,
		['arms'] = 15, ['arms_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)
RegisterNetEvent('smerfikubrania:spodnie')
AddEventHandler('smerfikubrania:spodnie', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		if skin.sex == 0 then
			local clothesSkin = {
				['pants_1'] = 21, ['pants_2'] = 0
				}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		else
			local clothesSkin = {
				['pants_1'] = 15, ['pants_2'] = 0
				}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end
	end)
end)

RegisterNetEvent('smerfikubrania:buty')
AddEventHandler('smerfikubrania:buty', function()
	TriggerEvent('skinchanger:getSkin', function(skin)

		if skin.sex == 0 then
			local clothesSkin = {
				['shoes_1'] = 34, ['shoes_2'] = 0
			}
			
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		else
			local clothesSkin = {
				['shoes_1'] = 35, ['shoes_2'] = 0
			}
			
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end
		
	end)
end)


function OpenActionMenuInteraction(target)

	local elements = {}

	table.insert(elements, {label = ('Colocarse la ropa'), value = 'ubie'})
	table.insert(elements, {label = ('Sacarse la remera'), value = 'tul'})
	table.insert(elements, {label = ('Sacarse el pantalon'), value = 'spo'})
	table.insert(elements, {label = ('Sacarse las Zapatillas'), value = 'but'})
  		ESX.UI.Menu.CloseAll()	


	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu',
		{
			title    = ('Clothes'),
			align    = 'top-left',
			elements = elements
		},
    function(data, menu)

		if data.current.value == 'ubie' then			
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
			ESX.UI.Menu.CloseAll()	
		elseif data.current.value == 'tul' then
			TriggerEvent('smerfikubrania:koszulka')
			ESX.UI.Menu.CloseAll()	
		elseif data.current.value == 'spo' then
			TriggerEvent('smerfikubrania:spodnie')
			ESX.UI.Menu.CloseAll()	
		elseif data.current.value == 'but' then
			TriggerEvent('smerfikubrania:buty')
			ESX.UI.Menu.CloseAll()	
	  end
	end, function(data, menu)
		menu.close()
	end)


end
			
--[[Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustReleased(0, 57) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'action_menu') then
		OpenActionMenuInteraction()
    end
  end
end)]]--