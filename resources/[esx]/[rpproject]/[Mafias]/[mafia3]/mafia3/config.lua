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

Config.mafia3Stations = {

	LSPD = {

		Blip = {
			--Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			--vector3(452.6, -992.8, 30.6)
		},

		Armories = {
			vector3(-112.84, 985.9, 235.38)
		},

		Vehicles = {
			{
				Spawner = vector3(-131.01, 1007.44, 235.45),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(-125.22, 1000.88, 235.47), heading = 163.5, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(-131.01, 1007.44, 235.45),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(-125.22, 1000.88, 235.47), heading = 163.5, radius = 6.0 }
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
			vector3(-111.25, 999.87, 235.4)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		--{ weapon = 'WEAPON_KNIFE', price = 5000 },
		--{ weapon = 'WEAPON_PISTOL50', price = 80000 },
		--{ weapon = 'WEAPON_ASSAULTRIFLE', price = 200000 },
		--{ weapon = 'WEAPON_COMPACTRIFLE', price = 160000 },
		--{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 120000 },
	},

	officer = {
		--{ weapon = 'WEAPON_KNIFE', price = 5000 },
		--{ weapon = 'WEAPON_PISTOL50', price = 80000 },
		--{ weapon = 'WEAPON_ASSAULTRIFLE', price = 200000 },
		--{ weapon = 'WEAPON_COMPACTRIFLE', price = 160000 },
		--{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 120000 },
	},

	sergeant = {
		--{ weapon = 'WEAPON_KNIFE', price = 5000 },
		--{ weapon = 'WEAPON_PISTOL50', price = 80000 },
		--{ weapon = 'WEAPON_ASSAULTRIFLE', price = 200000 },
		--{ weapon = 'WEAPON_COMPACTRIFLE', price = 160000 },
		--{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 120000 },
	},

	intendent = {
		--{ weapon = 'WEAPON_KNIFE', price = 5000 },
		--{ weapon = 'WEAPON_PISTOL50', price = 80000 },
		--{ weapon = 'WEAPON_ASSAULTRIFLE', price = 200000 },
		--{ weapon = 'WEAPON_COMPACTRIFLE', price = 160000 },
		--{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 120000 },
	},

	lieutenant = {
		--{ weapon = 'WEAPON_KNIFE', price = 5000 },
		--{ weapon = 'WEAPON_PISTOL50', price = 80000 },
		--{ weapon = 'WEAPON_ASSAULTRIFLE', price = 200000 },
		--{ weapon = 'WEAPON_COMPACTRIFLE', price = 160000 },
		--{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 120000 },
	},

	chef = {
		--{ weapon = 'WEAPON_KNIFE', price = 5000 },
		--{ weapon = 'WEAPON_PISTOL50', price = 80000 },
		--{ weapon = 'WEAPON_ASSAULTRIFLE', price = 200000 },
		--{ weapon = 'WEAPON_COMPACTRIFLE', price = 160000 },
		--{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 120000 },
	},

	boss = {
		--{ weapon = 'WEAPON_KNIFE', price = 5000 },
		--{ weapon = 'WEAPON_PISTOL50', price = 80000 },
		--{ weapon = 'WEAPON_ASSAULTRIFLE', price = 200000 },
		--{ weapon = 'WEAPON_COMPACTRIFLE', price = 160000 },
		--{ weapon = 'WEAPON_BULLPUPSHOTGUN', price = 120000 },
	}
}

Config.AuthorizedVehicles = {
	Shared = {
	
	},
	recruit = {
		
	},
	officer = {
		
	},
	sergeant = {
		
	},
	intendent = {
		
	},
	lieutenant = {
		
	},
	chef = {
		
	},
	boss = {
		
	},
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	chef = {},

	boss = {}
}
