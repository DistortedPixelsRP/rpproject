resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Restaurante'

version '1.5.0'

dependency 'bob74_ipl'

client_scripts {
  --JOB-- 
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/de.lua',
  'config.lua',
  'client/main.lua',
  'client/teleport.lua',
  "@NativeUILua-Reloaded/Wrapper/Utility.lua",

  "@NativeUILua-Reloaded/UIElements/UIVisual.lua",
  "@NativeUILua-Reloaded/UIElements/UIResRectangle.lua",
  "@NativeUILua-Reloaded/UIElements/UIResText.lua",
  "@NativeUILua-Reloaded/UIElements/Sprite.lua",
  "@NativeUILua-Reloaded/UIProgressBar/UIProgressBarPool.lua",
  "@NativeUILua-Reloaded/UIProgressBar/items/UIProgressBarItem.lua",
  --------------------------
  --Extras--
  ---------------------------
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/de.lua',
  'config.lua',
  'config.lua',
  'server/main.lua'
}
dependencies {
  'es_extended',
  'bob74_ipl',
  'esx_billing',
  'esx_status',
  'esx_basicneeds'
}