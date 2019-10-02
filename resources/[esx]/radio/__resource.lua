resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_01_CLSS_ROCK" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_02_POP" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_04_PUNK" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_05_TALK_01" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_06_COUNTRY" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_07_DANCE_01" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_08_MEXICAN" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_09_HIPHOP_OLD" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_11_TALK_02" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_12_REGGAE" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_13_JAZZ" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_14_DANCE_02" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_15_MOTOWN" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_16_SILVERLAKE" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_17_FUNK" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }
supersede_radio "RADIO_18_90S_ROCK" { url = "http://centova.arkeo.cl:8062/;", volume = 0.2, name = "Project FM" }


files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}
