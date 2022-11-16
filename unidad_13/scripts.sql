/* 3- Crear una base de datos */

CREATE DATABASE Practica

/* 4- Crear 3 tablas: Alumno, Materia y Cursa. Alumno deberá tener
los siguientes campos: Legajo, nombre, apellido y fecha de
nacimiento. Materia deberá tener los siguientes campos:
Código y descripción. Finalmente, la tabla Cursa deberá tener
los siguientes campos: legajo y código de materia. Para las
tablas se deberá definir la clave primaria. También deben
crearse las claves foráneas. */

CREATE TABLE Alumno (
legajo INT PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
apellido VARCHAR(45) NULL,
fecha_de_nacimiento VARCHAR(45) NOT NULL,
);

CREATE TABLE Materia(
	codigo INT PRIMARY KEY,
	descripcion VARCHAR(45) NULL,
);

CREATE TABLE Cursada (
	codigo_de_materia int foreign key references Alumno(codigo),
	legajo int foreign key references Materia(legajo),
);

/* 5- Insertar 5 tuplas en cada una de las tablas */

INSERT INTO Alumno  VALUES  (0, 'pepe1', '1gonzalez', '1/1/1951'),
                            (2, 'pepe2', '2gonzalez', '1/1/1952'),
                            (3, 'pepe3', '3gonzalez', '1/1/1953'),
                            (4, 'pepe4', '4gonzalez', '1/1/1954'),
                            (5, 'pepe5', '5gonzalez', '1/1/1955');

INSERT INTO Cursada VALUES  (1, 5),
                            (2, 4),
                            (3, 3),
                            (4, 2),
                            (5, 0);

INSERT INTO Materia VALUES  (1, 'descript 1'),
                            (2, 'descript 2'),
                            (3, 'descript 3'),
                            (4, 'descript 4'),
                            (5, 'descript 5');

/* 7- Borrar la base creada */

DROP DATABASE Practica