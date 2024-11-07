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
-- Dumping routines for database 'diabsweet'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CrearAlimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_CrearAlimento`(
nombre varchar(255), 
indice_glucemico int,
clase_alimento int
)
BEGIN
    DECLARE response TEXT;  
    
-- excepcion
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1
			@sqlstate = RETURNED_SQLSTATE,
			@errno    = MYSQL_ERRNO,
			@text     = MESSAGE_TEXT;
		SET response = CONCAT(@errno, ' - ', @text);
		ROLLBACK;
    END;
    SET response = 'Se guardo Correctamente.';
     -- Reinicio de conteo
    SET @count = (SELECT COUNT(*) FROM alimento);

	IF @count = 0 THEN
		ALTER TABLE alimento AUTO_INCREMENT = 1;
	END IF;
    
    -- inico transacion
	 START TRANSACTION;
    
		INSERT INTO alimento (nombre, indice_glucemico, clase_alimento) 
		VALUES (
		nombre, indice_glucemico, clase_alimento
		);
        
   COMMIT;
   SELECT response;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CrearClaseAlimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_CrearClaseAlimento`(
descripcion varchar(255)
)
BEGIN
    DECLARE response TEXT;  
    
-- excepcion
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1
			@sqlstate = RETURNED_SQLSTATE,
			@errno    = MYSQL_ERRNO,
			@text     = MESSAGE_TEXT;
		SET response = CONCAT(@errno, ' - ', @text);
		ROLLBACK;
    END;
    
    SET response = 'Se guardo Correctamente.';
    -- Reinicio de conteo
    SET @count = (SELECT COUNT(*) FROM clase_alimento);

	IF @count = 0 THEN
		ALTER TABLE clase_alimento AUTO_INCREMENT = 1;
	END IF;
    
    -- inico transacion
	 START TRANSACTION;
    
		INSERT INTO clase_alimento (descripcion) 
		VALUES (
		descripcion 
		);
        
   COMMIT;
   SELECT response;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CrearConsulta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_CrearConsulta`(
id_usuario int, 
id_solicitud int, 
mensaje text,
id_medico int
)
BEGIN
    DECLARE response TEXT;  
    
-- excepcion
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1
			@sqlstate = RETURNED_SQLSTATE,
			@errno    = MYSQL_ERRNO,
			@text     = MESSAGE_TEXT;
		SET response = CONCAT(@errno, ' - ', @text);
		ROLLBACK;
    END;
    SET response = 'Se guardo Correctamente.';
    -- Reinicio de conteo
    SET @count = (SELECT COUNT(*) FROM consulta);

	IF @count = 0 THEN
		ALTER TABLE consulta AUTO_INCREMENT = 1;
	END IF;
    
    -- inico transacion
	 START TRANSACTION;
    
		INSERT INTO consulta (id_usuario, id_solicitud, fecha, mensaje, id_medico) 
		VALUES (
		id_usuario, id_solicitud, current_date(), mensaje, id_medico 
		);
        
   COMMIT;
   SELECT response;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CrearMedico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_CrearMedico`(
id_usuario int,
especialidad int, 
numero_licencia varchar(255), 
fecha_certificacion datetime, 
años_experiencia int
)
BEGIN
    DECLARE response TEXT;  
    
	-- excepcion
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
    GET DIAGNOSTICS CONDITION 1
        @sqlstate = RETURNED_SQLSTATE,
        @errno    = MYSQL_ERRNO,
        @text     = MESSAGE_TEXT;
    SET response = CONCAT(@errno, ' - ', @text);
    ROLLBACK;
