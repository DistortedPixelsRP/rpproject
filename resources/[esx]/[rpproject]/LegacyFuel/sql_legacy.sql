-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.37-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla essentialmode.legacy_fuel
CREATE TABLE IF NOT EXISTS `legacy_fuel` (
  `station_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Volcando datos para la tabla essentialmode.legacy_fuel: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `legacy_fuel` DISABLE KEYS */;
INSERT INTO `legacy_fuel` (`station_name`, `stock`) VALUES
	('estacion_1', 4),
	('estacion_2', 1),
	('estacion_3', 1),
	('estacion_4', 1),
	('estacion_5', 1),
	('estacion_6', 1),
	('estacion_7', 1),
	('estacion_8', 1),
	('estacion_9', 1),
	('estacion_10', 1),
	('estacion_11', 1),
	('estacion_12', 1),
	('estacion_13', 1),
	('estacion_14', 1),
	('estacion_15', 1),
	('estacion_16', 1),
	('estacion_17', 1),
	('estacion_18', 1),
	('estacion_19', 1),
	('estacion_20', 1),
	('estacion_21', 1),
	('estacion_22', 1),
	('estacion_23', 1),
	('estacion_24', 1),
	('estacion_25', 1),
	('estacion_26', 1),
	('estacion_27', 1);
/*!40000 ALTER TABLE `legacy_fuel` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
