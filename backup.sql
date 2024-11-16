-- --------------------------------------------------------
-- 호스트:                          192.168.132.130
-- 서버 버전:                        8.0.40 - MySQL Community Server - GPL
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- myapp-sql 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `myapp-sql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myapp-sql`;

-- 테이블 myapp-sql.answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `question_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 myapp-sql.answer:~2 rows (대략적) 내보내기
INSERT IGNORE INTO `answer` (`id`, `content`, `create_date`, `question_id`, `user_id`, `modify_date`) VALUES
	(1, '네 안녕하세요', '2024-11-16 15:39:37', 1, 1, NULL),
	(2, '확인', '2024-11-16 15:45:01', 203, 1, NULL);

-- 테이블 myapp-sql.answer_voter 구조 내보내기
CREATE TABLE IF NOT EXISTS `answer_voter` (
  `user_id` int NOT NULL,
  `answer_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`answer_id`),
  KEY `answer_id` (`answer_id`),
  CONSTRAINT `answer_voter_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `answer_voter_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 myapp-sql.answer_voter:~1 rows (대략적) 내보내기
INSERT IGNORE INTO `answer_voter` (`user_id`, `answer_id`) VALUES
	(1, 1);

-- 테이블 myapp-sql.question 구조 내보내기
CREATE TABLE IF NOT EXISTS `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 myapp-sql.question:~302 rows (대략적) 내보내기
INSERT IGNORE INTO `question` (`id`, `subject`, `content`, `create_date`, `user_id`, `modify_date`) VALUES
	(1, '안녕하세요', '반갑습니다.', '2024-11-16 15:39:24', 1, NULL),
	(2, '테스트 데이터입니다:[000]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(3, '테스트 데이터입니다:[001]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(4, '테스트 데이터입니다:[002]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(5, '테스트 데이터입니다:[003]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(6, '테스트 데이터입니다:[004]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(7, '테스트 데이터입니다:[005]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(8, '테스트 데이터입니다:[006]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(9, '테스트 데이터입니다:[007]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(10, '테스트 데이터입니다:[008]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(11, '테스트 데이터입니다:[009]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(12, '테스트 데이터입니다:[010]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(13, '테스트 데이터입니다:[011]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(14, '테스트 데이터입니다:[012]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(15, '테스트 데이터입니다:[013]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(16, '테스트 데이터입니다:[014]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(17, '테스트 데이터입니다:[015]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(18, '테스트 데이터입니다:[016]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(19, '테스트 데이터입니다:[017]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(20, '테스트 데이터입니다:[018]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(21, '테스트 데이터입니다:[019]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(22, '테스트 데이터입니다:[020]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(23, '테스트 데이터입니다:[021]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(24, '테스트 데이터입니다:[022]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(25, '테스트 데이터입니다:[023]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(26, '테스트 데이터입니다:[024]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(27, '테스트 데이터입니다:[025]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(28, '테스트 데이터입니다:[026]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(29, '테스트 데이터입니다:[027]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(30, '테스트 데이터입니다:[028]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(31, '테스트 데이터입니다:[029]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(32, '테스트 데이터입니다:[030]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(33, '테스트 데이터입니다:[031]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(34, '테스트 데이터입니다:[032]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(35, '테스트 데이터입니다:[033]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(36, '테스트 데이터입니다:[034]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(37, '테스트 데이터입니다:[035]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(38, '테스트 데이터입니다:[036]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(39, '테스트 데이터입니다:[037]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(40, '테스트 데이터입니다:[038]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(41, '테스트 데이터입니다:[039]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(42, '테스트 데이터입니다:[040]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(43, '테스트 데이터입니다:[041]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(44, '테스트 데이터입니다:[042]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(45, '테스트 데이터입니다:[043]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(46, '테스트 데이터입니다:[044]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(47, '테스트 데이터입니다:[045]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(48, '테스트 데이터입니다:[046]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(49, '테스트 데이터입니다:[047]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(50, '테스트 데이터입니다:[048]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(51, '테스트 데이터입니다:[049]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(52, '테스트 데이터입니다:[050]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(53, '테스트 데이터입니다:[051]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(54, '테스트 데이터입니다:[052]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(55, '테스트 데이터입니다:[053]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(56, '테스트 데이터입니다:[054]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(57, '테스트 데이터입니다:[055]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(58, '테스트 데이터입니다:[056]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(59, '테스트 데이터입니다:[057]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(60, '테스트 데이터입니다:[058]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(61, '테스트 데이터입니다:[059]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(62, '테스트 데이터입니다:[060]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(63, '테스트 데이터입니다:[061]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(64, '테스트 데이터입니다:[062]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(65, '테스트 데이터입니다:[063]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(66, '테스트 데이터입니다:[064]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(67, '테스트 데이터입니다:[065]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(68, '테스트 데이터입니다:[066]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(69, '테스트 데이터입니다:[067]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(70, '테스트 데이터입니다:[068]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(71, '테스트 데이터입니다:[069]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(72, '테스트 데이터입니다:[070]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(73, '테스트 데이터입니다:[071]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(74, '테스트 데이터입니다:[072]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(75, '테스트 데이터입니다:[073]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(76, '테스트 데이터입니다:[074]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(77, '테스트 데이터입니다:[075]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(78, '테스트 데이터입니다:[076]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(79, '테스트 데이터입니다:[077]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(80, '테스트 데이터입니다:[078]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(81, '테스트 데이터입니다:[079]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(82, '테스트 데이터입니다:[080]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(83, '테스트 데이터입니다:[081]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(84, '테스트 데이터입니다:[082]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(85, '테스트 데이터입니다:[083]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(86, '테스트 데이터입니다:[084]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(87, '테스트 데이터입니다:[085]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(88, '테스트 데이터입니다:[086]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(89, '테스트 데이터입니다:[087]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(90, '테스트 데이터입니다:[088]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(91, '테스트 데이터입니다:[089]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(92, '테스트 데이터입니다:[090]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(93, '테스트 데이터입니다:[091]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(94, '테스트 데이터입니다:[092]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(95, '테스트 데이터입니다:[093]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(96, '테스트 데이터입니다:[094]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(97, '테스트 데이터입니다:[095]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(98, '테스트 데이터입니다:[096]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(99, '테스트 데이터입니다:[097]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(100, '테스트 데이터입니다:[098]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(101, '테스트 데이터입니다:[099]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(102, '테스트 데이터입니다:[100]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(103, '테스트 데이터입니다:[101]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(104, '테스트 데이터입니다:[102]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(105, '테스트 데이터입니다:[103]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(106, '테스트 데이터입니다:[104]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(107, '테스트 데이터입니다:[105]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(108, '테스트 데이터입니다:[106]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(109, '테스트 데이터입니다:[107]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(110, '테스트 데이터입니다:[108]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(111, '테스트 데이터입니다:[109]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(112, '테스트 데이터입니다:[110]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(113, '테스트 데이터입니다:[111]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(114, '테스트 데이터입니다:[112]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(115, '테스트 데이터입니다:[113]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(116, '테스트 데이터입니다:[114]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(117, '테스트 데이터입니다:[115]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(118, '테스트 데이터입니다:[116]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(119, '테스트 데이터입니다:[117]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(120, '테스트 데이터입니다:[118]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(121, '테스트 데이터입니다:[119]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(122, '테스트 데이터입니다:[120]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(123, '테스트 데이터입니다:[121]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(124, '테스트 데이터입니다:[122]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(125, '테스트 데이터입니다:[123]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(126, '테스트 데이터입니다:[124]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(127, '테스트 데이터입니다:[125]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(128, '테스트 데이터입니다:[126]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(129, '테스트 데이터입니다:[127]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(130, '테스트 데이터입니다:[128]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(131, '테스트 데이터입니다:[129]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(132, '테스트 데이터입니다:[130]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(133, '테스트 데이터입니다:[131]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(134, '테스트 데이터입니다:[132]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(135, '테스트 데이터입니다:[133]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(136, '테스트 데이터입니다:[134]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(137, '테스트 데이터입니다:[135]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(138, '테스트 데이터입니다:[136]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(139, '테스트 데이터입니다:[137]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(140, '테스트 데이터입니다:[138]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(141, '테스트 데이터입니다:[139]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(142, '테스트 데이터입니다:[140]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(143, '테스트 데이터입니다:[141]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(144, '테스트 데이터입니다:[142]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(145, '테스트 데이터입니다:[143]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(146, '테스트 데이터입니다:[144]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(147, '테스트 데이터입니다:[145]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(148, '테스트 데이터입니다:[146]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(149, '테스트 데이터입니다:[147]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(150, '테스트 데이터입니다:[148]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(151, '테스트 데이터입니다:[149]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(152, '테스트 데이터입니다:[150]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(153, '테스트 데이터입니다:[151]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(154, '테스트 데이터입니다:[152]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(155, '테스트 데이터입니다:[153]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(156, '테스트 데이터입니다:[154]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(157, '테스트 데이터입니다:[155]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(158, '테스트 데이터입니다:[156]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(159, '테스트 데이터입니다:[157]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(160, '테스트 데이터입니다:[158]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(161, '테스트 데이터입니다:[159]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(162, '테스트 데이터입니다:[160]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(163, '테스트 데이터입니다:[161]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(164, '테스트 데이터입니다:[162]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(165, '테스트 데이터입니다:[163]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(166, '테스트 데이터입니다:[164]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(167, '테스트 데이터입니다:[165]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(168, '테스트 데이터입니다:[166]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(169, '테스트 데이터입니다:[167]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(170, '테스트 데이터입니다:[168]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(171, '테스트 데이터입니다:[169]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(172, '테스트 데이터입니다:[170]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(173, '테스트 데이터입니다:[171]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(174, '테스트 데이터입니다:[172]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(175, '테스트 데이터입니다:[173]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(176, '테스트 데이터입니다:[174]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(177, '테스트 데이터입니다:[175]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(178, '테스트 데이터입니다:[176]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(179, '테스트 데이터입니다:[177]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(180, '테스트 데이터입니다:[178]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(181, '테스트 데이터입니다:[179]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(182, '테스트 데이터입니다:[180]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(183, '테스트 데이터입니다:[181]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(184, '테스트 데이터입니다:[182]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(185, '테스트 데이터입니다:[183]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(186, '테스트 데이터입니다:[184]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(187, '테스트 데이터입니다:[185]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(188, '테스트 데이터입니다:[186]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(189, '테스트 데이터입니다:[187]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(190, '테스트 데이터입니다:[188]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(191, '테스트 데이터입니다:[189]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(192, '테스트 데이터입니다:[190]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(193, '테스트 데이터입니다:[191]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(194, '테스트 데이터입니다:[192]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(195, '테스트 데이터입니다:[193]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(196, '테스트 데이터입니다:[194]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(197, '테스트 데이터입니다:[195]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(198, '테스트 데이터입니다:[196]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(199, '테스트 데이터입니다:[197]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(200, '테스트 데이터입니다:[198]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(201, '테스트 데이터입니다:[199]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(202, '테스트 데이터입니다:[200]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(203, '테스트 데이터입니다:[201]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(204, '테스트 데이터입니다:[202]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(205, '테스트 데이터입니다:[203]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(206, '테스트 데이터입니다:[204]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(207, '테스트 데이터입니다:[205]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(208, '테스트 데이터입니다:[206]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(209, '테스트 데이터입니다:[207]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(210, '테스트 데이터입니다:[208]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(211, '테스트 데이터입니다:[209]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(212, '테스트 데이터입니다:[210]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(213, '테스트 데이터입니다:[211]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(214, '테스트 데이터입니다:[212]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(215, '테스트 데이터입니다:[213]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(216, '테스트 데이터입니다:[214]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(217, '테스트 데이터입니다:[215]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(218, '테스트 데이터입니다:[216]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(219, '테스트 데이터입니다:[217]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(220, '테스트 데이터입니다:[218]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(221, '테스트 데이터입니다:[219]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(222, '테스트 데이터입니다:[220]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(223, '테스트 데이터입니다:[221]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(224, '테스트 데이터입니다:[222]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(225, '테스트 데이터입니다:[223]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(226, '테스트 데이터입니다:[224]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(227, '테스트 데이터입니다:[225]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(228, '테스트 데이터입니다:[226]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(229, '테스트 데이터입니다:[227]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(230, '테스트 데이터입니다:[228]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(231, '테스트 데이터입니다:[229]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(232, '테스트 데이터입니다:[230]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(233, '테스트 데이터입니다:[231]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(234, '테스트 데이터입니다:[232]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(235, '테스트 데이터입니다:[233]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(236, '테스트 데이터입니다:[234]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(237, '테스트 데이터입니다:[235]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(238, '테스트 데이터입니다:[236]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(239, '테스트 데이터입니다:[237]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(240, '테스트 데이터입니다:[238]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(241, '테스트 데이터입니다:[239]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(242, '테스트 데이터입니다:[240]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(243, '테스트 데이터입니다:[241]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(244, '테스트 데이터입니다:[242]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(245, '테스트 데이터입니다:[243]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(246, '테스트 데이터입니다:[244]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(247, '테스트 데이터입니다:[245]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(248, '테스트 데이터입니다:[246]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(249, '테스트 데이터입니다:[247]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(250, '테스트 데이터입니다:[248]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(251, '테스트 데이터입니다:[249]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(252, '테스트 데이터입니다:[250]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(253, '테스트 데이터입니다:[251]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(254, '테스트 데이터입니다:[252]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(255, '테스트 데이터입니다:[253]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(256, '테스트 데이터입니다:[254]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(257, '테스트 데이터입니다:[255]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(258, '테스트 데이터입니다:[256]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(259, '테스트 데이터입니다:[257]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(260, '테스트 데이터입니다:[258]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(261, '테스트 데이터입니다:[259]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(262, '테스트 데이터입니다:[260]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(263, '테스트 데이터입니다:[261]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(264, '테스트 데이터입니다:[262]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(265, '테스트 데이터입니다:[263]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(266, '테스트 데이터입니다:[264]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(267, '테스트 데이터입니다:[265]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(268, '테스트 데이터입니다:[266]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(269, '테스트 데이터입니다:[267]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(270, '테스트 데이터입니다:[268]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(271, '테스트 데이터입니다:[269]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(272, '테스트 데이터입니다:[270]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(273, '테스트 데이터입니다:[271]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(274, '테스트 데이터입니다:[272]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(275, '테스트 데이터입니다:[273]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(276, '테스트 데이터입니다:[274]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(277, '테스트 데이터입니다:[275]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(278, '테스트 데이터입니다:[276]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(279, '테스트 데이터입니다:[277]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(280, '테스트 데이터입니다:[278]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(281, '테스트 데이터입니다:[279]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(282, '테스트 데이터입니다:[280]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(283, '테스트 데이터입니다:[281]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(284, '테스트 데이터입니다:[282]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(285, '테스트 데이터입니다:[283]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(286, '테스트 데이터입니다:[284]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(287, '테스트 데이터입니다:[285]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(288, '테스트 데이터입니다:[286]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(289, '테스트 데이터입니다:[287]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(290, '테스트 데이터입니다:[288]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(291, '테스트 데이터입니다:[289]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(292, '테스트 데이터입니다:[290]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(293, '테스트 데이터입니다:[291]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(294, '테스트 데이터입니다:[292]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(295, '테스트 데이터입니다:[293]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(296, '테스트 데이터입니다:[294]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(297, '테스트 데이터입니다:[295]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(298, '테스트 데이터입니다:[296]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(299, '테스트 데이터입니다:[297]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(300, '테스트 데이터입니다:[298]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(301, '테스트 데이터입니다:[299]', '내용무', '2024-11-16 15:41:34', NULL, NULL),
	(302, 'zzz', 'zzz', '2024-11-17 00:57:56', 1, NULL);

-- 테이블 myapp-sql.question_voter 구조 내보내기
CREATE TABLE IF NOT EXISTS `question_voter` (
  `user_id` int NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `question_voter_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `question_voter_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 myapp-sql.question_voter:~2 rows (대략적) 내보내기
INSERT IGNORE INTO `question_voter` (`user_id`, `question_id`) VALUES
	(1, 1),
	(1, 206);

-- 테이블 myapp-sql.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 myapp-sql.user:~1 rows (대략적) 내보내기
INSERT IGNORE INTO `user` (`id`, `username`, `password`, `email`) VALUES
	(1, 'aaa', '$2b$12$KjtEN7nuQ5.5AJQbzDIFJeFxaUQWDWgROF9MgnKGRzpfAJrC6emuC', 'aaa@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
