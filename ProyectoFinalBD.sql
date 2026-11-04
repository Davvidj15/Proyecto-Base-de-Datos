CREATE DATABASE ProyectoDB;
USE ProyectoDB;

CREATE TABLE Usuario (
CI INT PRIMARY KEY UNIQUE NOT NULL,
Nombre VARCHAR (20) NOT NULL,
Turno VARCHAR (15) NOT NULL
);

CREATE TABLE Profesor (
CI_Usuario INT PRIMARY KEY UNIQUE NOT NULL,
Materia VARCHAR (12) NOT NULL
);

CREATE TABLE Asistente (
CI_Usuario INT PRIMARY KEY UNIQUE NOT NULL,
Email VARCHAR (40) NOT NULL
);

CREATE TABLE Estudiante (
CI_Usuario INT PRIMARY KEY UNIQUE NOT NULL,
Grupo VARCHAR (5) NOT NULL
);

CREATE TABLE Lab (
Num INT PRIMARY KEY UNIQUE NOT NULL,
Equipo VARCHAR (12) NOT NULL
);

CREATE TABLE Equipo (
ID INT PRIMARY KEY UNIQUE NOT NULL,
CI_Garantia INT UNIQUE NOT NULL,
Horario VARCHAR(12) NOT NULL,
Categoria VARCHAR (15) NOT NULL
);

CREATE TABLE Averia (
ID INT PRIMARY KEY UNIQUE NOT NULL,
Tipo VARCHAR(20) NOT NULL
);

CREATE TABLE Usan (
CI_Usuario INT UNIQUE NOT NULL,
Num_Lab INT NOT NULL,
PRIMARY KEY (CI_Usuario, Num_Lab)
);

CREATE TABLE Mantener (
CI_Usuario INT UNIQUE NOT NULL,
ID_Equipo INT UNIQUE NOT NULL,
PRIMARY KEY (CI_Usuario, ID_Equipo)
);

CREATE TABLE Prestamo (
CI_Usuario INT UNIQUE NOT NULL,
ID_Equipo INT UNIQUE NOT NULL,
PRIMARY KEY (CI_Usuario, ID_Equipo),
FechaI DATE NOT NULL,
FechaF DATE NOT NULL
);

CREATE TABLE Tiene (
ID_Equipo INT UNIQUE NOT NULL,
ID_Averia INT UNIQUE NOT NULL,
PRIMARY KEY (ID_Equipo, ID_Averia)
);

CREATE TABLE Deriva_en (
ID_Averia INT UNIQUE NOT NULL,
ID_NuevaAveria INT UNIQUE NOT NULL,
PRIMARY KEY (ID_Averia, ID_NuevaAveria)
);

ALTER TABLE Profesor 
ADD CONSTRAINT fk_profesor_usuario FOREIGN KEY (CI_Usuario) 
REFERENCES Usuario(CI);

ALTER TABLE Asistente 
ADD CONSTRAINT fk_asistente_usuario FOREIGN KEY (CI_Usuario) 
REFERENCES Usuario(CI);

ALTER TABLE Estudiante 
ADD CONSTRAINT fk_estudiante_usuario FOREIGN KEY (CI_Usuario) 
REFERENCES Usuario(CI);

ALTER TABLE Equipo 
ADD CONSTRAINT fk_equipo_garantia FOREIGN KEY (CI_Garantia) 
REFERENCES Usuario(CI);

ALTER TABLE Usan 
ADD CONSTRAINT fk_usan_usuario FOREIGN KEY (CI_Usuario) 
REFERENCES Usuario(CI);

ALTER TABLE Usan 
ADD CONSTRAINT fk_usan_lab FOREIGN KEY (Num_Lab) 
REFERENCES Lab(Num);

ALTER TABLE Mantener 
ADD CONSTRAINT fk_mantener_usuario FOREIGN KEY (CI_Usuario) 
REFERENCES Usuario(CI);

ALTER TABLE Mantener 
ADD CONSTRAINT fk_mantener_equipo FOREIGN KEY (ID_Equipo) 
REFERENCES Equipo(ID);

ALTER TABLE Prestamo 
ADD CONSTRAINT fk_prestamo_usuario FOREIGN KEY (CI_Usuario) 
REFERENCES Usuario(CI);

ALTER TABLE Prestamo 
ADD CONSTRAINT fk_prestamo_equipo FOREIGN KEY (ID_Equipo) 
REFERENCES Equipo(ID);

ALTER TABLE Tiene 
ADD CONSTRAINT fk_tiene_equipo FOREIGN KEY (ID_Equipo) 
REFERENCES Equipo(ID);

ALTER TABLE Tiene 
ADD CONSTRAINT fk_tiene_averia FOREIGN KEY (ID_Averia) 
REFERENCES Averia(ID);

ALTER TABLE Deriva_en 
ADD CONSTRAINT fk_deriva_averia FOREIGN KEY (ID_Averia) 
REFERENCES Averia(ID);

ALTER TABLE Deriva_en 
ADD CONSTRAINT fk_deriva_nueva_averia FOREIGN KEY (ID_NuevaAveria) 
REFERENCES Averia(ID);

