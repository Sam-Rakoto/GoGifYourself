-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: gogifyourself
-- ------------------------------------------------------
-- Server version	5.5.55-0+deb8u1

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag_color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_title_unique` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'Ma vie de graphiste','#76E041','ma-vie-de-graphiste'),(4,'Ma vie de codeur','#50394C','ma-vie-de-codeur'),(5,'Ma vie de juriste','#4040A1','ma-vie-de-juriste'),(6,'Ma vie d\'illustrateur','#E0876A','ma-vie-d-illustrateur');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gif`
--

DROP TABLE IF EXISTS `gif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A2371034A76ED395` (`user_id`),
  CONSTRAINT `FK_A2371034A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gif`
--

LOCK TABLES `gif` WRITE;
/*!40000 ALTER TABLE `gif` DISABLE KEYS */;
INSERT INTO `gif` VALUES (1,'Quand on corrige un bug en prod avant que le client ne le remarque hihi','http://ljdchost.com/xTgBXJc.gif','jurassic park girl stressing','2017-04-06 23:53:31','2017-05-16 01:03:53','quand-on-corrige-un-bug-en-prod-avant-que-le-client-ne-le-remarque-hihi',1),(2,'Quand le commercial nous laisse après nous avoir mis sur une mission impossiburu','http://68.media.tumblr.com/b1546629ecf20715d5d1635c2bdea0e8/tumblr_inline_nihlfeYEAG1rqhh9g.gif','creepy asian guy','2017-04-06 23:54:54','2017-05-16 01:02:43','quand-le-commercial-nous-laisse-apres-nous-avoir-mis-sur-une-mission-impossiburu',1),(3,'Quand mon code marche du premier coup hehe','https://media.giphy.com/media/3og0IL91wssvREdqCI/giphy.gif','dude poping up in a pink background gif','2017-04-08 02:43:08','2017-05-16 01:02:22','quand-mon-code-marche-du-premier-coup-hehe',1),(9,'Quand je test un framework et que je me crois déjà super bonne','https://media.giphy.com/media/wLDXxrBcH4FPO/giphy.gif','batman waving superman\'s cape','2017-04-08 02:56:03','2017-05-16 01:02:04','quand-je-test-un-framework-et-que-je-me-crois-deja-super-bonne',1),(10,'Quand internet est coupé','https://media.giphy.com/media/9J7tdYltWyXIY/giphy.gif','john travolta lost in the internet cut','2017-05-16 01:00:22','2017-05-16 01:01:16','quand-internet-est-coupe',1),(11,'Quand le commercial commence à utiliser des termes techniques','https://media.giphy.com/media/dWhHUkuWnGxFK/giphy.gif','Little girl saying oh please','2017-05-16 17:06:02','2017-05-16 17:09:18','quand-le-commercial-commence-a-utiliser-des-termes-techniques',1);
/*!40000 ALTER TABLE `gif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gifs_categories`
--

DROP TABLE IF EXISTS `gifs_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gifs_categories` (
  `gif_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`gif_id`,`category_id`),
  KEY `IDX_E39A680CB75C3F80` (`gif_id`),
  KEY `IDX_E39A680C12469DE2` (`category_id`),
  CONSTRAINT `FK_E39A680C12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_E39A680CB75C3F80` FOREIGN KEY (`gif_id`) REFERENCES `gif` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gifs_categories`
--

LOCK TABLES `gifs_categories` WRITE;
/*!40000 ALTER TABLE `gifs_categories` DISABLE KEYS */;
INSERT INTO `gifs_categories` VALUES (1,4),(2,5),(3,4),(3,5);
/*!40000 ALTER TABLE `gifs_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gifs_tags`
--

DROP TABLE IF EXISTS `gifs_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gifs_tags` (
  `gif_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`gif_id`,`tag_id`),
  KEY `IDX_80C456C3B75C3F80` (`gif_id`),
  KEY `IDX_80C456C3BAD26311` (`tag_id`),
  CONSTRAINT `FK_80C456C3B75C3F80` FOREIGN KEY (`gif_id`) REFERENCES `gif` (`id`),
  CONSTRAINT `FK_80C456C3BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gifs_tags`
--

LOCK TABLES `gifs_tags` WRITE;
/*!40000 ALTER TABLE `gifs_tags` DISABLE KEYS */;
INSERT INTO `gifs_tags` VALUES (11,1);
/*!40000 ALTER TABLE `gifs_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tag_color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_title_unique` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'HAHA','','haha');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'PixelPanda','pixelpanda','samyr.rakoto@gmail.com','samyr.rakoto@gmail.com',1,'l9X.jrwp0oHKVMiO7KNrWqm0GDskCtoCxyoCKa4.N4I','4Tx73/XK3rOjWpZZSZc/u38xSwPjWdaqNwNZXSvNp1Rj3oDQXi7D94EUxPLaRVbSnvLn8Bsr6cWhzgQ/8cy0JA==','2017-04-19 23:54:46',NULL,NULL,'a:0:{}');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_categories`
--

DROP TABLE IF EXISTS `users_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_categories` (
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`category_id`),
  KEY `IDX_ED98E9FCA76ED395` (`user_id`),
  KEY `IDX_ED98E9FC12469DE2` (`category_id`),
  CONSTRAINT `FK_ED98E9FC12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_ED98E9FCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_categories`
--

LOCK TABLES `users_categories` WRITE;
/*!40000 ALTER TABLE `users_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-18 12:55:41
