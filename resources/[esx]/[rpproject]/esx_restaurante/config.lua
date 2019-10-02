Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = true
Config.MaxInService               = -1


Config.EnableHandcuffedTimer      = true
Config.EnableHandcuffedTimer      = 10 * 60000 --10 mins



Config.Locale                     = 'en'

Config.MissCraft                  = 10 -- %



Config.Blips = {
    
    Blip = {
      Pos     = { x = 273.96, y = -834.13, z = 29.26, },
      Sprite  = 93,
      Display = 4,
      Scale   = 1.1,
      Colour  = 4,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = 259.98, y = -813.72, z = 0.01 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 27,
    },


    Vaults = {
        Pos   = { x = 254.62, y = -808.81, z = 4.1 },
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 23,
    },

    Fridge = {
        Pos   = { x = 249.04, y = -823.73, z = 5.0 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Type  = 23,
    },


    BossActions = {
        Pos   = { x = 255.46, y = -804.23, z = 4.1 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------
--{
    Bebidas = {
        Pos   = { x = 254.39, y = -825.4, z = 4.1 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 23,
        Items = {
            { name = 'fernet',      label = _U('fernet'),   price = 4 },
            { name = 'jager',      label = _U('jager'),   price = 4 },
            { name = 'rhum',       label = _U('rhum'),    price = 4 },  
            { name = 'tequila',    label = _U('tequila'), price = 3 },
            { name = 'vodka',      label = _U('vodka'),   price = 4 },
            { name = 'whisky',     label = _U('whisky'),  price = 4 },
            { name = 'cocacola',      label = _U('cocacola'),   price = 3 },
            { name = 'menthe',     label = _U('menthe'),  price = 6 },
            { name = 'limonade',    label = _U('limonade'), price = 2 },
            { name = 'jusfruit',    label = _U('jusfruit'), price = 3 },
            { name = 'energy',    label = _U('energy'), price = 3 },
            
        },
    },

    Ice = {
        Pos   = { x = 252.75, y = -824.47, z = 4.1 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 255, b = 255 },
        Type  = 23,
        Items = {
            { name = 'ice',     label = _U('ice'),      price = 2 },
            { name = 'water', label = _U('water'), price = 30},
        },
    },

}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
  barman_outfit = {
    male = {
        ['tshirt_1'] = 6,  ['tshirt_2'] = 0,
        ['torso_1'] = 11,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 11,
        ['pants_1'] = 52,   ['pants_2'] = 2,
        ['shoes_1'] = 21,   ['shoes_2'] = 0,
        ['chain_1'] = 11,  ['chain_2'] = 2
    },
    female = {
        ['tshirt_1'] = 24,  ['tshirt_2'] = 0,
        ['torso_1'] = 28,   ['torso_2'] = 3,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 0,
        ['pants_1'] =54,   ['pants_2'] = 2,
        ['shoes_1'] = 13,   ['shoes_2'] = 0,
        ['chain_1'] = 0,  ['chain_2'] = 0
    },
  },
  
  cooker_outfit = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 107,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 14,
        ['pants_1'] = 48,   ['pants_2'] = 0,
        ['shoes_1'] = 82,   ['shoes_2'] = 0,
        ['chain_1'] = 0,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 0,  ['tshirt_2'] = 0,
        ['torso_1'] = 98,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 14,
        ['pants_1'] = 51,   ['pants_2'] = 0,
        ['shoes_1'] = 1,   ['shoes_2'] = 10,
        ['chain_1'] = 0,  ['chain_2'] = 0
    }
  },

  security_outfit = {
    male = {
        ['tshirt_1'] = 76,  ['tshirt_2'] = 0,
        ['torso_1'] = 130,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 20,
        ['pants_1'] = 49,   ['pants_2'] = 0,
        ['shoes_1'] = 82,   ['shoes_2'] = 0,
        ['chain_1'] = 0,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
        ['torso_1'] = 27,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 0,
        ['pants_1'] = 76,   ['pants_2'] = 0,
        ['shoes_1'] = 49,   ['shoes_2'] = 0,
        ['chain_1'] = 0,  ['chain_2'] = 0
    }
  },
}

-- markers
Config.zones = {

	RestauranteEnter = {
		x = 273.60,
		y = -833.05,
		z = 28.9,
		w = 2.0,
		h = 1.0,		
		visible = true,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},
	
	RestauranteExit = {
		x = 269.23,
		y = -829.90,
		z = 4.3,
		w = 2.0,
		h = 1.0,		
		visible = true,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},
}

-- Landing point,
Config.point = {

	RestauranteEnter = {
		x = 268.43,
		y = -828.2,
		z = 5.10
	},
	
	RestauranteExit = {
		x = 274.02,
		y = -834.60,
		z = 29.06
	}
}


-- Automatic teleport list
Config.auto = {
	'Restaurante',
	'RestauranteEnter',
	'RestauranteExit'
}
