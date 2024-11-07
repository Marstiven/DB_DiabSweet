DELIMITER $$
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

END$$
DELIMITER ;
