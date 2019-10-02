Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 1000 * 10
}

Config.DrugDealerItems = {
	marijuana = 200
}

Config.LicenseEnable = true -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 70000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	WeedField = {coords = vector3(1060.32, 4259.26, 36.79), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0},
	WeedProcessing = {coords = vector3(-575.62, -1624.5, 33.01), name = _U('blip_weedprocessing'), color = 49, sprite = 378, radius = 25.0},
	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 25.0},
}