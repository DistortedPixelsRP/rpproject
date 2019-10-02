ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

RegisterNetEvent('rpproject:setOnDutyJob')
AddEventHandler('rpproject:setOnDutyJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)

    if job == "ambulance" then
        local steam64 = tonumber(xPlayer.identifier:gsub("steam:", ""), 16) 
        local data = "steamid="..steam64

        local headers = {
            ["Content-Type"] = "application/x-www-form-urlencoded"
        }

        PerformHttpRequest("http://smi.arkeo.cl/api/reporte_control/inicio", function(err, text, headers)
            print(err)
        end, "POST", data, headers)
    end

    xPlayer.setJob(job, xPlayer.getJob().grade)
end)

RegisterNetEvent('rpproject:setOffDutyJob')
AddEventHandler('rpproject:setOffDutyJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if job == "ambulance_off" then
        local steam64 = tonumber(xPlayer.identifier:gsub("steam:", ""), 16) 
        local data = "steamid="..steam64

        local headers = {
            ["Content-Type"] = "application/x-www-form-urlencoded"
        }

        PerformHttpRequest("http://smi.arkeo.cl/api/reporte_control/fin", function(err, text, headers)
            print(err)
        end, "POST", data, headers)
    end

    xPlayer.setJob(job, xPlayer.getJob().grade)
end)