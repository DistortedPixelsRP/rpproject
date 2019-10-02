Config                        = {}
Config.DrawDistance           = 100.0
Config.Locale                 = 'en'

local seconde = 1000
local minute = 60 * seconde

Config.Fridge = {
	harina = 500,
	picada = 500,
	chorizo = 500,
	pan = 500,
	pollo = 500,
	chile = 500,
	vegetales = 500,
} -- maxquantity

Config.Recipes = {
	tacos = {
		Ingredients = {
			pollo			    	= { "Pollo"		, 1 },
			harina					= { "Harina"	, 1 },
			vegetales 				= { "Vegetales"	, 2 }
		},
		Price = 100,
		CookingTime = 30 * seconde,
		Item = 'tacos',
		Name = 'Tacos'
	},
	hamburguesa = {
		Ingredients = {
			pan 				= { "Pan"		, 2 },
			picada 				= { "Carne picada"	, 1 },
		},
		Price = 100,
		CookingTime = 15 * seconde,
		Item = 'hamburguesa',
		Name = 'Hamburguesa'
	},
	choripan = {
		Ingredients = {
			pan 					= { "Pan"		, 2 },
			chorizo 				= { "Chorizo"	, 1 },
		},
		Price = 100,
		CookingTime = 15 * seconde,
		Item = 'choripan',
		Name = 'Choripan'
	},
	tamal = {
		Ingredients = {
			vegetales 					= { "Vegetales"		, 2 },
			picada 				= { "Carne picada"	, 1 },
			harina 				= { "Harina"	, 1 },
			chile 				= { "Chile"	, 1 },
		},
		Price = 100,
		CookingTime = 15 * seconde,
		Item = 'tamal',
		Name = 'Tamal'
	},
	fajita = {
		Ingredients = {
			picada 					= { "Carne picada"		, 2 },
			vegetales 				= { "Vegetales"	, 1 },
			harina 					= { "Harina"	, 1 },
		},
		Price = 100,
		CookingTime = 15 * seconde,
		Item = 'fajita',
		Name = 'fajita'
	}
}

Config.Zones = {
	Actions = {
		Pos   = {x = 189.525, y = -1445.308, z = 28.1416},
		Size  = {x = 1.5, y = 1.5, z = 0.4},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	VehicleSpawnPoint = {
		Pos   = {x = 193.417, y = -1456.56, z = 28.1416},
		Size  = {x = 3.0, y = 3.0, z = 0.4},
		Type  = -1
	},
	VehicleDeleter = {
		Pos   = {x = 185.189, y = -1439.23, z = 28.1602},
		Size  = {x = 3.0, y = 3.0, z = 0.4},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1
	},
}

Config.Market = {
	Pos   = {x = -2511.07, y = 3615.16, z = 12.6714},
	Size  = {x = 1.5, y = 1.5, z = 0.4},
	Color = {r = 0, g = 255, b = 0},
	Type  = 1
}
