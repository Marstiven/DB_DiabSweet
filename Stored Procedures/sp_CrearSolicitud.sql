DELIMITER $$
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

END$$
DELIMITER ;
