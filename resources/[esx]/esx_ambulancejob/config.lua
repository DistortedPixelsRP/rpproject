Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }

Config.ReviveReward               = 1500  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'es'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 2 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 10 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 50000

Config.RespawnPoint = { coords = vector3(279.64, -585.55, 42.31), heading = 69.76 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(291.29, -587.4, 43.2),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(323.54, -582.24, 42.33)
		},

		Pharmacies = {
			vector3(309.63, -602.71, 42.29)
		},

		Vehicles = {
			{
				Spawner = vector3(327.39, -558.14, 28.74),
				InsideShop = vector3(317.23, -542.21, 27.74),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(326.45, -547.06, 28.74), heading = 264.19, radius = 4.0 },
					{ coords = vector3(326.06, -542.42, 28.74), heading = 264.19, radius = 4.0 },
					{ coords = vector3(314.73, -548.61, 28.74), heading = 266.53, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(343.18, -580.51, 74.17),
				InsideShop = vector3(351.9, -587.76, 74.17),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(349.71, -594.21, 74.17), heading = 236.77, radius = 10.0 },
					{ coords = vector3(353.2, -580.85, 74.17), heading = 235.22, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			-- Desde Garage al hospital
			{
				From = vector3(319.14, -558.92, 27.74),
				To = { coords = vector3(299.72, -596.16, 42.29), heading = 333.01 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
			-- Desde Hospital al garage
			{
				From = vector3(299.12, -599.5, 42.29),
				To = { coords = vector3(316.46, -555.43, 27.74), heading = 247.77 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
				-- Desde Ascensor al techo
			{
				From = vector3(325.54, -598.84, 42.29),
				To = { coords = vector3(341.75, -584.96, 73.17), heading = 249.46 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
				-- Desde el techo al Hospital
			{
				From = vector3(338.58, -583.9, 73.17),
				To = { coords = vector3(299.98, -597.16, 42.29), heading = 310.15 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
				-- Entrada hospital abajo hacia adentro
			{
				From = vector3(356.4, -595.18, 27.78),
				To = { coords = vector3(337.3, -591.48, 42.28), heading = 67.49 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			},
				-- Salida hospital hacia abajo
			{
				From = vector3(340.42, -592.66, 42.28),
				To = { coords = vector3(357.56, -592.3, 27.79), heading = 252.59 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

	enfermero = { -- dodgeEMS
		{ model = 'dodgeEMS', label = 'Auto Medico', price = 1000},
		{ model = 'ambulance', label = 'Ambulancia', price = 1000}
	},

	doctor = {
		{ model = 'dodgeEMS', label = 'Auto Medico', price = 1000},
		{ model = 'ambulance', label = 'Ambulancia', price = 1000}
	},

	chief_doctor = {
		{ model = 'dodgeEMS', label = 'Auto Medico', price = 1000},
		{ model = 'ambulance', label = 'Ambulancia', price = 1000}
	},

	boss = {
		{ model = 'dodgeEMS', label = 'Auto Medico', price = 1000},
		{ model = 'ambulance', label = 'Ambulancia', price = 1000}
	}

	
}

Config.AuthorizedHelicopters = {

	enfermero = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 1000 }
	},

	doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 1000 }
	},

	chief_doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 1000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 1000 }
	},

	boss = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 1000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 1000 }
	}

}
