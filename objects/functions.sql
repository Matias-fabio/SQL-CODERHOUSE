
-- FUNCION PARA VALIDAR SI UN MAIL YA EXISTE EN LA BASE DE DATOS
DELIMITER //
CREATE FUNCTION fn_verificar_email(email VARCHAR(100))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE existe BOOLEAN;
    
    IF EXISTS (SELECT 1 FROM usuarios WHERE email = email) THEN
        SET existe = TRUE;
    ELSE
        SET existe = FALSE;
    END IF;
    
    RETURN existe;
END;
//
DELIMITER ;



-- FUNCION PARA REGISTRAR UN JUEGO EN LA BIBLIOTECA DE UN USUARIO VERIFICANDO SI EL JUEGO YA SE ENCUENTRA EN LA BIBLIOTECA

DELIMITER //
CREATE FUNCTION fn_agregar_juego_biblioteca(
    p_id_usuario INT,
    p_id_juego INT
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_exito BOOLEAN;

    -- Verificar si el juego ya está en la biblioteca del usuario
    IF EXISTS (SELECT 1 FROM biblioteca WHERE id_usuario = p_id_usuario AND id_juego = p_id_juego) THEN
        SET v_exito = FALSE;
    ELSE
        -- Agregar el juego a la biblioteca del usuario
        INSERT INTO biblioteca(id_usuario, id_juego)
        VALUES(p_id_usuario, p_id_juego);
        SET v_exito = TRUE;
    END IF;

    RETURN v_exito;
END;
//
DELIMITER ;

-- SETEAMOS EN UNA VARIALBE EL LLAMADO DE LA FUNCION PARA AGREGAR UN JUEGO A LA BIBLIOTECA Y MUESTRE UN MENSAJE DE AGREGADO CON EXITO O SI EL JUEGO SE ENCUENTRA EN LA BIBLIOTECA
SET @resultado = fn_agregar_juego_biblioteca(2, 5);
SELECT 
    CASE 
        WHEN @resultado = TRUE THEN 'Juego agregado con éxito a tu biblioteca'
        ELSE 'El juego ya se encuentra en tu biblioteca'
    END AS mensaje;




