-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: tripssoda.cdsbd1wcf9nx.ap-northeast-2.rds.amazonaws.com    Database: tripssoda
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `accompany`
--

DROP TABLE IF EXISTS `accompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accompany` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '동행 게시글 번호',
  `user_id` int NOT NULL COMMENT '글 작성자',
  `nickname` varchar(800) NOT NULL,
  `region_code` tinyint DEFAULT NULL,
  `start_at` date NOT NULL COMMENT 'Date로 저장. 입력 안하면 오늘 날짜를 기본값.',
  `end_at` date NOT NULL COMMENT 'Date로 저장. 입력 안하면 오늘 날짜를 기본값.',
  `thumbnail` varchar(100) DEFAULT NULL COMMENT '글쓸때 사진을 업로드. 업로드를 안하면 기본 사진 중 랜덤하게 출력.',
  `status` tinyint DEFAULT '0' COMMENT '처음엔 모집중으로 뜨고, 모임날짜to 이후에는 자동으로 지난여행으로 바뀌고 동행신청을 못하게 된다.',
  `title` varchar(800) NOT NULL COMMENT '동행 글쓸 때 제목. Not Null',
  `content` varchar(8000) NOT NULL COMMENT '동행 글 쓸 때 내용. Not Null',
  `member_cnt` tinyint DEFAULT '1' COMMENT '글 쓸때 default는 1이고, 20명까지 지정할 수 있다.',
  `hashtag` varchar(200) DEFAULT NULL COMMENT '글을 쓸 때 해시태그를 달도록 한다.',
  `view_cnt` int DEFAULT '0' COMMENT '게시글 조회수',
  `acmp_board_status` tinyint DEFAULT '0' COMMENT '활성0 비활성1 삭제2',
  `report_cnt` int DEFAULT '0',
  `chat_url` varchar(5000) NOT NULL COMMENT '동행신청을 한 사람들을 위한 채팅방이 생성된다.',
  `applicant_cnt` int DEFAULT '0' COMMENT '실제 채팅방까지 연결된 사람의 수',
  `deleted_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '시스템컬럼',
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '시스템컬럼',
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accompany`
--

