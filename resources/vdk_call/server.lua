RegisterServerEvent("player:serviceOn")
RegisterServerEvent("player:serviceOff")
RegisterServerEvent("call:makeCall")
RegisterServerEvent("call:getCall")

local inService = {
    ["police"] = {},
    ["pizza"] = {},
    ["journaliste"] = {},
    ["ambulance"] = {},
    ["taxi"] = {},
	["mechanic"] = {},
    ["pilot"] = {},
	["fib"] = {},
	["army"] = {},
	["realestateagent"] = {},
	["reporter"] = {},
	["brinks"] = {},
    ["state"] = {},
    ["bahama"] = {},
    ["banksecurity"] = {},
}
local callActive = {
    ["police"] = {taken = false},
    ["pizza"] = {taken = false},
    ["journaliste"] = {taken = false},
    ["ambulance"] = {taken = false},
    ["taxi"] = {taken = false},
	["mechanic"] = {taken = false},
	["pilot"] = {taken = false},
	["fib"] = {taken = false},
	["army"] = {taken = false},
	["realestateagent"] = {taken = false},
	["reporter"] = {taken = false},
	["brinks"] = {taken = false},
    ["state"] = {taken = false},
    ["bahama"] = {taken = false},
    ["banksecurity"] = {taken = true},
}
local timing = 15000

-- Add the player to the inService table
AddEventHandler("player:serviceOn", function(job)
    if jobHasDuty(job) then
        table.insert(inService[job], source)
    end
end)

-- Remove the player to the inService table
AddEventHandler("player:serviceOff", function(job)
    if job == nil then
        for t,v in pairs(inService) do
            removeService(source, t)
        end
    end

    if jobHasDuty(job) then
        removeService(source, job)
    end
end)

-- Receive call event
AddEventHandler("call:makeCall", function(job, pos, message)
    -- Players can't call simultanously the same service
    --if callActive[job].taken then
     --   TriggerClientEvent("target:call:taken", callActive[job].target, 2)
     --   CancelEvent()
    --end
    -- Save the target of the call
    callActive[job].target = source
    callActive[job].taken = true
    -- Send notif to all players in service
    for _, player in pairs(inService[job]) do
        TriggerClientEvent("call:callIncoming", player, job, pos, message)
    end
    -- Say to the target after 'timing' seconds that nobody will come
    SetTimeout(timing, function()
        if callActive[job].taken then
            TriggerClientEvent("target:call:taken", callActive[job].target, 0)
        end
        callActive[job].taken = false
    end)
end)

AddEventHandler("call:getCall", function(job)
    callActive[job].taken = false
    -- Say to other in service people that the call is taken
    for _, player in pairs(inService[job]) do
        if player ~= source then
            TriggerClientEvent("call:taken", player)
        end
    end
    -- Say to a target that someone come
    if not callActive[job].taken then
        TriggerClientEvent("target:call:taken", callActive[job].target, 1)
    end
end)

function removeService(player, job)

    if jobHasDuty(job) then
        for i,val in pairs(inService[job]) do
            if val == player then
                table.remove(inService[job], i)
                return
            end
        end
    end
end

function jobHasDuty(job)
    for i=1,#Config.DutyJobs do
        if job == Config.DutyJobs[i] then
            return true
        end
    end

    return false
end