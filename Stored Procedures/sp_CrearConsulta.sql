DELIMITER $$
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

END$$
DELIMITER ;
