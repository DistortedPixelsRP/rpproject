Config              = {}
Config.DrawDistance = 100.0
Config.Locale       = 'es'
Config.Time 		= 10
Config.CoalSellPrice = 1
Config.PinePlankSell    = 1
Config.CedroPlankSell = 1
Config.RoblePlankSell = 1
Config.AbetoPlankSell = 1
--Posible lugar para obtener carbon: 1109, -2337, 31
--                                   521, -1916, 26
--                                   1570, -2130, 78

Config.BlipInfos = {
    Sprite = 237,
    Color = 4
}

Config.Vehicles = {
    "rebel"
}

Config.Zones = {
    
    CloakRoom = {
        Pos = {x = 1200.63, y = -1276.87, z = 34.38},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Marker = 1,
        Blip = true,
        Type = "cloakroom",
        Name = _U("lj_locker_room"),
        Hint = _U("cloak_change")
    },

    PaletBox = {
        Pos = {x = -500.17, y = 5265.36, z = 79.61},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Marker = 1,
        Blip = true,
        Type = "boxpalet",
        Name = "Crear Palets / Cajas",
        Hint = 'Presiona ~INPUT_PICKUP~ para abrir las opciones.'
    },

	Wood = {
        Pos = {x = -534.32, y = 5373.79, z = 69.50},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Marker = 1,
        Blip = true,
        Type = "wood",
        Name = _U("lj_mapblip"),
        Item = {
            {
                name = _U("lj_wood"),
                db_name = "wood",
                time = 3000,
                max = 20,
                add = 1,
                remove = 1,
                requires = "nothing",
                requires_name = "Nothing",
                drop = 100
            }
        },
        Hint = _U("lj_pickup")
    },

    Coal = {
        Pos = {x = 1569.25, y = -2130.29, z = 77.60},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Marker = 1,
        Blip = true,
        Type = "coal",
        Name = _U("lj_coal"),
        Item = {
            {
                name = _U("lj_coal"),
                db_name = "coal",
                time = 3000,
                max = 20,
                add = 1,
                remove = 1,
                requires = "cutted_wood",
                requires_name = _U("lj_cutwood"),
                drop = 100
            }
        },
        Hint = _U("lj_coal_button")
    },

    CuttedWood = {
        Pos = {x = -552.21, y = 5326.90, z = 72.59},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Marker = 1,
        Blip = true,
        Name = _U("lj_cutwood"),
        Item = {
            {
                name = _U("lj_cutwood"),
                db_name = "cutted_wood",
                time = 5000,
                max = 20,
                add = 1,
                remove = 1,
                requires = "wood",
                requires_name = _U("lj_wood"),
                drop = 100
            }
        },
        Hint = _U("lj_cutwood_button")
    },

    Planks = {
        Pos = {x = -501.38, y = 5280.53, z = 79.61},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Marker = 1,
        Blip = true,
        Name = _U("lj_board"),
        Item = {
            {
                name = _U("lj_planks"),
                db_name = "packaged_plank",
                time = 4000,
                max = 100,
                add = 5,
                remove = 1,
                requires = "cutted_wood",
                requires_name = _U("lj_cutwood"),
                drop = 100
            }
        },
        Hint = _U("lj_pick_boards")
    },

    VehicleSpawner = {
        Pos = {x = 1191.96, y = -1261.77, z = 34.17},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Color = {r = 204, g = 204, b = 0},
        Marker = 1,
        Blip = false,
        Type = "vehspawn",
        Name = _U("spawn_veh"),
        Spawner = 1,
        Hint = _U("spawn_veh_button"),
    },

    VehicleSpawnPoint = {
        Pos = {x = 1194.62, y = -1286.95, z = 34.12},
        Size = {x = 3.0, y = 3.0, z = 1.0},
        Marker = -1,
        Blip = false,
        Name = _U("service_vh"),
        Type = "vehspawnpt",
        Spawner = 1,
    },

    VehicleDeletePoint = {
        Pos = {x = 1216.89, y = -1229.23, z = 34.40},
        Size = {x = 5.0, y = 5.0, z = 1.0},
        Color = {r = 255, g = 0, b = 0},
        Marker = 1,
        Blip = false,
        Name = _U("return_vh"),
        Type = "vehdelete",
        Hint = _U("return_vh_button"),
        Spawner = 1,
        GPS = 0,
        Teleport = 0
    },

    SellZone = {
        Pos = {x = 1201.35, y = -1327.51, z = 34.22},
        Color = {r = 204, g = 204, b = 0},
        Size = {x = 5.0, y = 5.0, z = 3.0},
        Marker = 1,
        Blip = true,
        Name = _U("delivery_point"),
        Type = "delivery",
        Spawner = 1,
        Item = {
            {
                name = _U("delivery"),
                time = 500,
                remove = 1,
                max = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
                price = 13,
                requires = "packaged_plank",
                requires_name = _U("lj_planks"),
                drop = 100
            }
        },
        Hint = _U("lj_deliver_button")
    }
}

Config.Trees = {

	Tree1 = {
		Pos = {x = -491.2, y = 5595.34, z = 76.4},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 0,
		Blip = true,
		Name = _U("m_tree"),
		Type = "work",
	},


	Tree2 = {
		Pos = {x = -500.20, y = 5400.45, z = 74.30},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 0,
		Blip = true,
		Name = _U("m_tree"),
		Type = "work",
	},


	Tree3 = {
		Pos = {x = -503.67, y = 5392.1, z = 75.95},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 0,
		Blip = true,
		Name = _U("m_tree"),
		Type = "work",
	},

	Tree4 = {
		Pos = {x = -457.48, y = 5408.91, z = 78.75},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 0,
		Blip = true,
		Name = _U("m_tree"),
		Type = "work",
	},

	Tree5 = {
		Pos = {x = -456.51, y = 5398.4, z = 79.3},
		Size = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Marker = 0,
		Blip = true,
		Name = _U("m_tree"),
		Type = "work",
	},
}