END;
    
    -- Reinicio de conteo
    SET @count = (SELECT COUNT(*) FROM medico);

	IF @count = 0 THEN
		ALTER TABLE medico AUTO_INCREMENT = 1;
	END IF;
    
    -- inico transacion
	 START TRANSACTION;
    
		INSERT INTO medico (id_usuario, especialidad, numero_licencia, fecha_certificacion, años_experiencia) 
		VALUES (
		id_usuario, especialidad, numero_licencia, fecha_certificacion, años_experiencia 
        );
        
   COMMIT;
   SELECT response;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CrearPaciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_CrearPaciente`(
id_usuario int,
tipo_diabetes int,
peso int,
altura int,
tipo_sangre int,
nivel_glucosa int,
presion_arterial int
)
BEGIN
    DECLARE response TEXT;  
    
	-- excepcion
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1
			@sqlstate = RETURNED_SQLSTATE,
			@errno    = MYSQL_ERRNO,
			@text     = MESSAGE_TEXT;
		SET response = CONCAT(@errno, ' - ', @text);
		ROLLBACK;
    END;
    SET response = 'Se guardo Correctamente.';
    -- Reinicio de conteo
    SET @count = (SELECT COUNT(*) FROM paciente);

	IF @count = 0 THEN
		ALTER TABLE paciente AUTO_INCREMENT = 1;
	END IF;
    
    -- inico transacion
	 START TRANSACTION;
    
		INSERT INTO paciente (id_usuario, tipo_diabetes, peso, altura, tipo_sangre, nivel_glucosa, presion_arterial) 
		VALUES (
		id_usuario, tipo_diabetes, peso, altura, tipo_sangre, nivel_glucosa, presion_arterial 
		);
        
   COMMIT;
   SELECT response;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CrearSolicitud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_CrearSolicitud`(
id_usuario int, 
id_medico int, 
descripcion text
)
BEGIN
    DECLARE response TEXT;  
    
-- excepcion
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1
			@sqlstate = RETURNED_SQLSTATE,
			@errno    = MYSQL_ERRNO,
			@text     = MESSAGE_TEXT;
		SET response = CONCAT(@errno, ' - ', @text);
		ROLLBACK;
    END;
    SET response = 'Se guardo Correctamente.';
    -- Reinicio de conteo
    SET @count = (SELECT COUNT(*) FROM solicitud);

	IF @count = 0 THEN
		ALTER TABLE solicitud AUTO_INCREMENT = 1;
	END IF;
    
    -- inico transacion
	 START TRANSACTION;
    
		INSERT INTO solicitud (id_usuario, id_medico, fecha, descripcion) 
		VALUES (
		id_usuario, id_medico, 	current_date(), descripcion 
		);
        
   COMMIT;
   SELECT response;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CrearUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sa`@`%` PROCEDURE `sp_CrearUsuario`(
nombre VARCHAR(255),
apellido VARCHAR(255),
rol int,
telefono VARCHAR(50), 
edad int ,
correo VARCHAR(255) ,
sexo int ,
direccion VARCHAR(255), 
departamento int ,
municipio int, 
nombre_acceso VARCHAR(100), 
contraseña VARCHAR(255)
)
BEGIN
	DECLARE hash_password VARCHAR(255);
	DECLARE fecha DATETIME;
    DECLARE estado int;
    DECLARE response TEXT;   
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
    GET DIAGNOSTICS CONDITION 1
        @sqlstate = RETURNED_SQLSTATE,
        @errno    = MYSQL_ERRNO,
        @text     = MESSAGE_TEXT;
    SET response = CONCAT(@errno, ' - ', @text);
    ROLLBACK;
END;

    
    SET response = 'Se guardo Correctamente.';
    SET estado = 1;
    SET hash_password = sha2(contraseña,256);
    SET fecha = date_add(current_date(),interval 6 MONTH);
    
    SET @count = (SELECT COUNT(*) FROM usuario);

	IF @count = 0 THEN
		ALTER TABLE usuario AUTO_INCREMENT = 1;
	END IF;
    
    
    START TRANSACTION;
    
		INSERT INTO usuario (nombre, apellido, rol, telefono, edad, correo, sexo, direccion, departamento, municipio, estado, nombre_acceso,contraseña,fecha_vencimiento) 
		VALUES (
		nombre, apellido, rol, telefono, edad, correo, sexo, direccion, departamento, municipio, estado, nombre_acceso,hash_password,fecha
		);
        
   COMMIT;
   SELECT response;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-07 17:02:26
