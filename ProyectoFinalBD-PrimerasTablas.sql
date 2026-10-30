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

INSERT INTO Lab (Num, Equipo) VALUES 
(1, 'Ceibalita'),
(2, 'Ceibalita'),
(3, 'Microbit'),
(4, 'Ceibalita'),
(5, 'Coordinacion'),
(6, 'Microbit'),
(7, 'Cargadores');

-- Averías comunes en una UTU
INSERT INTO Averia (ID, Tipo) VALUES 
(1, 'Pantalla'),
(2, 'Cargador'),
(3, 'Tecla'),
(4, 'Bateria'),
(5, 'Pin Carga');

INSERT INTO Profesor (CI_Usuario, Materia) VALUES 
(12345678, 'Programacion'),
(23456789, 'Sistemas Op.');

INSERT INTO Asistente (CI_Usuario, Email) VALUES 
(34567890, 'marcelo@utu.edu.uy');

INSERT INTO Estudiante (CI_Usuario, Grupo) VALUES 
(45678901, '1BA'),
(56789012, '2BB'),
(67890123, '3BD');

-- Equipos realistas: Ceibalitas, Micro:bit, cargadores y mouses
INSERT INTO Equipo (ID, CI_Garantia, Horario, Categoria) VALUES 
(101, 12345678, '2026-03-01', 'Ceibalita'),
(102, 23456789, '2026-03-02', 'Microbit'),
(103, 34567890, '2026-03-03', 'Cargador'),
(104, 45678901, '2026-03-04', 'Mouse'),
(105, 56789012, '2026-03-05', 'Ceibalita');

INSERT INTO Usan (CI_Usuario, Num_Lab) VALUES 
(45678901, 1),
(56789012, 2),
(67890123, 3);

INSERT INTO Mantener (CI_Usuario, ID_Equipo) VALUES 
(34567890, 101),
(12345678, 102);

INSERT INTO Prestamo (CI_Usuario, ID_Equipo, FechaI, FechaF) VALUES 
(45678901, 103, '2026-04-01', '2026-04-01'),
(56789012, 102, '2026-04-02', '2026-04-02');

INSERT INTO Tiene (ID_Equipo, ID_Averia) VALUES 
(101, 1),
(102, 2),
(103, 5);

INSERT INTO Deriva_en (ID_Averia, ID_NuevaAveria) VALUES 
(2, 5),
(1, 4);

