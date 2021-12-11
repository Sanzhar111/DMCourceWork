-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: technicalarchive
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `countdoc`
--

DROP TABLE IF EXISTS `countdoc`;
/*!50001 DROP VIEW IF EXISTS `countdoc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `countdoc` AS SELECT 
 1 AS `Документ`,
 1 AS `count_`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `абоненты`
--

DROP TABLE IF EXISTS `абоненты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `абоненты` (
  `Номер` int unsigned NOT NULL AUTO_INCREMENT,
  `ФИО` varchar(100) NOT NULL,
  `Отдел` int unsigned NOT NULL,
  PRIMARY KEY (`Номер`),
  KEY `абоненты_FK` (`Отдел`),
  CONSTRAINT `абоненты_FK` FOREIGN KEY (`Отдел`) REFERENCES `отделы` (`Номер`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `абоненты`
--

LOCK TABLES `абоненты` WRITE;
/*!40000 ALTER TABLE `абоненты` DISABLE KEYS */;
INSERT INTO `абоненты` VALUES (1,'Иван Иванов',3),(2,'Игорь Платошкин',2),(3,'Михаил Портнов',2),(4,'Мария Петрова',1),(5,'Елена Астраханская',1),(6,'Алексей Стрельцов',3),(7,'Владимир Набоков',4),(8,'Бильбо Сумкин',4),(9,'Сергей Есенин',5),(10,'Алексей Пушкин',5),(11,'Дмитрий Пеньков',6),(12,'Виктор Старовойтов',6),(13,'Карина Игорева',7),(14,'Евгений Орениенбаум',7),(15,'Изольда Тимофеева',8),(16,'Владлен Пасторов',8);
/*!40000 ALTER TABLE `абоненты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `документ с наибольшим количеством экземпляров`
--

DROP TABLE IF EXISTS `документ с наибольшим количеством экземпляров`;
/*!50001 DROP VIEW IF EXISTS `документ с наибольшим количеством экземпляров`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `документ с наибольшим количеством экземпляров` AS SELECT 
 1 AS `Название`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `документация`
--

DROP TABLE IF EXISTS `документация`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `документация` (
  `Инвентарный номер` int unsigned NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) NOT NULL,
  `Тема` int unsigned DEFAULT NULL,
  `Количество` int unsigned NOT NULL DEFAULT '1',
  `Ячейка` int unsigned DEFAULT NULL,
  `Дата поступления` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Инвентарный номер`),
  KEY `документация_FK_1` (`Тема`),
  KEY `документация_FK` (`Ячейка`),
  CONSTRAINT `документация_FK` FOREIGN KEY (`Ячейка`) REFERENCES `ячейки` (`Номер`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `документация_FK_1` FOREIGN KEY (`Тема`) REFERENCES `тема` (`Номер`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `документация`
--

LOCK TABLES `документация` WRITE;
/*!40000 ALTER TABLE `документация` DISABLE KEYS */;
INSERT INTO `документация` VALUES (1,'Разработка ПО1',1,1,1,'2021-12-09 17:13:57'),(2,'Разработка ПО2',1,2,2,'2021-12-09 17:13:57'),(3,'Разработка ПО3',1,1,3,'2021-12-09 17:13:57'),(4,'Договор 1',2,5,4,'2021-12-09 17:13:57'),(5,'Договор 2',2,7,5,'2021-12-09 17:13:57'),(6,'Договор 3',2,1,6,'2021-12-09 17:13:57'),(7,'Чек 1',3,5,7,'2021-12-09 17:13:57'),(8,'Чек 2',3,1,8,'2021-12-09 17:13:57'),(9,'Чек 3',3,1,9,'2021-12-09 17:13:57'),(10,'Квитанция 1',4,4,10,'2021-12-09 17:13:57'),(11,'Квитанция 2',4,4,11,'2021-12-09 17:13:57'),(12,'Квитанция 3',4,7,12,'2021-12-09 17:13:57'),(13,'Письмо 1',5,2,13,'2021-12-09 17:13:57'),(14,'Письмо 2',5,5,14,'2021-12-09 17:13:57'),(15,'Письмо 3',5,6,15,'2021-12-09 17:13:57'),(16,'ТД 1',6,3,16,'2021-12-09 17:13:57'),(17,'ТД 2',6,1,17,'2021-12-09 17:13:57'),(18,'ТД 3',6,4,18,'2021-12-09 17:13:57'),(19,'Накладная',7,1,19,'2021-12-09 17:13:57'),(20,'Записка 1',8,4,20,'2021-12-09 17:13:57'),(23,'Отчет 1',9,4,23,'2021-12-09 17:13:57'),(24,'Отчет 2',9,1,24,'2021-12-09 17:13:57'),(25,'Отчет 3',9,5,25,'2021-12-09 17:13:57'),(26,'Декларация 1',10,1,26,'2021-12-09 17:13:57'),(27,'Декларация 2',10,1,27,'2021-12-09 17:13:57'),(28,'Скан 1',11,2,28,'2021-12-09 17:13:57'),(29,'Скан 2',11,1,29,'2021-12-09 17:13:57'),(30,'Скан 3',11,2,30,'2021-12-09 17:13:57'),(31,'Квиток',3,323,29,'2021-12-09 23:18:35'),(32,'ТЗ на Курсовую',1,2,12,'2021-12-10 00:41:42'),(34,'Чек 228',3,5,17,'2021-12-11 15:25:57');
/*!40000 ALTER TABLE `документация` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `запросы к документам`
--

DROP TABLE IF EXISTS `запросы к документам`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `запросы к документам` (
  `Номер` int unsigned NOT NULL AUTO_INCREMENT,
  `абонент` int unsigned NOT NULL,
  `Дата` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Документ` int unsigned NOT NULL,
  PRIMARY KEY (`Номер`),
  KEY `запросы_к_документам_FK` (`абонент`),
  KEY `запросы_к_документам_FK_1` (`Документ`),
  CONSTRAINT `запросы_к_документам_FK` FOREIGN KEY (`абонент`) REFERENCES `абоненты` (`Номер`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `запросы_к_документам_FK_1` FOREIGN KEY (`Документ`) REFERENCES `документация` (`Инвентарный номер`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `запросы к документам`
--

LOCK TABLES `запросы к документам` WRITE;
/*!40000 ALTER TABLE `запросы к документам` DISABLE KEYS */;
INSERT INTO `запросы к документам` VALUES (1,1,'2021-12-09 17:24:39',1),(2,1,'2021-12-09 17:24:39',2),(3,1,'2021-12-09 17:24:39',3),(4,1,'2021-12-09 17:24:39',1),(5,1,'2021-12-09 17:24:39',2),(6,1,'2021-12-09 17:24:39',3),(7,1,'2021-12-09 17:24:39',4),(8,1,'2021-12-09 17:24:39',5),(9,1,'2021-12-09 17:24:39',6),(10,2,'2021-12-09 17:24:39',7),(11,2,'2021-12-09 17:24:39',8),(12,2,'2021-12-09 17:24:39',9),(13,2,'2021-12-09 17:24:39',7),(14,2,'2021-12-09 17:24:39',8),(15,2,'2021-12-09 17:24:39',9),(16,2,'2021-12-09 17:24:39',10),(17,2,'2021-12-09 17:24:39',11),(18,2,'2021-12-09 17:24:39',11),(19,2,'2021-12-09 17:24:39',12),(20,2,'2021-12-09 17:24:39',12),(21,2,'2021-12-09 17:24:39',13),(22,3,'2021-12-09 17:24:39',13),(23,3,'2021-12-09 17:24:39',13),(24,3,'2021-12-09 17:24:39',13),(25,3,'2021-12-09 17:24:39',13),(26,3,'2021-12-09 17:24:39',14),(27,3,'2021-12-09 17:24:39',14),(28,3,'2021-12-09 17:24:39',15),(29,3,'2021-12-09 17:24:39',15),(30,4,'2021-12-09 17:24:39',16),(31,4,'2021-12-09 17:24:39',16),(32,4,'2021-12-09 17:24:39',16),(33,4,'2021-12-09 17:24:39',16),(34,4,'2021-12-09 17:24:39',17),(35,4,'2021-12-09 17:24:39',17),(36,4,'2021-12-09 17:24:39',18),(37,5,'2021-12-09 17:24:39',19),(38,5,'2021-12-09 17:24:39',19),(39,5,'2021-12-09 17:24:39',20),(40,5,'2021-12-09 17:24:39',20),(41,5,'2021-12-09 17:24:39',20),(46,6,'2021-12-09 17:24:39',23),(47,6,'2021-12-09 17:24:39',23),(48,6,'2021-12-09 17:24:39',23),(49,6,'2021-12-09 17:24:39',24),(50,6,'2021-12-09 17:24:39',24),(51,7,'2021-12-09 17:24:39',25),(52,7,'2021-12-09 17:24:39',25),(53,7,'2021-12-09 17:24:39',26),(54,7,'2021-12-09 17:24:39',26),(55,7,'2021-12-09 17:24:39',27),(56,7,'2021-12-09 17:24:39',27),(57,8,'2021-12-09 17:24:39',28),(58,8,'2021-12-09 17:24:39',28),(59,8,'2021-12-09 17:24:39',29),(60,8,'2021-12-09 17:24:39',29),(61,8,'2021-12-09 17:24:39',29),(62,8,'2021-12-09 17:24:39',30),(63,8,'2021-12-09 17:24:39',30),(64,9,'2021-12-09 17:24:39',30),(65,9,'2021-12-09 17:24:39',30),(66,9,'2021-12-09 17:24:39',29),(67,9,'2021-12-09 17:24:39',29),(68,9,'2021-12-09 17:24:39',29),(69,9,'2021-12-09 17:24:39',28),(70,10,'2021-12-09 17:24:39',23),(71,10,'2021-12-09 17:24:39',29),(72,10,'2021-12-09 17:24:39',23),(73,10,'2021-12-09 17:24:39',23),(74,10,'2021-12-09 17:24:39',24),(75,10,'2021-12-09 17:24:39',25),(76,10,'2021-12-09 17:24:39',24),(77,11,'2021-12-09 17:24:39',28),(79,11,'2021-12-09 17:24:39',2),(80,11,'2021-12-09 17:24:39',1),(82,11,'2021-12-09 17:24:39',2),(83,12,'2021-12-09 17:24:39',2),(84,12,'2021-12-09 17:24:39',23),(85,12,'2021-12-09 17:24:39',1),(86,12,'2021-12-09 17:24:39',5),(87,12,'2021-12-09 17:24:39',4),(88,12,'2021-12-09 17:24:39',4),(89,13,'2021-12-09 17:24:39',6),(90,13,'2021-12-09 17:24:39',8),(91,13,'2021-12-09 17:24:39',6),(92,13,'2021-12-09 17:24:39',11),(93,13,'2021-12-09 17:24:39',8),(94,14,'2021-12-09 17:24:39',25),(95,14,'2021-12-09 17:24:39',30),(96,14,'2021-12-09 17:24:39',5),(97,14,'2021-12-09 17:24:39',15),(98,14,'2021-12-09 17:24:39',12),(99,14,'2021-12-09 17:24:39',12),(100,15,'2021-12-09 17:24:39',16),(101,15,'2021-12-09 17:24:39',17),(102,15,'2021-12-09 17:24:39',16),(103,15,'2021-12-09 17:24:39',12),(104,15,'2021-12-09 17:24:39',19),(105,15,'2021-12-09 17:24:39',11),(106,15,'2021-12-09 17:24:39',10),(107,16,'2021-12-09 17:24:39',5),(108,16,'2021-12-09 17:24:39',4),(109,16,'2021-12-09 17:24:39',3),(110,16,'2021-12-09 17:24:39',5),(111,16,'2021-12-09 17:24:39',2),(112,16,'2021-12-09 17:24:39',9),(113,16,'2021-12-09 17:24:39',7),(114,16,'2021-12-09 17:24:39',8);
/*!40000 ALTER TABLE `запросы к документам` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `количество документов по темам`
--

DROP TABLE IF EXISTS `количество документов по темам`;
/*!50001 DROP VIEW IF EXISTS `количество документов по темам`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `количество документов по темам` AS SELECT 
 1 AS `Тема`,
 1 AS `_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `количество запросов от отделов`
--

DROP TABLE IF EXISTS `количество запросов от отделов`;
/*!50001 DROP VIEW IF EXISTS `количество запросов от отделов`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `количество запросов от отделов` AS SELECT 
 1 AS `отдел`,
 1 AS `count_`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `наиболее требуемый документ`
--

DROP TABLE IF EXISTS `наиболее требуемый документ`;
/*!50001 DROP VIEW IF EXISTS `наиболее требуемый документ`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `наиболее требуемый документ` AS SELECT 
 1 AS `название`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `отдел, работники которого наиболее часто обращаются к архиву`
--

DROP TABLE IF EXISTS `отдел, работники которого наиболее часто обращаются к архиву`;
/*!50001 DROP VIEW IF EXISTS `отдел, работники которого наиболее часто обращаются к архиву`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `отдел, работники которого наиболее часто обращаются к архиву` AS SELECT 
 1 AS `отдел`,
 1 AS `count_`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `отделы`
--

DROP TABLE IF EXISTS `отделы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `отделы` (
  `Номер` int unsigned NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) NOT NULL,
  `Телефон` varchar(25) NOT NULL,
  PRIMARY KEY (`Номер`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `отделы`
--

LOCK TABLES `отделы` WRITE;
/*!40000 ALTER TABLE `отделы` DISABLE KEYS */;
INSERT INTO `отделы` VALUES (1,'Бухгалтерия','+228'),(2,'Безопасности','+7 (545)'),(3,'Охраны труда','+73'),(4,'Контрольно пропускной системы','+74'),(5,'Разработки','+75'),(6,'Поддержки клиентов','+784'),(7,'Директоров','+77'),(8,'Производства','+78');
/*!40000 ALTER TABLE `отделы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `полки`
--

DROP TABLE IF EXISTS `полки`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `полки` (
  `Номер` int unsigned NOT NULL AUTO_INCREMENT,
  `Стеллаж` int unsigned NOT NULL,
  PRIMARY KEY (`Номер`),
  KEY `полки_FK_1` (`Стеллаж`),
  CONSTRAINT `полки_FK_1` FOREIGN KEY (`Стеллаж`) REFERENCES `стеллажи` (`Номер`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `полки`
--

LOCK TABLES `полки` WRITE;
/*!40000 ALTER TABLE `полки` DISABLE KEYS */;
INSERT INTO `полки` VALUES (1,1),(4,1),(2,2),(3,2),(5,2),(6,2),(7,4),(8,4),(9,4),(10,5),(11,5),(12,5),(13,6),(14,6),(15,7),(16,7),(17,7),(18,7),(19,7),(20,7),(21,8),(22,8),(23,8),(24,8),(25,8),(26,8),(27,9),(28,9),(29,9),(30,9),(31,9),(32,9),(33,9),(34,9),(35,10),(36,10),(37,10),(38,10),(39,10),(40,10),(41,10),(42,10);
/*!40000 ALTER TABLE `полки` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `стеллажи`
--

DROP TABLE IF EXISTS `стеллажи`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `стеллажи` (
  `Номер` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Номер`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `стеллажи`
--

LOCK TABLES `стеллажи` WRITE;
/*!40000 ALTER TABLE `стеллажи` DISABLE KEYS */;
INSERT INTO `стеллажи` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `стеллажи` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `тема`
--

