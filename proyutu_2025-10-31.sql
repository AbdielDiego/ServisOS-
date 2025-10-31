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
-- Table structure for table `BanUsers`
--

DROP TABLE IF EXISTS `BanUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `BanUsers` (
  `ban_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `banned_by` int(11) DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ban_id`),
  UNIQUE KEY `uq_ban_user` (`user_id`),
  UNIQUE KEY `uq_ban_email` (`email`),
  KEY `idx_banned_by` (`banned_by`),
  CONSTRAINT `fk_ban_admin` FOREIGN KEY (`banned_by`) REFERENCES `Users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ban_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BanUsers`
--

LOCK TABLES `BanUsers` WRITE;
/*!40000 ALTER TABLE `BanUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `BanUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES
(75,'Aire Acondicionado'),
(65,'Albañilería'),
(20,'Automatizacion'),
(18,'Backend'),
(3,'Bases de Datos'),
(15,'Big Data'),
(14,'Blockchain'),
(69,'Carpintería'),
(73,'Cerrajería'),
(5,'Ciberseguridad'),
(11,'Ciencia de Datos'),
(7,'Cloud Computing'),
(64,'Construcción'),
(83,'Cuidado de Mascotas'),
(16,'Desarrollo Movil'),
(2,'Desarrollo Web'),
(6,'DevOps'),
(80,'Diseño Gráfico'),
(9,'Diseño UX/UI'),
(67,'Electricidad'),
(76,'Electrodomésticos'),
(10,'Emprendimiento'),
(82,'Eventos'),
(84,'Fletes'),
(81,'Fotografía'),
(17,'Frontend'),
(22,'Gaming'),
(74,'Gasista'),
(70,'Herrería'),
(77,'Informática'),
(4,'Inteligencia Artificial'),
(21,'Internet de las Cosas'),
(71,'Jardinería'),
(72,'Limpieza'),
(12,'Machine Learning'),
(8,'Marketing Digital'),
(63,'Mensajería'),
(62,'Mudanzas'),
(66,'Pintura'),
(68,'Plomería'),
(1,'Programacion'),
(13,'Realidad Virtual'),
(78,'Redes y Cableado'),
(79,'Soporte Técnico'),
(85,'Tapicería'),
(19,'Testing de Software'),
(61,'Transporte'),
(86,'Vidriería');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `edit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`),
  CONSTRAINT `Comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
INSERT INTO `Comments` VALUES
(1,1,2,'¡Excelente introducción! Muy claro para principiantes.','2023-02-01 14:00:00',NULL),
(2,1,NULL,'¿Hay algún recurso para practicar los conceptos?','2023-02-01 15:00:00',NULL),
(3,2,1,'Siempre me confundo con Grid y Flexbox, ¡esto ayuda mucho!','2023-02-03 18:00:00',NULL),
(4,3,4,'La normalización es clave, buen recordatorio.','2023-02-05 13:00:00',NULL),
(5,4,5,'Interesante, probaré Scikit-learn este fin de semana.','2023-02-07 15:00:00',NULL),
(6,5,6,'Muy buenos tips de seguridad, ¡gracias!','2023-02-09 20:00:00',NULL),
(7,6,7,'Docker es un cambio de juego, totalmente de acuerdo.','2023-02-11 14:30:00',NULL),
(8,7,8,'AWS EC2 es un buen punto de partida para la nube.','2023-02-13 17:00:00',NULL),
(9,8,9,'No había pensado en el SEO desde el código, ¡buen post!','2023-02-15 13:00:00',NULL),
(10,9,10,'Los principios UX son fundamentales para cualquier producto.','2023-02-17 19:00:00',NULL),
(11,10,1,'Emprender es un desafío, pero posts como este inspiran.','2023-02-19 15:00:00',NULL),
(12,11,3,'POO en Java es la base, bien explicado.','2023-02-21 14:00:00',NULL),
(13,12,4,'React Hooks simplifican mucho el desarrollo, ¡me encantan!','2023-02-23 18:00:00',NULL),
(14,13,5,'Las JOINs siempre son un dolor de cabeza, pero este post ayuda.','2023-02-25 13:30:00',NULL),
(15,14,6,'CNNs son fascinantes, ¡quiero aprender más!','2023-02-27 16:00:00',NULL),
(16,15,7,'Seguridad es lo primero, gracias por los consejos.','2023-03-01 20:00:00',NULL),
(17,16,8,'Jenkins es robusto, lo usamos en mi empresa.','2023-03-03 14:15:00',NULL),
(18,17,9,'Serverless es el futuro, ¡muy interesante!','2023-03-05 17:45:00',NULL),
(19,18,10,'El email marketing sigue siendo muy efectivo.','2023-03-07 13:40:00',NULL),
(20,19,11,'Figma es una herramienta increíble para prototipar.','2023-03-09 19:30:00',NULL),
(21,20,12,'Automatización con Python me ha ahorrado mucho tiempo.','2023-04-01 15:45:00',NULL),
(22,21,13,'Pandas es una joya para el análisis de datos.','2023-03-13 14:00:00',NULL),
(23,22,NULL,'¿Qué otros frameworks de Deep Learning recomiendan?','2023-03-15 18:30:00',NULL),
(24,23,14,'Unity es muy potente para VR.','2023-03-17 13:15:00',NULL),
(25,24,15,'Blockchain es complejo, pero este post lo hace más claro.','2023-03-19 15:00:00',NULL),
(26,25,16,'Big Data es un campo con mucho futuro.','2023-03-21 20:45:00',NULL),
(27,30,26,'buen servicio','2025-08-21 23:41:13',NULL),
(28,20,26,'buen servicio','2025-08-21 23:55:54',NULL),
(30,1,37,'wow que genial','2025-08-23 16:04:30',NULL),
(31,30,24,'ola','2025-08-30 00:38:03',NULL),
(32,22,26,'wow que genial','2025-08-30 00:43:11',NULL),
(33,28,26,'fdd','2025-08-30 02:11:13',NULL),
(34,11,26,'increible','2025-08-30 16:52:53',NULL),
(35,9,26,'wow','2025-08-31 19:27:29',NULL),
(36,30,24,'wasd','2025-09-01 14:49:43',NULL),
(37,32,24,'Wow! Genial!','2025-09-08 21:37:59',NULL),
(39,35,42,'ok','2025-09-22 16:12:03',NULL),
(48,37,26,'ok','2025-10-18 17:40:30',NULL),
(49,37,26,'ok','2025-10-18 17:59:17',NULL),
(56,1,24,'hs','2025-10-29 00:48:19','2025-10-29 00:48:36 by 24'),
(58,1,26,'ok','2025-10-29 16:53:09',NULL),
(59,1,26,'oo','2025-10-29 17:18:22',NULL),
(60,1,26,'pp','2025-10-29 17:20:10',NULL),
(61,1,26,'ooo','2025-10-29 17:45:05',NULL),
(63,41,26,'ll','2025-10-29 18:51:12',NULL),
(65,42,26,'ooo','2025-10-29 19:25:14',NULL);
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContractedService`
--

DROP TABLE IF EXISTS `ContractedService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContractedService` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContractedService`
--

