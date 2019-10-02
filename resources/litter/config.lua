local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Config              = {}
Config.OpenMenuSpawn= {x = 327.49, y = -594.42, z = 43.29}
Config.Depth = -2.5
Config.Height = 0.5

Config.Press = {
	open_menu = Keys["E"],
	take_bed = Keys["E"],
	do_action = Keys["E"],
	out_vehicle_bed = Keys["E"],
	release_bed = Keys["E"],
	in_vehicle_bed = Keys["E"],
	go_out_bed = Keys["E"],
}

Config.Language = {
	name_hospital = 'Hospital',
	open_menu = 'Presiona ~b~E',
	do_action = 'Presiona ~INPUT_CONTEXT~ para hacer una accion',
	take_bed = "Presiona~INPUT_CONTEXT~ para tomar la cama",
	release_bed = "Presiona ~INPUT_CONTEXT~ para dejar la cama",
	in_vehicle_bed = "Presiona ~INPUT_CONTEXT~ para guardar la cama",
	out_vehicle_bed = "Presiona sur ~INPUT_CONTEXT~ para levantarse de la cama",
	go_out_bed = "Levantate de la cama",
	delete_bed = "Eliminar cama",
	lit_1 = "Camilla",
	lit_2 = "Cama colcon verde",
	lit_3 = "Cama acolchonada Azul",
	anim = {
		spawn_command = "Civil",
		lie_back = "Acostarse Boca Arriba",
		sit_right = "Sentarse a la derecha de la cama",
		sit_left = "Sentarse a la Izquierda de la cama",
		convulse = "Convulsivar?",
		pls = "Estar en PLS?",
	}
}