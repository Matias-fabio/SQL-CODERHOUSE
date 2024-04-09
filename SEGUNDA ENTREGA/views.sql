
-- VISTA PARA MOSTRAR LOS USUARIOS REGISTRADOS Y EL NIVEL DEL PLAN AL QUE ESTAN SUSCRIPTOS

CREATE VIEW vw_usuarios_suscripciones AS
SELECT u.nombre_usuario, s.nombre_plan
FROM usuarios u
INNER JOIN suscripciones sus ON u.id_usuario = sus.id_usuario
INNER JOIN planes s ON sus.id_plan = s.id_plan;

DROP VIEW IF EXISTS vw_usuarios_suscripciones;
SELECT * FROM vw_usuarios_suscripciones;


-- VISTA PARA MOSTRAR LOS 5 JUEGOS MAS POPULARES
CREATE VIEW vw_juegos_populares AS
SELECT j.nombre_juego, COUNT(r.id_reporte) AS num_reportes
FROM juegos j
LEFT JOIN reportes r ON j.id_juego = r.id_juego
GROUP BY j.id_juego
ORDER BY num_reportes DESC
LIMIT 5;

DROP VIEW IF EXISTS vw_juegos_populares;
SELECT * FROM vw_juegos_populares;




-- VISTA PARA VER LOS JUEGOS ORDENADOS POR EL NOMBRE DE EMPRESA
CREATE VIEW vw_juegos_por_empresa AS
SELECT e.nombre_empresa, j.nombre_juego, j.descripcion
FROM juegos j
INNER JOIN empresas e ON j.id_empresa = e.id_empresa
ORDER BY e.nombre_empresa, j.nombre_juego;

DROP VIEW IF EXISTS vw_juegos_por_empresa;
SELECT * FROM  vw_juegos_por_empresa;