INSERT INTO Usuario
(CI, Nombre, Turno) 
VALUES
(45123456, 'Juan Leal', 'Matutino'),
(45345423, 'Darwin Galiano', 'Vespertino'),
(47234567, 'Nacho Rodriguez', 'Vespertino'),
(51345678, 'David Araque', 'Nocturno'),
(52456789, 'Santiago Marra', 'Matutino'),
(53567890, 'Tiago Tripaldi', 'Vespertino'),
(54367810, 'Ibis Davila', 'Matutino'),
(54678901, 'Mateo Silva', 'Matutino'),
(55789012, 'Sofia Bulla', 'Nocturno'),
(56783219, 'Juana Paredes', 'Vespertino'),
(56789012, 'Matias Garbarino', 'Vespertino'),
(56890123, 'Rocio Vazquez', 'Vespertino'),
(62234564, 'Alberto Monzon', 'Nocturno'),
(67890123, 'Nestor Nuñez', 'Matutino'),
(78901234, 'Joaquin Pegoraro','Vespertino'),
(89012345, 'Agustin Russell','Nocturno'),
(90123456, 'Serrana Bazet', 'Matutino'),
(98754091, 'Walter Jes', 'Nocturno');

INSERT INTO Profesor
(CI_Usuario, Materia)
VALUES
(56789012, 'CTS'),
(67890123, 'Sistemas Op'),
(78901234, 'APT'),
(89012345, 'Programacion'),
(90123456, 'Matematicas');

INSERT INTO Asistente
(CI_Usuario, Email)
VALUES
(45345423, 'darwinrodriguezutu@gmail.com'),
(54367810, 'ibisutudavila@gmail.com'),
(56783219, 'juanasist@gmail.com'),
(62234564, 'albertoutu@gmail.com'),
(98754091, 'walterjes10utu@hotmail.com');

INSERT INTO Estudiante
(CI_Usuario, Grupo)
VALUES
(45123456, '2ME'),
(47234567, '2MD'),
(51345678, '2MF'),
(52456789, '2MA'),
(53567890, '2ME'),
(54678901, '2MA'),
(55789012, '2MF'),
(56890123, '2ME');

INSERT INTO Lab
(Num, Equipo)
VALUES
(1, 'Ceibalita'),
(2, 'Teclados'),
(3, 'Mouses'),
(4, 'Microbit'),
(5, 'Cargadores');

INSERT INTO Equipo 
(ID, CI_Garantia, Horario, Categoria) 
VALUES 
(101, 47234567, '10:10-11:30', 'Ceibalita'),
(102, 67890123, '09:00-11:00', 'Ceibalita'),
(103, 89012345, '09:30-12:30', 'Microbit'),
(104, 90123456, '08:00-09:00', 'Cargador'),
(105, 98754091, '08:30-10:30', 'Teclado');

INSERT INTO Averia
(ID, Tipo)
VALUES
(1, 'Pantalla'),
(2, 'Cargador'),
(3, 'Tecla'),
(4, 'Bateria'),
(5, 'Pin de Carga'),
(6, 'Fuga térmica'),
(7, 'Membrana'),
(8, 'Fusible de backlight'),
(9, 'Chip de carga');

INSERT INTO Usan
(CI_Usuario, Num_Lab)
VALUES
(45123456, 1),
(47234567, 2),
(51345678, 1),
(52456789, 2),
(53567890, 3),
(54678901, 4),
(55789012, 5),
(56890123, 1);

INSERT INTO Mantener
(CI_Usuario, ID_Equipo)
VALUES
(45345423, 101),
(54367810, 102),
(56783219, 103),
(62234564, 104),
(98754091, 105);

INSERT INTO Prestamo
(CI_Usuario, ID_Equipo, FechaI, FechaF)
VALUES
(45345423, 101, '2026/03/11', '2026/03/18'),
(54367810, 102, '2026/05/16', '2026/06/3'),
(56783219, 103, '2026/08/13', '2026/08/21'),
(62234564, 104, '2026/07/23', '2026/07/24'),
(98754091, 105, '2026/11/2', '2026/11/10');

INSERT INTO Tiene
(ID_Equipo, ID_Averia)
VALUES
(101, 2),
(102, 1),
(103, 4),
(104, 5),
(105, 3);

INSERT INTO Deriva_en
(ID_Averia, ID_NuevaAveria)
VALUES
(1, 8),
(2, 5),
(3, 7),
(4, 6),
(5, 9);

SELECT * FROM Usuario;

SELECT * FROM Prestamo;

SELECT * FROM Estudiante WHERE Grupo = '2ME';

SELECT Email 
FROM Asistente 
JOIN Usuario ON Asistente.CI_Usuario = Usuario.CI
WHERE Usuario.Nombre = 'Darwin Galiano';

SELECT Nombre
FROM Usuario
JOIN Profesor ON Usuario.CI = Profesor.CI_Usuario
WHERE Profesor.Materia = 'CTS';

SELECT Horario, Usuario.Nombre, Categoria
FROM Equipo
JOIN Usuario ON Equipo.CI_Garantia = Usuario.CI
WHERE ID = 104;

SELECT Tipo
FROM Averia
JOIN Deriva_en ON Averia.ID = Deriva_en.ID_NuevaAveria
WHERE Deriva_en.Id_NuevaAveria = 8;


