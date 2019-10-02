USE `essentialmode`;

CREATE TABLE `gunlicenses` (
	`type` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`type`)
);

CREATE TABLE `user_gunlicenses` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`type` varchar(60) NOT NULL,
	`owner` varchar(60) NOT NULL,

	PRIMARY KEY (`id`)
);