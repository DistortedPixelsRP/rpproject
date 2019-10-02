Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 42

Config.Recipes = {
	-- Can be a normal ESX item
	-- Clavos
	["nails"] = { 
        name = "Clavos",
        ingredients = {
            {item = "iron_ingot", quantity = 4, name = "Lingote de Hierro" }, 
            {item = "nail_mold", quantity = 1, name = "Molde de clavos" }
        }
    },
	-- Caja de Madera
	["wooden_box"] = { 
		name = "Caja de Madera",
		ingredients = {
			{item = "pine_plank", quantity = 1, name = "Tablon de Pino" }, 
			{item = "saw", quantity = 1, remove = false, name = "Serrucho" },
			{item = "nails", quantity = 1, name = "Clavos" }, 
			{item = "rope", quantity = 1, name = "Cuerda" }, 
			{item = "hammer", quantity = 1, remove = false, name = "Martillo" }
		}
	},
	-- Tablon de Madera 
	["pine_wood"] = {
		name = "Madera de Pino",
		ingredients = {
			{item = "wood", quantity = 1, name = "Madera" },
			{item = "saw", quantity = 1, remove = false, name = "Serrucho" }
		}
	},
	-- Film de Plastico
	["plastic_film"] = {
		name = "Film",
		ingredients = {
			{item = "plastic_bottle_process", quantity = 5, name = "Botellas Plasticas Procesadas" }
		}
	},
	-- Caja de madera para transporte de Drogas
	["wooden_box_for_transport_drugs"] = {
		name = "Caja de madera para transporte de Drogas",
		ingredients = {
			{item = "wooden_box", quantity = 1, name = "Caja de Madera" },
			{item = "drugs", quantity = 1, name = "Drogas" },
			{item = "plastic_film", quantity = 1, name = "Film" }
		}
	},
	-- Caja de Madera para Transporte de Armas
	["wooden_box_for_transport_weapons"] = {
		name = "Caja de Madera para Transporte de Armas",
		ingredients = {
			{item = "wooden_box", quantity = 1, name = "Caja de Madera" },
			{item = "Weapons", quantity = 1, name = "Armas" },
			{item = "plastic_film", quantity = 1, name = "Film" }
		}
	},
	-- Caja de madera para exportación de alimentos
	["wooden_box_for_export_food"] = {
		name = "Caja de madera para exportación de alimentos",
		ingredients = {
			{item = "wooden_box", quantity = 1, name = "Caja de Madera" },
			{item = "food", quantity = 1, name = "Comidas" },
			{item = "plastic_film", quantity = 1, name = "Film" }
		}
	},
	-- Caja de Madera para Exportacion de Bebidas Alcoholicas
	["wooden_box_for_export_alcoholic_beverages"] = {
		name = "Caja de Madera para Exportacion de Bebidas Alcoholicas",
		ingredients = {
			{item = "wooden_box", quantity = 1, name = "Caja de Madera" },
			{item = "alcoholic_beverages", quantity = 1, name = "Bebidas Alcoholicas" },
			{item = "plastic_film", quantity = 1, name = "Film" }
		}
	},
	-- Caja de madera para exportación de Ropa
	["wooden_box_for_export_alcoholic_beverages"] = {
		name = "Caja de madera para exportación de Ropa",
		ingredients = {
			{item = "wooden_box", quantity = 1, name = "Caja de Madera" },
			{item = "clothes_created", quantity = 1, name = "Ropas Creadas" },
			{item = "plastic_bags", quantity = 1, name = "Bolsas de Plastico" }
		}
	},
	-- Partes Electronicas
	["electronic_plate"] = {
		name = "Plaqueta Electronica",
		ingredients = {
			{item = "electronic_parts", quantity = 1, name = "Partes Electronicas" },
			{item = "gold", quantity = 1, name = "Oro" },
			{item = "copper", quantity = 1, name = "Cobre" },
			{item = "diamond", quantity = 1, name = "Diamante" }
		}
	},
	-- Maquina de Hackeo
	["hack_machine"] = {
		name = "Maquina de Hackeo",
		ingredients = {
			{item = "plastic", quantity = 1, name = "Plastico" },
			{item = "electronic_plate", quantity = 1, name = "Plaqueta Electronica" }
		}
	},
	-- Pendrive
	["pendrive"] = {
		name = "Pendrive",
		ingredients = {
			{item = "plastic", quantity = 1, name = "Plastico" },
			{item = "electronic_plate", quantity = 1, name = "Plaqueta Electronica" },
			{item = "copper", quantity = 1, name = "Cobre" }
		}
	},
	-- Manguera
	["hose"] = {
		name = "Manguera",
		ingredients = {
			{item = "plastic", quantity = 10, name = "Plastico" }
		}
	},
	-- Soplete
	["blowtorch"] = {
		name = "Soplete",
		ingredients = {
			{item = "steel", quantity = 1, name = "Acero" },
			{item = "gas_carafe", quantity = 1, name = "Garrafa de Gas" },
			{item = "hose", quantity = 1, name = "Manguera" }
		}
	},
	-- Cables
	["cables"] = {
		name = "Cables",
		ingredients = {
			{item = "plastic", quantity = 1, name = "Plastico" },
			{item = "copper", quantity = 1, name = "Cobre" }
		}
	},
	-- Explosivos Sintetico para Bancos
	["Synthetic_explosive_for_banks"] = {
		name = "Explosivos Sinteticos para Bancos",
		ingredients = {
			{item = "gunpowder", quantity = 1, name = "Polvora" },
			{item = "leather", quantity = 1, name = "Cuero" },
			{item = "electronic_plate", quantity = 1, name = "Plaqueta Electronica" },
			{item = "cables", quantity = 1, name = "Cables" }
		}
	}
}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = true,
	shopCoordinates = { x=962.5, y=-1585.5, z=29.6 },
	shopName = "Crafting Station",
	shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

Config.Shop2 = {
	useShop = true,
	shopCoordinates = { x=-962.5, y=-1585.5, z=29.6 },
	shopName = "Crafting Station",
	shopBlipID = 446,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}


-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}
