CREATE DATABASE Proyecto;
USE Proyecto;

CREATE TABLE Persona (
DNI integer NOT NULL,
CONSTRAINT check_dni_persona CHECK (DNI > 0),
nombre varchar(50),
apellido varchar(50),
direccion varchar(100),
PRIMARY KEY (DNI)
);

CREATE TABLE MPersona (
DNI integer NOT NULL,
telefono integer,
CONSTRAINT check_telefono CHECK (telefono > 0),
CONSTRAINT pk_mpersona PRIMARY KEY (DNI,telefono),
CONSTRAINT fk_persona FOREIGN KEY (DNI) REFERENCES Persona(DNI)
ON DELETE CASCADE
ON UPDATE RESTRICT
);

CREATE TABLE Docente (
DNI_docente integer NOT NULL,
CONSTRAINT check_dni_docente CHECK (DNI_docente > 0),
dedicacion enum('Exclusivo','Semi-exclusivo','Simple') NOT NULL,
CONSTRAINT pk_docente PRIMARY KEY (DNI_docente),
CONSTRAINT fk_docente_persona FOREIGN KEY (DNI_docente) REFERENCES Persona(DNI)
ON DELETE CASCADE
ON UPDATE RESTRICT
);

CREATE TABLE Materia (
cod_materia integer NOT NULL AUTO_INCREMENT,
nombre varchar(50),
DNI_docente integer NOT NULL,
CONSTRAINT pk_materia PRIMARY KEY (cod_materia),
CONSTRAINT fk_materia_docente FOREIGN KEY (DNI_docente) REFERENCES Docente(DNI_docente)
ON DELETE CASCADE
ON UPDATE RESTRICT
);

CREATE TABLE Actividad (
cod_actividad integer NOT NULL AUTO_INCREMENT,
desc_actividad varchar(200),
cod_materia integer NOT NULL,
CONSTRAINT pk_actividad PRIMARY KEY (cod_actividad),
CONSTRAINT fk_actividad_materia FOREIGN KEY (cod_materia) REFERENCES Materia(cod_materia)
ON DELETE CASCADE
ON UPDATE RESTRICT
);

CREATE TABLE Resolucion (
cod_resolucion integer NOT NULL AUTO_INCREMENT,
fecha_hora datetime,
nota integer NOT NULL,
CONSTRAINT check_nota CHECK (nota > 0 AND nota < 11),
DNI_docente integer NOT NULL,
cod_actividad integer NOT NULL,
CONSTRAINT pk_resolucion PRIMARY KEY (cod_resolucion),
CONSTRAINT fk_resolucion_docente FOREIGN KEY (DNI_docente) REFERENCES Docente(DNI_docente),
CONSTRAINT fk_resolucion_actividad FOREIGN KEY (cod_actividad) REFERENCES Actividad(cod_actividad)
ON DELETE CASCADE
ON UPDATE RESTRICT
);

CREATE TABLE Alumno (
DNI_alumno integer NOT NULL,
CONSTRAINT check_dni_alumno CHECK (DNI_alumno > 0),
num_alumno integer NOT NULL,
CONSTRAINT check_numero CHECK (num_alumno > 0),
cod_resolucion integer NOT NULL,
CONSTRAINT pk_alumno PRIMARY KEY (DNI_alumno),
CONSTRAINT fk_alumno_persona FOREIGN KEY (DNI_alumno) REFERENCES Persona(DNI),
CONSTRAINT fk_alumno_resolucion FOREIGN KEY (cod_resolucion) REFERENCES Resolucion(cod_resolucion)
ON DELETE CASCADE
ON UPDATE RESTRICT
);

CREATE TABLE Facultad (
cod_facultad integer NOT NULL AUTO_INCREMENT,
desc_facultad varchar(200),
CONSTRAINT pk_facultad PRIMARY KEY (cod_facultad)
);

CREATE TABLE Cargo (
cod_cargo integer NOT NULL AUTO_INCREMENT,
desc_cargo varchar(200),
CONSTRAINT pk_cargo PRIMARY KEY (cod_cargo)
);

CREATE TABLE Cursa (
DNI_alumno integer NOT NULL,
cod_materia integer NOT NULL,
CONSTRAINT pk_cursa PRIMARY KEY (DNI_alumno,cod_materia),
CONSTRAINT fk_cursa_alumno FOREIGN KEY (DNI_alumno) REFERENCES Alumno(DNI_alumno),
CONSTRAINT fk_cursa_materia FOREIGN KEY (cod_materia) REFERENCES Materia(cod_materia)
ON DELETE CASCADE
ON UPDATE RESTRICT
);

CREATE TABLE Asignado (
cod_materia integer NOT NULL AUTO_INCREMENT,
DNI_docente integer NOT NULL,
CONSTRAINT pk_asignado PRIMARY KEY (cod_materia,DNI_docente),
CONSTRAINT fk_asignado_materia FOREIGN KEY (cod_materia) REFERENCES Materia(cod_materia),
CONSTRAINT fk_asignado_2 FOREIGN KEY (DNI_docente) REFERENCES Docente(DNI_docente)
ON DELETE CASCADE
ON UPDATE RESTRICT
);

CREATE TABLE Pertenece (
cod_facultad integer NOT NULL AUTO_INCREMENT,
DNI_docente integer NOT NULL,
cod_cargo integer NOT NULL,
CONSTRAINT pk_pertenece PRIMARY KEY (cod_facultad,DNI_docente,cod_cargo),
CONSTRAINT fk_pertenece_facultad FOREIGN KEY (cod_facultad) REFERENCES Facultad(cod_facultad),
CONSTRAINT fk_pertenece_docente FOREIGN KEY (DNI_docente) REFERENCES Docente(DNI_docente),
CONSTRAINT fk_pertenece_cargo FOREIGN KEY (cod_cargo) REFERENCES Cargo(cod_cargo)
ON DELETE CASCADE
ON UPDATE RESTRICT
);

CREATE TABLE Auditoria (
cod_resolucion integer,
calificacion_anterior integer,
calificacion_nueva integer,
fecha date,
usuario varchar(50),
CONSTRAINT pk_auditoria PRIMARY KEY (cod_resolucion)
);

/* antes de ingresar un docente a la relacion asignado debemos chequear que no pertenece a materia*/

delimiter $$
CREATE TRIGGER trigger_docente_responsable
	BEFORE INSERT ON Asignado
	  FOR EACH ROW
		BEGIN
			IF NEW.DNI_docente IN (SELECT DNI_docente from Materia) THEN 
			/* Si el docente no es responsable de una materia*/
            /* Si existe  */
				signal sqlstate '45000';
            END IF;
		END;
$$
delimiter ;

delimiter $$
CREATE TRIGGER trigger_docente_asignado
	BEFORE INSERT ON Materia
	  FOR EACH ROW
		BEGIN
			IF NEW.DNI_docente IN (SELECT DNI_docente from Asignado) THEN 
			/* Si el docente no es responsable de una materia*/
            /* Si existe  */
				signal sqlstate '45000';
            END IF;
		END;
$$
delimiter ;

delimiter $$
CREATE TRIGGER trigger_carga_auditoria
	AFTER UPDATE ON Resolucion
		FOR EACH ROW
			BEGIN
				INSERT INTO Auditoria VALUES (OLD.cod_resolucion,OLD.nota,NEW.nota,NOW(),CURRENT_USER());
			END;
$$
delimiter ;



