Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1, y = 1, z = 0.5 }

Config.Documents = {
    ['police'] = {
        {
            label = 'Identificacion',
            value = 'identification',
            item  = 'identification'
        },
        {
            label = 'Licencia de Conducir',
            value = 'driving_license',
            item  = 'drive_card'
        },
        {
            label = 'Permiso de Armas',
            value = 'weapon',
            item  = 'weapon_card',
            license = 'weapon'
        },
        {
            label = 'Licencia de Armas A',
            value = 'weapon_a',
            license = 'weapon_a'
        },
        {
            label = 'Licencia de Armas B',
            value = 'weapon_b',
            license = 'weapon_b'
        },
        {
            label = 'Licencia de Armas C',
            value = 'weapon_c',
            license = 'weapon_c'
        },
        {
            label = 'Licencia de Armas D',
            value = 'weapon_d',
            license = 'weapon_d'
        }
    },
    ['ambulance'] = {
        {
            label = 'Carnet de Salud', 
            value = 'health_license',
            item = 'health_card',
            license = 'health_license'
        },
        {
            label = 'Certificado de Discapacidad', 
            value = 'discapacidad',
            item = 'discapacidad',
            license = 'discapacidad'
        }
        
    }
}

Config.Shops = {
    ["police"] = {
        {
            Coords      = { x = 439.5, y = -993.3, z = 30.2 },
            Rotation    = { x = 0.0, y = 0.0, z = 90.0},
            Sprite      = 21,
            Scale       = 1,
            Color       = { r = 50, g = 50, b = 204 }
        },
    },
    ['ambulance'] = {
        {
            Coords      = { x = 305.12, y = -598.61, z = 43.29 },
            Rotation    = { x = 0.0, y = 0.0, z = 48.0},
            Sprite      = 21,
            Scale       = 1,
            Color       = { r = 209, g = 14, b = 14 }
        },
    }
}