SET @job_name = 'negocio1';
SET @society_name = 'society_ComedyClub';
SET @job_Name_Caps = 'Comedy Club';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  ('society_negocio1_fridge', 'Comedy Club (Refrigerador)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'barman', 'Barman', 300, '{}', '{}'),
  (@job_name, 1, 'dancer', 'RRPP', 300, '{}', '{}'),
  (@job_name, 2, 'viceboss', 'SubJefe', 500, '{}', '{}'),
  (@job_name, 3, 'boss', 'Jefe', 600, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES  
    ('jager', 'Jägermeister', 5),
    ('vodka', 'Vodka', 5),
    ('rhum', 'Ron', 5),
    ('whisky', 'Whisky', 5),
    ('tequila', 'Tequila', 5),
    ('martini', 'Martini blanco', 5),
    ('soda', 'Gaseosa', 5),
    ('jusfruit', 'Jugo de Frutas', 5),
    ('icetea', 'Té Helado', 5),
    ('energy', 'Bebida energizante', 5),
    ('drpepper', 'Dr. Pepper', 5),
    ('limonade', 'Limonada', 5),
    ('bolcacahuetes', 'Maní', 5),
    ('bolnoixcajou', 'Nueces', 5),
    ('bolpistache', 'Pistachos', 5),
    ('bolchips', 'Papas Fritas', 5),
    ('saucisson', 'Salchicha', 5),
    ('grapperaisin', 'Racimo de uvas', 5),
    ('jagerbomb', 'Jägerbomb', 5),
    ('golem', 'Golem', 5),
    ('whiskycoca', 'Whiscola', 5),
    ('vodkaenergy', 'Vodka con Energizante', 5),
    ('vodkafruit', 'Vodka con Jugo de Frutas', 5),
    ('rhumfruit', 'Ron con Jugo de Frutas', 5),
    ('teqpaf', "Shot de Tequila", 5),
    ('rhumcoca', 'Roncola', 5),
    ('mojito', 'Mojito', 5),
    ('ice', 'Hielo', 5),
    ('mixapero', 'Mix Aperitivo', 3),
    ('metreshooter', 'Medidor de Shots', 3),
    ('jagercerbere', 'Jäger Cerberus', 3),
    ('menthe', 'Hoja de Menta', 10)
;
