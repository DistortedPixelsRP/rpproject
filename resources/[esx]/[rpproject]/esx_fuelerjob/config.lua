Config                            = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.Locale                     = 'fr'

Config.precioFuel					= 50

Config.Zones = {

	PetrolFarm = {
		Pos   = {x = 696.413, y = 2889.107, z = 49.0},
		Size  = {x = 10.0, y = 10.0, z = 2.0},
		Color = {r = 0, g = 0, b = 0},
		Name  = "Recoletar Petroleo",
		Type  = 1
	},


	TraitementPetrol = {
		Pos   = {x = 2746.750, y = 1653.339, z = 23.0},
		Size  = {x = 4.0, y = 4.0, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Tratamiento de Petroleo",
		Type  = 1
	},

	TraitementRaffin = {
		Pos   = {x = 2765.624, y = 1709.929, z = 23.0},
		Size  = {x = 4.0, y = 4.0, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Tratamiento de petroleo refinado",
		Type  = 1
	},

	FuelerActions = {
		Pos   = {x = 2890.645, y = 4391.536, z = 49.4},
		Size  = {x = 2.0, y = 2.0, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Point d'action",
		Type  = 27
	 },
	  
	VehicleSpawner = {
		Pos   = {x = 2899.537, y = 4398.668, z = 49.4},
		Size = {x = 2.0, y = 2.0, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Garage véhicule",
		Type  = 27
	},

	VehicleSpawnPoint = {
		Pos   = {x = 2899.626, y = 4382.079, z = 49.5},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 136, g = 243, b = 216},
		Name  = "Spawn point",
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = {x = 2909.202, y = 4365.562, z = 49.4},
		Size  = {x = 5.0, y = 5.0, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		Name  = "Ranger son véhicule",
		Type  = 27
	},

	-- estaciones
	estacion_1 = {
		Pos   = {x = 65.73, y = 2778.9, z =  56.88},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_2 = {
		Pos   = {x = 243.26, y = 2600.58, z = 44.11},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_3 = {
		Pos   = {x = 1026.59, y = 2657.91, z = 38.55},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_4 = {
		Pos   = {x = 1193.19, y = 2663.46, z = 36.81},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_5 = {
		Pos   = {x = 2537.2, y = 2576.04, z = 36.94},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_6 = {
		Pos   = {x = 2683.41, y = 3293.5, z = 54.24},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_7 = {
		Pos   = {x = 1985.9, y = 3776.47, z = 31.18},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_8 = {
		Pos   = {x = 1695.9, y = 4916.44, z = 41.08},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_9 = {
		Pos   = {x = 1720.55, y = 6424.27, z = 32.48},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_10 = {
		Pos   = {x = 200.29, y = 6627.48, z = 30.55},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_11 = {
		Pos   = {x = -77.01, y = 6427.45, z = 30.49},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_12 = {
		Pos   = {x = -2528.4, y = 2345.03, z = 32.06},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_13 = {
		Pos   = {x = -1822.51, y = 807.21, z = 137.83},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_14 = {
		Pos   = {x = -1414.09, y = -281.24, z = 45.32},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_15 = {
		Pos   = {x = -2069.75, y = -304.0, z = 12.15},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_16 = {
		Pos   = {x = -728.56, y = -910.65, z = 18.01},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_17 = {
		Pos   = {x = -541.43, y = -1215.51, z = 17.3},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_18 = {
		Pos   = {x = -59.03, y = -1745.26, z = 28.35},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_19 = {
		Pos   = {x = 293.73, y = -1245.01, z = 28.29},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_20 = {
		Pos   = {x = 810.21, y = -1045.64, z = 25.67},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_21 = {
		Pos   = {x = 1200.35, y = -1384.4, z = 34.23},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_22 = {
		Pos   = {x = 1153.44, y = -331.41, z = 67.89},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_23 = {
		Pos   = {x = 649.09, y = 279.03, z = 102.14},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_24 = {
		Pos   = {x = 2559.16, y = 340.17, z = 107.46},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_25 = {
		Pos   = {x = 180.85, y = -1547.35, z = 28.16},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_26 = {
		Pos   = {x = -304.16, y = -1478.89, z = 29.42},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	},
	estacion_27 = {
		Pos   = {x = 1768.09, y = 3340.59, z = 40.22},
		Size  = {x = 2.5, y = 2.5, z = 0.9},
		Color = {r = 102, g = 102, b = 204},
		Type  = 1,
		Name = "Venta de combustible"
	}
}