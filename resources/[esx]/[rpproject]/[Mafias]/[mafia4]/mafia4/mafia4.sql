USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mafia4', 'mafia4', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mafia4', 'mafia4', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mafia4', 'mafia4', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mafia4','Mafia 4')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mafia4',0,'recruit','Miembro1',0,'{}','{}'),
	('mafia4',1,'officer','Miembro2',0,'{}','{}'),
	('mafia4',2,'sergeant','Miebro3',0,'{}','{}'),
	('mafia4',3,'lieutenant','Subjefe',0,'{}','{}'),
	('mafia4',4,'boss','Jefe',0,'{}','{}')
;
