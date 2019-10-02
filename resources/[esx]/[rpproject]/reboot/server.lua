local text1 = "Reinicio automatico en 15 minutos ! A 10h/22h"
local text2 = "Reinicio automatico en 10 minutos ! A 10h/22h"
local text3 = "Reinicio automatico en 5 minutos  ! A 10h/22h"
local text4 = "EL REINICIO SE ESTA POR REALIZAR!!"

RegisterServerEvent("restart:checkreboot")

AddEventHandler('restart:checkreboot', function()
	date_local1 = os.date('%H:%M:%S', os.time())
	local date_local = date_local1

	if date_local == '9:46:00' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text1)
	elseif date_local == '9:51:00' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text2)
	elseif date_local == '9:56:00' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text3)
	elseif date_local == '9:59:10' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '9:59:20' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '9:59:30' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '9:59:40' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '9:59:50' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '10:00:00' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)

	elseif date_local == '21:46:00' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text1)
	elseif date_local == '21:51:00' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text2)
	elseif date_local == '21:56:00' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text3)
	elseif date_local == '21:59:10' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '21:59:20' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '21:59:30' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '21:59:40' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '21:59:50' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	elseif date_local == '22:00:00' then
		TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, text4)
	end

end)

function restart_server()
	SetTimeout(1000, function()
		TriggerEvent('restart:checkreboot')
		restart_server()
	end)
end
restart_server()
