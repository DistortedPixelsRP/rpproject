-- Dependencies:
-- https://forum.fivem.net/t/release-fivem-to-discord/62618
-- A command that sends a report to your Discord using @flatracer’s FiveM to Discord resource:
CommandPack("Report Pack", "glitchdetector", {
    -- Add commands here
    -- Report command, sends a message to Discord
    {
        command = "report",
        format = "^*^2[REPORT] ^8(#username# | #id#)^7: #message#",
        help = "Reporta un problema al staff / admin",
        usage = "/report [problema]",
        args = {{name = "problema", help = "tu incomeniente"}},
        hidden = true, -- Prevents the message from being shown in chat
        cb = function(source, message, _, args)

            TriggerClientEvent('chat:addMessage', source, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.8); border-radius: 3px;"><i class="fas fa-exclamation-triangle"></i> {0}:<br> {1}</div>',
                args = {"^1REPORT", " (^2" .. GetPlayerName(source) .. " | " .. source .. "^0) " .. table.concat(args, " ")}
            })
        
            TriggerEvent("es:getPlayers", function(pl)
                for k,v in pairs(pl) do
                    TriggerEvent("es:getPlayerFromId", k, function(user)
                        if(user.getPermissions() > 0 and k ~= source)then
                            TriggerClientEvent('chat:addMessage', k, {
                                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.8); border-radius: 3px;"><i class="fas fa-exclamation-triangle"></i> {0}:<br> {1}</div>',
                                args = {"^1REPORT", " (^2" .. GetPlayerName(source) .." | "..source.."^0) " .. table.concat(args, " ")}
                            })
                        end
                    end)
                end
            end)

            -- Sends a message to discord using the FiveM to Discord resource
            --TriggerEvent('DiscordBot:ToDiscord', 'system', ('%s (%s) reports an issue'):format(GetPlayerName(source), source), message, 'https://wiki.fivem.net/w/images/d/db/FiveM-Wiki.png', true)
        end,
    },
}, {
    -- Default values
})
