
DROP DATABASE IF EXISTS workshop;
CREATE DATABASE workshop;

USE workshop;
CREATE TABLE IF NOT EXISTS workshop.pais (
	id_pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(20) NOT NULL
    );

CREATE TABLE IF NOT EXISTS workshop.usuarios (
	id_usuario INT AUTO_INCREMENT,
    nombre_usuario VARCHAR(30) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL, 
    password_ VARCHAR(20) NOT NULL,
    id_pais INT NOT NULL,
    fecha_registro DATE,
    PRIMARY KEY (id_usuario),
    INDEX nombre_usuario (nombre_usuario),
    CONSTRAINT fk_nombre_pais FOREIGN KEY (id_pais) REFERENCES pais (id_pais) ON DELETE RESTRICT ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS workshop.empresas (
	id_empresa INT AUTO_INCREMENT,
    nombre_empresa VARCHAR(30) NOT NULL,
    anio_fundacion DATE NOT NULL, 
	sitio_web VARCHAR(400) NOT NULL,
    PRIMARY KEY (id_empresa)
);

CREATE TABLE IF NOT EXISTS workshop.genero_juegos (
	id_genero INT AUTO_INCREMENT,
    genero VARCHAR(40) NOT NULL,
    PRIMARY KEY (id_genero),
    INDEX genero (genero)
);

CREATE TABLE IF NOT EXISTS workshop.juegos (
	id_juego INT AUTO_INCREMENT,
    nombre_juego VARCHAR(200) NOT NULL,
    descripcion VARCHAR(350) NOT NULL, 
    id_empresa INT NOT NULL,
    id_genero_juego INT NOT NULL,
    fecha_creacion DATE,
    PRIMARY KEY (id_juego),
    INDEX juego (nombre_juego),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES empresas (id_empresa) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_id_genero FOREIGN KEY (id_genero_juego) REFERENCES genero_juegos(id_genero) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS workshop.reportes (
	id_reporte INT AUTO_INCREMENT,
    id_juego INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_reporte DATETIME DEFAULT CURRENT_TIMESTAMP(),
    descripcion TEXT NOT NULL,
    PRIMARY KEY (id_reporte),
    CONSTRAINT fk_nombre_juego FOREIGN KEY (id_juego) REFERENCES juegos (id_juego) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_nombre_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS workshop.planes (
	id_plan INT AUTO_INCREMENT,
    nombre_plan VARCHAR(20) NOT NULL,
    precio DECIMAL(11,2) DEFAULT 0,
    PRIMARY KEY (id_plan),
    INDEX(nombre_plan)
);
 
CREATE TABLE IF NOT EXISTS workshop.suscripciones (
	id_suscripcion INT AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_plan INT NOT NULL,
    fecha_incio DATETIME DEFAULT CURRENT_TIMESTAMP(),
    fecha_fin DATE NOT NULL,
    PRIMARY KEY (id_suscripcion),
	CONSTRAINT fk_suscripcion_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_nsuscripcion_plan FOREIGN KEY (id_plan) REFERENCES planes (id_plan) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS workshop.calificaciones (
	id_calificacion INT AUTO_INCREMENT,
    id_juego INT NOT NULL,
    id_usuario INT NOT NULL,
    calificacion DECIMAL NOT NULL,
    comentarios VARCHAR(300) NOT NULL,
    PRIMARY KEY (id_calificacion),
	CONSTRAINT fk_calificaion_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_calificacion_juego FOREIGN KEY (id_juego) REFERENCES juegos (id_juego) ON DELETE RESTRICT ON UPDATE CASCADE
);
USE workshop;
CREATE TABLE IF NOT EXISTS workshop.actividad (
	id_actividad INT AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    fecha_actividad DATETIME DEFAULT CURRENT_TIMESTAMP(),
    tiempo DECIMAL NOT NULL,
    PRIMARY KEY (id_actividad),
    CONSTRAINT fk_actividad_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS workshop.biblioteca(
	id_biblioteca INT AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_juego INT NOT NULL,
    PRIMARY KEY (id_biblioteca),
    CONSTRAINT fk_biblioteca_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_biblioteca_juego FOREIGN KEY (id_juego) REFERENCES juegos (id_juego) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS workshop.amigos(
	id_solicitud INT AUTO_INCREMENT,
    fecha_solicitud DATE NOT NULL,
    estado VARCHAR(10),
    PRIMARY KEY (id_solicitud)
);

CREATE TABLE IF NOT EXISTS workshop.logros(
	id_logro INT AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_juego INT NOT NULL,
    nombre_logro VARCHAR (30) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    obtencion DATETIME DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (id_logro),
    CONSTRAINT fk_logro_juego FOREIGN KEY (id_juego) REFERENCES juegos (id_juego) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_logro_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);