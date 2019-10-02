USE `essentialmode`;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('miner', 'Minero', 0),
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('miner', 0, 'Minero', 'Aprendiz', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('stone', 'Piedra', 100),
	('copper_rock', 'Mena de cobre', 100),
	('copper_ingot', 'Lingote de cobre', 100),
	('iron_rock', 'Mena de hierro', 100),
	('iron_ingot', 'Lingote de hierro', 100),
	('gold_rock', 'Mena de oro', 100),
	('gold_ingot', 'Lingote de oro', 100),
	('diamond_rock', 'Diamante en bruto', 100),
	('neumatic_hammer', 'Martillo neumatico', 1),
;
