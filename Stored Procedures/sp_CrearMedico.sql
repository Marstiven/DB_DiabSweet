DELIMITER $$
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
    
END$$
DELIMITER ;
