SET @job_name = 'restaurante';
SET @society_name = 'society_restaurante';
SET @job_Name_Caps = 'Restaurante';

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'barman', 'Bartender', 1450, '{}', '{}'),
  (@job_name, 1, 'seguridad', 'Seguridad', 1450, '{}', '{}'),
  (@job_name, 2, 'cocinero', 'Cocinero', 5000, '{}', '{}'),
  (@job_name, 3, 'boss', 'Dueño', 5000, '{}', '{}')
;



CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
);
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_restaurante', 'Restaurante', 1),
('society_restaurante_fridge', 'Restaurante heladera', 1);




CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(5, 'society_restaurante', 0, NULL);




CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_restaurante', 'Restaurante', 1),
('society_restaurante_fridge', 'IlRistorante heladera', 1);


CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_restaurante', 'IlRistorante', 1);



CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_datastore_owner_name` (`owner`,`name`),
  KEY `index_datastore_name` (`name`)
);
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(2, 'society_restaurante', NULL, '{}');
COMMIT;




CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `whitelisted` tinyint(4) NOT NULL,
  PRIMARY KEY (`name`)
);
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('restaurante', 'Restaurante', 0);



CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
);
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('jagerbomb', 'JaggerBomb', 10, 0, 1),
('golem', 'Golem', 10, 0, 1),
('whiskycoca', 'Whiscola', 10, 0, 1),
('vodkaenergy', 'VodkaE nergy', 10, 0, 1),
('vodkafruit', 'Vodka Frutal', 10, 0, 1),
('rhumfruit', 'Ron Frutal', 10, 0, 1),
('teqpaf', 'Tequilapf', 10, 0, 1),
('rhumcoca', 'Ron con coca', 10, 0, 1),
('mojito', 'Mojito', 10, 0, 1),
('metreshooter', 'Metreshooter', 10, 0, 1),
('jagercerbere', 'Jaggercerbere', 10, 0, 1),
('fernetcoca', 'Fernet con coca', 10, 0, 1),
('energy', 'Energy', 10, 0, 1),
('jager', 'jager', 10, 0, 1),
('limonade', 'Limonada', 10, 0, 1),
('vodka', 'Vodka', 10, 0, 1),
('ice', 'Hielo', 10, 0, 1),
('cocacola', 'Cocacola', 10, 0, 1),
('whisky', 'Whiskey', 10, 0, 1),
('rhum', 'Ron', 10, 0, 1),
('jusfruit', 'Jusfruit', 10, 0, 1),
('bread', 'Pan', 10, 0, 1),
('tequila', 'Tequila', 10, 0, 1),
('menthe', 'Menta', 10, 0, 1),
('fernet', 'Fernet', 10, 0, 1),
('pizza', 'Pizza', 10, 0, 1),
('lasagna', 'Lasagna', 10, 0, 1),
('levadura', 'Levadura', 10, 0, 1),
('harina', 'Harina', 10, 0, 1),
('mozarella', 'Mozarella', 10, 0, 1),
('tomate', 'Tomate', 10, 0, 1),
('picada', 'Picada', 10, 0, 1),
('acelga', 'Acelga', 10, 0, 1);
