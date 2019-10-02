USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mafia3', 'mafia3', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mafia3', 'mafia3', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mafia3', 'mafia3', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mafia3','Mafia 3')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mafia3',0,'recruit','Miembro1',0,'{}','{}'),
	('mafia3',1,'officer','Miembro2',0,'{}','{}'),
	('mafia3',2,'sergeant','Miebro3',0,'{}','{}'),
	('mafia3',3,'lieutenant','Subjefe',0,'{}','{}'),
	('mafia3',4,'boss','Jefe',0,'{}','{}')
;
