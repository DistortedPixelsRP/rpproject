
ESX = nil

vipslist       = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function loadVips(cb)
    vipslist       = {}

	MySQL.Async.fetchAll('SELECT v.identifier, v.id_grado, v.packfundador, vg.* FROM vips as v INNER JOIN vips_grados as vg ON v.id_grado = vg.id', {}, function (datos)
        for i=1, #datos, 1 do

            vipslist[datos[i].identifier] = {
                id_grado = datos[i].id_grado,
                nombre_pack = datos[i].nombre,
                paycheck = datos[i].paycheck,
                packfundador = datos[i].packfundador
            }
		end

		if cb ~= nil then
			cb()
		end
	end)
end

MySQL.ready(function()
	loadVips()
end)


ESX.RegisterServerCallback('rpproject_vip:getData', function(source, cb)
    local identifier = GetPlayerIdentifiers(source)[1]
    cb(vipslist[identifier])
end)

RegisterServerEvent("rpproject_vip:getData")
AddEventHandler('rpproject_vip:getData', function(source, cb)
    local identifier = GetPlayerIdentifiers(source)[1]
    cb(vipslist[identifier])
end)

TriggerEvent('es:addGroupCommand', 'vipsrefresh', 'admin', function (source, args, user)
    
    loadVips(function()
        TriggerClientEvent('chat:addMessage', source, { args = { "VIPS", "Vips recargados" } })
	end)
end, function (source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficienct permissions!' } })
end, { help = "recargar la lista de vips" })

-- Start paycheck vips
--rpproject_StartPayCheck()

-- Give car command
TriggerEvent('es:addGroupCommand', 'vipgivecar', 'admin', function(source, args, user)
    local vehicleModel = args[2]

    TriggerClientEvent('rpproject:vip:giveCar', args[1], args[2])
end, 
function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, 
{
    help = 'Vender vehículo a VIP',
    params = {
        {name = "id", help = 'Id del jugador'},
        {name = "model", help = 'Vehículo'},
    }
}
)