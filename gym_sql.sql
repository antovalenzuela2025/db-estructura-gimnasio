-- Tabla: socios
CREATE TABLE socios (
    id_socio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    fecha_nacimiento DATE,
    telefono VARCHAR(20),
    direccion TEXT,
    email VARCHAR(100)
);

-- Tabla: membresias
CREATE TABLE membresias (
    id_membresia SERIAL PRIMARY KEY,
    tipo_membresia VARCHAR(50) NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    duracion_dias INT NOT NULL
);

-- Tabla: pagos
CREATE TABLE pagos (
    id_pago SERIAL PRIMARY KEY,
    id_socio INT NOT NULL,
    id_membresia INT NOT NULL,
    monto_pagado NUMERIC(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    forma_pago VARCHAR(50),
    FOREIGN KEY (id_socio) REFERENCES socios(id_socio),
    FOREIGN KEY (id_membresia) REFERENCES membresias(id_membresia)
);

-- Tabla: clases
CREATE TABLE clases (
    id_clase SERIAL PRIMARY KEY,
    nombre_clase VARCHAR(100) NOT NULL,
    dia_semana VARCHAR(15) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    cupo_maximo INT NOT NULL,
    nombre_instructor VARCHAR(100)
);

-- Tabla: inscripciones_clases
CREATE TABLE inscripciones_clases (
    id_inscripcion SERIAL PRIMARY KEY,
    id_socio INT NOT NULL,
    id_clase INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (id_socio) REFERENCES socios(id_socio),
    FOREIGN KEY (id_clase) REFERENCES clases(id_clase)
);
