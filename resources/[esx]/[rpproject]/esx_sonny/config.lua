Config = {}

Config.Menu = {

	{
		name  = 'servicios',
		label = 'LLamar Servicios',
		items = {
			{label = "Ambulancia", value = "ambulance"},
			{label = "Policia", value = "police"},
			{label = "Taxi", value = "taxi"},
			{label = "Mecanico", value = "mechanic"},
		}
	},
	{
		name 	= "documentos",
		label 	= "Documentos",
		items 	= {
			{label = 'Identificacion', value = nil},
			{label = 'Carné de Salud', value = 'health'},
			{label = 'Licencia de Conducir', value = 'driver'},
			{label = 'Licencia de Armas', value = 'weapon'},
		},
	},
	{
		name	= "puertas",
		label	= "Puertas del vehículo",
		items 	= {
			{label = 'Todas', value = {0, 1, 2, 3, 4, 5}},
			{label = 'Conductor Frontal', value = {0}},
			{label = 'Pasajero Frontal', value = {1}},
			{label = 'Conductor Trasera', value = {2}},
			{label = 'Pasajero Trasera', value = {3}},
			{label = 'Maletero', value = {5}},
			{label = 'Capó', value = {4}},
		}
	},
	{
		name 	= "personaje",
		label	= "Personaje",
		items	= {
			{label = 'Skills', value = "skills"},
			{label = 'Borrar Personaje', value = "borrar_personaje"},
			{label = 'Nuevo Personaje', value = "nuevo_personaje"},
		}
	},
	{
		isSubMenu = true,
		name	= "documentos_accion",
		label	= "Acción",
		items 	= {
			{label = 'Ver', value = 'show_me'},
			{label = 'Mostrar', value = 'show_other'},
		}
	},
}