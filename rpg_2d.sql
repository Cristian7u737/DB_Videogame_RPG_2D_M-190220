CREATE DATABASE  IF NOT EXISTS `rpg_2d` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rpg_2d`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: rpg_2d
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

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL,
  `id_item_FK` int NOT NULL,
  `numSlot` int NOT NULL,
  `numMaxAcumulacion` varchar(45) NOT NULL,
  `icono` blob,
  PRIMARY KEY (`id_inventario`,`id_item_FK`),
  UNIQUE KEY `numSlot_UNIQUE` (`numSlot`),
  KEY `id_item_FK_II_idx` (`id_item_FK`),
  CONSTRAINT `id_item_FK_II` FOREIGN KEY (`id_item_FK`) REFERENCES `item` (`id_item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,1,'1',NULL),(2,2,2,'20',NULL),(3,3,3,'20',NULL),(4,4,4,'30',NULL),(5,5,5,'10',NULL);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `icono` blob,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo` enum('armas','posiones','pergaminos','ingredientes','tesoros') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `consumible` tinyint NOT NULL,
  `acumulable` tinyint NOT NULL,
  `acumulacionMax` int NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'mazo',NULL,'Maza pequeña de madera para golpear, aplastar o machacar.','armas',0,1,1),(2,'miel',NULL,'aumenta el nivel de vida en un diez por ciento','posiones',1,1,20),(3,'fuego',NULL,'se usa con otro percamino para crear una arma de fuego','pergaminos',0,1,20),(4,'medipack',NULL,'aumenta en un 50 por ciento la vida y en el mana en un 30 por ciento','ingredientes',1,1,30),(5,'shuriken',NULL,'arma arrojable que atraviesa a varios enemigos','tesoros',0,1,10);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `correoElectronico` varchar(45) NOT NULL,
  `fechaRegistro` date NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `avatar` blob,
  PRIMARY KEY (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Cristian','cristiannoche@gmail.com','2022-11-06','c4321',NULL),(2,'Daniela','danielaaguilar@gmail.com','2022-11-05','d1234',NULL),(3,'Pedro','pedronnoche@gmail.com','2022-11-04','p7894',NULL),(4,'Jhon','jhoncazares@gmail.com','2022-11-03','j4567',NULL),(5,'Max','maxjunior@gmail.com','2022-11-02','m4328',NULL);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaje`
--

DROP TABLE IF EXISTS `personaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personaje` (
  `id_personaje` int NOT NULL AUTO_INCREMENT,
  `id_inventario_FK` int NOT NULL,
  `id_jugador_FK` int NOT NULL,
  `nombrePersonaje` varchar(45) NOT NULL,
  `numMaxEnemigosDerrotados` int NOT NULL,
  `misionesCumplidas` int NOT NULL,
  `posX` int NOT NULL,
  `posY` int NOT NULL,
  `totalTiempoJugado` time NOT NULL,
  PRIMARY KEY (`id_personaje`),
  KEY `id_inventario_FK_I_idx` (`id_inventario_FK`),
  KEY `id_jugador_FK_II_idx` (`id_jugador_FK`),
  CONSTRAINT `id_inventario_FK_I` FOREIGN KEY (`id_inventario_FK`) REFERENCES `inventario` (`id_inventario`),
  CONSTRAINT `id_jugador_FK_II` FOREIGN KEY (`id_jugador_FK`) REFERENCES `jugador` (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaje`
--

LOCK TABLES `personaje` WRITE;
/*!40000 ALTER TABLE `personaje` DISABLE KEYS */;
INSERT INTO `personaje` VALUES (1,1,1,'cris777',50,20,12,13,'01:30:46'),(2,2,2,'dani666',30,10,12,13,'02:30:46'),(3,3,3,'pedro888',40,30,17,11,'30:00:46'),(4,4,4,'john444',30,10,23,25,'40:00:46'),(5,5,5,'max222',34,21,21,31,'15:30:46');
/*!40000 ALTER TABLE `personaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08 23:27:23
