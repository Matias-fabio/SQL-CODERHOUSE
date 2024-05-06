USE workshop;

-- TRIGGER PARA ACTUALIZAR AUTOMATICAMENTE LA CALIFICAION PROMEDIO DE UN JUEGO CUANDO SE INSERTA UNA NUEVA CALIFICACION.
DELIMITER //
CREATE TRIGGER tr_actualizar_calificacion
AFTER INSERT ON calificaciones
FOR EACH ROW
BEGIN
    DECLARE avg_calificacion DECIMAL(3,1);
    
    SELECT AVG(calificacion) INTO avg_calificacion
    FROM calificaciones
    WHERE id_juego = NEW.id_juego;
    
    UPDATE juegos
    SET calificacion_promedio = avg_calificacion
    WHERE id_juego = NEW.id_juego;
END;
//
DELIMITER ;




SHOW CREATE TRIGGER tr_actualizar_calificacion;




-- TRIGER PARA VALIDAR SI EL EMAIL DE UN USUARIO ES UNICO AL INSERTAR UN NUEVO USUARIO
DELIMITER //

CREATE TRIGGER tr_verificar_email_unico
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*) INTO v_count
    FROM usuarios
    WHERE email = NEW.email;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El correo electrónico ya existe en la base de datos';
    END IF;
END;
//
DELIMITER ;


-- TRIGGER PARA VERIFICAR SI UN USUARIO YA TIENE UN JUEGO AGREGADO EN SU BIBLIOTECA
DELIMITER //

CREATE TRIGGER tr_verificar_juego_en_biblioteca
BEFORE INSERT ON biblioteca
FOR EACH ROW
BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*) INTO v_count
    FROM biblioteca
    WHERE id_usuario = NEW.id_usuario AND id_juego = NEW.id_juego;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El usuario ya tiene este juego en su biblioteca';
    END IF;
END;
//
DELIMITER ;



-- TRIGGER para almacenar los usuarios que estan dados de bajas de una suscripcion
CREATE TABLE IF NOT EXISTS workshop.usuarios_baja_suscripcion (
    id_usuario INT NOT NULL,
    fecha_baja DATETIME DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

DELIMITER $$
CREATE TRIGGER trg_usuario_baja_suscripcion
AFTER DELETE ON suscripciones
FOR EACH ROW
BEGIN
    INSERT INTO workshop.usuarios_baja_suscripcion (id_usuario) VALUES (OLD.id_usuario);
END$$
DELIMITER ;


SHOW TRIGGERS;




