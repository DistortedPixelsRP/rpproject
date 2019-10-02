CommandPack("Roleplay Toolkit", "glitchdetector", {
    -- Add commands here
    -- Global Out of Character chat
    --[[{
        command = "ooc",
        format = "^*OOC | #username#: #message#",
        help = "Global out of character chat",
        color = {128, 128, 128},
        usage = "/ooc [message]",
        args = {{name = "message", help = "An out of character message"}},
    },
    -- Global in-character tweet
    {
        command = "tweet",
        --format = "^*^5[#char# @#username#] ^r^7#message#",
        format = "^*^0[^4Twitter^0] (^5@#char#^0) ^r^7#message#",
       
        help = "Twitter message",
        usage = "/tweet [message]",
        args = {{name = "message", help = "Tweet message"}},
    },
    --]]
    {
        command = "ooc",
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
        title = "#username# (#id#)",
        format = "#message#",
        help = "Global out of character chat",
        color = {128, 128, 128},
        usage = "/ooc [message]",
        args = {{name = "message", help = "An out of character message"}},
    },
    -- Local Out of Character chat
    {
        command = "looc",
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(14, 178, 0, 0.3); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
        title = "Local OOC | #username# (#id#)",
        format = "#message#",
        help = "Local out of character chat",
        usage = "/looc [message]",
        args = {{name = "message", help = "An out of character message"}},
        range = 50.0,
    },
    -- A /me command with range and help information
    {
        command = "me",
        format = "^*^6*#name# #message#",
        help = "action tercera persona",
        usage = "/me [accion]",
        args = {{name = "action", help = "Comando para acciones de tu personaje en tercera persona."}},
        range = 50.0,
        cb = function(source, _, _, args)
            local message = "*"..table.concat(args, " ")
            TriggerClientEvent("chat_commands:showFloatingText", -1, source, message)
        end,
    },
    {
        command = "do",
        format = "^3*[^0#name#^3] ^3#message#",
        help = "Aclaraciones de rol",
        usage = "/do [aclaracion]",
        args = {{name = "entorno", help = "Comando para entorno y aclaraciones de rol"}},
        range = 50.0,
        cb = function(source, _, _, args)
            local message = "*"..table.concat(args, " ").."*"
            TriggerClientEvent("chat_commands:showFloatingText", -1, source, message)
        end,
    },
    {
        command = "job",
        format = "#name#: #message#",
        help = "Mensajes de trabajo",
        usage = "/job [mensaje]",
        args = {{name = "entorno", help = "Comando para entorno y aclaraciones de rol"}},
        hidden = true, -- Prevents the message from being shown in chat
        cb = function(source, message, _, args)
            local xPlayer = ESX.GetPlayerFromId(source)
            local job = xPlayer.job.label
            TriggerClientEvent("chat:addMessage", -1, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 250, 0, 0.3); border-radius: 3px;"><i class="fas fa-user-tie"></i> {0} | {1}</div>',
                args = { job:sub(1,1):upper()..job:sub(2), message },
            })
            
        end,
    },
}, {
    -- Default values, if one is not specified for the command
}, {
    -- Aliases
    {"twt", "tweet"},
    {"b", "looc"}
})
