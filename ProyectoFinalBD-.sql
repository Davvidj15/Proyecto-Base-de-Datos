 CREATE DATABASE ProyectoDB;
USE ProyectoDB;

CREATE TABLE Usuario (
CI INT PRIMARY KEY UNIQUE NOT NULL,
Nombre VARCHAR (15) NOT NULL,
Turno VARCHAR (15) NOT NULL
);

CREATE TABLE Profesor (
CI_Usuario INT PRIMARY KEY UNIQUE NOT NULL,
Materia VARCHAR (12) NOT NULL
);

CREATE TABLE Asistente (
CI_Usuario INT PRIMARY KEY UNIQUE NOT NULL,
Email VARCHAR (20) NOT NULL
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
Horario DATE NOT NULL,
Categoria VARCHAR (15) NOT NULL
);

CREATE TABLE Averia (
ID INT PRIMARY KEY UNIQUE NOT NULL,
Tipo VARCHAR(10) NOT NULL
);

CREATE TABLE Usan (
CI_Usuario INT UNIQUE NOT NULL,
Num_Lab INT UNIQUE NOT NULL,
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
(45123456, 'Juan Leal',   'Matutino'),
(47234567, 'Nacho Rodriguez',  'Vespertino'),
(51345678, 'David Araque',  'Nocturno'),
(52456789, 'Santiago Marra',    'Matutino'),
(53567890, 'Tiago Tripaldi',   'Vespertino'),
(54678901, 'Mateo Silva',  'Matutino'),
(55789012, 'Sofia Bulla', 'Nocturno'),
(56890123, 'Rocio Vazquez', 'Vespertino');
SELECT * FROM Usuario;

INSERT INTO Profesor
(CI_Usuario, Materia)
VALUES
(90123456, 'Matematicas'),
(89012345, 'Programacion'),
(78901234, 'APT'),
(67890123, 'Sistemas Op'),
(56789012, 'CTS');

INSERT INTO Asistente
(CI_Usuario, Email)
VALUES
(5678321, 'juanasist@gmail.com'),
(6223456, 'albertoutu@gmail.com'),
(5436781, 'ibisutudavila@gmail.com'),
(9875409, 'walterjes10utu@hotmail.com'),
(4534542, 'darwinrodriguezutu@gmail.com');

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
(101, 12345678, '10:10-11:30', 'Ceibalita'),
(102, 23456789, '09:30-12:30', 'Microbit'),
(103, 34567890, '08:00-09:00', 'Cargador'),
(104, 45678901, '08:30-10:30', 'Mouse'),
(105, 56789012, '09:00-11:00', 'Ceibalita');


INSERT INTO Averia
(ID, Tipo)
VALUES
(1, 'Pantalla'),
(2, 'Cargador'),
(3, 'Tecla'),
(4, 'Bateria'),
(5, 'Pin Carga');

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



