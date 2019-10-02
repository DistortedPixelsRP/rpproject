resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Tag Admin'

version '1.1.0'

server_scripts {
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}
client_scripts {
	'config.lua',
	'client.lua'
}

dependency 'es_extended'