

<p align="center">
<span style="font-size:larger; ">  # SQL-CODERHOUSE WORKSHOP 2🛢️🛢️🥈🛢️🛢️</span>

</p>


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




<span style="color:blueviolet;">
 DIAGRAMA ENTIDAD RELACION DATA BASE: 📈
</span>


##
##


<img src="./IMG/DER_WORKSHOP.png" alt="der" width=""/>
