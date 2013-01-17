-- MySQL dump 10.13  Distrib 5.5.28, for osx10.8 (i386)
--
-- Host: localhost    Database: exercises
-- ------------------------------------------------------
-- Server version	5.5.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `title` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `index_articles_category` (`category`),
  KEY `index_articles_user` (`user`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`name`),
  CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES ('First Test Article By User One','Category One','User One'),('First Test Article By User three','Category Five','User Three'),('First Test Article By User Two','Category Three','User Two'),('Second Test Article By User One','Category One','User One'),('Second Test Article By User three','Category Five','User Three'),('Second Test Article By User Two','Category One','User Two'),('Third Test Article By User One','Category Four','User One'),('Third Test Article By User three','Category Two','User Three'),('Third Test Article By User Two','Category Three','User Two');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `bcode` varchar(50) NOT NULL,
  `librarian` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('B1','2 Anglesea Rd','John Smith'),('B2','Mary Jones','34 Pearse St'),('B3','Francis Owens','Grange X');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('Category Five'),('Category Four'),('Category One'),('Category Three'),('Category Two');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `description` varchar(500) DEFAULT NULL,
  `article` varchar(255) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  KEY `article` (`article`),
  KEY `user` (`user`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`article`) REFERENCES `articles` (`title`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES ('First Test Comment on First Article By User One','First Test Article By User One','User One'),('First Test Comment on First Article By User two','First Test Article By User One','User Two'),('First Test Comment on Second Article By User One','Second Test Article By User One','User One'),('First Test Comment on Second Test Article By User One','Second Test Article By User Two','User One'),('First Test Comment on Second Test Article By User Three','Second Test Article By User Three','User Three'),('First Test Comment on First Article  By User Two','First Test Article By User Two','User Three'),('Second Test Comment on Article One By User two','First Test Article By User One','User Two'),('Second Test Comment on Article Two By User One','Second Test Article By User One','User One'),('Second Test Comment on Second Article By User One','Second Test Article By User Two','User One'),('First Test Comment on Third Article By User Three','Third Test Article By User Two','User Three'),('Second Test Comment on Second Test Article By User two','Second Test Article By User three','User Two');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holdings`
--

DROP TABLE IF EXISTS `holdings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holdings` (
  `branch` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(60) NOT NULL DEFAULT '',
  `copies` int(11) DEFAULT NULL,
  PRIMARY KEY (`branch`,`title`),
  KEY `title` (`title`),
  CONSTRAINT `holdings_ibfk_1` FOREIGN KEY (`branch`) REFERENCES `branch` (`bcode`),
  CONSTRAINT `holdings_ibfk_2` FOREIGN KEY (`title`) REFERENCES `titles` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holdings`
--

LOCK TABLES `holdings` WRITE;
/*!40000 ALTER TABLE `holdings` DISABLE KEYS */;
INSERT INTO `holdings` VALUES ('B1','A History of Dublin',1),('B1','How To Fish',2),('B1','Susannah',3),('B2','Computers',2),('B2','How To Fish',4),('B2','The Wife',3),('B3','A History of Dublin',1),('B3','Computers',4),('B3','Susannah',3),('B3','The Wife',1);
/*!40000 ALTER TABLE `holdings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `lname` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`lname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('Buttery','702 3421','College St'),('Lincoln','683 4523','Lincoln Place'),('O\'Neill\'s','674 2134 ','Pearse St '),('Old Nag','767 8132','Dame St');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sandwiches`
--

DROP TABLE IF EXISTS `sandwiches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sandwiches` (
  `location` varchar(50) DEFAULT NULL,
  `bread` varchar(30) DEFAULT NULL,
  `filling` varchar(20) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  KEY `sandwiches_location` (`location`),
  CONSTRAINT `sandwiches_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`lname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sandwiches`
--

LOCK TABLES `sandwiches` WRITE;
/*!40000 ALTER TABLE `sandwiches` DISABLE KEYS */;
INSERT INTO `sandwiches` VALUES ('Lincoln','Rye','Ham',1.25),('O\'Neill\'s','White','Cheese',1.20),('O\'Neill\'s','Whole','Ham',1.25),('Old Nag','Rye','Beef',1.35),('Buttery','White','Cheese',1.00),('O\'Neill\'s','White','Turkey',1.35),('Buttery','White','Ham',1.10),('Lincoln','Rye','Beef',1.35),('Lincoln','White','Ham',1.30),('Old Nag ','Rye','Ham',1.40);
/*!40000 ALTER TABLE `sandwiches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tastes`
--

DROP TABLE IF EXISTS `tastes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tastes` (
  `name` varchar(30) DEFAULT NULL,
  `fillings` varchar(30) DEFAULT NULL,
  UNIQUE KEY `index_tastes_name_and_fillings` (`name`,`fillings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tastes`
--

LOCK TABLES `tastes` WRITE;
/*!40000 ALTER TABLE `tastes` DISABLE KEYS */;
INSERT INTO `tastes` VALUES ('Brown','Beef'),('Brown','Ham'),('Brown','Turkey'),('Green','Beef'),('Green','Cheese'),('Green','Turkey'),('Jones','Cheese');
/*!40000 ALTER TABLE `tastes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `title` varchar(60) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `publisher` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES ('A History of Dublin','David Little','Wiley'),('Computers','Blaise Pascal','Applewoods'),('How to Fish','Amy Fly','Stop Press'),('Susannah','Ann Brown','Macmillan'),('The Wife','Ann Brown','Macmillan');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `name` varchar(100) NOT NULL,
  `type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Admin One','admin'),('Admin Two','admin'),('User One','normal'),('User Three','normal'),('User Two','normal');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-17 14:19:02
