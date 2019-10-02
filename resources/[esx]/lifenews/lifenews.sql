USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_lifenews', 'lifenews', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_lifenews', 'lifenews', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_lifenews', 'lifenews', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('lifenews','Life News')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('lifenews',0,'recruit','Reportero',20,'{}','{}'),
	('lifenews',1,'officer','Camarografo',40,'{}','{}'),
	('lifenews',2,'sergeant','Secretario',60,'{}','{}'),
	('lifenews',3,'lieutenant','Manager',85,'{}','{}'),
	('lifenews',4,'boss','Dueño',100,'{}','{}')
;