LOCK TABLES `ContractedService` WRITE;
/*!40000 ALTER TABLE `ContractedService` DISABLE KEYS */;
INSERT INTO `ContractedService` VALUES
(1,24,'Consulta sobre tu servicio: Vendo PCS (Contratación)','✅ Servicio contratado\n\nQUiero 10','2025-10-18 16:14:23'),
(2,24,'Consulta sobre tu servicio: Vendo PCS (Contratación)','✅ Servicio contratado\n\nQUiero 1','2025-10-20 09:21:46'),
(3,46,'Consulta sobre tu servicio: Vendo PCS (Contratación)','✅ Servicio contratado\n\nQuiero 1 pc, con 16 de ram, y que sea azul','2025-10-27 16:20:02'),
(4,26,'Consulta sobre tu servicio: Plomeria expres (Contratación)','✅ Servicio contratado\n\nquiero contratarte','2025-10-29 16:25:47'),
(5,48,'Consulta sobre tu servicio (Contratación)','✅ Servicio contratado\n\nme interesa','2025-10-31 15:45:29');
/*!40000 ALTER TABLE `ContractedService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostTags`
--

DROP TABLE IF EXISTS `PostTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PostTags` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `PostTags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `Posts` (`post_id`),
  CONSTRAINT `PostTags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `Tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostTags`
--

LOCK TABLES `PostTags` WRITE;
/*!40000 ALTER TABLE `PostTags` DISABLE KEYS */;
INSERT INTO `PostTags` VALUES
(1,1),
(1,27),
(2,4),
(2,24),
(3,3),
(3,19),
(4,13),
(4,19),
(5,14),
(6,8),
(6,15),
(7,9),
(7,16),
(8,10),
(8,24),
(9,11),
(9,12),
(10,18),
(11,1),
(12,6),
(12,24),
(13,3),
(14,20),
(15,14),
(16,15),
(17,9),
(17,16),
(18,17),
(19,11),
(20,1),
(20,27),
(21,1),
(21,19),
(22,20),
(23,28),
(24,21),
(25,22),
(26,23),
(27,6),
(27,24),
(28,7),
(28,25),
(29,2),
(29,26),
(30,1),
(30,27);
/*!40000 ALTER TABLE `PostTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `Posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Posts_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES
(1,1,1,'Introducción a Python para Principiantes','Descubre los fundamentos de Python y por qué es ideal para empezar en la programación.',0,'2023-02-01 13:00:00','2023-02-01 13:00:00'),
(2,2,2,'CSS Grid vs Flexbox: ¿Cuál usar y cuándo?','Una guía completa para entender las diferencias y aplicaciones de CSS Grid y Flexbox.',0,'2023-02-03 17:30:00','2023-02-03 17:30:00'),
(3,3,3,'Normalización de Bases de Datos: Conceptos Clave','Exploramos las formas normales y su importancia en el diseño de bases de datos relacionales.',0,'2023-02-05 12:15:00','2023-02-05 12:15:00'),
(4,4,4,'Machine Learning con Scikit-learn: Un Primer Acercamiento','Cómo construir tu primer modelo de Machine Learning usando la librería Scikit-learn.',0,'2023-02-07 14:00:00','2023-02-07 14:00:00'),
(5,5,5,'Protegiendo tu Aplicación Web: Medidas Básicas de Seguridad','Consejos esenciales para proteger tu aplicación de ataques comunes.',0,'2023-02-09 19:45:00','2023-02-09 19:45:00'),
(6,6,6,'Introducción a Docker para Desarrolladores','Aprende a contenerizar tus aplicaciones con Docker y simplifica tu flujo de trabajo.',0,'2023-02-11 13:30:00','2023-02-11 13:30:00'),
(7,7,7,'Despliegue en la Nube: AWS EC2 para Principiantes','Pasos para desplegar tu primera aplicación en una instancia EC2 de AWS.',0,'2023-02-13 16:00:00','2023-02-13 16:00:00'),
(8,8,8,'SEO para Desarrolladores: Optimizando tu Código','Cómo el código que escribes puede influir en el SEO de tu sitio web.',0,'2023-02-15 12:00:00','2023-02-15 12:00:00'),
(9,9,9,'Principios de Diseño UX: Creando Experiencias Intuitivas','Descubre los principios fundamentales del diseño de experiencia de usuario.',0,'2023-02-17 18:00:00','2023-02-17 18:00:00'),
(10,10,10,'De la Idea al Producto: Pasos para Emprender en Tech','Una guía para convertir tu idea en un producto tecnológico exitoso.',0,'2023-02-19 14:45:00','2023-02-19 14:45:00'),
(11,11,1,'Programación Orientada a Objetos en Java','Conceptos esenciales de POO aplicados en Java.',0,'2023-02-21 13:00:00','2023-02-21 13:00:00'),
(12,12,2,'React Hooks: Simplificando el Estado y el Ciclo de Vida','Cómo usar los Hooks de React para escribir componentes más limpios y funcionales.',0,'2023-02-23 17:00:00','2023-02-23 17:00:00'),
(13,13,3,'Consultas Avanzadas con SQL: JOINs y Subconsultas','Domina las consultas complejas para extraer datos de múltiples tablas.',0,'2023-02-25 12:30:00','2023-02-25 12:30:00'),
(14,14,4,'Redes Neuronales Convolucionales (CNNs) Explicadas','Entendiendo cómo las CNNs revolucionan el procesamiento de imágenes.',0,'2023-02-27 15:00:00','2023-02-27 15:00:00'),
(15,15,5,'Autenticación y Autorización en Aplicaciones Web','Diferencias y mejores prácticas para gestionar el acceso de usuarios.',0,'2023-03-01 19:00:00','2023-03-01 19:00:00'),
(16,16,6,'CI/CD con Jenkins: Automatizando tu Despliegue','Configura un pipeline de integración y entrega continua con Jenkins.',0,'2023-03-03 13:15:00','2023-03-03 13:15:00'),
(17,17,7,'Servidores Serverless con AWS Lambda','Construye aplicaciones escalables sin preocuparte por la infraestructura.',0,'2023-03-05 16:45:00','2023-03-05 16:45:00'),
(18,18,8,'Email Marketing Efectivo: Estrategias y Herramientas','Cómo diseñar campañas de email marketing que conviertan.',0,'2023-03-07 12:40:00','2023-03-07 12:40:00'),
(19,19,9,'Prototipado Rápido con Figma','Crea prototipos interactivos de tus diseños de UX/UI con Figma.',0,'2023-03-09 18:30:00','2023-03-09 18:30:00'),
(20,20,10,'Financiación para Startups: Opciones y Consejos','Explora las diferentes vías de financiación para tu emprendimiento tecnológico.',0,'2023-03-11 14:00:00','2023-03-11 14:00:00'),
(21,1,11,'Análisis Exploratorio de Datos con Pandas','Primeros pasos en el análisis de datos usando la librería Pandas en Python.',0,'2023-03-13 13:00:00','2023-03-13 13:00:00'),
(22,2,12,'Introducción al Deep Learning con TensorFlow','Conceptos básicos y cómo construir tu primera red neuronal profunda.',0,'2023-03-15 17:30:00','2023-03-15 17:30:00'),
(23,3,13,'Desarrollo de Aplicaciones de Realidad Virtual con Unity','Creando experiencias inmersivas desde cero.',0,'2023-03-17 12:15:00','2023-03-17 12:15:00'),
(24,4,14,'Entendiendo Blockchain: La Tecnología Detrás de las Criptomonedas','Una explicación sencilla de cómo funciona la tecnología blockchain.',0,'2023-03-19 14:00:00','2023-03-19 14:00:00'),
(25,5,15,'Big Data: Almacenamiento y Procesamiento Distribuido','Cómo manejar grandes volúmenes de datos con herramientas como Hadoop y Spark.',0,'2023-03-21 19:45:00','2023-03-21 19:45:00'),
(26,6,16,'Desarrollo de Apps Nativas con Swift para iOS','Primeros pasos en la creación de aplicaciones para iPhone y iPad.',0,'2023-03-23 13:30:00','2023-03-23 13:30:00'),
(27,7,17,'Frameworks Frontend: Comparativa de React, Angular y Vue','Analizamos las ventajas y desventajas de los frameworks más populares.',0,'2023-03-25 16:00:00','2023-03-25 16:00:00'),
(28,8,18,'Desarrollo Backend con Node.js y Express','Construye APIs RESTful robustas y escalables con Node.js.',0,'2023-03-27 12:00:00','2023-03-27 12:00:00'),
(29,9,19,'Pruebas Unitarias en JavaScript con Jest','Asegura la calidad de tu código JavaScript con pruebas unitarias.',0,'2023-03-29 18:00:00','2023-03-29 18:00:00'),
(30,10,20,'Automatización de Tareas con Python','Scripts útiles para automatizar procesos repetitivos en tu día a día.',0,'2023-04-01 14:45:00','2023-04-01 14:45:00'),
(31,24,18,'Novedad de prueba','Esto es una prueba',0,'2025-09-05 12:19:38','2025-09-05 12:19:38'),
(32,26,22,'Curso de Clash Royale','Aprende a jugar como un verdadero crack... y consigue 5000 copas en menos de 2 dias',0,'2025-09-05 16:06:49','2025-09-05 16:06:49'),
(33,27,NULL,'Taller de escritura creativa','Aprenderás a desarrollar tus facultades creativas.',0,'2025-09-08 21:40:21','2025-09-08 21:40:21'),
(35,24,2,'Otra prueba','Cosas utiles y asi viste...',0,'2025-09-15 11:28:30','2025-09-15 11:28:30'),
(37,26,10,'Vendo PCS','eee bendo pcs',0,'2025-09-29 11:23:37','2025-10-28 11:37:41'),
(40,27,8,'Paquete turístico a Cancún','Paquete a Cancún. 7 noches más boleto de avión. 699 usd',0,'2025-10-28 02:10:08','2025-10-28 02:10:08'),
(41,24,68,'Plomeria expres','Plomeria a domicilio',0,'2025-10-28 11:43:05','2025-10-28 11:43:05'),
(42,26,76,'Vendo PlayStation 5','PlayStation 5, con 1 mando, 3 juegos a eleccion y practicamente nueva',35000,'2025-10-28 19:44:17','2025-10-28 19:44:17'),
(43,24,10,'Clases de Guitarra','Clases de guitarra para ser profecionales',4000,'2025-10-31 18:15:27','2025-10-31 18:15:27'),
(44,48,83,'Paseo de perros','Paseo perros por las tardes de 5pm a 9pm',600,'2025-10-31 18:46:20','2025-10-31 18:46:20');
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profile`
--

DROP TABLE IF EXISTS `Profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Profile` (
  `user_id` int(11) NOT NULL,
  `profile_visit` int(11) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profile`
--

LOCK TABLES `Profile` WRITE;
/*!40000 ALTER TABLE `Profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProfileVisitors`
--

DROP TABLE IF EXISTS `ProfileVisitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProfileVisitors` (
  `profile_user_id` int(11) NOT NULL,
  `visitor_user_id` int(11) NOT NULL,
  `first_seen_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`profile_user_id`,`visitor_user_id`),
  KEY `fk_pv_visitor` (`visitor_user_id`),
  CONSTRAINT `fk_pv_owner` FOREIGN KEY (`profile_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pv_visitor` FOREIGN KEY (`visitor_user_id`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProfileVisitors`
--

LOCK TABLES `ProfileVisitors` WRITE;
/*!40000 ALTER TABLE `ProfileVisitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProfileVisitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RolUsers`
--

DROP TABLE IF EXISTS `RolUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RolUsers` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_name` varchar(50) NOT NULL,
  PRIMARY KEY (`rol_id`),
  UNIQUE KEY `rol_name` (`rol_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RolUsers`
--

LOCK TABLES `RolUsers` WRITE;
/*!40000 ALTER TABLE `RolUsers` DISABLE KEYS */;
INSERT INTO `RolUsers` VALUES
(1,'Admin'),
(2,'User');
/*!40000 ALTER TABLE `RolUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tags`
--

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;
INSERT INTO `Tags` VALUES
(27,'Automatizacion'),
(9,'AWS'),
(25,'Backend'),
(22,'Big Data'),
(21,'Blockchain'),
(14,'Ciberseguridad'),
(16,'Cloud'),
(4,'CSS'),
(19,'Data Science'),
(20,'Deep Learning'),
(15,'DevOps'),
(8,'Docker'),
(18,'Emprendimiento'),
(24,'Frontend'),
(29,'Gaming'),
(5,'HTML'),
(28,'IoT'),
(2,'JavaScript'),
(13,'Machine Learning'),
(17,'Marketing'),
(23,'Mobile'),
(7,'Node.js'),
(1,'Python'),
(6,'React'),
(10,'SEO'),
(3,'SQL'),
(26,'Testing'),
(12,'UI'),
(11,'UX');
/*!40000 ALTER TABLE `Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol_id` int(11) DEFAULT 2,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `Users_ibfk_rol` (`rol_id`),
  CONSTRAINT `Users_ibfk_rol` FOREIGN KEY (`rol_id`) REFERENCES `RolUsers` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES
(1,'juanperez','juan.perez@example.com','hash_jperez123',1,'2023-01-15 13:00:00'),
(2,'mariagomez','maria.gomez@example.com','hash_mgomez456',2,'2023-01-18 14:30:00'),
(3,'carlosruiz','carlos.ruiz@example.com','hash_cruiz789',2,'2023-01-20 17:45:00'),
(4,'laurafernandez','laura.fernandez@example.com','hash_lfernandez012',2,'2023-02-01 12:15:00'),
(5,'pedrosanchez','pedro.sanchez@example.com','hash_psanchez345',2,'2023-02-05 19:00:00'),
(6,'anagarcia','ana.garcia@example.com','hash_agarcia678',2,'2023-02-10 13:20:00'),
(7,'javierlopez','javier.lopez@example.com','hash_jlopez901',2,'2023-02-12 16:05:00'),
(8,'sofiamartinez','sofia.martinez@example.com','hash_smartinez234',2,'2023-02-15 20:30:00'),
(9,'diegovazquez','diego.vazquez@example.com','hash_dvazquez567',2,'2023-02-20 11:40:00'),
(10,'elenamartin','elena.martin@example.com','hash_emartin890',2,'2023-02-22 15:10:00'),
(11,'ricardodiaz','ricardo.diaz@example.com','hash_rdiaz123',2,'2023-03-01 12:55:00'),
(12,'patriciahernandez','patricia.hernandez@example.com','hash_phernandez456',2,'2023-03-05 17:00:00'),
(13,'miguelgonzalez','miguel.gonzalez@example.com','hash_mgonzalez789',2,'2023-03-08 14:00:00'),
(14,'rociojimenez','rocio.jimenez@example.com','hash_rjimenez012',2,'2023-03-10 19:30:00'),
(15,'fernandoruiz','fernando.ruiz@example.com','hash_fruiz345',2,'2023-03-15 13:45:00'),
(16,'valeriasoto','valeria.soto@example.com','hash_vsoto678',2,'2023-03-18 16:20:00'),
(17,'gabrielblanco','gabriel.blanco@example.com','hash_gblanco901',2,'2023-03-20 12:00:00'),
(18,'luciaalonso','lucia.alonso@example.com','hash_lalonso234',2,'2023-03-25 18:10:00'),
(19,'sergiomoreno','sergio.moreno@example.com','hash_smoreno567',2,'2023-03-28 14:50:00'),
(20,'andrearomero','andrea.romero@example.com','hash_aromero890',2,'2023-04-01 17:00:00'),
(21,'davidperez','david.perez@example.com','hash_dperez111',2,'2023-04-05 13:00:00'),
(22,'cristinagarcia','cristina.garcia@example.com','hash_cgarcia222',2,'2023-04-08 14:30:00'),
(23,'pepe','pepeloconaz@gmail.com','$2y$10$tiZWsr9VNIv/79Si./hxN.zmIHqepLHRat/Sksce0nflSYq7kSRAK',2,'2025-08-13 16:43:08'),
(24,'diego','diego@gmail.com','$2y$10$PNqNaFqmsMbA5JdzOrPFFec/yhluKyF6mg7QPJfK/RY3RL296SUWa',1,'2025-08-13 19:46:14'),
(25,'bruno','bruno@gmail.com','$2y$10$3cRVZcJyOn2KXVewNAenO.BWriujXihTsK1jtbI47jYyTWZe9N3Ae',2,'2025-08-13 21:16:04'),
(26,'samuel55','samuel@gmail.com','$2y$10$Z3ANdQ6F/7r4a/F9eh/o3ObI/kxisePksbwqMp3XNeVfwvruQQPCu',2,'2025-08-13 21:18:13'),
(27,'alain Alvarez','alain@gmail.com','$2y$10$EDmIG7OyX5qTl6VF6KEQqOEpYwBGn3C43oSHfEfSAoySzzqa7Kn1S',2,'2025-08-13 21:25:58'),
(28,'Administrador','Admin@gmail.com','$2y$10$EdgEwH34fnB9fMntUNzrrOEH5IS5S1s6YjBrH8aMIoG2kZy9o8RA2',1,'2025-08-14 19:35:40'),
(29,'pedrito perez pereira','pedriope@gmail.com','$2y$10$K4I3kMV6ZoMsysbwS8jO0Of07scSASv9.8jZg6VaiJ1URaNPkkVXS',2,'2025-08-14 20:41:37'),
(30,'luciabo astol','astolluciano@gmail.com','$2y$10$h.fFQPMs5CZ1CKpRFT6Bhu/PyPlefEILCswdPdIgni7RbYxq5eLOW',2,'2025-08-14 20:44:44'),
(31,'caleb','caleb@gmail.com','$2y$10$bFHHPI5VPw77h7oMJVtrZuf8SZlQZUpvJYhB8cfQIVRKxe6LV4gDa',2,'2025-08-18 15:20:50'),
(32,'sofia Mendez','sofimendez@gmail.com','$2y$10$YvVKltlVIQ4iyz2M6AzGfeGN.Bvm2IORZcPeasaDHbysu0DFHrULG',2,'2025-08-18 15:22:11'),
(33,'roberto gomez','robertogomez@gmail.com','$2y$10$H53QtvnD9pA7I0plvgFYj.hPoDddeLvxS3ANOYPLOcK818XoWXDY6',2,'2025-08-21 20:02:10'),
(35,'12d','12d@gmail.com','$2y$10$HylgthGxqhttsXcc.nSmPepUpm8deRMdq8Xv16wV6y1efskUaIAQG',2,'2025-08-21 20:20:40'),
(37,'Carlitos Lachaise','carlitos123@gmail.com','$2y$10$7AuCUELUURXjpIdfukhMae.Dp5K658zc7Jh9.hdTEu2535MUOofAK',2,'2025-08-23 16:03:50'),
(38,'Maria','maria@gmail.com','$2y$10$0fbARdeB4YCGD6nx00TV7uiUHDq1LvQKPfKP68oAGFXpI2WS9Q7T6',2,'2025-09-09 18:26:19'),
(42,'Mario','daashxstudios@gmail.com','$2y$10$y3AYBfAlvTwR9r8UNlAVtuLEmCXTni8WgS2qtZzKEPDqIB/UzJLsW',2,'2025-09-22 15:08:56'),
(48,'Shey','sheilagisellechavez@gmail.com','$2y$10$Tf1F2sB7UWFOEFKj9z0/muk50NYyvWCWFJ0cItBqhjkzt2yw24KIO',2,'2025-10-31 16:01:37');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_ratings`
--

DROP TABLE IF EXISTS `category_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `rating` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cat_user` (`category_id`,`user_id`),
  KEY `idx_category` (`category_id`),
  KEY `idx_user` (`user_id`),
  CONSTRAINT `chk_cat_rating` CHECK (`rating` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_ratings`
--

LOCK TABLES `category_ratings` WRITE;
/*!40000 ALTER TABLE `category_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_recipients`
--

DROP TABLE IF EXISTS `message_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `message_recipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`,`is_read`),
  CONSTRAINT `message_recipients_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_recipients`
--

LOCK TABLES `message_recipients` WRITE;
/*!40000 ALTER TABLE `message_recipients` DISABLE KEYS */;
INSERT INTO `message_recipients` VALUES
(1,1,27,1,'2025-09-19 17:47:26',NULL,0),
(2,2,24,0,NULL,NULL,0),
(3,3,27,1,'2025-10-27 23:13:19',NULL,0),
(4,4,24,0,NULL,NULL,0),
(5,5,31,0,NULL,NULL,0),
(8,8,27,1,'2025-10-27 23:13:16',NULL,0),
(9,9,24,0,NULL,NULL,0),
(11,11,24,0,NULL,NULL,0),
(13,13,24,1,'2025-10-06 20:36:19',NULL,0),
(14,14,26,1,'2025-10-16 23:33:53',NULL,0),
(15,15,24,1,'2025-10-06 20:36:28',NULL,0),
(17,17,38,0,NULL,NULL,0),
(22,22,26,1,'2025-10-17 20:18:44',NULL,0),
(23,23,24,1,'2025-10-17 20:19:23',NULL,0),
(24,24,24,1,'2025-10-18 15:40:09',NULL,0),
(25,25,26,1,'2025-10-18 16:15:06',NULL,0),
(26,26,26,1,'2025-10-27 16:25:01',NULL,0),
(27,27,26,1,'2025-10-29 16:24:56',NULL,0),
(33,33,24,1,'2025-10-27 23:08:16',NULL,0),
(34,34,24,1,'2025-10-27 23:14:09',NULL,0),
(35,35,24,0,NULL,NULL,0),
(36,36,24,1,'2025-10-30 14:55:21',NULL,0),
(37,37,28,0,NULL,NULL,0),
(38,38,28,0,NULL,NULL,0),
(39,39,1,0,NULL,NULL,0),
(40,39,24,1,'2025-10-30 16:44:19',NULL,0),
(41,39,28,0,NULL,NULL,0),
(42,39,38,0,NULL,NULL,0),
(43,40,1,0,NULL,NULL,0),
(44,40,24,1,'2025-10-30 17:16:39',NULL,0),
(45,40,28,0,NULL,NULL,0),
(46,40,38,0,NULL,NULL,0),
(47,41,1,0,NULL,NULL,0),
(48,41,24,1,'2025-10-31 11:41:29',NULL,0),
(49,41,28,0,NULL,NULL,0),
(50,41,38,0,NULL,NULL,0),
(51,42,24,0,NULL,NULL,0),
(52,43,1,0,NULL,NULL,0),
(53,43,24,1,'2025-10-31 13:08:46',NULL,0),
(54,43,28,0,NULL,NULL,0),
(55,43,38,0,NULL,NULL,0),
(56,44,24,0,NULL,NULL,0);
/*!40000 ALTER TABLE `message_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES
(1,24,'hola','prueba','2025-09-08 17:40:33'),
(2,27,'Hola','Hello','2025-09-08 18:43:43'),
(3,24,'Consulta de precio','HOla, a cuanto esta el curso...?','2025-09-08 22:00:26'),
(4,27,'Re: hola','hola','2025-09-08 22:01:04'),
(5,24,'calbe','asdas','2025-09-09 15:58:59'),
(8,24,'prueba1','ola manuel como tas','2025-09-11 11:06:47'),
(9,27,'Re: hola','wazzaaaaaaaaaaaaaaaaaaaa','2025-09-11 11:07:25'),
(11,27,'Re: hola','xxxx','2025-09-11 11:18:10'),
(13,27,'Re: hola','hola','2025-09-16 14:46:14'),
(14,27,'holis','hilos','2025-09-18 14:49:47'),
(15,27,'Re: hola','ok','2025-09-19 16:55:21'),
(17,42,'hola maria','Como estas?','2025-09-22 13:12:47'),
(20,26,'Re: Disguastado por el servicio','ok','2025-10-16 23:41:25'),
(21,26,'Consulta sobre tu servicio: Analista de Datos','me interesa','2025-10-17 16:16:45'),
(22,24,'test','mensajito','2025-10-17 20:18:23'),
(23,26,'Re: test','Test funcional','2025-10-17 20:18:54'),
(24,26,'Consulta sobre tu servicio: Otra prueba','f','2025-10-18 15:38:36'),
(25,24,'Consulta sobre tu servicio: Vendo PCS (Contratación)','✅ Servicio contratado\n\nQUiero 10','2025-10-18 16:14:23'),
(26,24,'Hola bobo','Dicen que te gustan los travas jajaj','2025-10-20 09:20:56'),
(27,24,'Consulta sobre tu servicio: Vendo PCS (Contratación)','✅ Servicio contratado\n\nQUiero 1','2025-10-20 09:21:46'),
(31,26,'Re: Hola Samuel','ok','2025-10-27 16:25:29'),
(32,26,'Re: Consulta sobre tu servicio: Vendo PCS (Contratación)','Perfecto. En 2 dias la tenemos pronta!','2025-10-27 16:26:42'),
(33,27,'felicitaciones','Un lujo que se vea en mi cell','2025-10-27 23:07:34'),
(34,27,'Hola e','Holla','2025-10-27 23:14:03'),
(35,26,'HOla desde aca','como esta la vida compa?','2025-10-29 16:24:48'),
(36,26,'Consulta sobre tu servicio: Plomeria expres (Contratación)','✅ Servicio contratado\n\nquiero contratarte','2025-10-29 16:25:47'),
(37,0,'Solicitud de reset de contraseña','Pedido de reset manual de contraseña\n-----------------------------------\nEmail del solicitante: samuel@gmail.com\nUsuario en sistema: samuel55 (ID 26)\nMensaje del usuario: No recuerdo mi contraseña\nIP: 127.0.0.1\nAgente: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:144.0) Gecko/20100101 Firefox/144.0\nFecha: 2025-10-30 17:54:47','2025-10-30 14:54:47'),
(38,0,'Solicitud de reset de contraseña','Pedido de reset manual de contraseña\n-----------------------------------\nEmail del solicitante: samuel@gmail.com\nUsuario en sistema: samuel55 (ID 26)\nMensaje del usuario: no recuerdo la contraseña\nIP: 127.0.0.1\nAgente: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:144.0) Gecko/20100101 Firefox/144.0\nFecha: 2025-10-30 18:46:52','2025-10-30 15:46:52'),
(39,0,'Solicitud de reset de contraseña','Pedido de reset manual de contraseña\n-----------------------------------\nEmail del solicitante: samuel@gmail.com\nUsuario en sistema: samuel55 (ID 26)\nMensaje del usuario: Olvide mi contraseña\nIP: 127.0.0.1\nAgente: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:144.0) Gecko/20100101 Firefox/144.0\nFecha: 2025-10-30 18:52:50','2025-10-30 15:52:50'),
(40,0,'Solicitud de reset de contraseña','Pedido de reset manual de contraseña\n-----------------------------------\nEmail del solicitante: samuel@gmail.com\nUsuario en sistema: samuel55 (ID 26)\nMensaje del usuario: olvide mi contraseña\nIP: 127.0.0.1\nAgente: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:144.0) Gecko/20100101 Firefox/144.0\nFecha: 2025-10-30 20:16:03','2025-10-30 17:16:03'),
(41,0,'Solicitud de reset de contraseña','Pedido de reset manual de contraseña\n-----------------------------------\nEmail del solicitante: maria@gmail.com\nUsuario en sistema: Maria (ID 38)\nMensaje del usuario: Se me olvido la contraseña\nIP: 127.0.0.1\nAgente: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:144.0) Gecko/20100101 Firefox/144.0\nFecha: 2025-10-31 14:40:12','2025-10-31 11:40:12'),
(42,48,'servicio','hola','2025-10-31 13:02:36'),
(43,0,'Solicitud de reset de contraseña','Pedido de reset manual de contraseña\n-----------------------------------\nEmail del solicitante: sheilagisellechavez@gmail.com\nUsuario en sistema: Shey (ID 48)\nMensaje del usuario: olvide mi contraseña\nIP: 127.0.0.1\nAgente: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:144.0) Gecko/20100101 Firefox/144.0\nFecha: 2025-10-31 16:07:59','2025-10-31 13:07:59'),
(44,48,'Consulta sobre tu servicio (Contratación)','✅ Servicio contratado\n\nme interesa','2025-10-31 15:45:29');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `token_hash` char(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `expires_at` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES
(1,'samuel@gmail.com','d0c1e0c048d65054cabd20948675141263fc2bb9a6c112a40b94db76940ba335','2025-09-22 15:37:43','2025-09-22 12:07:43'),
(3,'daashxstudios@gmail.com','84c2f2bf3cc342aaf63226e27806a9f1dee7f1c2aee078ae1483d3c739f2b2f3','2025-09-22 15:49:33','2025-09-22 12:19:33');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_ratings`
--

DROP TABLE IF EXISTS `post_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `rating` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_post_user` (`post_id`,`user_id`),
  KEY `idx_post` (`post_id`),
  KEY `idx_user` (`user_id`),
  CONSTRAINT `chk_post_rating` CHECK (`rating` between 1 and 5)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_ratings`
--

LOCK TABLES `post_ratings` WRITE;
/*!40000 ALTER TABLE `post_ratings` DISABLE KEYS */;
INSERT INTO `post_ratings` VALUES
(1,30,24,3,'2025-09-04 22:35:54','2025-09-04 22:35:56'),
(2,31,24,4,'2025-09-05 13:40:16','2025-09-08 17:49:50'),
(3,32,26,2,'2025-09-05 16:07:11','2025-09-29 11:22:21'),
(4,31,26,3,'2025-09-06 02:26:47','2025-10-29 15:31:57'),
(6,32,24,4,'2025-09-08 21:37:01','2025-09-08 21:37:11'),
(10,35,42,2,'2025-09-22 15:21:36','2025-09-22 15:21:37'),
(14,37,27,2,'2025-10-14 20:12:34','2025-10-14 20:12:35'),
(16,37,26,5,'2025-10-18 18:36:43','2025-10-20 12:25:17'),
(17,33,26,2,'2025-10-23 15:29:01','2025-10-23 15:29:04'),
(19,35,26,4,'2025-10-23 15:46:23','2025-10-23 15:46:23'),
(20,35,24,1,'2025-10-23 19:17:12','2025-10-23 19:17:19'),
(27,40,24,3,'2025-10-28 02:10:37','2025-10-28 02:10:37'),
(29,43,24,1,'2025-10-31 18:15:33','2025-10-31 18:15:35'),
(31,44,48,2,'2025-10-31 18:46:32','2025-10-31 18:46:32'),
(32,43,48,2,'2025-10-31 18:52:15','2025-10-31 18:52:15');
/*!40000 ALTER TABLE `post_ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bi_post_ratings_no_self
BEFORE INSERT ON post_ratings
FOR EACH ROW
BEGIN
  DECLARE v_owner INT;

  
  SELECT user_id INTO v_owner
  FROM Posts
  WHERE post_id = NEW.post_id
  LIMIT 1;

  
  IF v_owner = NEW.user_id THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'No puedes puntuar tu propio post.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER bu_post_ratings_no_self
BEFORE UPDATE ON post_ratings
FOR EACH ROW
BEGIN
  DECLARE v_owner INT;

  SELECT user_id INTO v_owner
  FROM Posts
  WHERE post_id = NEW.post_id
  LIMIT 1;

  IF v_owner = NEW.user_id THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'No puedes puntuar tu propio post.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'proyutu'
--

--
-- Dumping routines for database 'proyutu'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-31 16:39:16
