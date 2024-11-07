DELIMITER $$
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

END$$
DELIMITER ;
