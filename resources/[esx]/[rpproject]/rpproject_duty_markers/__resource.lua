resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description 'RP Project Duty Markers'

version '0.0.1'

dependency 'vdk_call'

client_scripts {
	'config.lua',
	'client/client.lua'
}

server_script {
	'server/server.lua'
}