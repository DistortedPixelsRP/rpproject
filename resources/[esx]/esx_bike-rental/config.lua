Config                            = {}
Config.Locale                     = 'en'

--- #### BASICS
Config.EnablePrice = true -- false = bikes for free
Config.EnableEffects = true
Config.EnableBlips = true


--- #### PRICES	
Config.PriceTriBike = 120
Config.PriceScorcher = 150
Config.PriceCruiser = 200
Config.PriceBmx = 190


--- #### MARKER EDITS
Config.TypeMarker = 27
Config.MarkerScale = {{x = 2.000,y = 2.000,z = 0.500}}
Config.MarkerColor = {{r = 0,g = 255,b = 255}}
	
Config.MarkerZones = { 

    {x = -1013.09,y = -2696.63,z = 12.99},

}


-- Edit blip titles
Config.BlipZones = { 

   {title="Alquiler de bicis", colour=2, id=376, x = -1013.09,y = -2696.63,z = 12.99},
}
