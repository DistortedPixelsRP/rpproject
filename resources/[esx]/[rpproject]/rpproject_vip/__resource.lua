resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'RPProject Vips'

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/es.lua',
    'config.lua',
    --'server/paycheck.lua',
    'server/main.lua',

}

client_scripts {
    'client/main.lua'
}

dependencies {
	'esx_vehicleshop'
}