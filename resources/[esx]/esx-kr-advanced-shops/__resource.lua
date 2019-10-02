resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page('html/index.html') 

files({
  'html/index.html',
  'html/script.js',
  'html/style.css',
	'html/img/burger.png',
	'html/img/bottle.png',
  'html/font/vibes.ttf',
  'html/img/box.png',
  'html/img/carticon.png',

  'html/img/te_frio.png',
  'html/img/taco.png',
  'html/img/rosa.png',
  'html/img/redgul.png',
  'html/img/milk.png',

  'html/img/mascaraoxigen.png',
  'html/img/donut.png',
  'html/img/cupcake.png',
  'html/img/coffe.png',
  'html/img/cocacola.png',
  'html/img/chocolate.png',
  'html/img/chips.png',
  'html/img/carnada.png',

})


client_scripts {
  'config.lua',
  'client/main.lua',
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',	
  'locales/sv.lua',
}

server_scripts {
  'config.lua',
  'server/main.lua',
  '@mysql-async/lib/MySQL.lua'
}