DROP TABLE IF EXISTS `тема`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `тема` (
  `Номер` int unsigned NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) NOT NULL,
  PRIMARY KEY (`Номер`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `тема`
--

LOCK TABLES `тема` WRITE;
/*!40000 ALTER TABLE `тема` DISABLE KEYS */;
INSERT INTO `тема` VALUES (1,'ЧТЗ'),(2,'Договор'),(3,'Чек'),(4,'Квитанция'),(5,'Письмо'),(6,'Трудовой договор'),(7,'Накладная'),(8,'Записка'),(9,'Отчет'),(10,'Декларация'),(11,'Скан документов');
/*!40000 ALTER TABLE `тема` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `темы и названия`
--

DROP TABLE IF EXISTS `темы и названия`;
/*!50001 DROP VIEW IF EXISTS `темы и названия`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `темы и названия` AS SELECT 
 1 AS `Название`,
 1 AS `Тема`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ячейки`
--

DROP TABLE IF EXISTS `ячейки`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ячейки` (
  `Номер` int unsigned NOT NULL AUTO_INCREMENT,
  `Полка` int unsigned NOT NULL,
  PRIMARY KEY (`Номер`),
  KEY `ячейки_FK` (`Полка`),
  CONSTRAINT `ячейки_FK` FOREIGN KEY (`Полка`) REFERENCES `полки` (`Номер`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ячейки`
--

LOCK TABLES `ячейки` WRITE;
/*!40000 ALTER TABLE `ячейки` DISABLE KEYS */;
INSERT INTO `ячейки` VALUES (6,1),(7,1),(8,1),(29,1),(1,2),(2,2),(3,2),(4,2),(5,2),(30,2),(9,3),(10,3),(11,3),(12,3),(26,4),(27,4),(28,4),(13,5),(14,5),(15,5),(16,5),(17,6),(18,6),(20,21),(21,21),(22,21),(19,26),(23,35),(25,38),(24,40);
/*!40000 ALTER TABLE `ячейки` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `countdoc`
--

/*!50001 DROP VIEW IF EXISTS `countdoc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `countdoc` AS select `запросы к документам`.`Документ` AS `Документ`,count(`запросы к документам`.`Документ`) AS `count_` from `запросы к документам` group by `запросы к документам`.`Документ` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `документ с наибольшим количеством экземпляров`
--

/*!50001 DROP VIEW IF EXISTS `документ с наибольшим количеством экземпляров`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `документ с наибольшим количеством экземпляров` AS select `документация`.`Название` AS `Название` from `документация` where (`документация`.`Количество` = (select max(`документация`.`Количество`) from `документация`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `количество документов по темам`
--

/*!50001 DROP VIEW IF EXISTS `количество документов по темам`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `количество документов по темам` AS select `документация`.`Тема` AS `Тема`,count(`документация`.`Тема`) AS `_count` from `документация` group by `документация`.`Тема` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `количество запросов от отделов`
--

/*!50001 DROP VIEW IF EXISTS `количество запросов от отделов`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `количество запросов от отделов` AS select (select `абоненты`.`Отдел` from `абоненты` where (`абоненты`.`Номер` = `запросы к документам`.`абонент`)) AS `отдел`,count(`запросы к документам`.`Документ`) AS `count_` from `запросы к документам` group by `отдел` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `наиболее требуемый документ`
--

/*!50001 DROP VIEW IF EXISTS `наиболее требуемый документ`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `наиболее требуемый документ` AS select `документация`.`Название` AS `название` from `документация` where `документация`.`Инвентарный номер` in (select `countdoc`.`Документ` from `countdoc` where (`countdoc`.`count_` = (select max(`countdoc`.`count_`) from `countdoc`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `отдел, работники которого наиболее часто обращаются к архиву`
--

/*!50001 DROP VIEW IF EXISTS `отдел, работники которого наиболее часто обращаются к архиву`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `отдел, работники которого наиболее часто обращаются к архиву` AS select `количество запросов от отделов`.`отдел` AS `отдел`,`количество запросов от отделов`.`count_` AS `count_` from `количество запросов от отделов` where (`количество запросов от отделов`.`count_` = (select max(`количество запросов от отделов`.`count_`) from `количество запросов от отделов`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `темы и названия`
--

/*!50001 DROP VIEW IF EXISTS `темы и названия`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `темы и названия` AS select `документация`.`Название` AS `Название`,`документация`.`Тема` AS `Тема` from `документация` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-11 22:13:47
