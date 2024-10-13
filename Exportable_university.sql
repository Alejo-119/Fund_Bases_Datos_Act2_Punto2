-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: university
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
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `ID_Clase` int NOT NULL,
  `ID_Curso` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Aula` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Clase`),
  KEY `ID_Curso` (`ID_Curso`),
  CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`ID_Curso`) REFERENCES `curso` (`ID_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,1,'2024-09-01','09:00:00','Aula 101'),(2,1,'2024-09-03','09:00:00','Aula 101'),(3,2,'2024-09-02','11:00:00','Aula 102'),(4,3,'2024-09-01','13:00:00','Aula 201'),(5,4,'2024-09-02','15:00:00','Aula 202');
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `ID_Curso` int NOT NULL,
  `ID_Modulo` int DEFAULT NULL,
  `ID_Profesor` int DEFAULT NULL,
  `Semestre` int DEFAULT NULL,
  `Año` int DEFAULT NULL,
  PRIMARY KEY (`ID_Curso`),
  KEY `ID_Modulo` (`ID_Modulo`),
  KEY `ID_Profesor` (`ID_Profesor`),
  CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`ID_Modulo`) REFERENCES `modulo` (`ID_Modulo`),
  CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`ID_Profesor`) REFERENCES `profesor` (`ID_Profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,1,1,1,2024),(2,2,1,2,2024),(3,3,2,1,2024),(4,4,3,2,2024);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `ID_Estudiante` int NOT NULL,
  `Nombre_Estudiante` varchar(100) NOT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Dirección` varchar(200) DEFAULT NULL,
  `Correo_Electrónico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Estudiante`),
  UNIQUE KEY `Correo_Electrónico` (`Correo_Electrónico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,'Juan Pérez','2000-05-15','Calle Falsa 123','juan.perez@example.com'),(2,'María López','1999-11-22','Avenida Siempre Viva 456','maria.lopez@example.com'),(3,'Pedro Martínez','2001-03-10','Calle del Sol 789','pedro.martinez@example.com');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `ID_Facultad` int NOT NULL,
  `Nombre_Facultad` varchar(100) NOT NULL,
  `Ubicación` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Facultad de Ingeniería','Edificio A'),(2,'Facultad de Ciencias Sociales','Edificio B'),(3,'Facultad de Medicina','Edificio C');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `ID_Matricula` int NOT NULL,
  `ID_Estudiante` int DEFAULT NULL,
  `ID_Curso` int DEFAULT NULL,
  PRIMARY KEY (`ID_Matricula`),
  KEY `ID_Estudiante` (`ID_Estudiante`),
  KEY `ID_Curso` (`ID_Curso`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`ID_Estudiante`) REFERENCES `estudiante` (`ID_Estudiante`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`ID_Curso`) REFERENCES `curso` (`ID_Curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,1,1),(2,2,2),(3,3,3),(4,1,4);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `ID_Modulo` int NOT NULL,
  `Nombre_Modulo` varchar(100) NOT NULL,
  `Descripción` text,
  `ID_Programa` int DEFAULT NULL,
  PRIMARY KEY (`ID_Modulo`),
  KEY `ID_Programa` (`ID_Programa`),
  CONSTRAINT `modulo_ibfk_1` FOREIGN KEY (`ID_Programa`) REFERENCES `programa_formacion` (`ID_Programa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Programación 1','Introducción a la programación.',1),(2,'Estructuras de Datos','Estudio de estructuras de datos y algoritmos.',1),(3,'Psicología Clínica','Fundamentos de la psicología clínica.',2),(4,'Anatomía Humana','Estudio detallado de la anatomía humana.',3);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `ID_Profesor` int NOT NULL,
  `Nombre_Profesor` varchar(100) NOT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Dirección` varchar(200) DEFAULT NULL,
  `Correo_Electrónico` varchar(100) DEFAULT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Profesor`),
  UNIQUE KEY `Correo_Electrónico` (`Correo_Electrónico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'Dr. Carlos Gómez','1975-06-30','Calle Luna 101','carlos.gomez@example.com','Sistemas'),(2,'Dra. Ana Torres','1980-12-15','Avenida Estrella 202','ana.torres@example.com','Psicología'),(3,'Dr. Luis Fernández','1970-08-22','Calle Marte 303','luis.fernandez@example.com','Medicina');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa_formacion`
--

DROP TABLE IF EXISTS `programa_formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa_formacion` (
  `ID_Programa` int NOT NULL,
  `Nombre_Programa` varchar(100) NOT NULL,
  `Descripción` text,
  `ID_Facultad` int DEFAULT NULL,
  PRIMARY KEY (`ID_Programa`),
  KEY `ID_Facultad` (`ID_Facultad`),
  CONSTRAINT `programa_formacion_ibfk_1` FOREIGN KEY (`ID_Facultad`) REFERENCES `facultad` (`ID_Facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa_formacion`
--

LOCK TABLES `programa_formacion` WRITE;
/*!40000 ALTER TABLE `programa_formacion` DISABLE KEYS */;
INSERT INTO `programa_formacion` VALUES (1,'Ingeniería de Sistemas','Programa de formación en Ingeniería de Sistemas.',1),(2,'Psicología','Programa de formación en Psicología.',2),(3,'Medicina General','Programa de formación en Medicina General.',3);
/*!40000 ALTER TABLE `programa_formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_cursos_abiertos_con_estudiantes`
--

DROP TABLE IF EXISTS `vista_cursos_abiertos_con_estudiantes`;
/*!50001 DROP VIEW IF EXISTS `vista_cursos_abiertos_con_estudiantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cursos_abiertos_con_estudiantes` AS SELECT 
 1 AS `ID_Curso`,
 1 AS `Nombre_Modulo`,
 1 AS `Numero_Estudiantes_Matriculados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_cursos_con_estudiantes_por_programa`
--

DROP TABLE IF EXISTS `vista_cursos_con_estudiantes_por_programa`;
/*!50001 DROP VIEW IF EXISTS `vista_cursos_con_estudiantes_por_programa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cursos_con_estudiantes_por_programa` AS SELECT 
 1 AS `Nombre_Programa`,
 1 AS `Total_Cursos_Con_Estudiantes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_cursos_por_programa`
--

DROP TABLE IF EXISTS `vista_cursos_por_programa`;
/*!50001 DROP VIEW IF EXISTS `vista_cursos_por_programa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cursos_por_programa` AS SELECT 
 1 AS `Nombre_Programa`,
 1 AS `Nombre_Modulo`,
 1 AS `ID_Curso`,
 1 AS `Semestre`,
 1 AS `Año`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estudiantes_matriculados_programa`
--

DROP TABLE IF EXISTS `vista_estudiantes_matriculados_programa`;
/*!50001 DROP VIEW IF EXISTS `vista_estudiantes_matriculados_programa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estudiantes_matriculados_programa` AS SELECT 
 1 AS `Nombre_Estudiante`,
 1 AS `ID_Curso`,
 1 AS `Nombre_Modulo`,
 1 AS `Nombre_Programa`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_cursos_abiertos_con_estudiantes`
--

/*!50001 DROP VIEW IF EXISTS `vista_cursos_abiertos_con_estudiantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cursos_abiertos_con_estudiantes` AS select `c`.`ID_Curso` AS `ID_Curso`,`m`.`Nombre_Modulo` AS `Nombre_Modulo`,count(`mt`.`ID_Estudiante`) AS `Numero_Estudiantes_Matriculados` from ((`curso` `c` join `modulo` `m` on((`c`.`ID_Modulo` = `m`.`ID_Modulo`))) left join `matricula` `mt` on((`c`.`ID_Curso` = `mt`.`ID_Curso`))) group by `c`.`ID_Curso`,`m`.`Nombre_Modulo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cursos_con_estudiantes_por_programa`
--

/*!50001 DROP VIEW IF EXISTS `vista_cursos_con_estudiantes_por_programa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cursos_con_estudiantes_por_programa` AS select `pf`.`Nombre_Programa` AS `Nombre_Programa`,count(distinct `c`.`ID_Curso`) AS `Total_Cursos_Con_Estudiantes` from (((`programa_formacion` `pf` join `modulo` `m` on((`pf`.`ID_Programa` = `m`.`ID_Programa`))) join `curso` `c` on((`m`.`ID_Modulo` = `c`.`ID_Modulo`))) join `matricula` `mtr` on((`c`.`ID_Curso` = `mtr`.`ID_Curso`))) group by `pf`.`Nombre_Programa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cursos_por_programa`
--

/*!50001 DROP VIEW IF EXISTS `vista_cursos_por_programa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cursos_por_programa` AS select `pf`.`Nombre_Programa` AS `Nombre_Programa`,`m`.`Nombre_Modulo` AS `Nombre_Modulo`,`c`.`ID_Curso` AS `ID_Curso`,`c`.`Semestre` AS `Semestre`,`c`.`Año` AS `Año` from ((`programa_formacion` `pf` join `modulo` `m` on((`pf`.`ID_Programa` = `m`.`ID_Programa`))) join `curso` `c` on((`m`.`ID_Modulo` = `c`.`ID_Modulo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estudiantes_matriculados_programa`
--

/*!50001 DROP VIEW IF EXISTS `vista_estudiantes_matriculados_programa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estudiantes_matriculados_programa` AS select `e`.`Nombre_Estudiante` AS `Nombre_Estudiante`,`c`.`ID_Curso` AS `ID_Curso`,`m`.`Nombre_Modulo` AS `Nombre_Modulo`,`pf`.`Nombre_Programa` AS `Nombre_Programa` from ((((`estudiante` `e` join `matricula` `mtr` on((`e`.`ID_Estudiante` = `mtr`.`ID_Estudiante`))) join `curso` `c` on((`mtr`.`ID_Curso` = `c`.`ID_Curso`))) join `modulo` `m` on((`c`.`ID_Modulo` = `m`.`ID_Modulo`))) join `programa_formacion` `pf` on((`m`.`ID_Programa` = `pf`.`ID_Programa`))) */;
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

-- Dump completed on 2024-10-13 17:08:09
