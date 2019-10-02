Config = {}

-- Are you using ESX? Turn this to true if you would like fuel & jerry cans to cost something.
Config.UseESX = true

-- What should the price of jerry cans be?
Config.JerryCanCost = 100
Config.RefillCost = 50 -- If it is missing half of it capacity, this amount will be divided in half, and so on.

-- Fuel decor - No need to change this, just leave it.
Config.FuelDecor = "_FUEL_LEVEL"

-- What keys are disabled while you're fueling.
Config.DisableKeys = {0, 22, 23, 24, 29, 30, 31, 37, 44, 56, 82, 140, 166, 167, 168, 170, 288, 289, 311, 323}

-- Want to use the HUD? Turn this to true.
Config.EnableHUD = false

-- Configure blips here. Turn both to false to disable blips all together.
Config.ShowNearestGasStationOnly = false
Config.ShowAllGasStations = true

-- Configure the strings as you wish here.
Config.Strings = {
    ExitVehicle = "Debes estar fuera del vehiculo para cargar combustible",
    EToRefuel = "Presiona ~g~E ~w~para cargar combustible",
    JerryCanEmpty = "El bidon de gasolina esta vacio",
    FullTank = "El tanque esta lleno",
    PurchaseJerryCan = "Presiona ~g~E ~w~para comprar un bidon de gasolina por ~g~$" .. Config.JerryCanCost,
    CancelFuelingPump = "Presiona ~g~E ~w~para dejar de cargar combustible",
    CancelFuelingJerryCan = "Presiona ~g~E ~w~para dejar de cargar combustible",
    NotEnoughCash = "No tienes dinero suficiente",
    RefillJerryCan = "Presiona ~g~E ~w~ para rellenar el bidon de gasolina por ",
    NotEnoughCashJerryCan = "No tienes suficiente dinero para llenar el bidon de gasolina",
	JerryCanFull = "El bidon de gasolina esta lleno",
	TotalCost = "Costo",
}

if not Config.UseESX then
	Config.Strings.PurchaseJerryCan = "Press ~g~E ~w~to grab a jerry can"
	Config.Strings.RefillJerryCan = "Press ~g~E ~w~ to refill the jerry can"
end

Config.PumpModels = {
	[-2007231801] = true,
	[1339433404] = true,
	[1694452750] = true,
	[1933174915] = true,
	[-462817101] = true,
	[-469694731] = true,
	[-164877493] = true
}

-- Blacklist certain vehicles. Use names or hashes. https://wiki.gtanet.work/index.php?title=Vehicle_Models
Config.Blacklist = {
	"blista",
    "sanchez",
    "mule3"
	--"Adder",
	--276773164
}

-- Do you want the HUD removed from showing in blacklisted vehicles?
Config.RemoveHUDForBlacklistedVehicle = true

-- Class multipliers. If you want SUVs to use less fuel, you can change it to anything under 1.0, and vise versa.
Config.Classes = {
	[0] = 1.0, -- Compacts
	[1] = 1.0, -- Sedans
	[2] = 1.0, -- SUVs
	[3] = 1.0, -- Coupes
	[4] = 1.0, -- Muscle
	[5] = 1.0, -- Sports Classics
	[6] = 1.0, -- Sports
	[7] = 1.0, -- Super
	[8] = 1.0, -- Motorcycles
	[9] = 1.0, -- Off-road
	[10] = 1.0, -- Industrial
	[11] = 1.0, -- Utility
	[12] = 1.0, -- Vans
	[13] = 0.0, -- Cycles
	[14] = 1.0, -- Boats
	[15] = 1.0, -- Helicopters
	[16] = 1.0, -- Planes
	[17] = 1.0, -- Service
	[18] = 1.0, -- Emergency
	[19] = 1.0, -- Military
	[20] = 1.0, -- Commercial
	[21] = 1.0, -- Trains
}

-- The left part is at percentage RPM, and the right is how much fuel (divided by 10) you want to remove from the tank every second
Config.FuelUsage = {
	[1.0] = 1.4,
	[0.9] = 1.2,
	[0.8] = 1.0,
	[0.7] = 0.9,
	[0.6] = 0.8,
	[0.5] = 0.7,
	[0.4] = 0.5,
	[0.3] = 0.4,
	[0.2] = 0.2,
	[0.1] = 0.1,
	[0.0] = 0.0,
}

