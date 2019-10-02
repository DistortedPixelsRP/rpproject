ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('lirianer_document_shops:giveDocument')
AddEventHandler('lirianer_document_shops:giveDocument', function(player, document)
   local xPlayer = ESX.GetPlayerFromId(player)
   local xSource = ESX.GetPlayerFromId(source)
   local configDocument = GetConfigDocumentFromValue(document)
   local sourceItem = nil
   local sourceMessage = nil
   local playerMessage = nil
   local waitForCallback, callbackCompleted = false, false

   if configDocument.item then 
     sourceItem = xPlayer.getInventoryItem(configDocument.item)
     if (sourceItem.count + 1) <= sourceItem.limit then
         xPlayer.addInventoryItem(sourceItem.name, 1)
         playerMessage = 'Has recibido ' .. configDocument.label
         sourceMessage = 'Has entregado ' .. configDocument.label
     else
         sourceMessage = 'La persona ya tiene ' .. configDocument.label
     end
   end

   if configDocument.license then
      waitForCallback = true
      TriggerEvent('esx_license:checkLicense', player, configDocument.license, function(hasLicense)
         if not hasLicense then
            TriggerEvent('esx_license:addLicense', player, configDocument.license, function()
               if not configDocument.item or (sourceItem and sourceItem.count == 1) then
                  if sourceMessage then
                     sourceMessage = sourceMessage .. ' y has otorgado la licencia'
                  else
                     sourceMessage = 'Le has dado la licencia a la persona'
                  end
               end
               callbackCompleted = true
            end)
         else
            callbackCompleted = true
         end
      end)
   end

   while waitForCallback and not callbackCompleted do
      Wait(10)
   end

   if sourceMessage ~= nil then
      TriggerClientEvent('esx:showNotification', xSource.source, sourceMessage)
   end

   if playerMessage  ~= nil then
      TriggerClientEvent('esx:showNotification', xPlayer.source, playerMessage)
   end
end)

function GetConfigDocumentFromValue(value)
   for k, v in pairs(Config.Documents) do
      for j=1,#v do
         if v[j].value == value then
            return v[j]
         end
      end
   end
end