# Estructura de Tablas en la Base de Datos

## 1. `tipo_membresia`

| **Nombre**        | **Tipo**   | **Ajustes**                                  | **Referencias**       | **Nota**                   |
|-------------------|------------|---------------------------------------------|-----------------------|----------------------------|
| `tipo_id`         | SERIAL     | 🔑 PK, no nulo, único, autoincremento        |                       | Clave primaria             |
| `tpo_descrip`     | VARCHAR    | No nulo                                      |                       | Descripción del tipo       |

---

## 2. `socio`

| **Nombre**        | **Tipo**    | **Ajustes**                                  | **Referencias**         | **Nota**                    |
|-------------------|-------------|---------------------------------------------|-------------------------|-----------------------------|
| `soc_id`          | SERIAL      | 🔑 PK, no nulo, único, autoincremento         |                         | Clave primaria              |
| `soc_nombre`      | VARCHAR     | No nulo                                      |                         | Nombre del socio            |
| `soc_apellido`    | VARCHAR     | No nulo                                      |                         | Apellido del socio          |
| `soc_cedula`      | INTEGER     | No nulo                                      |                         | Cédula del socio            |
| `soc_fecnac`      | DATE        | No nulo                                      |                         | Fecha de nacimiento         |
| `soc_tel`         | INTEGER     | Nulo                                         |                         | Teléfono del socio          |
| `soc_direccion`   | VARCHAR     | Nulo                                         |                         | Dirección del socio         |
| `soc_email`       | VARCHAR     | Nulo                                         |                         | Correo electrónico del socio|

---

## 3. `tipo_clase`

| **Nombre**        | **Tipo**   | **Ajustes**                                  | **Referencias**       | **Nota**                   |
|-------------------|------------|---------------------------------------------|-----------------------|----------------------------|
| `tipo_clasid`     | SERIAL     | 🔑 PK, no nulo, único, autoincremento        |                       | Clave primaria             |
| `tipo_clasdescrip`| VARCHAR    | No nulo                                      |                       | Descripción del tipo       |

---

## 4. `membresia`

| **Nombre**        | **Tipo**    | **Ajustes**                                  | **Referencias**             | **Nota**                    |
|-------------------|-------------|---------------------------------------------|-----------------------------|-----------------------------|
| `mem_id`          | SERIAL      | 🔑 PK, no nulo, único, autoincremento         |                             | Clave primaria              |
| `mem_precio`      | INTEGER     | No nulo                                      |                             | Precio de la membresía      |
| `mem_fechainicio` | DATE        | No nulo                                      |                             | Fecha de inicio             |
| `mem_fechafin`    | DATE        | No nulo                                      |                             | Fecha de fin                |
| `tipo_id`         | INTEGER     | No nulo                                      | `fk_tipo_membresia`         | Clave foránea (tipo_membresia) |

---

## 5. `metodo_de_pago`

| **Nombre**        | **Tipo**    | **Ajustes**                                  | **Referencias**             | **Nota**                    |
|-------------------|-------------|---------------------------------------------|-----------------------------|-----------------------------|
| `metodo_id`       | SERIAL      | 🔑 PK, no nulo, único, autoincremento         |                             | Clave primaria              |
| `met_descripcion` | VARCHAR     | No nulo                                      |                             | Descripción del método de pago|

---

## 6. `pago`

| **Nombre**        | **Tipo**    | **Ajustes**                                  | **Referencias**                | **Nota**                    |
|-------------------|-------------|---------------------------------------------|--------------------------------|-----------------------------|
| `pago_id`         | SERIAL      | 🔑 PK, no nulo, único, autoincremento         |                                | Clave primaria              |
| `soc_id`          | INTEGER     | No nulo                                      | `fk_pago_socio`                | Clave foránea (socio)       |
| `mem_id`          | INTEGER     | No nulo                                      | `fk_pago_membresia`           | Clave foránea (membresia)   |
| `pago_montopaga`  | INTEGER     | No nulo                                      |                                | Monto pagado                |
| `pago_fecha`      | DATE        | No nulo                                      |                                | Fecha de pago               |
| `metodo_id`       | INTEGER     | No nulo                                      | `fk_pago_metodo`              | Clave foránea (metodo_de_pago)|

---

## 7. `dias`

| **Nombre**        | **Tipo**    | **Ajustes**                                  | **Referencias**       | **Nota**                   |
|-------------------|-------------|---------------------------------------------|-----------------------|----------------------------|
| `dias_id`         | SERIAL      | 🔑 PK, no nulo, único, autoincremento         |                       | Clave primaria             |
| `dias_descrip`    | VARCHAR     | No nulo                                      |                       | Descripción del día        |

---

## 8. `horarios`

| **Nombre**        | **Tipo**    | **Ajustes**                                  | **Referencias**       | **Nota**                   |
|-------------------|-------------|---------------------------------------------|-----------------------|----------------------------|
| `hora_id`         | SERIAL      | 🔑 PK, no nulo, único, autoincremento         |                       | Clave primaria             |
| `hora_descrip`    | TIME        | No nulo                                      |                       | Descripción de la hora     |

---

## 9. `instructor`

| **Nombre**        | **Tipo**    | **Ajustes**                                  | **Referencias**       | **Nota**                   |
|-------------------|-------------|---------------------------------------------|-----------------------|----------------------------|
| `instru_id`       | SERIAL      | 🔑 PK, no nulo, único, autoincremento         |                       | Clave primaria             |
| `instru_nombre`   | VARCHAR     | No nulo                                      |                       | Nombre del instructor      |
| `instru_apellido` | VARCHAR     | No nulo                                      |                       | Apellido del instructor    |
| `instru_tel`      | INTEGER     | Nulo                                         |                       | Teléfono del instructor    |

---

## 10. `clase`

| **Nombre**        | **Tipo**    | **Ajustes**                                  | **Referencias**                         | **Nota**                    |
|-------------------|-------------|---------------------------------------------|-----------------------------------------|-----------------------------|
| `clase_id`        | SERIAL      | 🔑 PK, no nulo, único, autoincremento         |                                         | Clave primaria              |
| `tipo_clasid`     | INTEGER     | No nulo                                      | `fk_tipo_clase`                         | Clave foránea (tipo_clase)  |
| `dias_id`         | INTEGER     | No nulo                                      | `fk_clase_dia`                          | Clave foránea (dias)        |
| `hora_id`         | INTEGER     | No nulo                                      | `fk_clase_hora`                         | Clave foránea (horarios)    |
| `clas_cupomaximo` | INTEGER     | No nulo                                      |                                         | Cupo máximo de la clase     |
| `instru_id`       | INTEGER     | No nulo                                      | `fk_clase_instructor`                   | Clave foránea (instructor)  |

---

## 11. `inscripcion_clase`

| **Nombre**        | **Tipo**    | **Ajustes**                                  | **Referencias**              | **Nota**                    |
|-------------------|-------------|---------------------------------------------|------------------------------|-----------------------------|
| `inscrip_id`      | SERIAL      | 🔑 PK, no nulo, único, autoincremento         |                              | Clave primaria              |
| `soc_id`          | INTEGER     | No nulo                                      | `fk_inscrip_socio`           | Clave foránea (socio)       |
| `clase_id`        | INTEGER     | No nulo                                      | `fk_inscrip_clase`           | Clave foránea (clase)       |
| `inscrip_fecha`   | DATE        | No nulo                                      |                              | Fecha de inscripción        |

