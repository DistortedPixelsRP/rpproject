ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx-qalle-hunting:reward')
AddEventHandler('esx-qalle-hunting:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 then
        xPlayer.addInventoryItem('meat', 3)
    elseif Weight >= 9 then
        xPlayer.addInventoryItem('meat', 6)
    elseif Weight >= 15 then
        xPlayer.addInventoryItem('meat', 9)
    end

    xPlayer.addInventoryItem('leather', math.random(2, 5))
        
end)

RegisterServerEvent('esx-qalle-hunting:sell')
AddEventHandler('esx-qalle-hunting:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local MeatPrice = 100
    local LeatherPrice = 50

    local MeatQuantity = xPlayer.getInventoryItem('meat').count
    local LeatherQuantity = xPlayer.getInventoryItem('leather').count

    if MeatQuantity > 0 or LeatherQuantity > 0 then
        xPlayer.addMoney(MeatQuantity * MeatPrice)
        xPlayer.addMoney(LeatherQuantity * LeatherPrice)

        xPlayer.removeInventoryItem('meat', MeatQuantity)
        xPlayer.removeInventoryItem('leather', LeatherQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vendiste ' .. LeatherQuantity + MeatQuantity .. ' y ganó $' .. LeatherPrice * LeatherQuantity + MeatPrice * MeatQuantity)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'No tienes carne ni cuero')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end
