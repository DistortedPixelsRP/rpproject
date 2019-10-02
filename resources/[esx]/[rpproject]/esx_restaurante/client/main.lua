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

local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local Blips                   = {}
local isBarman                = false
local isCooker                = false
local isSecurity              = false
local isDrunk                 = 0
local isInMarker              = false
local isInPublicMarker        = false
local hintIsShowed            = false
local hintToDisplay           = "no hint to display"
local IsHandcuffed            = false
local isEating = false
local HandcuffTimer           = {}
local DragStatus = {}
local IsAnimated              = false 
DragStatus.IsDragged = false

ESX                           = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

-- Create blips
Citizen.CreateThread(function()

  local blipMarker = Config.Blips.Blip
  local blipCoord = AddBlipForCoord(blipMarker.Pos.x, blipMarker.Pos.y, blipMarker.Pos.z)

  SetBlipSprite (blipCoord, blipMarker.Sprite)
  SetBlipDisplay(blipCoord, blipMarker.Display)
  SetBlipScale  (blipCoord, blipMarker.Scale)
  SetBlipColour (blipCoord, blipMarker.Colour)
  SetBlipAsShortRange(blipCoord, true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(_U('map_blip'))
  EndTextCommandSetBlipName(blipCoord)


end)

function IsJobTrue()
    if PlayerData ~= nil then
        local IsJobTrue = false
        if PlayerData.job ~= nil and PlayerData.job.name == 'restaurante' then
            IsJobTrue = true
        end
        return IsJobTrue
    end
end

function IsGradeBoss()
    if PlayerData ~= nil then
        local IsGradeBoss = false
        if PlayerData.job.grade_name == 'boss' then
            IsGradeBoss = true
        end
        return IsGradeBoss
    end
end


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


function cleanPlayer(playerPed)
  ClearPedBloodDamage(playerPed)
  ResetPedVisibleDamage(playerPed)
  ClearPedLastWeaponDamage(playerPed)
  ResetPedMovementClipset(playerPed, 0)
end

function setClipset(playerPed, clip)
  RequestAnimSet(clip)
  while not HasAnimSetLoaded(clip) do
    Citizen.Wait(0)
  end
  SetPedMovementClipset(playerPed, clip, true)
end

function setUniform(job, playerPed)
  TriggerEvent('skinchanger:getSkin', function(skin)

    if skin.sex == 0 then
      if Config.Uniforms[job].male ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
      else
        ESX.ShowNotification(_U('no_outfit'))
      end
      if job ~= 'citizen_wear' and job ~= 'barman_outfit' then
        setClipset(playerPed, "MOVE_M@POSH@")
      end
    else
      if Config.Uniforms[job].female ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
      else
        ESX.ShowNotification(_U('no_outfit'))
      end
      if job ~= 'citizen_wear' and job ~= 'barman_outfit' then
        setClipset(playerPed, "MOVE_F@POSH@")
      end
    end

  end)
end

function OpenCloakroomMenu()

  local playerPed = GetPlayerPed(-1)

  local elements = {
    { label = _U('citizen_wear'),     value = 'citizen_wear'},
    { label = _U('barman_outfit'),    value = 'barman_outfit'},
    { label = _U('cooker_outfit'),  value = 'cooker_outfit'},
    { label = _U('security_outfit'), value = 'security_outfit'},
  }

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'cloakroom',
    {
      title    = _U('cloakroom'),
      align    = 'bottom-right',
      elements = elements,
    },
    function(data, menu)

      isBarman = false
      isCooker = false
      isSecurity = false
      cleanPlayer(playerPed)
      weapon = 'WEAPON_STUNGUN'
      if data.current.value == 'citizen_wear' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
          TriggerEvent('skinchanger:loadSkin', skin)
        TriggerServerEvent('esx_restaurantejob:taser', data.current.value, weapon)
        end)
      end

      if data.current.value == 'barman_outfit' then
        setUniform(data.current.value, playerPed)
        TriggerServerEvent('esx_restaurantejob:taser', data.current.value, weapon)
        isBarman = true
      end
      if data.current.value == 'cooker_outfit' then
        setUniform(data.current.value, playerPed)
        TriggerServerEvent('esx_restaurantejob:taser', data.current.value, weapon)
        isCooker = true
      end
      if data.current.value == 'security_outfit' then
        setUniform(data.current.value, playerPed)
        TriggerServerEvent('esx_restaurantejob:taser', data.current.value, weapon)
        isSecurity = true
      end

    
      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}

    end,
    function(data, menu)
      menu.close()
      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}
    end
  )
