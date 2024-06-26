

<p align="center">
<span style="font-size:larger; ">  # SQL-CODERHOUSE WORKSHOP 🛢️🛢️🥈🛢️🛢️</span>

</p>

<img src="./IMG/coder00.webp" alt="der" width=""/>


### DEFINIR EL PROYECTO 👩🏻‍💻
---

* **¿Qué modelo de negocio utilizamos?**
El modelo de negocio será el de un servicio de juego en la nube, basado en la suscripción de acceso a juegos individuales disponibles dentro de la plataforma.

* **¿Cuál es el objetivo?**
Crear un sistema de Data Base que nos permita almacenar la información para poder ofrecer un buen servicio, poder obtener información en cuanto al desempeño de los juegos, datos como la popularidad de los juegos dentro del catálogo ofrecido, etc. 

* **¿Cuál es la necesidad por cubrir?**
Permitir a los usuarios jugar videojuegos de alta calidad sin necesidad de tener una consola o una computadora de alto rendimiento y sin necesidad de comprar juegos. Los usuarios pueden acceder a los juegos a través de dispositivos compatibles con internet.

<span style="color:blueviolet;">
 DIAGRAMA ENTIDAD RELACION DATA BASE: 📈
</span>


##
##


<img src="./IMG/DER_WORKSHOP.png" alt="der" width=""/>



# Tablas de la Base de Datos Workshop 📊

## `pais`

| Columna    | Tipo       | Descripción                  |
|------------|------------|------------------------------|
| id_pais    | INT        | Clave primaria               |
| pais       | VARCHAR(20)| Nombre del país              |

## `usuarios`

| Columna        | Tipo       | Descripción                      |
|----------------|------------|----------------------------------|
| id_usuario     | INT        | Clave primaria                   |
| nombre_usuario | VARCHAR(30)| Nombre del usuario               |
| email          | VARCHAR(100)| Email del usuario (único)        |
| password_      | VARCHAR(20)| Contraseña del usuario           |
| id_pais        | INT        | Clave foránea a `pais`           |
| fecha_registro | DATE       | Fecha de registro del usuario    |

## `empresas`

| Columna        | Tipo       | Descripción                  |
|----------------|------------|------------------------------|
| id_empresa     | INT        | Clave primaria               |
| nombre_empresa  | VARCHAR(30)| Nombre de la empresa         |
| anio_fundacion | DATE       | Año de fundación             |
| sitio_web      | VARCHAR(400)| Sitio web de la empresa      |

## `genero_juegos`

| Columna    | Tipo       | Descripción             |
|------------|------------|-------------------------|
| id_genero  | INT        | Clave primaria          |
| genero     | VARCHAR(40)| Género del juego        |

## `juegos`

| Columna         | Tipo       | Descripción                        |
|-----------------|------------|------------------------------------|
| id_juego        | INT        | Clave primaria                     |
| nombre_juego    | VARCHAR(200)| Nombre del juego                   |
| descripcion     | VARCHAR(350)| Descripción del juego              |
| id_empresa      | INT        | Clave foránea a `empresas`         |
| id_genero_juego | INT        | Clave foránea a `genero_juegos`    |
| fecha_creacion  | DATE       | Fecha de creación del juego        |

## `reportes`

| Columna       | Tipo       | Descripción                          |
|---------------|------------|--------------------------------------|
| id_reporte    | INT        | Clave primaria                       |
| id_juego      | INT        | Clave foránea a `juegos`             |
| id_usuario    | INT        | Clave foránea a `usuarios`           |
| fecha_reporte | DATETIME   | Fecha y hora del reporte             |
| descripcion   | TEXT       | Descripción del reporte              |

## `planes`

| Columna     | Tipo       | Descripción                  |
|-------------|------------|------------------------------|
| id_plan     | INT        | Clave primaria               |
| nombre_plan | VARCHAR(20)| Nombre del plan              |
| precio      | DECIMAL(11,2)| Precio del plan            |

## `suscripciones`

| Columna      | Tipo       | Descripción                        |
|--------------|------------|------------------------------------|
| id_suscripcion| INT        | Clave primaria                     |
| id_usuario    | INT        | Clave foránea a `usuarios`         |
| id_plan       | INT        | Clave foránea a `planes`           |
| fecha_incio   | DATETIME   | Fecha y hora de inicio de suscripción|
| fecha_fin     | DATE       | Fecha de finalización de suscripción|

## `calificaciones`

| Columna       | Tipo       | Descripción                          |
|---------------|------------|--------------------------------------|
| id_calificacion| INT       | Clave primaria                       |
| id_juego      | INT        | Clave foránea a `juegos`             |
| id_usuario    | INT        | Clave foránea a `usuarios`           |
| calificacion  | DECIMAL    | Calificación del juego               |
| comentarios   | VARCHAR(300)| Comentarios sobre el juego          |

## `actividad`

| Columna        | Tipo       | Descripción                          |
|----------------|------------|--------------------------------------|
| id_actividad   | INT        | Clave primaria                       |
| id_usuario     | INT        | Clave foránea a `usuarios`           |
| fecha_actividad| DATETIME   | Fecha y hora de la actividad         |
| tiempo         | DECIMAL    | Tiempo de actividad                  |

## `biblioteca`

| Columna     | Tipo       | Descripción                        |
|-------------|------------|------------------------------------|
| id_biblioteca| INT        | Clave primaria                     |
| id_usuario   | INT        | Clave foránea a `usuarios`         |
| id_juego     | INT        | Clave foránea a `juegos`           |

## `amigos`

