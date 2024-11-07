DELIMITER $$
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
    
END$$
DELIMITER ;
