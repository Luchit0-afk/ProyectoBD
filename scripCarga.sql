--
-- Carga de contenidos en la tablas
--


INSERTO INTO 'Persona' ('DNI','nombre','apellido','direccion') VALUES 
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
(34435690,'Guadalupe','Tortosa','Santiago del estero 645');
(33465969,'Noelia','Urquiza','Luis Pasteur 18'),
(39543576,'Marisa','Flores','Rafael Obligado 765'),
(34547864,'Micaela','Lepori','Alberdi 813'),
(29446541,'Franco','Barzola','9 de julio 81'),
(29435690,'Matias','Barzola','San Martin 890');


INSERTO INTO 'M-Persona' ('DNI','telefono') VALUES 
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
(34435690,15548584);
(33465969,15579487),
(39543576,15671782),
(34547864,15668381),
(29446541,15450480),
(29435690,15442589;


INSERTO INTO 'Alumno' ('DNI_alumno','numero_alumno','cod_resolucion') VALUES 
(12543569,1,0001),
(12345568,2,0002),
(23543882,3,0003),
(32556763,4,0004),
(42465690,5,0005),
(37891852,6,0006),
(25455069,7,0007),
(42543564,8,0008),
(12547543,9,0009),
(34435690,10,0010);


INSERTO INTO 'Docente' ('DNI_docente','dedicacion') VALUES
(12543569,), 

(39544576,),

(33465969,),

(39543576,),

(34547864,),

(29446541,),

(29435690,);

INSERTO INTO 'Actividad' ('cod_actividad','descripcion','cod_materia') VALUES 
(0001,'TP3 8queens',0005),
(0002,'TP2 figure-figure',0005),
(0003,'TP1 lines-builder',0005),
(0004,'Proyecto ODP',0002),
(0005,'Proyecto BDD',0001),
(0006,'Parcial en laboratorio',0003),
(0007,'TP1 Netflix',0003),
(0008,'Proyecto Test-Vocacional',0010),
(0009,'TP1 Assembler',0002),
(0010,'TP1 Logica',0007);


INSERTO INTO 'Materia' ('cod_materia','nombre','DNI_docente') VALUES 
(0001,'Base De Datos',39544576),
(0002,'Organizacion del Procesador',33465969),
(0003,'Algoritmica',39543576),
(0004,'Calculo',12543569),
(0005,'Algoritmos',34547864),
(0006,'Algebra',29435690),
(0007,'Logica',12543569),
(0008,'Estadistica',29446541),