| Columna      | Tipo       | Descripción                  |
|--------------|------------|------------------------------|
| id_solicitud | INT        | Clave primaria               |
| fecha_solicitud| DATE     | Fecha de la solicitud        |
| estado       | VARCHAR(10)| Estado de la solicitud       |

## `logros`

| Columna       | Tipo       | Descripción                        |
|---------------|------------|------------------------------------|
| id_logro      | INT        | Clave primaria                     |
| id_usuario     | INT       | Clave foránea a `usuarios`         |
| id_juego      | INT        | Clave foránea a `juegos`           |
| nombre_logro  | VARCHAR(30)| Nombre del logro                   |
| descripcion   | VARCHAR(150)| Descripción del logro             |
| obtencion     | DATETIME   | Fecha y hora de obtención del logro|





### Documentacion de Vistas 👁️‍🗨️
---

### Vista: USUARIOS SUSCRIPCIONES

**Descripción:** Esta vista muestra los usuarios registrados y el plan al que se encuetran suscriptos


**Ejemplo de consulta:**

```sql
DROP VIEW IF EXISTS vw_usuarios_suscripciones;

SELECT * FROM vw_usuarios_suscripciones;
```

### Vista: TOP 5

**Descripción:** Esta vista muestra a los cinco juegos mas populares


**Ejemplo de consulta:**

```sql
DROP VIEW IF EXISTS vw_juegos_populares;

SELECT * FROM vw_juegos_populares;
```

### Vista: JUEGOS POR EMPRESA

**Descripción:** Esta vista muestra los juegos ordenados por el nombre a la empresa que pertenecen

**Ejemplo de consulta:**

```sql
DROP VIEW IF EXISTS vw_juegos_por_empresa;

SELECT * FROM  vw_juegos_por_empresa;

```

## Documentación de Funciones 🛠️

### Función: VERIFICAR EMAIL

**Descripción:** Esta función verifica si un email ya existe registrado en la base de datos
**Parámetros:**

* **email:** direccion de email

**Retorno:**

* **TRUE** si el mail ya se encuetra registrado , **FALSE** en caso contrario

**Ejemplo de uso:**

se le da funcionalidad en el Stored Procedure: **sp_insertar_usuario**



### Función: AGREGAR JUEGO A LA BIBLIOTECA

**Descripción:** Esta función registra un juego en la bilbioteca de un usuario verificando si el juego ya se encuentra agregado o caso contrario

**Parámetros:**

* **p_id_usuario:** Identificador único del usuario
* **p_id_juego:** Identificador único del juego


**Retorno:**

agrega el juego a la biblioteca

**Ejemplo de uso:**
SETEAMOS EN UNA VARIALBE EL LLAMADO DE LA FUNCION PARA AGREGAR UN JUEGO A LA BIBLIOTECA Y MUESTRE UN MENSAJE DE AGREGADO CON EXITO O SI EL JUEGO SE ENCUENTRA EN LA BIBLIOTECA

```sql
SET @resultado = fn_agregar_juego_biblioteca(2, 5);
SELECT 
    CASE 
        WHEN @resultado = TRUE THEN 'Juego agregado con éxito a tu biblioteca'
        ELSE 'El juego ya se encuentra en tu biblioteca'
    END AS mensaje;
```
.



## Documentación de Procedimientos Almacenados📦

### Procedimiento: actualizar password

**Descripción:** Este procedimiento actualiza la contraseña de un usuario

**Parámetros:**

* **id_usuario:** identificador unico del usuario
* **nueva_paswword:** nueva contraseña a registrar

**Retorno:**

* indica si la poeracion se realizo con éxito o error

**Ejemplo de uso:**

```sql
CALL sp_actualizar_password(1, 'nuevaclave123');
```

### Procedimiento: INSERTAR USUARIO

**Descripción:** Este procedimiento crea un nuevo usuario, varificando que el correo electronico no exista previamente, utilizando la función:
 ```sql
fn_verificar_email('ejemplo@correo.com');
```
previamente creada y que le asigne de forma automatica la fecha de creacion de dicho usuario.

**Parámetros:**

* **p_nombre:** nombre del usuario
* **p_email:** Correo electrónico del usuario
* **p_paswword:** contraseña a crear
* **p_id_pais:** identificador unico de pais

**Retorno:**

* Mensaje de éxito o error

**Ejemplo de uso:**

```sql
CALL sp_insertar_usuario('Juan', 'juan@example.com', 'password123', 1);
```

## Documentación de Triggers 🤯

### Trigger: ACTUALIZAR CALIFICACION

**Descripción:** Este trigger actualiza la calificaion promedio de un juego cuando se inserta una nueva calificacion




# Desencriptar y descomprimir una copia de seguridad de la base de datos

los siguientes pasos son necesarios para desencriptar y descomprimir la copia de seguridad de la base de datos workshop encriptada, utilizando OpenSSL y el comando tar en un entorno Unix.

## Pasos

### 1. Desencriptar el archivo encriptado

Para desencriptar el archivo encriptado, ejecute el siguiente comando en su terminal:

```bash
openssl aes-256-cbc -d -in backup_workshop.tar.gz.enc -out backup_workshop.tar.gz -k your_password
```
Reemplace  `your_password` con la contraseña utilizada para encriptar el archivo.

### 2. Descomprimir el archivo desencriptado

Una vez que el archivo esté desencriptado, descomprímalo utilizando el siguiente comando:

```bash
tar -xvzf backup_workshop.tar.gz
```

Este comando restaurará el contenido original del archivo desencriptado.

## Nota

Asegúrese de tener OpenSSL instalado en su sistema y de tener la contraseña correcta para desencriptar el archivo. Además, asegúrese de tener permisos de escritura en el directorio donde se encuentra el archivo encriptado y donde desea extraer los archivos desencriptados.
