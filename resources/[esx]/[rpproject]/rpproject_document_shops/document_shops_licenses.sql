USE `essentialmode`;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
	('id_card', 'Identificación', 1, 0, 0),
	('health_card', 'Carné de Salud', 1, 0, 0),
	('drive_card', 'Licencia de Conducir', 1, 0, 0),
	('weapon_card', 'Licencia de Armas', 1, 0, 0),
;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('health_license', 'Carné de Salud'),
;