Config.GasStations = {
	vector3(49.4187, 2778.793, 58.043),
	vector3(263.894, 2606.463, 44.983),
	vector3(1039.958, 2671.134, 39.550),
	vector3(1207.260, 2660.175, 37.899),
	vector3(2539.685, 2594.192, 37.944),
	vector3(2679.858, 3263.946, 55.240),
	vector3(2005.055, 3773.887, 32.403),
	vector3(1687.156, 4929.392, 42.078),
	vector3(1701.314, 6416.028, 32.763),
	vector3(179.857, 6602.839, 31.868),
	vector3(-94.4619, 6419.594, 31.489),
	vector3(-2554.996, 2334.40, 33.078),
	vector3(-1800.375, 803.661, 138.651),
	vector3(-1437.622, -276.747, 46.207),
	vector3(-2096.243, -320.286, 13.168),
	vector3(-724.619, -935.1631, 19.213),
	vector3(-526.019, -1211.003, 18.184),
	vector3(-70.2148, -1761.792, 29.534),
	vector3(265.648, -1261.309, 29.292),
	vector3(819.653, -1028.846, 26.403),
	vector3(1208.951, -1402.567,35.224),
	vector3(1181.381, -330.847, 69.316),
	vector3(620.843, 269.100, 103.089),
	vector3(2581.321, 362.039, 108.468),
	vector3(176.631, -1562.025, 29.263),
	vector3(-319.292, -1471.715, 30.549),
	vector3(1784.324, 3330.55, 41.253)
}

Config.Marcadores = {
	estacion_1 = {
		Pos   = {x = 49.81, y = 2777.32, z =  57.04},
		Size  = {x = 10.0, y = 10.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_2 = {
		Pos   = {x = 263.894, y = 2606.463, z = 43.983},
		Size  = {x = 10.0, y = 10.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_3 = {
		Pos   = {x = 1038.45, y = 2670.99, z = 38.55},
		Size  = {x = 20.0, y = 15.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_4 = {
		Pos   = {x = 1207.260, y = 2660.175, z = 36.899},
		Size  = {x = 7.0, y = 7.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_5 = {
		Pos   = {x = 2539.685, y = 2594.192, z = 36.944},
		Size  = {x = 5.0, y = 5.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_6 = {
		Pos   = {x = 2680.52, y = 3264.13, z = 54.24},
		Size  = {x = 10.0, y = 10.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_7 = {
		Pos   = {x = 2005.055, y = 3773.887, z = 31.403},
		Size  = {x = 15.0, y = 10.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_8 = {
		Pos   = {x = 1687.156, y = 4929.392, z = 41.078},
		Size  = {x = 15.0, y = 10.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_9 = {
		Pos   = {x = 1701.314, y = 6416.028, z = 31.763},
		Size  = {x = 15.0, y = 10.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_10 = {
		Pos   = {x = 180.06, y = 6603.15, z = 30.87},
		Size  = {x = 20.0, y = 25.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_11 = {
		Pos   = {x = -94.81, y = 6417.67, z = 30.49},
		Size  = {x = 12.0, y = 15.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_12 = {
		Pos   = {x = -2555.996, y = 2334.46, z = 32.08},
		Size  = {x = 25.0, y = 25.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_13 = {
		Pos   = {x = -1800.375, y = 803.661, z=137.651},
		Size  = {x = 25.0, y = 25.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_14 = {
		Pos   = {x = -1437.622, y=-276.747, z=45.207},
		Size  = {x = 25.0, y = 25.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_15 = {
		Pos   = {x = -2096.243, y=-320.286, z=12.168},
		Size  = {x = 30.0, y = 30.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_16 = {
		Pos   = {x = -724.619, y=-935.1631, z=18.213},
		Size  = {x = 25.0, y = 15.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_17 = {
		Pos   = {x = -526.019, y=-1211.003, z=17.184},
		Size  = {x = 20.0, y = 20.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_18 = {
		Pos   = {x = -70.2148, y=-1761.792, z=28.534},
		Size  = {x = 30.0, y = 22.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_19 = {
		Pos   = {x = 265.648, y=-1261.309, z=28.292},
		Size  = {x = 30.0, y = 25.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_20 = {
		Pos   = {x = 819.653, y=-1028.846, z=25.403},
		Size  = {x = 23.0, y = 20.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_21 = {
		Pos   = {x =1208.951, y=-1402.567, z=34.224},
		Size  = {x = 15.0, y = 15.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_22 = {
		Pos   = {x = 1181.381, y = -330.847, z=68.316},
		Size  = {x = 25.0, y = 25.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_23 = {
		Pos   = {x = 620.843, y= 269.100, z=102.089},
		Size  = {x = 25.0, y = 25.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_24 = {
		Pos   = {x = 2581.321, y=362.039, z=107.468},
		Size  = {x = 25.0, y = 25.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_25 = {
		Pos   = {x = 176.631, y =-1562.025, z=28.263},
		Size  = {x = 18.0, y = 18.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_26 = {
		Pos   = {x = -319.292, y=-1471.715, z=29.549},
		Size  = {x = 25.0, y = 25.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
	estacion_27 = {
		Pos   = {x = 1784.324, y=3330.55, z=40.253},
		Size  = {x = 7.0, y = 7.0, z = 0.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1
	},
}