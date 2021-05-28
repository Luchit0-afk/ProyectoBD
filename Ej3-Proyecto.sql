

CREATE TABLE persona (
DNI integer,
CHECK (DNI > 0),
nombre varchar(50),
apellido varchar(50),
direccion varchar(100),
PRIMARY KEY (DNI)
);

CREATE TABLE alumno (
CONSTRAINT fk_alumno FOREIGN KEY (DNI) REFERENCES persona(DNI),
num_alumno integer,
CONSTRAINT fk_alumno_2 FOREIGN KEY (cod_resolucion) REFERENCES resolucion(cod_resolucion)
);

CREATE TABLE docente (
CONSTRAINT fk_docente FOREIGN KEY (DNI) REFERENCES persona(DNI),
dedicacion varchar(100)
);

CREATE TABLE actividad (
cod_actividad integer,
desc_actividad varchar(200),
CONSTRAINT fk_actividad FOREIGN KEY (cod_materia) REFERENCES materia(cod_materia),
PRIMARY KEY (cod_actividad)
);

CREATE TABLE materia (
cod_materia integer,
nombre varchar(50),
CONSTRAINT fk_materia FOREIGN KEY (DNI) REFERENCES docente(DNI),
PRIMARY KEY (cod_materia)
);

CREATE TABLE resolucion (
cod_resolucion integer,
fecha date,
hora integer,
/* QUE PONER A HORA? JUNTAR CON FECHA?*/
nota integer,
CONSTRAINT fk_resolucion FOREIGN KEY (DNI) REFERENCES docente(DNI),
CONSTRAINT fk_resolucion_2 FOREIGN KEY (cod_actividad) REFERENCES actividad(cod_actividad),
PRIMARY KEY (cod_resolucion)
);

CREATE TABLE facultad (
cod_facultad integer,
desc_facultad varchar(200),
PRIMARY KEY (cod_facultad)
);

CREATE TABLE cargo (
cod_cargo integer,
desc_cargo varchar(200),
PRIMARY KEY (cod_cargo)
);

CREATE TABLE cursa (
CONSTRAINT fk_cursa FOREIGN KEY (DNI) REFERENCES alumno(DNI),
CONSTRAINT fk_cursa_2 FOREIGN KEY (cod_materia) REFERENCES materia(cod_materia)
);

CREATE TABLE asignado (
CONSTRAINT fk_asignado FOREIGN KEY (cod_materia) REFERENCES materia(cod_materia),
CONSTRAINT fk_asignado_2 FOREIGN KEY (DNI) REFERENCES docente(DNI)
);

CREATE TABLE pertenece (
CONSTRAINT fk_pertenece FOREIGN KEY (DNI) REFERENCES docente(DNI),
CONSTRAINT fk_pertenece_2 FOREIGN KEY (cod_facultad) REFERENCES facultad(cod_facultad),
CONSTRAINT fk_pertenece_3 FOREIGN KEY (cod_cargo) REFERENCES cargo(cod_cargo)
);