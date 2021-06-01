--
-- Carga de contenidos en la tablas
--
USE Proyecto;

INSERT INTO Persona (DNI,nombre,apellido,direccion) VALUES 
(12543569,'Sofia','Urquiza','Tucuman 123'),
(12345568,'Rocio','Urquiza','Tucuman 123'),
(23543882,'Thomas','Sanchez','Mendoza 456'),
(32556763,'Tobias','Sanchez','Mendoza 456'),
(42465690,'Ivan','Bakanowsky','Cabrera 800'),
(37891852,'Sabrina','Fernandez','Guemes 1020'),
(25455069,'Franco','Fernandez','Costa Rica 800'),
(39544576,'Braiam','Zulberti','Bariloche 13'),
(42543564,'Franco','Arias','Bariloche 18'),
(12547543,'Nicolas','Pereyra','Peron 754'),
(34435690,'Guadalupe','Tortosa','Santiago del estero 645'),
(33465969,'Noelia','Urquiza','Luis Pasteur 18'),
(39543576,'Marisa','Flores','Rafael Obligado 765'),
(34547864,'Micaela','Lepori','Alberdi 813'),
(29446541,'Franco','Barzola','9 de julio 81'),
(29435690,'Matias','Barzola','San Martin 890'),
(25501211,'Fabian','Palacio','Bolivia 21'),
(17864350,'Facundo','Ortiz','Alberdi 98'),
(38974563,'Gonzalo','Espinoza','Constitucion 123'),
(40156234,'Sofia','Quiroga','San Martin 42'),
(12345678,'Martina','Martinez','Velez Sarfield 1');


INSERT INTO MPersona (DNI,telefono) VALUES 
(12543569,15447889),
(12345568,15458776),
(23543882,15644710),
(32556763,15648890),
(42465690,15478889),
(37891852,15441823),
(25455069,15438782),
(39544576,15545781),
(42543564,15646788),
(12547543,15457685),
(34435690,15548584),
(33465969,15579487),
(39543576,15671782),
(34547864,15668381),
(29446541,15450480),
(29435690,15442589);

INSERT INTO Docente (DNI_docente,dedicacion) VALUES
(12543569,1), 
(39544576,3),
(33465969,1),
(39543576,2),
(34547864,3),
(29446541,1),
(29435690,3),
(25501211,2),
(17864350,1),
(38974563,3),
(40156234,2),
(12345678,1);

INSERT INTO Materia (nombre,DNI_docente) VALUES 
('Base De Datos',39544576),
('Organizacion del Procesador',33465969),
('Algoritmica',39543576),
('Calculo',12543569),
('Algoritmos',34547864),
('Algebra',29435690),
('Logica',12543569),
('Estadistica',29446541),
('Ingenieria de software', 29446541),
('Diseño', 34547864);

INSERT INTO Actividad (desc_actividad,cod_materia) VALUES 
('TP3 8queens',0005),
('TP2 figure-figure',0005),
('TP1 lines-builder',0005),
('Proyecto ODP',0002),
('Proyecto BDD',0001),
('Parcial en laboratorio',0003),
('TP1 Netflix',0003),
('Proyecto Test-Vocacional',0010),
('TP1 Assembler',0002),
('TP1 Logica',0007);

INSERT INTO Resolucion (fecha_hora,nota,DNI_docente,cod_actividad) VALUES
('2017-07-03 16:30:00', 10, 12543569, 0008),
('2017-08-03 16:45:00', 8, 39544576, 0009),
('2018-03-05 13:50:00', 8, 33465969, 0003),
('2019-04-09 14:30:00', 7, 25501211, 0002),
('2019-08-12 20:00:00', 10, 29435690, 0007),
('2019-11-01 17:45:00', 5, 39543576, 0009),
('2020-05-01 12:30:00', 9, 34547864, 0002),
('2020-09-01 18:15:00', 6, 12543569, 0009),
('2020-10-11 15:00:00', 8, 39543576, 0005),
('2021-04-04 13:30:00', 7, 29446541, 0006);

INSERT INTO Alumno (DNI_alumno,cod_resolucion) VALUES 
(12543569,0001),
(12345568,0002),
(23543882,0003),
(32556763,0004),
(42465690,0005),
(37891852,0006),
(25455069,0007),
(42543564,0008),
(12547543,0009),
(34435690,0010);

INSERT INTO Facultad (desc_facultad) VALUES
('Ciencias exactas y naturales'),
('Ciencias economicas'),
('Ciencias sociales'),
('Arquitectura, disenio y urbanismo'),
('Medicina'),
('Derecho');

INSERT INTO Cargo (desc_cargo) VALUES
('profesor'),
('director administrativo'),
('secretario general'),
('rector'),
('vice-rector'),
('fiscal'),
('decano'),
('director de facultad'),
('director de departamento'),
('director de desarrollo estudiantil');

INSERT INTO Cursa (DNI_alumno,cod_materia) VALUES
(12543569,0001),
(12345568,0002),
(23543882,0002),
(32556763,0006),
(42465690,0005),
(37891852,0009),
(25455069,0006),
(42543564,0008),
(12547543,0007),
(34435690,0005);

INSERT INTO Asignado (cod_materia,DNI_docente) VALUES
(0006,25501211),
(0005,17864350),
(0001,38974563),
(0002,40156234),
(0001,12345678);

INSERT INTO Pertenece (cod_facultad,DNI_docente,cod_cargo) VALUES
(0005,12543569,0004),
(0003,29446541,0007),
(0003,39544576,0006),
(0002,29435690,0001),
(0004,33465969,0003),
(0001,34547864,0009),
(0004,39543576,0008),
(0003,25501211,0007);