end

function OpenVaultMenu()

  if Config.EnableVaultManagement then

    local elements = {
        {label = _U('get_object'), value = 'get_stock'},
      {label = _U('put_object'), value = 'put_stock'}
    }
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault',
      {
        title    = _U('vault'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'get_weapon' then
          OpenGetWeaponMenu()
        end

        if data.current.value == 'put_weapon' then
          OpenPutWeaponMenu()
        end

        if data.current.value == 'put_stock' then
           OpenPutStocksMenu()
        end

        if data.current.value == 'get_stock' then
           OpenGetStocksMenu()
        end

      end,
      
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_vault'
        CurrentActionMsg  = _U('open_vault')
        CurrentActionData = {}
      end
    )

  end

end

function OpenFridgeMenu()

    local elements = {
      {label = _U('get_object'), value = 'get_stock'},
      {label = _U('put_object'), value = 'put_stock'}
    }
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'fridge',
      {
        title    = _U('fridge'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'put_stock' then
           OpenPutFridgeStocksMenu()
        end

        if data.current.value == 'get_stock' then
           OpenGetFridgeStocksMenu()
        end

      end,
      
      function(data, menu)

        menu.close()

        CurrentAction     = 'menu_fridge'
        CurrentActionMsg  = _U('open_fridge')
        CurrentActionData = {}
      end
    )

end



function OpenSocietyActionsMenu()

  local elements = {}

  table.insert(elements, {label = _U('billing'),    value = 'billing'})
  if (isBarman) then
    table.insert(elements, {label = _U('crafting_b'),    value = 'menu_crafting_barman'})
  end
  if (isCooker) then
    table.insert(elements, {label = _U('crafting_c'),    value = 'menu_crafting_cooker'})
  end
  if (isSecurity) then
    table.insert(elements, {label = _U('security_options'),    value = 'menu_security_options'})
  end

  ESX.UI.Menu.CloseAll()
--Nose bien que hace nigthclub_actions
  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'restaurante_actions',
    {
      title    = _U('restaurante_menu'),
      align    = 'bottom-right',
      elements = elements
    },
    function(data, menu)

      if data.current.value == 'billing' then
        OpenBillingMenu()
      end

      if data.current.value == 'menu_crafting_barman' then
        
          ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'menu_crafting_barman',
              {
                  title = _U('crafting_b'),
                  align = 'bottom-right',
                  elements = {
                      {label = _U('jagerbomb'),     value = 'jagerbomb'},
                      {label = _U('golem'),         value = 'golem'},
                      {label = _U('whiskycoca'),    value = 'whiskycoca'},
                      {label = _U('vodkaenergy'),   value = 'vodkaenergy'},
                      {label = _U('vodkafruit'),    value = 'vodkafruit'},
                      {label = _U('rhumfruit'),     value = 'rhumfruit'},
                      {label = _U('rhumcoca'),      value = 'rhumcoca'},
                      {label = _U('mojito'),        value = 'mojito'},                  
                      {label = _U('jagercerbere'),  value = 'jagercerbere'},  
                      {label = _U('metreshooter'),  value = 'metreshooter'},  
                      {label = _U('fernetcoca'),  value = 'fernetcoca'},

                  }
              },
              function(data2, menu2)
            
                  TriggerServerEvent('esx_restaurantejob:craftingCoktails', data2.current.value)

              end,
              function(data2, menu2)
                  menu2.close()
              end
          )
      end
      if data.current.value == 'menu_crafting_cooker' then
        
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'menu_crafting_cooker',
            {
                title = _U('crafting_c'),
                align = 'bottom-right',
                elements = {
                  {label = _U('pizza'),  value = 'pizza'},
                  {label = _U('lasagna'),  value = 'lasagna'},
                }
            },
            function(data2, menu2)
          
                TriggerServerEvent('esx_restaurantejob:craftingFood', data2.current.value)
                TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BBQ', 1, true)
                exports['progressBars']:startUI(25000, "Preparando comida")
                Citizen.Wait(25000)
                ClearPedTasks(GetPlayerPed(-1))

    
            end,
            function(data2, menu2)
                menu2.close()
            end
        )
      end
      

      if data.current.value == 'menu_security_options' then
        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'menu_security_options',
          {
              title = _U('security_options'),
              align = 'bottom-right',
              elements = {
                {label = _U('esposar'),  value = 'handcuff'},
                {label = _U('arrastrar'),  value = 'drag'},
                {label = _U('cachear'),  value = 'getInventory'},
              }
          },  
          function(data2, menu2)
        
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
              local action = data2.current.value
              if action == 'handcuff' then
                TriggerServerEvent('esx_restaurante:handcuff', GetPlayerServerId(closestPlayer))
              end
              if action == 'drag' then
                TriggerServerEvent('esx_restaurante:drag', GetPlayerServerId(closestPlayer))
              end
              if action == 'getInventory' then
                TriggerServerEvent('esx_restaurante:message', GetPlayerServerId(closestPlayer), _U('being_searched'))
                OpenBodySearchMenu(closestPlayer)
              end
            else
              ESX.ShowNotification(_U('no_players_nearby'))
            end
  
          end,
          function(data2, menu2)
              menu2.close()
          end
         )
       end


   
     end,
    function(data, menu)

      menu.close()

    end
  )
