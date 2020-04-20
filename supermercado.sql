-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: Tenda
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `Caixer`
--

DROP TABLE IF EXISTS `Caixer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Caixer` (
  `ID_CAIXER` int(5) NOT NULL AUTO_INCREMENT,
  `DNI_CLIENT` varchar(9) NOT NULL,
  `NOM_CAIXER` varchar(15) NOT NULL,
  `COGNOM_CAIXER` varchar(15) NOT NULL,
  `TEL_CAIXER` varchar(9) NOT NULL,
  PRIMARY KEY (`ID_CAIXER`),
  KEY `DNI_CLIENT` (`DNI_CLIENT`),
  CONSTRAINT `Caixer_ibfk_1` FOREIGN KEY (`DNI_CLIENT`) REFERENCES `Clients` (`DNI_CLIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caixer`
--

LOCK TABLES `Caixer` WRITE;
/*!40000 ALTER TABLE `Caixer` DISABLE KEYS */;
INSERT INTO `Caixer` VALUES (23,'12366677E','Lluc','Avellan','932541525'),(34,'11363547X','Pau','Barber','938742595'),(54,'14366677W','Fran','Català','932457825'),(123,'12366677Z','Roser','Avellan','934524565');
/*!40000 ALTER TABLE `Caixer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clients` (
  `DNI_CLIENT` varchar(9) NOT NULL,
  `NOM_CLIENT` varchar(15) NOT NULL,
  `COGNOM_CLIENT` varchar(15) NOT NULL,
  `TEL_CLIENT` varchar(9) NOT NULL,
  `TIP_CLIENT` varchar(15) NOT NULL,
  PRIMARY KEY (`DNI_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES ('11363547X','Pau','Barber','938742595','Normal'),('12366677E','Lluc','Avellan','932541525','Preferent'),('12366677Z','Roser','Avellan','934524565','Normal'),('14366677W','Fran','Català','932457825','Normal'),('25366677S','David','Campos','934152545','Preferent');
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compra`
--

DROP TABLE IF EXISTS `Compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compra` (
  `ID_COMPRA` bigint(15) NOT NULL AUTO_INCREMENT,
  `DNI_CLIENT` varchar(9) NOT NULL,
  `DATA_COMPRA` datetime NOT NULL,
  `ID_CAIXER` int(5) NOT NULL,
  PRIMARY KEY (`ID_COMPRA`),
  KEY `DNI_CLIENT` (`DNI_CLIENT`),
  KEY `ID_CAIXER` (`ID_CAIXER`),
  CONSTRAINT `Compra_ibfk_1` FOREIGN KEY (`DNI_CLIENT`) REFERENCES `Clients` (`DNI_CLIENT`),
  CONSTRAINT `Compra_ibfk_2` FOREIGN KEY (`ID_CAIXER`) REFERENCES `Caixer` (`ID_CAIXER`)
) ENGINE=InnoDB AUTO_INCREMENT=3456433534340 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compra`
--

LOCK TABLES `Compra` WRITE;
/*!40000 ALTER TABLE `Compra` DISABLE KEYS */;
INSERT INTO `Compra` VALUES (3456433534333,'25366677S','2008-12-12 14:45:00',123),(3456433534334,'25366677S','2008-12-12 14:50:00',54),(3456433534335,'14366677W','2008-12-12 16:55:00',54),(3456433534336,'11363547X','2008-12-13 17:45:00',123),(3456433534337,'12366677E','2008-12-13 17:46:00',54),(3456433534338,'12366677Z','2008-12-13 13:00:00',123),(3456433534339,'12366677Z','2008-12-13 13:50:00',123);
/*!40000 ALTER TABLE `Compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Linia_Compra`
--

DROP TABLE IF EXISTS `Linia_Compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Linia_Compra` (
  `ID_COMPRA` bigint(15) NOT NULL,
  `ID_LINIA` int(10) NOT NULL,
  `ID_PRODUCTE` int(5) NOT NULL,
  `UNITATS_COMPRA` int(5) NOT NULL,
  `TOTAL_LINIA` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID_COMPRA`,`ID_LINIA`),
  CONSTRAINT `Linia_Compra_ibfk_1` FOREIGN KEY (`ID_COMPRA`) REFERENCES `Compra` (`ID_COMPRA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Linia_Compra`
--

LOCK TABLES `Linia_Compra` WRITE;
/*!40000 ALTER TABLE `Linia_Compra` DISABLE KEYS */;
INSERT INTO `Linia_Compra` VALUES (3456433534333,1,2,2,' '),(3456433534333,2,3,1,' '),(3456433534333,3,4,2,' '),(3456433534334,1,1,1,' '),(3456433534335,1,1,2,' '),(3456433534336,1,3,1,' '),(3456433534337,1,3,2,' '),(3456433534337,2,2,1,' '),(3456433534337,3,4,2,' '),(3456433534337,4,6,2,' '),(3456433534338,1,7,1,' ');
/*!40000 ALTER TABLE `Linia_Compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-30 19:02:01
