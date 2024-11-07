-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: diabsweet
-- ------------------------------------------------------
-- Server version	8.0.39

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

--
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimento` (
  `id_alimento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `indice_glucemico` int DEFAULT NULL,
  `clase_alimento` int DEFAULT NULL,
  PRIMARY KEY (`id_alimento`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `alimento_claseAlimento` (`clase_alimento`),
  CONSTRAINT `alimento_claseAlimento` FOREIGN KEY (`clase_alimento`) REFERENCES `clase_alimento` (`id_clase`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES (1,'Espinaca',15,1),(2,'Brócoli',10,1),(3,'Lechuga',15,1),(4,'Pepino',15,1),(5,'Apio',15,1),(6,'Col rizada',15,1),(7,'Acelga',15,1),(8,'Berro',15,1),(9,'Coliflor',15,1),(10,'Judías verdes',15,1),(11,'Fresas',25,2),(12,'Moraz',25,2),(13,'Frambuesas',25,2),(14,'Manzana',36,2),(15,'Peras',38,2),(16,'Cerezas',22,2),(17,'Pomelos',25,2),(18,'Durazno',28,2),(19,'Kiwi',52,2),(20,'Melocotón',28,2),(21,'Pechuga de pollo',0,3),(22,'Pechuga de pavo',0,3),(23,'Pescado (salmón)',0,3),(24,'Atún',0,3),(25,'Carne de res magra',0,3),(26,'Tofu',0,3),(27,'Claras de huevo',0,3),(28,'Camarones',0,3),(29,'Pechuga de pato',0,3),(30,'Conejo',0,3),(31,'Lentejas',21,4),(32,'Garbanzos',28,4),(33,'Frijoles negros',30,4),(34,'Frijoles rojos',29,4),(35,'Guisantes verdes',39,4),(36,'Alubias',32,4),(37,'Lentejas rojas',21,4),(38,'Frijoles de soya',18,4),(39,'Judías blancas',31,4),(40,'Frijoles mungo',25,4),(41,'Avena',55,5),(42,'Quinoa',53,5),(43,'Arroz integral',50,5),(44,'Cebada',28,5),(45,'Mijo',50,5),(46,'Amaranto',97,5),(47,'Trigo integral',41,5),(48,'Centeno',41,5),(49,'Sorgo',53,5),(50,'Freekeh',43,5),(51,'Almendras',0,6),(52,'Nueces',0,6),(53,'Avellanas',0,6),(54,'Pistachos',0,6),(55,'Anacardos',0,6),(56,'Semillas de chía',0,6),(57,'Semillas de lino',0,6),(58,'Semillas de calabaza',0,6),(59,'Nueces de macadamia',0,6),(60,'Semillas de girasol',0,6),(61,'Leche descremada',32,7),(62,'Yogur natural sin azúcar',36,7),(63,'Queso cottage bajo en grasa',0,7),(64,'Leche de almendra',30,7),(65,'Leche de soya',30,7),(66,'Queso ricotta bajo en grasa',0,7),(67,'Yogur griego bajo en grasa',10,7),(68,'Leche de coco light',25,7),(69,'Queso parmesano bajo en grasa',0,7),(70,'Queso mozzarella bajo en grasa',0,7),(71,'Batata',44,8),(72,'Ñame',43,8),(73,'Yuca',46,8),(74,'Papas moradas',50,8),(75,'Papas dulces',50,8),(76,'Camote',48,8),(77,'Papas nuevas',52,8),(78,'Papas rojas',56,8),(79,'Papas en puré (sin añadir azúcar)',55,8),(80,'Papas asadas',53,8),(81,'Aceite de oliva extra virgen',0,9),(82,'Aceite de aguacate',0,9),(83,'Aceite de coco',0,9),(84,'Aceite de nuez',0,9),(85,'Aceite de linaza',0,9),(86,'Aceite de almendra',0,9),(87,'Aceite de semilla de uva',0,9),(88,'Aceite de sésamo',0,9),(89,'Aceite de canola',0,9),(90,'Aceite de girasol',0,9);
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-07 17:02:25
