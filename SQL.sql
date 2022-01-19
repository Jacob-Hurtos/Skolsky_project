-- --------------------------------------------------------
-- Hostiteľ:                     127.0.0.1
-- Verze serveru:                10.4.21-MariaDB - mariadb.org binary distribution
-- OS serveru:                   Win64
-- HeidiSQL Verzia:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportování struktury databáze pro
CREATE DATABASE IF NOT EXISTS `pzatrestnyregister` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `pzatrestnyregister`;

-- Exportování struktury pro tabulka pzatrestnyregister.ciselnik
CREATE TABLE IF NOT EXISTS `ciselnik` (
  `id` int(11) NOT NULL,
  `povolany_ako` varchar(255) DEFAULT NULL,
  `narodnost` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_ciselnik_pouzivatelia` FOREIGN KEY (`id`) REFERENCES `pouzivatelia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku pzatrestnyregister.ciselnik: ~8 rows (přibližně)
/*!40000 ALTER TABLE `ciselnik` DISABLE KEYS */;
INSERT INTO `ciselnik` (`id`, `povolany_ako`, `narodnost`) VALUES
	(1, 'Pravny_zastupca', 'Slovenska'),
	(2, 'Sudca', 'Ceska'),
	(3, 'Veduci_oddelenia_pz', 'Slovenska'),
	(4, 'Clen_pz', 'Slovenska'),
	(5, 'Pravny_zastupca', 'Nemecka'),
	(6, 'Sudca', 'Polska'),
	(7, 'Clen_pz', 'Ceska'),
	(8, 'Sudca', 'Slovenska');
/*!40000 ALTER TABLE `ciselnik` ENABLE KEYS */;

-- Exportování struktury pro tabulka pzatrestnyregister.detaily_sudu
CREATE TABLE IF NOT EXISTS `detaily_sudu` (
  `case_id` int(11) NOT NULL,
  `termin` datetime DEFAULT NULL,
  `sudca_id` int(11) DEFAULT NULL,
  `stav_trestneho_stihania` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  KEY `FK_detaily_sudu_pouzivatelia` (`sudca_id`),
  CONSTRAINT `FK_detaily_sudu_pouzivatelia` FOREIGN KEY (`sudca_id`) REFERENCES `pouzivatelia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku pzatrestnyregister.detaily_sudu: ~10 rows (přibližně)
/*!40000 ALTER TABLE `detaily_sudu` DISABLE KEYS */;
INSERT INTO `detaily_sudu` (`case_id`, `termin`, `sudca_id`, `stav_trestneho_stihania`) VALUES
	(1, '2021-01-21 06:03:13', 8, 'Odsudeny'),
	(2, '2022-03-05 12:03:53', 2, 'Cakajuci_na_verdikt'),
	(3, '2022-01-18 16:08:33', 6, 'Podmienka'),
	(4, '2015-05-06 08:09:39', 8, 'Odsudeny'),
	(5, '2022-01-15 09:03:05', 8, 'Odsudeny'),
	(6, '2022-02-01 06:11:50', 2, 'Cakajuci_na_verdikt'),
	(7, '2019-05-03 07:13:49', 6, 'Odsudeny'),
	(8, '2008-02-04 09:25:17', 2, 'Podmienka'),
	(9, '2012-04-06 12:35:53', 8, 'Odsudeny'),
	(10, '2022-04-20 12:00:32', 6, 'Cakajuci_na_verdikt');
/*!40000 ALTER TABLE `detaily_sudu` ENABLE KEYS */;

-- Exportování struktury pro tabulka pzatrestnyregister.pouzivatelia
CREATE TABLE IF NOT EXISTS `pouzivatelia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meno` varchar(255) DEFAULT NULL,
  `priezvisko` varchar(255) DEFAULT NULL,
  `vytvoreny` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_pouzivatelia_ciselnik` FOREIGN KEY (`id`) REFERENCES `ciselnik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku pzatrestnyregister.pouzivatelia: ~8 rows (přibližně)
/*!40000 ALTER TABLE `pouzivatelia` DISABLE KEYS */;
INSERT INTO `pouzivatelia` (`id`, `meno`, `priezvisko`, `vytvoreny`) VALUES
	(1, 'Peter', 'Okruhly', '2000-03-23 08:21:30'),
	(2, 'Jan', 'Dudo', '2012-02-08 16:22:29'),
	(3, 'Ferdinand', 'Doskocil', '2022-01-19 06:26:55'),
	(4, 'Jozef', 'Tichy', '2013-02-06 07:08:09'),
	(5, 'Fritz', 'Rote', '2022-01-19 06:30:20'),
	(6, 'Stanislaus', 'Parepasz', '2009-03-03 03:03:03'),
	(7, 'Dusan', 'Spokojny', '2022-01-19 06:30:55'),
	(8, 'Pavol', 'Nezabudol', '2018-01-26 10:43:40');
/*!40000 ALTER TABLE `pouzivatelia` ENABLE KEYS */;

-- Exportování struktury pro tabulka pzatrestnyregister.register
CREATE TABLE IF NOT EXISTS `register` (
  `meno` varchar(255) DEFAULT NULL,
  `priezvisko` varchar(255) DEFAULT NULL,
  `zaciatok_trestneho_stihania` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vek` int(11) DEFAULT NULL,
  `zodpovedny_clen_PZ_id` int(11) DEFAULT NULL,
  `pravny_zastupca_id` int(11) DEFAULT NULL,
  `case_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`case_id`),
  KEY `pravny_zastupca_id` (`pravny_zastupca_id`),
  KEY `zodpovedny_clen_PZ_id` (`zodpovedny_clen_PZ_id`) USING BTREE,
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`pravny_zastupca_id`) REFERENCES `pouzivatelia` (`id`),
  CONSTRAINT `register_ibfk_2` FOREIGN KEY (`case_id`) REFERENCES `detaily_sudu` (`case_id`),
  CONSTRAINT `register_ibfk_3` FOREIGN KEY (`zodpovedny_clen_PZ_id`) REFERENCES `pouzivatelia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku pzatrestnyregister.register: ~10 rows (přibližně)
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` (`meno`, `priezvisko`, `zaciatok_trestneho_stihania`, `vek`, `zodpovedny_clen_PZ_id`, `pravny_zastupca_id`, `case_id`) VALUES
	('Karol', 'Mrtvy', '2020-05-19 06:49:14', 38, 4, 1, 1),
	('Vojtech', 'Krivy', '2022-01-03 06:51:42', 45, 7, 1, 2),
	('Marek', 'Zakopol', '2021-11-18 07:30:48', 30, 7, 5, 3),
	('Ignac', 'Zcervenal', '2022-01-19 07:33:58', 58, 7, 5, 4),
	('Radoslav', 'Nadradeny', '2020-06-03 08:35:33', 35, 4, 5, 5),
	('Laco', 'Opuchol', '2022-01-19 07:37:35', 19, 4, 1, 6),
	('Andrej', 'Deprimovany', '2022-01-19 07:39:10', 50, 7, 5, 7),
	('Boris', 'Prehnal', '2006-12-11 10:41:05', 33, 4, 1, 8),
	('Jana', 'Slepa', '2022-01-19 07:44:17', 42, 7, 1, 9),
	('Barbora', 'Stastna', '2022-01-19 07:46:08', 28, 4, 5, 10);
/*!40000 ALTER TABLE `register` ENABLE KEYS */;

-- Exportování struktury pro tabulka pzatrestnyregister.vystup
CREATE TABLE IF NOT EXISTS `vystup` (
  `case_id` int(11) NOT NULL,
  `vystupny_trest` varchar(50) DEFAULT NULL,
  `zariadenie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  CONSTRAINT `FK_vystup_detaily_sudu` FOREIGN KEY (`case_id`) REFERENCES `detaily_sudu` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Exportování dat pro tabulku pzatrestnyregister.vystup: ~0 rows (přibližně)
/*!40000 ALTER TABLE `vystup` DISABLE KEYS */;
INSERT INTO `vystup` (`case_id`, `vystupny_trest`, `zariadenie`) VALUES
	(1, '5 rok', 'Bratislava'),
	(2, '-', '-'),
	(3, '3 rok - pod', '-'),
	(4, 'doživotie', 'Bratislava'),
	(5, '15 rok', 'Martin'),
	(6, '-', '-'),
	(7, '10 rok', 'Prešov'),
	(8, '5 rok - pod', '-'),
	(9, '25 rok', 'Bratislava'),
	(10, '-', '-');
/*!40000 ALTER TABLE `vystup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
