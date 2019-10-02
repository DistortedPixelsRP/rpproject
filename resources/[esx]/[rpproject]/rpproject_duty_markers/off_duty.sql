USE `essentialmode`;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('police_off', 'Fuera de Servicio', 1),
	('ambulance_off', 'Fuera de Servicio', 1),
	('taxi_off', 'Fuera de Servicio', 1),
	('mechanic_off', 'Fuera de Servicio', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('police_off',0,'recruit','Recluta',2500,'{}','{}'),
  ('police_off',1,'officer','Oficial',2500,'{}','{}'),
  ('police_off',2,'sergeant','Sargento',2500,'{}','{}'),
  ('police_off',3,'lieutenant','Teniente',2500,'{}','{}'),
  ('police_off',4,'boss','Jefe de Policias',2500,'{}','{}'),
  
  ('ambulance_off',0,'ambulance','Enfermero',2500,'{}','{}'),
  ('ambulance_off',1,'doctor','Doctor',2500,'{}','{}'),
  ('ambulance_off',2,'chief_doctor','Dr. Post Grado',2500,'{}','{}'),
  ('ambulance_off',3,'boss','Jefe de Médicos',2500,'{}','{}'),

  ('taxi_off',0,'recrue','Novato',1000,'{}','{}'),
  ('taxi_off',1,'novice','Aprendíz',1000,'{}','{}'),
  ('taxi_off',2,'experimente','Experimentado',1000,'{}','{}'),
  ('taxi_off',3,'uber','Dueño de Choche',1000,'{}','{}'),
  ('taxi_off',4,'boss','Patrón',1000,'{}','{}'),

  ('mechanic_off',0,'recrue','Recluta',1500,'{}','{}'),
  ('mechanic_off',1,'novice','Principiante',1500,'{}','{}'),
  ('mechanic_off',2,'experimente','Experimentado',1500,'{}','{}'),
  ('mechanic_off',3,'chief','Ingeniero',1500,'{}','{}'),
  ('mechanic_off',4,'boss','Patrón',1500,'{}','{}')
;