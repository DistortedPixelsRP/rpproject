Config              = {}
Config.DrawDistance = 100.0
Config.MaxDelivery	= 10
Config.TruckPrice	= 500
Config.Locale       = 'en'
Config.BagPay       = 35
Config.MulitplyBags = false   -- Multiplies BagPay by number of workers - 4 max.

Config.Trucks = {
	"trash",
	"trash2",
	--"biff",	
	--"scrap"
}

Config.Cloakroom = {
	CloakRoom = {
			Pos   = {x = -321.70, y = -1545.94, z = 30.02},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},
}

Config.Zones = {
	VehicleSpawner = {
			Pos   = {x = -316.16, y = -1536.08, z = 26.65},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1
		},

	VehicleSpawnPoint = {
			Pos   = {x = -328.50, y = -1520.99, z = 27.53},
			Size  = {x = 3.0, y = 3.0, z = 1.0},
			Type  = -1
		},
}
--prop_dumpster_02a no aparece
Config.DumpstersAvaialbe = {
	"prop_dumpster_01a",
	"prop_dumpster_02a", 
	"prop_dumpster_02b",
	"prop_dumpster_3a",
	"prop_dumpster_4a",
	"prop_dumpster_4b",
	"prop_skip_01a",
	"prop_skip_06a",
	"prop_skip_05a",
	"prop_skip_03"
}


Config.Livraison = {
-------------------------------------------Los Santos
	-- fleeca Este Aparece!
	Delivery1LS = {
			Pos   = {x = 114.83280181885, y = -1462.3127441406, z = 29.295083999634},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	-- fleeca2 Este aparece!
	Delivery2LS = {
			Pos   = {x = -6.0481648445129, y = -1566.2338867188, z = 29.209197998047},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	-- blainecounty Este aparece!
	Delivery3LS = {
			Pos   = {x = -1.8858588933945, y = -1729.5538330078, z = 29.300233840942},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	-- PrincipalBank Este aparece!
	Delivery4LS = {
			Pos   = {x = 159.09, y = -1816.69, z = 27.9},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- route68e Este aparece!
	Delivery5LS = {
			Pos   = {x = 358.94696044922, y = -1805.0723876953, z = 28.966590881348},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 200
		},
	--littleseoul Este aparece!
	Delivery6LS = {
			Pos   = {x = 481.36560058594, y = -1274.8297119141, z = 29.64475440979},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	--capitalBlvdgas Este aparece! Este se cambio
	Delivery7LS = {
			Pos   = {x = 300.70010375977, y = -1292.32482910156, z = 29.196590423584},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	--fleecacarpark Este aparece! Este se cambio
	Delivery8LS = {
			Pos   = {x = 171.98079528809, y = -781.91204833984, z = 30.018426895142},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	--Mt Haan Dr Radio Tower Este aparece!
	Delivery9LS = {
			Pos   = {x = 342.78308105469, y = -1036.4720458984, z = 29.194206237793},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
	--Senora Way Fuel Depot Este aparece!
	Delivery10LS = {
			Pos   = {x = 462.17517089844, y = -949.51434326172, z = 27.959424972534},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 350
		},
------------------------------------------- 2nd Patrol 
	-- Adam's Apple Blvd HQ Este aparece!
	Delivery1BC = {
			Pos   = {x = 376.53698730469, y = -1115.95416259766, z = 29.878547286987},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 400
		},
	-- Mirror Park Railyard Este aparece!
	Delivery2BC = {
			Pos   = {x = 493.22503662109, y = -636.30517578125, z = 29.20943069458},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- Little Bighorn ave Este aparece!
	Delivery3BC = {
			Pos   = {x = 480.36038208008, y = -1066.35577392578, z = 28.582489776611},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- Elysian Fields Este aparece!
	Delivery4BC = {
			Pos   = {x = 443.96984863281, y = -574.33978271484, z = 28.494501113892},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},

	-- Magellan Ave Este aparece!
	Delivery5BC = {
			Pos   = {x = -1240.53, y = -1396.49, z = 3.62},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- Meteor St. Este aparece!
	Delivery6BC = {
			Pos   = {x = 353.443946838379, y = -191.32261657715, z = 57.561594390869},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- Dutch London Este aparece!
	Delivery7BC = {
			Pos   = {x = -31.948055267334, y = -93.437454223633, z = 57.249073028564},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- Autopia Pkwy Este aparece!
	Delivery8BC = {
			Pos   = {x = 283.10873413086, y = -164.81878662109, z = 60.060565948486},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- Meteor St. Este aparece!
	Delivery9BC = {
			Pos   = {x = 616.46835327148, y = 195.485572814941, z = 97.554975891113},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
	-- Eclipse Blvd Este aparece!
	Delivery10BC = {
			Pos   = {x = -114.89678955078, y = 218.97653198242, z = 94.887702941895},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 250
		},
		
	RetourCamion = {
			Pos   = {x = -335.26095581055, y = -1529.5614013672, z = 27.565467834473},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
	
	AnnulerMission = {
			Pos   = {x = -314.62796020508, y = -1514.5662841797, z = 27.677434921265},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 1,
			Paye = 0
		},
}
