-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.33 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for travel
CREATE DATABASE IF NOT EXISTS `travel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `travel`;

-- Dumping structure for table travel.govt_interaction
CREATE TABLE IF NOT EXISTS `govt_interaction` (
  `DateOfPublication` date DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Publication` varchar(50) DEFAULT NULL,
  `Headline` varchar(50) DEFAULT NULL,
  `Link` varchar(50) DEFAULT NULL,
  `GovtInteraction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table travel.govt_interaction: ~30 rows (approximately)
REPLACE INTO `govt_interaction` (`DateOfPublication`, `Description`, `Publication`, `Headline`, `Link`, `GovtInteraction`) VALUES
	('2023-12-30', 'waljkdhiowdu', 'PUBLICATION', 'kwjadgukahdjawhdil', '', NULL),
	('2022-11-30', 'adkjahdoiajd', 'ajkdhajwdhaoid', 'kjawdoadajkdn', 'https://www.example.com', 'Yes'),
	('2020-12-01', 'kaefoijqwhenof', 'kjabfkaefjkan', 'akwndlafnla', 'jkandladak', 'Yes'),
	('2023-10-17', 'ajkedibajbfajfkab', 'TIMES OF INDIA', 'iawjdaoiwdj', 'www.example.com`', 'Yes'),
	('2023-10-17', 'ajkedibajbfajfkab', 'TIMES OF INDIA', 'iawjdaoiwdj', 'www.example.com`', 'Yes'),
	('2021-01-01', 'ajkedibajbfajfkab', 'Republic bharat', 'hjeagduahwd', 'kwjdhakdhajdahd', 'Yes'),
	('2022-10-31', 'Work', 'Gujrat samachar', 'Work', '', 'Yes'),
	('2022-10-31', 'Work', 'Gujrat samachar', 'Work', '', 'Yes'),
	(NULL, NULL, NULL, NULL, NULL, NULL),
	('2022-12-31', 'akhedghiad', 'TIMES OF INDIA', 'Important News', 'https://www.example.com', 'Yes'),
	(NULL, NULL, NULL, NULL, NULL, NULL),
	('2023-10-25', 'akhedghiad', '', 'Work', '', NULL),
	('2023-11-30', 'akhedghiad', 'Gujrat samachar', 'Work', 'http://www.wdwdkhadgajd.com', 'Yes'),
	('2023-10-19', 'ajkedibajbfajfkab', 'Gujrat samachar', 'Work', '', NULL),
	('2023-10-19', 'ajkedibajbfajfkab', 'Gujrat samachar', 'Work', '', NULL),
	('2023-10-25', 'ajkedibajbfajfkab', '', 'Work', '', NULL),
	('2023-12-31', 'Work', 'hewgdkahd', 'Important News', 'http://www.wdwdkhadgajd.com', 'Yes'),
	('2023-12-01', 'jkwdnoqfj', 'jwdlailfkqp`', 'kjqaijwdhoiajd', 'kjawndiojwadjp', 'No'),
	('2023-12-01', 'jkwdnoqfj', 'jwdlailfkqp`', 'kjqaijwdhoiajd', 'kjawndiojwadjp', 'No'),
	('2023-10-26', 'akhedghiad', 'TIMES OF INDIA', 'Important News', 'www.example.com`', 'Yes'),
	('2023-10-26', 'akhedghiad', 'TIMES OF INDIA', 'Important News', 'www.example.com`', 'Yes'),
	('2021-11-01', 'ajkedibajbfajfkab', 'TIMES OF INDIA', 'Important News', 'kwjdhakdhajdahd', 'No'),
	(NULL, NULL, NULL, NULL, NULL, NULL),
	(NULL, NULL, NULL, NULL, NULL, NULL),
	('2023-11-30', 'akhedghiad', 'TIMES OF INDIA', 'Important News', 'http://www.wdwdkhadgajd.com', 'No'),
	('2023-11-30', 'akhedghiad', 'TIMES OF INDIA', 'Important News', 'http://www.wdwdkhadgajd.com', 'No'),
	('2023-11-30', 'akhedghiad', 'TIMES OF INDIA', 'Important News', 'http://www.wdwdkhadgajd.com', 'No'),
	('2023-11-30', 'akhedghiad', 'TIMES OF INDIA', 'Important News', 'http://www.wdwdkhadgajd.com', 'No'),
	('2023-11-30', 'akhedghiad', 'TIMES OF INDIA', 'Important News', 'http://www.wdwdkhadgajd.com', 'No'),
	('2023-11-30', 'akhedghiad', 'TIMES OF INDIA', 'Important News', 'http://www.wdwdkhadgajd.com', 'No');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
