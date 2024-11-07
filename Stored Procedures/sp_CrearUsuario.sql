DELIMITER $$
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
   
END$$
DELIMITER ;
