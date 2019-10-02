-- A simple DM / SMS system with a reply feature.
-- Save previous messager for reply command
local PreviousMessager = {}
CommandPack("Direct Messaging", "glitchdetector", {
    -- Add commands here
    -- An SMS command
    {
        command = "pm",
        format = "#message#",
        help = "enviar un PM a un player",
        usage = "/pm [player] [message]",
        args = {{name = "player", help = "ID of receiving player"}, {name = "message", help = "The PM contents"}},
        cb = function(source, message, _, args)
            local receiver = tonumber(args[1])

            local xPlayer = ESX.GetPlayerFromId(source)
            local xPermission = xPlayer.getPermissions()

            if xPermission > 0 then
                if receiver and GetPlayerName(receiver) then
                    PreviousMessager[receiver] = source
                    message = message:sub(#args[1]+1)
                    TriggerClientEvent("chat:addMessage", source, {
                        args = {(("^*^5(PM a %s (%s)): ^r^7%s"):format(GetPlayerName(receiver), receiver, message))},
                    })
                    TriggerClientEvent("chat:addMessage", receiver, {
                        args = {(("^*^5(PM de %s (%s)): ^r^7%s"):format(GetPlayerName(source), source, message))},
                    })
                else
                    -- Malformed ID
                    TriggerClientEvent("chat:addMessage", source, {
                        args = {"This player does not exist"},
                    })
                end
            end
        end,
    },
    -- Reply command
    {
        command = "reply",
        format = "#message#",
        help = "Responder ultimo PM",
        usage = "/reply [message]",
        args = {{name = "message", help = "The PM contents"}},
        cb = function(source, message, _, args)
            local receiver = PreviousMessager[source]
            if receiver and GetPlayerName(receiver) then
                PreviousMessager[receiver] = source
                TriggerClientEvent("chat:addMessage", source, {
                    args = {(("^*^5(PM a %s (%s)): ^r^7%s"):format(GetPlayerName(receiver), receiver, message))},
                })
                TriggerClientEvent("chat:addMessage", receiver, {
                    args = {(("^*^5(PM de %s (%s)): ^r^7%s"):format(GetPlayerName(source), source, message))},
                })
            else
                -- No previous conversation
                TriggerClientEvent("chat:addMessage", source, {
                    args = {"This player does not exist"},
                })
            end
        end,
    },
}, {
    -- Default values, if one is not specified for the command
    hidden = true,
}, {
    -- Aliases
    {"p", "pm"},
    {"r", "reply"},
})
