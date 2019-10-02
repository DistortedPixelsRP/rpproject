SET @job_name = 'foodtruck';
SET @society_name = 'society_foodtruck';
SET @job_Name_Caps = 'Foodtruck';



INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'cook', 'Cook', 200, '{}', '{}'),
  (@job_name, 1, 'boss', 'Owner', 300, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES  
('pollo', 'Pollo', 200, 0, 1),
('hamburguesa', 'Hamburguesa', 20, 0, 1),
('choripan', 'Choripan', 20, 0, 1),
('vegetales', 'Vegetales', 100, 0, 1),
('tacos', 'Tacos', 20, 0, 1),
('harina', 'Harina', 50, 0, 1),
('picada', 'Carne picada', 50, 0, 1),
('chorizo', 'Chorizo', 100, 0, 1),
('pan', 'Pan', 200, 0, 1),
('chile', 'Chile', 100, 0, 1),
('fajita', 'Fajita', 20, 0, 1),
('tamal', 'Tamal', 20, 0, 1);
;

INSERT INTO `shops` (`store`, `item`, `price`) VALUES
('Market', 'harina', 50),
('Market', 'picada', 50),
('Market', 'chorizo', 50),
('Market', 'pan', 50),
('Market', 'vegetales', 50),
('Market', 'chile', 50),
('Market', 'pollo', 50);
;
