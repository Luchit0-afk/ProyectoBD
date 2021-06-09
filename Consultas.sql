Use Proyecto;

USE Proyecto;

# ACTIVIDAD A
# SELECT DNI_alumno FROM Alumno WHERE DNI_Alumno NOT IN (SELECT DNI_alumno FROM (Alumno NATURAL JOIN Resolucion NATURAL JOIN Actividad) WHERE cod_materia = 2)

# ACTIVIDAD B
# SELECT cod_materia FROM Materia WHERE cod_materia NOT IN (SELECT cod_materia FROM Materia UNION SELECT cod_materia FROM Asignado)

# MENOS CODIGO, PERO NO ANDA
# SELECT cod_materia FROM Materia WHERE cod_materia NOT IN (SELECT cod_materia FROM (Materia NATURAL JOIN Asignado))

/*C}*/
SELECT Alumno.DNI_alumno FROM  
(Docente JOIN Alumno)
WHERE (Alumno.DNI_alumno = Docente.DNI_docente);

/*Alumno que cursan Base de datos*/
SELECT * FROM (
(SELECT DNI_alumno
FROM Cursa
WHERE cod_materia = 1) as dni_alumnos_bdd
JOIN Persona)
WHERE DNI = DNI_alumno;

/*Datos de los docentes con dedicacion simple*/
SELECT distinct * FROM 
((SELECT DNI_docente
FROM Docente
WHERE dedicacion = 'Simple') as Dni_docentes
JOIN Persona)
WHERE DNI_docente = DNI;


