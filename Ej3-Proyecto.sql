CREATE DATABASE ProyectoDB;
USE ProyectoDB;

CREATE TABLE Persona (
DNI integer,
nombre varchar(50),
apellido varchar(50),
direccion varchar(100),
PRIMARY KEY (DNI)
);

CREATE TABLE MPersona (
DNI integer,
telefono integer,
CONSTRAINT pk_mpersona PRIMARY KEY (DNI,telefono),
CONSTRAINT fk_persona FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

CREATE TABLE Docente (
DNI_docente integer,
dedicacion enum('Exclusivo','Semi-exclusivo','Simple'),
CONSTRAINT pk_docente PRIMARY KEY (DNI_docente),
CONSTRAINT fk_docente_persona FOREIGN KEY (DNI_docente) REFERENCES Persona(DNI)
);

CREATE TABLE Materia (
cod_materia integer,
nombre varchar(50),
DNI_docente integer,
CONSTRAINT pk_materia PRIMARY KEY (cod_materia),
CONSTRAINT fk_materia_docente FOREIGN KEY (DNI_docente) REFERENCES Docente(DNI_docente)
);

CREATE TABLE Actividad (
cod_actividad integer,
desc_actividad varchar(200),
cod_materia integer,
CONSTRAINT pk_actividad PRIMARY KEY (cod_actividad),
CONSTRAINT fk_actividad_materia FOREIGN KEY (cod_materia) REFERENCES Materia(cod_materia)
);

CREATE TABLE Resolucion (
cod_resolucion integer,
fecha_hora datetime,
nota integer,
DNI_docente integer,
cod_actividad integer,
CONSTRAINT pk_resolucion PRIMARY KEY (cod_resolucion),
CONSTRAINT fk_resolucion_docente FOREIGN KEY (DNI_docente) REFERENCES Docente(DNI_docente),
CONSTRAINT fk_resolucion_actividad FOREIGN KEY (cod_actividad) REFERENCES Actividad(cod_actividad)
);

CREATE TABLE Alumno (
DNI_alumno integer ,
num_alumno integer,
cod_resolucion integer,
CONSTRAINT pk_alumno PRIMARY KEY (DNI_alumno),
CONSTRAINT fk_alumno_persona FOREIGN KEY (DNI_alumno) REFERENCES Persona(DNI),
CONSTRAINT fk_alumno_resolucion FOREIGN KEY (cod_resolucion) REFERENCES Resolucion(cod_resolucion)
);

CREATE TABLE Facultad (
cod_facultad integer,
desc_facultad varchar(200),
CONSTRAINT pk_facultad PRIMARY KEY (cod_facultad)
);

CREATE TABLE Cargo (
cod_cargo integer,
desc_cargo varchar(200),
CONSTRAINT pk_cargo PRIMARY KEY (cod_cargo)
);

CREATE TABLE Cursa (
DNI_alumno integer,
cod_materia integer,
CONSTRAINT pk_cursa PRIMARY KEY (DNI_alumno,cod_materia),
CONSTRAINT fk_cursa_alumno FOREIGN KEY (DNI_alumno) REFERENCES Alumno(DNI_alumno),
CONSTRAINT fk_cursa_materia FOREIGN KEY (cod_materia) REFERENCES Materia(cod_materia)
);

CREATE TABLE Asignado (
cod_materia integer,
DNI_docente integer,
CONSTRAINT pk_asignado PRIMARY KEY (cod_materia,DNI_docente),
CONSTRAINT fk_asignado_materia FOREIGN KEY (cod_materia) REFERENCES Materia(cod_materia),
CONSTRAINT fk_asignado_2 FOREIGN KEY (DNI_docente) REFERENCES Docente(DNI_docente)
);

CREATE TABLE Pertenece (
cod_facultad integer,
DNI_docente integer,
cod_cargo integer,
CONSTRAINT pk_pertenece PRIMARY KEY (cod_facultad,DNI_docente,cod_cargo),
CONSTRAINT fk_pertenece_facultad FOREIGN KEY (cod_facultad) REFERENCES Facultad(cod_facultad),
CONSTRAINT fk_pertenece_docente FOREIGN KEY (DNI_docente) REFERENCES Docente(DNI_docente),
CONSTRAINT fk_pertenece_cargo FOREIGN KEY (cod_cargo) REFERENCES Cargo(cod_cargo)
);

/* antes de ingresar un docente a la relacion asignado debemos chequear que no pertenece a pertenece*/


