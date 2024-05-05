

-- STORED PROCEDURE PARA ACTUALIZAR LA CONTRASEÑA DE UN USUARIO

DELIMITER //
CREATE PROCEDURE sp_actualizar_password(
    IN id_usuario INT,
    IN nueva_password VARCHAR(20)
)
BEGIN
    UPDATE usuarios
    SET password_ = nueva_password
    WHERE id_usuario = id_usuario;
END;
//
DELIMITER ;
DROP PROCEDURE IF EXISTS sp_actualizar_password;


-- STORED PROCEDURE PARA LA CREACION DE UN NUEVO USUARIO, VERIFICANDO QUE EL CORREO ELECTRONICO NO EXISTA PREVIAMENTE, UTILIZANDO LA FUNCION fn_verificar_email PREVIAMENTE CREADA Y QUE LE ASIGNE DE FORMA AUTOMATICA LA FECHA DE CREACION DEL USUARIO
DELIMITER //

CREATE PROCEDURE sp_insertar_usuario(
    IN p_nombre VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_password VARCHAR(50),
    IN p_id_pais INT
)
BEGIN
    DECLARE v_existe BOOLEAN;

    -- Verificar si el correo electrónico ya existe utilizando la función fn_verificar_email
    SET v_existe = fn_verificar_email(p_email);

    IF v_existe THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El correo electrónico ya existe en la base de datos';
    ELSE
        -- Insertar el nuevo usuario
        INSERT INTO usuarios(nombre_usuario, email, password_, id_pais, fecha_registro)
        VALUES(p_nombre, p_email, p_password, p_id_pais, CURDATE());
    END IF;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_insertar_usuario;
CALL sp_insertar_usuario('Juan', 'juan@example.com', 'password123', 1);

DELETE FROM usuarios WHERE email = 'juan@example.com';

SELECT * FROM usuarios;
