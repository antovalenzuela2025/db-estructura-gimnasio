CREATE TABLE tipo_membresia (
    tipo_id SERIAL PRIMARY KEY,
    tpo_descrip VARCHAR
);

CREATE TABLE socio (
    soc_id SERIAL PRIMARY KEY,
    soc_nombre VARCHAR,
    soc_apellido VARCHAR,
    soc_cedula INTEGER,
    soc_fecnac DATE,
    soc_tel INTEGER,
    soc_direccion VARCHAR,
    soc_email VARCHAR
);

CREATE TABLE tipo_clase (
    tipo_clasid SERIAL PRIMARY KEY,
    tipo_clasdescrip VARCHAR
);

CREATE TABLE membresia (
    mem_id SERIAL PRIMARY KEY,
    mem_precio INTEGER NOT NULL,
    mem_fechainicio DATE,
    mem_fechafin DATE,
    tipo_id INTEGER,
    CONSTRAINT fk_tipo_membresia FOREIGN KEY (tipo_id) REFERENCES tipo_membresia(tipo_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE metodo_de_pago (
    metodo_id SERIAL PRIMARY KEY,
    met_descripcion VARCHAR
);

CREATE TABLE pago (
    pago_id SERIAL PRIMARY KEY,
    soc_id INTEGER,
    mem_id INTEGER,
    pago_montopaga INTEGER,
    pago_fecha DATE,
    metodo_id INTEGER,
    CONSTRAINT fk_pago_socio FOREIGN KEY (soc_id) REFERENCES socio(soc_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pago_membresia FOREIGN KEY (mem_id) REFERENCES membresia(mem_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pago_metodo FOREIGN KEY (metodo_id) REFERENCES metodo_de_pago(metodo_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE dias (
    dias_id SERIAL PRIMARY KEY,
    dias_descrip VARCHAR
);

CREATE TABLE horarios (
    hora_id SERIAL PRIMARY KEY,
    hora_descrip TIME
);

CREATE TABLE instructor (
    instru_id SERIAL PRIMARY KEY,
    instru_nombre VARCHAR,
    instru_apellido VARCHAR,
    instru_tel INTEGER
);

CREATE TABLE clase (
    clase_id SERIAL PRIMARY KEY,
    tipo_clasid INTEGER,
    dias_id INTEGER,
    hora_id INTEGER,
    clas_cupomaximo INTEGER,
    instru_id INTEGER,
    CONSTRAINT fk_tipo_clase FOREIGN KEY (tipo_clasid) REFERENCES tipo_clase(tipo_clasid)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_clase_dia FOREIGN KEY (dias_id) REFERENCES dias(dias_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_clase_hora FOREIGN KEY (hora_id) REFERENCES horarios(hora_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_clase_instructor FOREIGN KEY (instru_id) REFERENCES instructor(instru_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE inscripcion_clase (
    inscrip_id SERIAL PRIMARY KEY,
    soc_id INTEGER,
    clase_id INTEGER,
    inscrip_fecha DATE,
    CONSTRAINT fk_inscrip_socio FOREIGN KEY (soc_id) REFERENCES socio(soc_id)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_inscrip_clase FOREIGN KEY (clase_id) REFERENCES clase(clase_id)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
