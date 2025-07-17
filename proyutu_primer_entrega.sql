/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: proyutu
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `rol_id` int(11) DEFAULT 3,
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES
(1,'Juan Pérez','juan@example.com',NULL,NULL,3),
(2,'Valentina Rodríguez','valen.rodriguez92@hotmail.com','+59898765432','2025-06-25',3),
(32,'Ricardo Sanchez','wabalabadubdub@gmail.com','0984324523','2025-07-05',3);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresarios`
--

DROP TABLE IF EXISTS `empresarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `representante` varchar(100) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `sector` varchar(100) DEFAULT NULL,
  `sitio_web` varchar(150) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresarios`
--

LOCK TABLES `empresarios` WRITE;
/*!40000 ALTER TABLE `empresarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'administrador'),
(3,'cliente'),
(2,'proveedor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=990 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES
(120,'Tobias Martine',' Guardia de seguridad en shopping Las Piedras ',30000.00,'seguridad'),
(122,'Roberto Parroqui','Seguridad en eventos / espectáculos ',30000.00,'seguridad'),
(134,'Manuel Pereira','Vigilante armado ',52000.00,'seguridad'),
(156,'Linda Parker','Personal de limpieza en hospitales ',18000.00,'limpieza'),
(173,'Samanta Molina','Personal de limpieza en centros educativos ',16000.00,'limpieza'),
(300,'Markus Spector',' Albañil',60000.00,'construccion'),
(315,'Victor Dum',' Electricista',30000.00,'construccion'),
(320,'Mark Webel','Ayudante de Albañil',25000.00,'construccion'),
(325,'Jorge Gutierrez',' Sanitario',42000.00,'construccion'),
(342,'Robert Deniro','Soy Uber desde el 2020',45000.00,'transporte'),
(402,'Adam Sandler',' Desarrollador de Software Junior ',34900.00,'informatica'),
(422,'Mario Ripoll','Arquitecto',80000.00,'construcción'),
(424,'Mark Weber','Técnico en soporte informático a domicilio',19000.00,'informatica'),
(456,'Ted Mosby','Lead Software Engineer ',132500.00,'informatica'),
(465,'Samuel Abimelec','Guia Turistico ',35000.00,'turismo'),
(467,'Ryan Gosling','Arquitecto de Software ',196600.00,'informatica'),
(489,'Gordon Gomez',' Ingeniero DevOps ',85000.00,'informatica'),
(543,'Mauricio Betralla','Camionero desde 1996',50000.00,'transporte'),
(604,'Facundo Lopez','Transportista Escolar',38000.00,'transporte'),
(705,'Fabricio Aleman','Servicio de transporte de maquinaria o cargas especiales',56000.00,'transporte'),
(722,'Javier Hernandez',' Profesor particular de Matematicas ',24000.00,'educacion'),
(734,'Roberto Carlos',' Profesor particular de Historia ',26000.00,'educacion'),
(759,'Camionero','Trabajo para TL 300 Transporte y Carga',1500.00,NULL),
(788,'Leandro Tito',' Profesor particular de Ingles ',28000.00,'educacion'),
(800,'Agustin Fernandez',' Profesor particular de Fisica ',29000.00,'educacion'),
(830,'Mateus Rodriguez','Técnico en reparación de electrodomésticos ',30000.00,'electrodomesticos'),
(890,'Rodrigo Mesa',' Profesor particular de Español ',17000.00,'educacion'),
(895,'Francisco Valiante',' Profesor particular de Finanzas ',19000.00,'educacion'),
(900,'Alberto Rodriguez','Mensajeria y paqueteria express',42000.00,'transporte'),
(910,'Andres Echavarria','Plomero sanitario ',30000.00,'mantenimiento'),
(932,'Marcos Solis',' Adidas  shop ',32500.00,'ventaropa'),
(940,'Ben Grim','Técnico en refrigeración / aire acondicionado ',40000.00,'mantenimiento'),
(945,'Reed Richards','Mantenimiento en hoteles o shoppings ',50000.00,'mantenimiento'),
(949,'Diana Ripoll',' Adidas  shop ',18000.00,'ventaropa'),
(953,'Jose Antonio',' Nike shop ',20000.00,'ventaropa'),
(969,'Markus Sullyvan',' H&M  shop ',18500.00,'ventaropa'),
(989,'Maria Selina',' BlackStore ',21500.00,'ventaropa');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-17 18:15:12
