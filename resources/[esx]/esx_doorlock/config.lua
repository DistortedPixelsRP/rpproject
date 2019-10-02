Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vector3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vector3(434.7, -983.2, 30.8)
			}
		}
	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -90.0,
		objCoords  = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = { 'police', 'police_off' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(445.3, -988.7, 30.6)
			}
		}
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 0.0,
		objCoords  = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},
		--
	--Extension Comisaria
	--
	
	-- Cell 4
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 90.0,
        objCoords  = vector3(466.145, -1001.306, 25.06443),
        textCoords = vector3(466.145, -1001.306, 25.06443),
        authorizedJobs = { 'police','admin' },
        locked = true
    },

	-- Cell 5
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 90.0,
        objCoords  = vector3(466.145, -997.6584, 25.06443),
        textCoords = vector3(466.145, -997.6584, 25.06443),
        authorizedJobs = { 'police','admin' },
        locked = true
    },

	-- Cell 6
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 0.0,
        objCoords  = vector3(482.737, -991.7142, 25.0654),
        textCoords = vector3(482.737, -991.7142, 25.0654),
        authorizedJobs = { 'police','admin' },
        locked = true
    },

	-- Cell 7
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 0.0,
        objCoords  = vector3(482.737, -988.2937, 25.0654),
        textCoords = vector3(482.737, -988.2937, 25.0654),
        authorizedJobs = { 'police','admin' },
        locked = true
    },

	-- Interrogatorio 1 (Observatorio)
    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = 0.0,
        objCoords  = vector3(471.78, -991.71, 24.91),
        textCoords = vector3(471.78, -991.71, 24.91),
        authorizedJobs = { 'police','admin' },
        locked = true
    },

	-- Interrogatorio 2 (Observatorio)
    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = 0.0,
        objCoords  = vector3(472.04, -988.49, 24.91),
        textCoords = vector3(472.04, -988.49, 24.91),
        authorizedJobs = { 'police','admin' },
        locked = true
    },

	-- Interrogatorio 1
    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = 0.0,
        objCoords  = vector3(477.44, -991.67, 24.91),
        textCoords = vector3(477.44, -991.67, 24.91),
        authorizedJobs = { 'police','admin' },
        locked = true
    },

	-- Interrogatorio 2
    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = 0.0,
        objCoords  = vector3(477.56, -988.25, 24.91),
        textCoords = vector3(477.56, -988.25, 24.91),
        authorizedJobs = { 'police','admin' },
        locked = true
    },
	
	
	--
	-- Oficinas Life News
	--
	
	--Entrada Principal
	    {
        textCoords = vector3(-1082.33, -259.78, 37.8),
        authorizedJobs = { 'lifenews','admin' },
        locked = true,
        distance = 4,
        doors = {
            {
                objName = 'v_ilev_fb_door01',
                objYaw = 27.5,
                objCoords  = vector3(-1082.97, -260.38, 37.8),
            },

            {
                objName = 'v_ilev_fb_door02',
                objYaw = 27.5,
                objCoords  = vector3(-1081.77, -259.46, 37.8),
            }
        }
    },
	
	--Entrada Trasera
	    {
        textCoords = vector3(-1045.87, -230.61, 39.01),
        authorizedJobs = { 'lifenews','admin' },
        locked = true,
        distance = 4,
        doors = {
            {
                objName = 'v_ilev_fb_doorshortl',
                objYaw = 117.5,
                objCoords  = vector3(-1045.47, -231.38, 37.8),
            },

            {
                objName = 'v_ilev_fb_doorshortr',
                objYaw = 117.5,
                objCoords  = vector3(-1046.16, -229.94, 39.01),
            }
        }
    },
	
	--Puerta Recreacion
	    {
        textCoords = vector3(-1057.14, -237.1, 44.02),
        authorizedJobs = { 'lifenews','admin' },
        locked = true,
        distance = 4,
        doors = {
            {
                objName = 'v_ilev_fb_sl_door01',
                objYaw = 27.0,
                objCoords  = vector3(-1057.14, -237.1, 44.02),
            }
        }
    },

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = { 'police', 'police_off' },
		locked = true
	},
	
	
	--
	--Hospital Nuevo
	--
	
	    {
        textCoords = vector3(334.46, -592.42, 28.79),
        authorizedJobs = { 'ambulance','admin' },
        locked = true,
        distance = 4,
        doors = {
            {
                objName = 'V_ILev_Cor_FireDoor',
                objYaw = 250.0,
                objCoords  = vector3(333.96, -592.63, 28.79),
            },

            {
                objName = 'V_ILev_Cor_FireDoor',
                objYaw = 70.0,
                objCoords  = vector3(334.29, -591.94, 28.79),
            }
        }
    },
	
		    {
        textCoords = vector3(337.38, -583.42, 28.79),
        authorizedJobs = { 'ambulance','admin' },
        locked = true,
        distance = 4,
        doors = {
            {
                objName = 'V_ILev_Cor_FireDoorWide',
                objYaw = 250.0,
                objCoords  = vector3(337.38, -583.42, 28.79),
            }
        }
    },
	
		    {
        textCoords = vector3(342.28, -571.68, 28.79),
        authorizedJobs = { 'ambulance','admin' },
        locked = true,
        distance = 4,
        doors = {
            {
                objName = 'V_ILev_Cor_FireDoor',
                objYaw = 250.0,
                objCoords  = vector3(341.47, -572.0, 28.79),
            },

            {
                objName = 'V_ILev_Cor_FireDoor',
                objYaw = 70.0,
                objCoords  = vector3(341.82, -570.81, 28.79),
            }
        }
    },
	
			    {
        textCoords = vector3(345.89, -568.92, 28.79),
        authorizedJobs = { 'ambulance','admin' },
        locked = true,
        distance = 4,
        doors = {
            {
                objName = 'V_ILev_Cor_FireDoor',
                objYaw = 160.0,
                objCoords  = vector3(345.7, -568.17, 28.79),
            },

            {
                objName = 'V_ILev_Cor_FireDoor',
                objYaw = -19.0,
                objCoords  = vector3(346.82, -568.44, 28.79),
            }
        }
    },
	
	
			    {
        textCoords = vector3(345.98, -572.89, 28.79),
        authorizedJobs = { 'ambulance','admin' },
        locked = true,
        distance = 4,
        doors = {
            {
                objName = 'V_ILev_Cor_FireDoor',
                objYaw = 70.0,
                objCoords  = vector3(346.43, -572.69, 28.79),
            },

            {
                objName = 'V_ILev_Cor_FireDoor',
                objYaw = -110.0,
                objCoords  = vector3(346.41, -573.46, 28.79),
            }
        }
    },
	
		{
		objName = 'V_ILev_Cor_FireDoorWide',
		objYaw = 160.0,
		objCoords  = vector3(333.24, -588.02, 28.79),
		textCoords = vector3(333.24, -588.02, 28.79),
		authorizedJobs = { 'ambulance','admin' },
		locked = true
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = { 'police', 'police_off' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vector3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vector3(469.9, -1014.4, 26.5)
			}
		}
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = { 'police', 'police_off' },
		locked = true,
		distance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objYaw = 30.0,
		objCoords  = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = { 'police', 'police_off' },
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = { 'police', 'police_off' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_shrf2door',
				objYaw = -45.0,
				objCoords  = vector3(-443.1, 6015.6, 31.7),
			},

			{
				objName = 'v_ilev_shrf2door',
				objYaw = 135.0,
				objCoords  = vector3(-443.9, 6016.6, 31.7)
			}
		}
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police', 'police_off' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police', 'police_off' },
		locked = true,
		distance = 12,
		size = 2
	},
	--PUERTA DOBLE COCINA
	{
		textCoords = vector3(260.3, -813.88, 6.07),
		authorizedJobs = { 'restaurante' },
		locked = true,
		doors = {
			{
				objName = 'apa_prop_ss1_mpint_door_l',
				objYaw = 70.0,
				objCoords = vector3(259.84, -814.15, 5.06)
			},

			{
				objName = 'apa_prop_ss1_mpint_door_r',
				objYaw = 70.0,
				objCoords = vector3(260.29, -813.59, 5.06)
			}
		}
	},



	--PUERTA DOBLE JEFE
	{
		textCoords = vector3(261.85, -807.5, 6.07),
		authorizedJobs = { 'restaurante' },
		locked = true,
		doors = {
			{
				objName = 'apa_prop_apa_bankdoor_new',
				objYaw = 70.0,
				objCoords = vector3(261.77, -808.0, 5.06)
			},

			{
				objName = 'apa_prop_apa_bankdoor_new',
				objYaw = -110.0,
				objCoords = vector3(262.0, -807.33, 5.06)
			}
		}
	},


	--PUERTA VIP 
	{
		objName = 'ba_prop_door_club_generic_vip',
		objYaw = 160.0,
		objCoords  = vector3(270.07, -815.12, 5.06),
		textCoords = vector3(269.04, -815.3, 6.07),
		authorizedJobs = { 'restaurante' },
		locked = true
	}

	-- FABRICA MAFIA 1 - 

	--v_ilev_carmod3door


	-- FABRICA MAFIA 2 - 

	--
	-- Addons
	--

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = vector3(420.1, -1017.3, 28.0),
		textCoords = vector3(420.1, -1021.0, 32.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]
}