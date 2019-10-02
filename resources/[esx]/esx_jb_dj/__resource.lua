resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'esx_jb_dj made by jager bom'

dependency 'ft_libs'

client_script 'esx_jb_dj_cl.lua'
client_script 'config.lua'
server_script 'esx_jb_dj_sv.lua'

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/app.js',
	'html/songs/clasicosvilla.mp3',
	'html/songs/djalex.mp3',
	'html/songs/enganchadaodjeze.mp3',
	'html/songs/enganchadocuarteto.mp3',
	'html/songs/fiestero.mp3',
	'html/songs/reggeatonviejo.mp3',
	'html/songs/t-rex-roar.mp3'
}