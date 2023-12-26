-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 10.4.18-MariaDB - mariadb.org binary distribution
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk jwt_ci3_server
CREATE DATABASE IF NOT EXISTS `jwt_ci3_server` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `jwt_ci3_server`;

-- membuang struktur untuk table jwt_ci3_server.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel jwt_ci3_server.user: ~16 rows (lebih kurang)
INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
	(1, 'alex', 'alex@gmail.com', '12345'),
	(2, 'alex', 'alex@gmail.com', '12345'),
	(3, 'alex', 'alex@gmail.com', '12345'),
	(4, 'alex', 'alex@gmail.com', '12345'),
	(5, 'alex', 'alex@gmail.com', '12345'),
	(6, 'alex', 'alex@gmail.com', '12345'),
	(7, 'alex', 'alex@gmail.com', '12345'),
	(8, 'admin_tester', 'admin@gmail.com', '12345'),
	(9, '1400003', 'admin@gmail.com', '12345'),
	(10, '1400003', 'admin@gmail.com', '34566'),
	(11, 'ebola212@gmail.com', 'eflixjunior@gmail.com', '123'),
	(12, NULL, 'bayu@gmail.com', '$2y$10$sMbspOon2xRUW.eJZ6e/Qe.fbC98lUAUmuPiRn5pYgI'),
	(13, 'andi', 'andi@gmail.com', '$2y$10$HbY4OCD2L7CkB5hWKSXaBuxeNDnxiBMDzCscWhFXmBk'),
	(14, 'budi', 'budi1@gmail.com', '$2y$10$YU.Wjxmb5j7J.4A94yAwq.CckRw052wkt0EaqkxyP42'),
	(15, 'maya', 'maya@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
	(16, 'apri', 'apri@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
	(17, 'janji', 'janji@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