end



function OpenBillingMenu()

  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'billing',
    {
      title = _U('billing_amount')
    },
    function(data, menu)
    
      local amount = tonumber(data.value)
      local player, distance = ESX.Game.GetClosestPlayer()

      if player ~= -1 and distance <= 3.0 then

        menu.close()
        if amount == nil or amount < 0 then
            ESX.ShowNotification(_U('amount_invalid'))
        else
            TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_restaurante', _U('billing'), amount)
        end

      else
        ESX.ShowNotification(_U('no_players_nearby'))
      end

    end,
    function(data, menu)
        menu.close()
    end
  )
end

function OpenGetStocksMenu()

  ESX.TriggerServerCallback('esx_restaurantejob:getStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('restaurante_stock'),
		align    = 'bottom-right',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('esx_restaurantejob:getStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutStocksMenu()

ESX.TriggerServerCallback('esx_restaurantejob:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'stocks_menu',
      {
        title    = _U('inventory'),
		align    = 'bottom-right',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenPutStocksMenu()

              TriggerServerEvent('esx_restaurantejob:putStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetFridgeStocksMenu()

  ESX.TriggerServerCallback('esx_restaurantejob:getFridgeStockItems', function(items)

    print(json.encode(items))

    local elements = {}

    for i=1, #items, 1 do
      table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'fridge_menu',
      {
        title    = _U('restaurante_fridge_stock'),
		align    = 'bottom-right',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'fridge_menu_get_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenGetStocksMenu()

              TriggerServerEvent('esx_restaurantejob:getFridgeStockItem', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutFridgeStocksMenu()

ESX.TriggerServerCallback('esx_restaurantejob:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'fridge_menu',
      {
        title    = _U('fridge_inventory'),
		align    = 'bottom-right',
        elements = elements
      },
      function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
          'dialog', GetCurrentResourceName(), 'fridge_menu_put_item_count',
          {
            title = _U('quantity')
          },
          function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
              ESX.ShowNotification(_U('invalid_quantity'))
            else
              menu2.close()
              menu.close()
              OpenPutFridgeStocksMenu()

              TriggerServerEvent('esx_restaurantejob:putFridgeStockItems', itemName, count)
            end

          end,
          function(data2, menu2)
            menu2.close()
          end
        )

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenGetWeaponMenu()

  ESX.TriggerServerCallback('esx_restaurantejob:getVaultWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
      if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
      end
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault_get_weapon',
      {
        title    = _U('get_weapon_menu'),
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('esx_restaurantejob:removeVaultWeapon', function()
          OpenGetWeaponMenu()
        end, data.current.value)

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end

function OpenPutWeaponMenu()

  local elements   = {}
  local playerPed  = GetPlayerPed(-1)
  local weaponList = ESX.GetWeaponList()

  for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
      local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
      table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
    end

  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vault_put_weapon',
    {
      title    = _U('put_weapon_menu'),
      align    = 'bottom-right',
      elements = elements,
    },
    function(data, menu)

      menu.close()

      ESX.TriggerServerCallback('esx_restaurantejob:addVaultWeapon', function()
        OpenPutWeaponMenu()
      end, data.current.value)

    end,
    function(data, menu)
      menu.close()
    end
  )

end

function OpenShopMenu(zone)

    local elements = {}
    for i=1, #Config.Zones[zone].Items, 1 do

        local item = Config.Zones[zone].Items[i]

        table.insert(elements, {
            label     = item.label .. ' - <span style="color:green;">$' .. item.price .. ' </span>',
            realLabel = item.label,
            value     = item.name,
            price     = item.price
        })

    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'restaurante_shop',
        {
            title    = _U('shop'),
			align    = 'bottom-right',
            elements = elements
        },
        function(data, menu)
            TriggerServerEvent('esx_restaurantejob:buyItem', data.current.value, data.current.price, data.current.realLabel)
        end,
        function(data, menu)
            menu.close()
        end
    )

end



RegisterNetEvent('esx_restaurante:sirviendo')
AddEventHandler('esx_restaurante:sirviendo', function(prop_name)
    if not IsAnimated then
      local prop_name = 'p_whiskey_bottle_s'
      IsAnimated = true
      Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(playerPed))
        local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
        local boneIndex = GetPedBoneIndex(playerPed, 57005)
        AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

        ESX.Streaming.RequestAnimDict('mini@drinking', function()
          TaskPlayAnim(playerPed, 'mini@drinking', 'shots_barman_b', 8.0, -8, -1, 49, 0, 0, 0, 0)
          exports['progressBars']:startUI(20000, "Preparando...")
          Citizen.Wait(20000)
          IsAnimated  = false
          ClearPedSecondaryTask(playerPed)
          DeleteObject(prop)
        end)
      end)

    end
end)








RegisterNetEvent('esx_restaurante:comiendo')
AddEventHandler('esx_restaurante:comiendo', function(prop_name)
	if not IsAnimated then
		IsAnimated = true
		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
        exports['progressBars']:startUI(30000, "Comiendo...")
				Citizen.Wait(30000)
				IsAnimated  = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

















RegisterNetEvent('esx_restaurante:tomando')
AddEventHandler('esx_restaurante:tomando', function(source, time, string)
    animsAction({ lib = "mp_player_intdrink", anim = "loop_bottle" })
    exports['progressBars']:startUI(3500, "Tomando trago")
    Citizen.Wait(3500)
end)
function animsAction(animObj)
    Citizen.CreateThread(function()
        if not playAnim then
            local playerPed = GetPlayerPed(-1);
            if DoesEntityExist(playerPed) then -- Check if ped exist
                dataAnim = animObj

                -- Play Animation
                RequestAnimDict(dataAnim.lib)
                while not HasAnimDictLoaded(dataAnim.lib) do
                    Citizen.Wait(0)
                end
                if HasAnimDictLoaded(dataAnim.lib) then
                    local flag = 0
                    if dataAnim.loop ~= nil and dataAnim.loop then
                        flag = 1
                    elseif dataAnim.move ~= nil and dataAnim.move then
                        flag = 49
                    end

                    TaskPlayAnim(playerPed, dataAnim.lib, dataAnim.anim, 8.0, -8.0, -1, flag, 0, 0, 0, 0)
                    playAnimation = true
                end

                -- Wait end animation
                while true do
                    Citizen.Wait(0)
                    if not IsEntityPlayingAnim(playerPed, dataAnim.lib, dataAnim.anim, 3) then
                        playAnim = false
                        TriggerEvent('ft_animation:ClFinish')
                        break
                    end
                end
            end -- end ped exist
        end
    end)
end
function animsAction2(animObj)
    Citizen.CreateThread(function()
        if not playAnim then
            local playerPed = GetPlayerPed(-1);
            if DoesEntityExist(playerPed) then -- Check if ped exist
                dataAnim = animObj

                -- Play Animation
                RequestAnimDict(dataAnim.lib)
                while not HasAnimDictLoaded(dataAnim.lib) do
                    Citizen.Wait(0)
                end
                if HasAnimDictLoaded(dataAnim.lib) then
                    local flag = 0
                    if dataAnim.loop ~= nil and dataAnim.loop then
                        flag = 1
                    elseif dataAnim.move ~= nil and dataAnim.move then
                        flag = 49
                    end

                    TaskPlayAnim(playerPed, dataAnim.lib, dataAnim.anim, 8.0, -8.0, -1, flag, 0, 0, 0, 0)
                    playAnimation = true
                end

                -- Wait end animation
                while true do
                    Citizen.Wait(0)
                    if not IsEntityPlayingAnim(playerPed, dataAnim.lib, dataAnim.anim, 3) then
                        playAnim = false
                        --TriggerEvent('ft_animation:ClFinish')
                        break
                    end
                end
            end -- end ped exist
        end
    end)
end


AddEventHandler('esx_restaurantejob:hasEnteredMarker', function(zone)
 
    if zone == 'BossActions' and IsGradeBoss() then
      CurrentAction     = 'menu_boss_actions'
      CurrentActionMsg  = _U('open_bossmenu')
      CurrentActionData = {}
    end

    if zone == 'Cloakrooms' then
      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}
    end

    if Config.EnableVaultManagement then
      if zone == 'Vaults' then
        CurrentAction     = 'menu_vault'
        CurrentActionMsg  = _U('open_vault')
        CurrentActionData = {}
      end
    end

    if zone == 'Fridge' then
      CurrentAction     = 'menu_fridge'
      CurrentActionMsg  = _U('open_fridge')
      CurrentActionData = {}
    end

    if zone == 'Bebidas' or zone == 'Ice' then
      CurrentAction     = 'menu_shop'
      CurrentActionMsg  = _U('shop_menu')
      CurrentActionData = {zone = zone}
    end

end)

AddEventHandler('esx_restaurantejob:hasExitedMarker', function(zone)

    CurrentAction = nil
    ESX.UI.Menu.CloseAll()

end)
RegisterNetEvent('esx_restaurante:drunk')
AddEventHandler('esx_restaurante:drunk', function(source)
    isDrunk=isDrunk+1
    if isDrunk==1 then
        TriggerClientEvent('esx:showNotification', source, _U('used_trago_1'))
        SetPedMovementClipset(GetPlayerPed(-1), "move_m@drunk@slightlydrunk", 0.5)
        ShakeGameplayCam("DRUNK_SHAKE", 0.25)
    end
    if isDrunk==2 then
        if not HasAnimSetLoaded("move_m@drunk@slightlydrunk") then
            RequestAnimSet("move_m@drunk@slightlydrunk")
            while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
                Citizen.Wait(0)
            end
        end


        SetPedIsDrunk(GetPlayerPed(-1), true)
        ShakeGameplayCam("DRUNK_SHAKE", 0.5)
        SetPedConfigFlag(GetPlayerPed(-1), 100, true)
        SetPedMovementClipset(GetPlayerPed(-1), "move_m@drunk@slightlydrunk", 1.0)

    end
    if isDrunk==3 then
        ShakeGameplayCam("DRUNK_SHAKE", 0.60)
        SetPedMovementClipset(GetPlayerPed(-1), "move_m@drunk@slightlydrunk", 1.3)
    end
    if isDrunk==4 then
        ShakeGameplayCam("DRUNK_SHAKE", 0.75)
        SetPedMotionBlur(GetPlayerPed(-1), true)
        SetPedMovementClipset(GetPlayerPed(-1), "move_m@drunk@slightlydrunk", 1.6)
    end
    if isDrunk==5 then
        if not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") then
            RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
            while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
                Citizen.Wait(0)
            end
        end


        SetPedIsDrunk(GetPlayerPed(-1), true)
        ShakeGameplayCam("DRUNK_SHAKE", 1.0)
        SetPedConfigFlag(GetPlayerPed(-1), 100, true)
        SetPedMotionBlur(GetPlayerPed(-1), true)
        SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", 1.0)

    end
    if isDrunk>5 then
        SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", 1.5)
    end

end)
RegisterNetEvent('esx_restaurante:undrunk')
AddEventHandler('esx_restaurante:undrunk', function(source)

    if isDrunk>=2 then
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
    StopGameplayCamShaking(false)


    end
    isDrunk=0
    end)

-- Display markers
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(10)
        if IsJobTrue() then

            local coords = GetEntityCoords(GetPlayerPed(-1))

            for k,v in pairs(Config.Zones) do
                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
                    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
                end
            end

        end

    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(10)
        if IsJobTrue() then

            local coords      = GetEntityCoords(GetPlayerPed(-1))
            local isInMarker  = false
            local currentZone = nil

            for k,v in pairs(Config.Zones) do
                if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
                    isInMarker  = true
                    currentZone = k
                end
            end

            if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
                HasAlreadyEnteredMarker = true
                LastZone                = currentZone
                TriggerEvent('esx_restaurantejob:hasEnteredMarker', currentZone)
            end

            if not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent('esx_restaurantejob:hasExitedMarker', LastZone)
            end

        end

    end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(10)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlJustReleased(0,  Keys['E']) and IsJobTrue() then

        if CurrentAction == 'menu_cloakroom' then
            OpenCloakroomMenu()
        end

        if CurrentAction == 'menu_vault' then
            OpenVaultMenu()
        end

        if CurrentAction == 'menu_fridge' then
            OpenFridgeMenu()
        end

        if CurrentAction == 'menu_shop' then
            OpenShopMenu(CurrentActionData.zone)
        end
        
        if CurrentAction == 'menu_boss_actions' and IsGradeBoss() then

          local options = {
            wash      = Config.EnableMoneyWash,
          }

          ESX.UI.Menu.CloseAll()

          TriggerEvent('esx_society:openBossMenu', 'restaurante', function(data, menu)

            menu.close()
            CurrentAction     = 'menu_boss_actions'
            CurrentActionMsg  = _U('open_bossmenu')
            CurrentActionData = {}

          end,options)

        end

        
        CurrentAction = nil

      end

    end


    if IsControlJustReleased(0,  Keys['F6']) and IsJobTrue() and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'restaurante_actions') then
        OpenSocietyActionsMenu()
    end


  end
end)


RegisterNetEvent('esx_restaurante:handcuff')
AddEventHandler('esx_restaurante:handcuff', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end

			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)
			FreezeEntityPosition(playerPed, true)
			DisplayRadar(false)

			if Config.EnableHandcuffTimer then

				if HandcuffTimer.Active then
					ESX.ClearTimeout(HandcuffTimer.Task)
				end

				StartHandcuffTimer()
			end

		else

			if Config.EnableHandcuffTimer and HandcuffTimer.Active then
				ESX.ClearTimeout(HandcuffTimer.Task)
			end

			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			FreezeEntityPosition(playerPed, false)
			DisplayRadar(true)
		end
	end)

end)


-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and HandcuffTimer.Active then
		ESX.ClearTimeout(HandcuffTimer.Task)
	end

	HandcuffTimer.Active = true

	HandcuffTimer.Task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('esx_restaurante:unrestrain')
		HandcuffTimer.Active = false
	end)
end


RegisterNetEvent('esx_restaurante:unrestrain')
AddEventHandler('esx_restaurante:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and HandcuffTimer.Active then
			ESX.ClearTimeout(HandcuffTimer.Task)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
    TriggerEvent('esx_restaurante:unrestrain')
    
		if Config.EnableHandcuffTimer and HandcuffTimer.Active then
			ESX.ClearTimeout(HandcuffTimer.Task)
		end
	end
end)


RegisterNetEvent('esx_restaurante:drag')
AddEventHandler('esx_restaurante:drag', function(copID)
	if not IsHandcuffed then
		return
	end

	DragStatus.IsDragged = not DragStatus.IsDragged
	DragStatus.CopId     = tonumber(copID)


  Citizen.CreateThread(function()
    local playerPed
    local targetPed

    while true do
      Citizen.Wait(1)

      if IsHandcuffed then
        playerPed = PlayerPedId()

        if DragStatus.IsDragged then
          targetPed = GetPlayerPed(GetPlayerFromServerId(DragStatus.CopId))

          -- undrag if target is in an vehicle
          if not IsPedSittingInAnyVehicle(targetPed) then
            AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
          else
            DragStatus.IsDragged = false
            DetachEntity(playerPed, true, false)
          end

          if IsPedDeadOrDying(targetPed, true) then
            DragStatus.IsDragged = false
            DetachEntity(playerPed, true, false)
          end

        else
          DetachEntity(playerPed, true, false)
        end
      else
        Citizen.Wait(500)
      end
    end
  end)
end)


function OpenBodySearchMenu(player)

	ESX.TriggerServerCallback('esx_restaurante:getOtherPlayerData', function(data)

		local elements = {}

		for i=1, #data.accounts, 1 do

			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then

				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Math.Round(data.black_money)),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.black_money
				})

				break
			end

		end

		table.insert(elements, {label = _U('guns_label'), value = nil})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label'), value = nil})

    for i=1, #data.inventory, 1 do
      Citizen.Trace (data.inventory[i].name)
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search',
		{
			title    = _U('search'),
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)

			local itemType = data.current.itemType
			local itemName = data.current.value
			local amount   = data.current.amount

			if data.current.value ~= nil then
				TriggerServerEvent('esx_restaurante:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
				OpenBodySearchMenu(player)
			end

		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))

end

