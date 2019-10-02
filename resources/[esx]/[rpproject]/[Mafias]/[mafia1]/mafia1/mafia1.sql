USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mafia1', 'La Bratva', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mafia1', 'La Bratva', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mafia1', 'La Bratva', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mafia1','La Bratva')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mafia1',0,'chef','Brigadier',0,'{}','{}'),
	('mafia1',0,'chef','Obshchak',0,'{}','{}'),
	('mafia1',0,'chef','Advokat',0,'{}','{}'),
	('mafia1',1,'officer','Byk',0,'{}','{}'),
	('mafia1',2,'sergeant','Sovetnik',0,'{}','{}'),
	('mafia1',3,'lieutenant','Ja Pakhan',0,'{}','{}'),
	('mafia1',4,'boss','Pakhan',0,'{}','{}')
;
