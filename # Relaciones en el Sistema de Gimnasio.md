# Relaciones en el Sistema de Gimnasio

## 1. tipo_membresia a membresia
- **Tipo de relación:** `one_to_many`
- **Descripción:** Un tipo de membresía puede estar asociado a muchas membresías.
- **Tabla principal (uno):** `tipo_membresia`
- **Tabla secundaria (muchos):** `membresia`
- **Clave foránea:** `tipo_id` en `membresia`

---

## 2. socio a pago
- **Tipo de relación:** `one_to_many`
- **Descripción:** Un socio puede realizar muchos pagos.
- **Tabla principal (uno):** `socio`
- **Tabla secundaria (muchos):** `pago`
- **Clave foránea:** `soc_id` en `pago`

---

## 3. membresia a pago
- **Tipo de relación:** `one_to_many`
- **Descripción:** Una membresía puede estar asociada a muchos pagos.
- **Tabla principal (uno):** `membresia`
- **Tabla secundaria (muchos):** `pago`
- **Clave foránea:** `mem_id` en `pago`

---

## 4. metodo_de_pago a pago
- **Tipo de relación:** `one_to_many`
- **Descripción:** Un método de pago puede ser utilizado en muchos pagos.
- **Tabla principal (uno):** `metodo_de_pago`
- **Tabla secundaria (muchos):** `pago`
- **Clave foránea:** `metodo_id` en `pago`

---

## 5. dias a clase
- **Tipo de relación:** `one_to_many`
- **Descripción:** Un día puede estar asociado a muchas clases.
- **Tabla principal (uno):** `dias`
- **Tabla secundaria (muchos):** `clase`
- **Clave foránea:** `dias_id` en `clase`

---

## 6. horarios a clase
- **Tipo de relación:** `one_to_many`
- **Descripción:** Un horario puede estar asociado a muchas clases.
- **Tabla principal (uno):** `horarios`
- **Tabla secundaria (muchos):** `clase`
- **Clave foránea:** `hora_id` en `clase`

---

## 7. instructor a clase
- **Tipo de relación:** `one_to_many`
- **Descripción:** Un instructor puede enseñar muchas clases.
- **Tabla principal (uno):** `instructor`
- **Tabla secundaria (muchos):** `clase`
- **Clave foránea:** `instru_id` en `clase`

---

## 8. socio a inscripcion_clase
- **Tipo de relación:** `one_to_many`
- **Descripción:** Un socio puede inscribirse en muchas clases.
- **Tabla principal (uno):** `socio`
- **Tabla secundaria (muchos):** `inscripcion_clase`
- **Clave foránea:** `soc_id` en `inscripcion_clase`

---

## 9. clase a inscripcion_clase
- **Tipo de relación:** `one_to_many`
- **Descripción:** Una clase puede tener muchos socios inscritos.
- **Tabla principal (uno):** `clase`
- **Tabla secundaria (muchos):** `inscripcion_clase`
- **Clave foránea:** `clase_id` en `inscripcion_clase`
