resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'RPProject Control'

version '1.1.0'

server_scripts {}

client_scripts{ 
  "lib/enum.lua",
  "cfg/npcs.lua",
  "client/main.lua"
}

dependencies {
	'es_extended'
}