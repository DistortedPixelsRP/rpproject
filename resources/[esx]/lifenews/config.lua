Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'es'

Config.lifenewsStations = {

	LSPD = {

		Blip = {
			--Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			--vector3(-1041.81, -234.27, 37.8)
		},

		Armories = {
			vector3(-1041.81, -234.27, 37.8)
		},

		Vehicles = {
			{
				Spawner = vector3(-1098.78, -256.58, 37.0),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(-1100.42, -262.39, 37.06), heading = 198.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(-1098.78, -256.58, 37.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(-1100.42, -262.39, 37.06), heading = 198.0, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				--Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(-1054.14, -230.65, 43.8)
		}

	}

}

Config.AuthorizedVehicles = {
	Shared = {
	
	},
	recruit = {
		
	},
	officer = {
		{ model = 'rumpo', label = 'Mercedez Sprinter', price = 1 }
	},
	sergeant = {
		{ model = 'rumpo', label = 'Mercedez Sprinter', price = 1 }
	},
	intendent = {
		
	},
	lieutenant = {
		{ model = 'serv_vwpolo', label = 'VW Polo', price = 1 },
		{ model = 'rumpo', label = 'Mercedez Sprinter', price = 1 }
	},
	chef = {
		
	},
	boss = {
		{ model = 'serv_vwpolo', label = 'VW Polo', price = 1 },
		{ model = 'rumpo', label = 'Mercedez Sprinter', price = 1 }
	},
}
