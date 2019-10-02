Config                              = {}

Config.OnDutyText                   = "Presiona ~INPUT_CONTEXT~ para ~g~entrar~w~ en servicio"
Config.OffDutyText                  = "Presiona ~INPUT_CONTEXT~ para ~r~salir~w~ de servicio"
Config.DrawDistance                 = 100.0
Config.MarkerSize                   = { x = 1.1, y = 1.0, z = 0.5 }

Config.Markers = {
    ["police"] = {
        {
            Coords      = { x = 454.37, y = -988.87, z = 29.69 },
            Rotation    = { x = 0.0, y = 0.0, z = 0.0},
            Sprite      = 27,
            Color       = { r = 50, g = 50, b = 204 }
        },
    },
    ['ambulance'] = {
        {
            Coords      = { x = 326.4, y = -583.08, z = 42.32 },
            Rotation    = { x = 0.0, y = 0.0, z = 0.0},
            Sprite      = 27,
            Color       = { r = 209, g = 14, b = 14 }
        },
    },
    ['taxi'] = {
        {
            Coords      = { x = 902.0, y = -173.21, z = 73.10 },
            Rotation    = { x = 0.0, y = 0.0, z = 0.0},
            Sprite      = 27,
            Color       = {r = 204, g = 204, b = 0}
        },
    },
    ['mechanic'] = {
        {
            Coords      = { x = -339.45, y = -132.12, z = 38.03 },
            Rotation    = { x = 0.0, y = 0.0, z = 0.0},
            Sprite      = 27,
            Color       = {r = 204, g = 204, b = 0}
        },
    },
    --['restaurante'] = {
    --    {
    --        Coords      = { x = 256.48, y = -812.6, z = 0.2 },
    --        Rotation    = { x = 0.0, y = 0.0, z = 0.0},
    --        Sprite      = 27,
    --        Color       = {r = 204, g = 204, b = 0}
    --    },
    --}
}