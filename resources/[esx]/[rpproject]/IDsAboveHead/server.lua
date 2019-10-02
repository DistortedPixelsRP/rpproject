TriggerEvent('es:addCommand', 'verid', function(source, args)
	if not args then 
		TriggerClientEvent('chatMessage', source, "[SYNTAX]", {255, 0, 0}, "/verid [on/off]") 
	else
	local a = tostring(args[1])
		if a == "off" then
			TriggerClientEvent('IDsAboveHead:toggle', source,false)
		elseif a == "on" then
			TriggerClientEvent('IDsAboveHead:toggle', source,true)
		else
			TriggerClientEvent('chatMessage', source, "[SYNTAX]", {255, 0, 0}, "/verid [on/off]") 
		end
	end
end, {help = "Ver los ids on and off"})
