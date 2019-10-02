USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mafia2', 'Bagna Cauda', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_mafia2', 'Bagna Cauda', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mafia2', 'Bagna Cauda', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mafia2','Bagna Cauda')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mafia2',0,'recruit','Socio',0,'{}','{}'),
	('mafia2',0,'officer','Detective',0,'{}','{}'),
	('mafia2',0,'officer','Tesorero',0,'{}','{}'),
	('mafia2',1,'officer','Dealer',0,'{}','{}'),
	('mafia2',2,'sergeant','Sicario',0,'{}','{}'),
	('mafia2',3,'lieutenant','Sub Jefe',0,'{}','{}'),
	('mafia2',4,'boss','Jefe',0,'{}','{}')
;