LOCK TABLES `accompany` WRITE;
/*!40000 ALTER TABLE `accompany` DISABLE KEYS */;
/*!40000 ALTER TABLE `accompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accompany_history`
--

DROP TABLE IF EXISTS `accompany_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accompany_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `accompany_id` int NOT NULL COMMENT '동행 게시글 번호',
  `updated_item` varchar(8000) DEFAULT NULL COMMENT '동행 글쓸 때 제목. Not Null',
  `before_content` varchar(8000) DEFAULT NULL COMMENT '동행 글 쓸 때 내용. Not Null',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accompany_history`
--

LOCK TABLES `accompany_history` WRITE;
/*!40000 ALTER TABLE `accompany_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `accompany_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '댓글 번호',
  `question_id` int NOT NULL COMMENT 'Q&A 게시글 번호',
  `user_id` int NOT NULL COMMENT '답변 작성자',
  `content` varchar(8000) NOT NULL,
  `report_cnt` int DEFAULT '0',
  `status` tinyint DEFAULT '0' COMMENT '0==기본 1==삭제 2==채택',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_history`
--

DROP TABLE IF EXISTS `answer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer_id` int NOT NULL COMMENT '댓글 번호',
  `before_content` varchar(8000) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_history`
--

LOCK TABLES `answer_history` WRITE;
/*!40000 ALTER TABLE `answer_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_code`
--

DROP TABLE IF EXISTS `city_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_code` (
  `city_code` int NOT NULL,
  `city_name` varchar(30) DEFAULT NULL,
  `country_code` tinyint DEFAULT NULL,
  PRIMARY KEY (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_code`
--

LOCK TABLES `city_code` WRITE;
/*!40000 ALTER TABLE `city_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combined_board`
--

DROP TABLE IF EXISTS `combined_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combined_board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_code` tinyint NOT NULL,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `title` varchar(100) NOT NULL,
  `view_cnt` int NOT NULL,
  `status` tinyint NOT NULL COMMENT '삭제여부',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combined_board`
--

LOCK TABLES `combined_board` WRITE;
/*!40000 ALTER TABLE `combined_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `combined_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combined_board_content`
--

DROP TABLE IF EXISTS `combined_board_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combined_board_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_code` tinyint NOT NULL,
  `content` varchar(2000) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combined_board_content`
--

LOCK TABLES `combined_board_content` WRITE;
/*!40000 ALTER TABLE `combined_board_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `combined_board_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combined_board_history`
--

DROP TABLE IF EXISTS `combined_board_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combined_board_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_code` tinyint NOT NULL COMMENT 'M001 M002 M003',
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `title` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view_cnt` int NOT NULL,
  `status` tinyint NOT NULL COMMENT '삭제여부',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combined_board_history`
--

LOCK TABLES `combined_board_history` WRITE;
/*!40000 ALTER TABLE `combined_board_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `combined_board_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continent_code`
--

DROP TABLE IF EXISTS `continent_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `continent_code` (
  `continent_code` tinyint NOT NULL,
  `continent_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`continent_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continent_code`
--

LOCK TABLES `continent_code` WRITE;
/*!40000 ALTER TABLE `continent_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `continent_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_code`
--

DROP TABLE IF EXISTS `country_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_code` (
  `country_code` tinyint NOT NULL,
  `country_name` varchar(30) DEFAULT NULL,
  `continent_code` tinyint DEFAULT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_code`
--

LOCK TABLES `country_code` WRITE;
/*!40000 ALTER TABLE `country_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(100) NOT NULL,
  `amount` int NOT NULL,
  `content` varchar(1000) NOT NULL,
  `status` tinyint NOT NULL COMMENT '사용가능, 사용완료, 발행취소, 기한초과',
  `valid_at` datetime NOT NULL DEFAULT (curdate()),
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon_history`
--

DROP TABLE IF EXISTS `coupon_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `use_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '사용완료,사용취소,회수',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_history`
--

LOCK TABLES `coupon_history` WRITE;
/*!40000 ALTER TABLE `coupon_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_history`
--

DROP TABLE IF EXISTS `email_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(30) DEFAULT NULL COMMENT '유저 식별자',
  `receiver` varchar(30) DEFAULT NULL COMMENT '유저 식별자',
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_history`
--

LOCK TABLES `email_history` WRITE;
/*!40000 ALTER TABLE `email_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verification`
--

DROP TABLE IF EXISTS `email_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verification` (
  `user_email` varchar(30) NOT NULL,
  `verf_code` int NOT NULL COMMENT '생성한 인증번호(난수)를 임시 저장함',
  `status` tinyint DEFAULT '0' COMMENT '회원가입 form을 제출할 때 이메일 인증 여부를 체크하기 위함',
  `valid_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '발송 시간으로 부터 +5분',
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verification`
--

LOCK TABLES `email_verification` WRITE;
/*!40000 ALTER TABLE `email_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `view_cnt` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_authority`
--

DROP TABLE IF EXISTS `group_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_authority` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '01,02,03',
  `group_name` varchar(50) NOT NULL COMMENT '일반회원,파트너,관리자',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_authority`
--

LOCK TABLES `group_authority` WRITE;
/*!40000 ALTER TABLE `group_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '유저 식별자',
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `view_cnt` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '답변대기/완료/삭제',
  `ans_user_id` int DEFAULT NULL COMMENT '유저 식별자',
  `ans_content` varchar(2000) DEFAULT NULL,
  `ans_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_answer_history`
--

DROP TABLE IF EXISTS `inquiry_answer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry_answer_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inquiry_id` int NOT NULL,
  `before_content` varchar(2000) NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_answer_history`
--

LOCK TABLES `inquiry_answer_history` WRITE;
/*!40000 ALTER TABLE `inquiry_answer_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry_answer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry_history`
--

DROP TABLE IF EXISTS `inquiry_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiry_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inquiry_id` int NOT NULL,
  `item` varchar(50) NOT NULL,
  `before_content` varchar(2000) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry_history`
--

LOCK TABLES `inquiry_history` WRITE;
/*!40000 ALTER TABLE `inquiry_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_menu`
--

DROP TABLE IF EXISTS `main_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_menu_name` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_menu`
--

LOCK TABLES `main_menu` WRITE;
/*!40000 ALTER TABLE `main_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(20) DEFAULT NULL COMMENT '공지사항,이벤트,여행상품',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_authority`
--

DROP TABLE IF EXISTS `menu_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_authority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL COMMENT '01,02,03',
  `menu_id` int NOT NULL,
  `authorities` varchar(20) NOT NULL COMMENT 'CRUD',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_authority`
--

LOCK TABLES `menu_authority` WRITE;
/*!40000 ALTER TABLE `menu_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_code`
--

DROP TABLE IF EXISTS `menu_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_code` (
  `menu_code` int NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_code`
--

LOCK TABLES `menu_code` WRITE;
/*!40000 ALTER TABLE `menu_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_sales_statistic`
--

DROP TABLE IF EXISTS `monthly_sales_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_sales_statistic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `statistic_of` varchar(4) DEFAULT NULL COMMENT '2208',
  `total_sales_cnt` int DEFAULT '0',
  `total_sales_amount` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_sales_statistic`
--

LOCK TABLES `monthly_sales_statistic` WRITE;
/*!40000 ALTER TABLE `monthly_sales_statistic` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_sales_statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_user_statistic`
--

DROP TABLE IF EXISTS `monthly_user_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_user_statistic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `statistic_of` varchar(4) DEFAULT NULL COMMENT '2207',
  `new_reg_cnt` int DEFAULT '0',
  `wdrw_cnt` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_user_statistic`
--

LOCK TABLES `monthly_user_statistic` WRITE;
/*!40000 ALTER TABLE `monthly_user_statistic` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_user_statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `title` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `view_cnt` int NOT NULL,
  `status` tinyint NOT NULL COMMENT '삭제여부',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_history`
--

DROP TABLE IF EXISTS `notice_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notice_id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `view_cnt` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_history`
--

LOCK TABLES `notice_history` WRITE;
/*!40000 ALTER TABLE `notice_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `reg_number` int DEFAULT NULL COMMENT '국내사업자일경우에만',
  `company_name` varchar(50) NOT NULL,
  `intro` varchar(6000) NOT NULL,
  `intro_attachment` varchar(50) DEFAULT NULL,
  `service_region` varchar(100) NOT NULL COMMENT '대륙/국가/지역 순으로 기입',
  `product_type` varchar(50) NOT NULL,
  `manager_name` varchar(30) NOT NULL,
  `manager_tel` varchar(30) NOT NULL,
  `terms_agreement` tinyint NOT NULL DEFAULT '0' COMMENT '미동의=0 / 동의=1',
  `on_partnership` tinyint NOT NULL DEFAULT '0' COMMENT '파트너쉽 유지X=0 / 유지O=1',
  `conclusion_date` datetime DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner`
--

LOCK TABLES `partner` WRITE;
/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_approval_history`
--

DROP TABLE IF EXISTS `partner_approval_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_approval_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canceled_reason` varchar(300) NOT NULL,
  `canceled_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `partner_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_approval_history`
--

LOCK TABLES `partner_approval_history` WRITE;
/*!40000 ALTER TABLE `partner_approval_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_approval_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_sales_statistic`
--

DROP TABLE IF EXISTS `partner_sales_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_sales_statistic` (
  `id` int NOT NULL AUTO_INCREMENT,
  `partner_id` int NOT NULL COMMENT 'FK',
  `product_id` int NOT NULL COMMENT 'FK',
  `price` int DEFAULT NULL COMMENT '매출액(상품1개 가격)',
  `qty` int DEFAULT NULL,
  `total_sales_amount` int DEFAULT NULL,
  `confirm_at` date DEFAULT (curdate()) COMMENT '규정에 따라, 판매가 확정된 시점',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_sales_statistic`
--

LOCK TABLES `partner_sales_statistic` WRITE;
/*!40000 ALTER TABLE `partner_sales_statistic` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_sales_statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `product_id` int NOT NULL COMMENT '상품식별자',
  `product_schedule_id` int NOT NULL COMMENT '식별자',
  `title` varchar(50) NOT NULL,
  `pg_id` int NOT NULL,
  `method` varchar(50) NOT NULL,
  `qty` int NOT NULL,
  `price` int NOT NULL,
  `option_price` int DEFAULT NULL,
  `used_point` int DEFAULT NULL,
  `total_price` int NOT NULL,
  `buyer_name` varchar(30) NOT NULL,
  `buyer_email` varchar(30) NOT NULL,
  `buyer_tel` varchar(30) NOT NULL,
  `status` tinyint NOT NULL COMMENT '승인, 취소',
  `approval_at` datetime NOT NULL,
  `cancel_at` datetime DEFAULT NULL,
  `receipt_detail_url` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '상품식별자',
  `partner_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `rating` tinyint NOT NULL,
  `req_time` int NOT NULL,
  `keyword` varchar(50) NOT NULL COMMENT '해쉬태그==검색키워드',
  `refund_amount` int DEFAULT NULL,
  `day_cnt` smallint NOT NULL COMMENT '상품 일정의 count를 select',
  `min_member` tinyint NOT NULL,
  `max_member` tinyint NOT NULL,
  `prd_intro` varchar(6000) NOT NULL,
  `course_intro` varchar(3000) NOT NULL,
  `inclusion` varchar(100) NOT NULL,
  `exclusion` varchar(100) NOT NULL,
  `additional_info` varchar(100) DEFAULT NULL,
  `meeting_point` varchar(50) NOT NULL,
  `mandatory_guidance` varchar(100) NOT NULL,
  `refund_policy` varchar(100) NOT NULL,
  `total_likes` smallint DEFAULT NULL COMMENT '위시리스트',
  `sale_status` tinyint DEFAULT '0' COMMENT '판매준비중=0 / 판매=1 / 판매종료=2',
  `approval_status` tinyint NOT NULL DEFAULT '0' COMMENT '승인대기중=0 / 승인완료=1',
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '상품 등록일',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '시스템컬럼',
  `created_by` int NOT NULL COMMENT '시스템컬럼',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '시스템컬럼',
  `updated_by` int NOT NULL COMMENT '시스템컬럼',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_approval_history`
--

DROP TABLE IF EXISTS `product_approval_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_approval_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT '상품식별자',
  `canceled_reason` varchar(300) NOT NULL,
  `canceled_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_approval_history`
--

LOCK TABLES `product_approval_history` WRITE;
/*!40000 ALTER TABLE `product_approval_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_approval_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT '상품식별자',
  `type` varchar(10) NOT NULL COMMENT '선택형 / 단답형',
  `name` varchar(50) NOT NULL,
  `content` varchar(100) DEFAULT NULL COMMENT '선택형일때만 필요',
  `price` smallint DEFAULT NULL COMMENT '가격조정이 필요할때만',
  `order` tinyint NOT NULL DEFAULT '0' COMMENT '옵션순서',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL COMMENT '상품식별자',
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `content` varchar(3000) NOT NULL,
  `rating` tinyint NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review`
--

LOCK TABLES `product_review` WRITE;
/*!40000 ALTER TABLE `product_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_schedule`
--

DROP TABLE IF EXISTS `product_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_schedule` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '식별자',
  `product_id` int NOT NULL COMMENT '상품식별자',
  `start_date` date NOT NULL COMMENT '상품 출발일자',
  `end_date` date NOT NULL COMMENT '상품 종료일자',
  `price` int NOT NULL COMMENT '상품가격',
  `current_member` tinyint DEFAULT NULL COMMENT '일정별 모집인원 현황',
  `min_member` tinyint NOT NULL COMMENT '일정별 최소 모집가능 인원',
  `max_member` tinyint NOT NULL COMMENT '일정별 최대 모집가능 인원',
  `member_status` tinyint NOT NULL COMMENT '모집중=0 / 마감=1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_schedule`
--

LOCK TABLES `product_schedule` WRITE;
/*!40000 ALTER TABLE `product_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_update_history`
--

DROP TABLE IF EXISTS `product_update_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_update_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT '상품식별자',
  `update_item` varchar(50) NOT NULL,
  `before_update` varchar(6000) NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_update_history`
--

LOCK TABLES `product_update_history` WRITE;
/*!40000 ALTER TABLE `product_update_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_update_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '유저 식별자',
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `view_cnt` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '삭제여부',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_history`
--

DROP TABLE IF EXISTS `promotion_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `promotion_id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `view_cnt` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_history`
--

LOCK TABLES `promotion_history` WRITE;
/*!40000 ALTER TABLE `promotion_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Q&A 게시글 번호',
  `user_id` int NOT NULL COMMENT '질문 작성자',
  `nickname` varchar(800) NOT NULL,
  `title` varchar(800) NOT NULL COMMENT 'not null, 100자이내',
  `content` varchar(8000) NOT NULL COMMENT 'not null, 1000자이내',
  `hashtag` varchar(800) DEFAULT NULL COMMENT '띄어쓰기로 해시태그를 구분해서 저장할수 있고, 기본값 성별, 나이, 아무나다좋아로 한다.',
  `ans_cnt` int DEFAULT '0' COMMENT '댓글은 쓸수만 있으므로 1증가. 삭제, 수정기능이 없음.',
  `view_cnt` int DEFAULT '0' COMMENT '질문글 조회수',
  `status` tinyint DEFAULT '0' COMMENT '0이 답변대기, 1이 채택 완료, 2가 삭제',
  `report_cnt` int DEFAULT '0',
  `region_code` tinyint DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_history`
--

DROP TABLE IF EXISTS `question_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_history` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '동행 게시글 번호',
  `question_id` int NOT NULL COMMENT 'Q&A 게시글 번호',
  `updated_item` varchar(8000) DEFAULT NULL COMMENT '동행 글쓸 때 제목. Not Null',
  `before_content` varchar(8000) DEFAULT NULL COMMENT '동행 글 쓸 때 내용. Not Null',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_history`
--

LOCK TABLES `question_history` WRITE;
/*!40000 ALTER TABLE `question_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `target_id` int NOT NULL COMMENT '유저 식별자',
  `reason` varchar(1000) NOT NULL,
  `report_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `report_status` tinyint NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL COMMENT '난수생성',
  `product_id` int NOT NULL COMMENT '상품식별자',
  `product_schedule_id` int NOT NULL COMMENT '식별자',
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `title` varchar(50) NOT NULL,
  `status` tinyint NOT NULL COMMENT '완료,취소',
  `qty` int NOT NULL,
  `pickup_info` varchar(1000) DEFAULT NULL,
  `extra_info` varchar(1000) DEFAULT NULL,
  `pay_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reserv_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `canceled_at` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_detail`
--

DROP TABLE IF EXISTS `reservation_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_detail` (
  `reservationi_id` int NOT NULL,
  `product_option_id` int NOT NULL,
  `content` varchar(300) NOT NULL,
  `qty` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`reservationi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_detail`
--

LOCK TABLES `reservation_detail` WRITE;
/*!40000 ALTER TABLE `reservation_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_history`
--

DROP TABLE IF EXISTS `reservation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` int NOT NULL,
  `item` varchar(30) NOT NULL,
  `before_content` varchar(100) NOT NULL,
  `after_content` varchar(100) NOT NULL,
  `mod_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_history`
--

LOCK TABLES `reservation_history` WRITE;
/*!40000 ALTER TABLE `reservation_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sample` varchar(45) NOT NULL DEFAULT 'asd',
  `sample2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample`
--

LOCK TABLES `sample` WRITE;
/*!40000 ALTER TABLE `sample` DISABLE KEYS */;
INSERT INTO `sample` VALUES (1,'샘플데이터',NULL),(2,'aaa',NULL),(3,'aaa',NULL),(4,'aaa',NULL),(5,'aaa',NULL),(6,'aaa',NULL),(7,'aaa',NULL),(8,'bbb','bbb'),(9,'8',NULL),(10,'9',NULL),(11,'10',NULL),(12,'asd','11'),(13,'asd','12'),(14,'asd','abc');
/*!40000 ALTER TABLE `sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_menu`
--

DROP TABLE IF EXISTS `sub_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_menu_id` int NOT NULL,
  `sub_menu_name` varchar(20) NOT NULL,
  `menu_url` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_menu`
--

LOCK TABLES `sub_menu` WRITE;
/*!40000 ALTER TABLE `sub_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `neccesary` tinyint NOT NULL DEFAULT '0',
  `order` int DEFAULT NULL,
  `user_id` int DEFAULT NULL COMMENT '(개인/단체/공통) 유저코드테이블',
  `apply_at` datetime DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms_history`
--

DROP TABLE IF EXISTS `terms_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `before_terms_id` int NOT NULL,
  `after_terms_id` int NOT NULL,
  `mod_reason` varchar(1000) NOT NULL,
  `updated_at` datetime DEFAULT (curdate()),
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms_history`
--

LOCK TABLES `terms_history` WRITE;
/*!40000 ALTER TABLE `terms_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `terms_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_interest_code`
--

DROP TABLE IF EXISTS `tour_interest_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_interest_code` (
  `tour_intr_code` smallint NOT NULL AUTO_INCREMENT,
  `tour_intr_keyword` varchar(20) NOT NULL,
  `tour_intr_description` varchar(1000) NOT NULL,
  PRIMARY KEY (`tour_intr_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_interest_code`
--

LOCK TABLES `tour_interest_code` WRITE;
/*!40000 ALTER TABLE `tour_interest_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_interest_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accompany_review`
--

DROP TABLE IF EXISTS `user_accompany_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_accompany_review` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '유저동행후기식별자',
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `target_id` int NOT NULL COMMENT '유저 식별자',
  `comment` varchar(2000) NOT NULL,
  `rating` tinyint NOT NULL COMMENT '5점만점. 정수로만 표현.',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accompany_review`
--

LOCK TABLES `user_accompany_review` WRITE;
/*!40000 ALTER TABLE `user_accompany_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_accompany_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authority`
--

DROP TABLE IF EXISTS `user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_authority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `group_id` int NOT NULL COMMENT '01,02,03',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authority`
--

LOCK TABLES `user_authority` WRITE;
/*!40000 ALTER TABLE `user_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_block`
--

DROP TABLE IF EXISTS `user_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_block` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '유저 차단 식별자',
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `target_id` int NOT NULL COMMENT '유저 식별자',
  `blocked_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_block`
--

LOCK TABLES `user_block` WRITE;
/*!40000 ALTER TABLE `user_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_code`
--

DROP TABLE IF EXISTS `user_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_code` (
  `user_code` varchar(4) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_code`
--

LOCK TABLES `user_code` WRITE;
/*!40000 ALTER TABLE `user_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `detail` varchar(20) NOT NULL COMMENT '로그인 여부, 비밀번호를 변경했는지.',
  `updated_at` date NOT NULL,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_history`
--

LOCK TABLES `user_history` WRITE;
/*!40000 ALTER TABLE `user_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '유저 식별자',
  `name` varchar(30) NOT NULL COMMENT '유저의 실명',
  `pwd` varchar(300) NOT NULL COMMENT '계정비밀번호 암호화',
  `email` varchar(50) NOT NULL COMMENT '아이디로 사용될 이메일',
  `tel` varchar(12) NOT NULL,
  `gender` char(1) DEFAULT 'M' COMMENT 'M(남자) / F(여자) 로 표현',
  `birthday` date NOT NULL,
  `nickname` varchar(40) NOT NULL COMMENT '이메일 id를 default 닉네임으로 사용함',
  `intro` varchar(3000) DEFAULT '안녕하세요',
  `profile_img` varchar(300) DEFAULT NULL COMMENT '이미지 파일 이름을 저장 / default를 기본이미지로',
  `instagram_id` varchar(50) DEFAULT NULL,
  `point` int DEFAULT '0',
  `report_cnt` int DEFAULT '0',
  `status` tinyint DEFAULT '1' COMMENT '1 활성화 0 휴면 (TRUE / FALSE)',
  `user_code` varchar(10) DEFAULT NULL COMMENT 'ex) U001(일반유저) U002(파트너) U003(관리자) From 유저코드테이블',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `program_id` int NOT NULL COMMENT 'M001',
  `group_id` int NOT NULL COMMENT '01,02,03',
  `create` char(1) DEFAULT NULL,
  `read` char(1) DEFAULT NULL,
  `update` char(1) DEFAULT NULL,
  `delete` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permission`
--

LOCK TABLES `user_permission` WRITE;
/*!40000 ALTER TABLE `user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_point_history`
--

DROP TABLE IF EXISTS `user_point_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_point_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `amount` int NOT NULL COMMENT 'ex)1000포인트',
  `process_detail` varchar(50) NOT NULL COMMENT 'ex)포인트적립/포인트사용/쿠폰사용',
  `process_at` datetime NOT NULL COMMENT 'now()',
  `status` tinyint NOT NULL COMMENT '처리완료,취소',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_point_history`
--

LOCK TABLES `user_point_history` WRITE;
/*!40000 ALTER TABLE `user_point_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_point_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rating` (
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `total_rating` smallint DEFAULT '0' COMMENT '모든 후기의 평점을 더한 결과',
  `total_rating_cnt` int DEFAULT '0' COMMENT '모든 후기의 갯수를 더한 결과',
  `rating_avg` double DEFAULT '0' COMMENT '누적평점 / 누적 후기수',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_statistic`
--

DROP TABLE IF EXISTS `user_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_statistic` (
  `total_user_count` int DEFAULT NULL,
  `female_count` int DEFAULT NULL,
  `male_count` int DEFAULT NULL,
  `age_ten` int DEFAULT NULL,
  `age_twenty` int DEFAULT NULL,
  `age_thirty` int DEFAULT NULL,
  `age_forty` int DEFAULT NULL,
  `age_fifty` int DEFAULT NULL,
  `age_sixty` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_statistic`
--

LOCK TABLES `user_statistic` WRITE;
/*!40000 ALTER TABLE `user_statistic` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_terms`
--

DROP TABLE IF EXISTS `user_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_terms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `terms_id` int NOT NULL,
  `agreement` tinyint NOT NULL,
  `agreement_at` datetime NOT NULL DEFAULT (curdate()),
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_terms`
--

LOCK TABLES `user_terms` WRITE;
/*!40000 ALTER TABLE `user_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tour_interest`
--

DROP TABLE IF EXISTS `user_tour_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tour_interest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `tour_intr_code` smallint NOT NULL COMMENT 'From 코드테이블',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tour_interest`
--

LOCK TABLES `user_tour_interest` WRITE;
/*!40000 ALTER TABLE `user_tour_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tour_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_wish`
--

DROP TABLE IF EXISTS `user_wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_wish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL COMMENT '상품식별자',
  `user_id` int NOT NULL COMMENT '유저 식별자',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_wish`
--

LOCK TABLES `user_wish` WRITE;
/*!40000 ALTER TABLE `user_wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_wish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_user`
--

DROP TABLE IF EXISTS `withdraw_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '유저 식별자',
  `name` varchar(30) NOT NULL COMMENT '유저의 실명',
  `pwd` varchar(70) NOT NULL COMMENT '계정비밀번호 암호화',
  `email` varchar(30) NOT NULL COMMENT '아이디로 사용될 이메일',
  `tel` varchar(12) NOT NULL,
  `gender` char(1) NOT NULL COMMENT 'M(남자) / F(여자) 로 표현',
  `birthday` date DEFAULT NULL,
  `nickname` varchar(40) NOT NULL COMMENT '이메일 id를 default 닉네임으로 사용함',
  `intro` varchar(3000) DEFAULT '안녕하세요',
  `profile_img` varchar(50) DEFAULT NULL COMMENT '이미지 파일 이름을 저장',
  `instagram_id` varchar(30) DEFAULT NULL,
  `point` int DEFAULT '0',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `report_cnt` int DEFAULT '0',
  `user_code` varchar(10) DEFAULT NULL COMMENT 'ex) U001(일반유저) U002(파트너) U003(관리자) From 유저코드테이블',
  `withdraw_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_user`
--

LOCK TABLES `withdraw_user` WRITE;
/*!40000 ALTER TABLE `withdraw_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraw_user` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-11 11:11:01
