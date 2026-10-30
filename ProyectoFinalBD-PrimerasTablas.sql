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

-- ==========================================
-- 1. CREACIÓN DE LA BASE DE DATOS Y TABLAS (DDL)
-- ==========================================
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

-- RESTRICCIONES (FOREIGN KEYS)
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


-- ==========================================
-- 2. INSERCIÓN DE DATOS RANDOM (DATOS)
-- ==========================================

INSERT INTO Usuario (CI, Nombre, Turno) VALUES 
(12345678, 'Ana Pérez', 'Matutino'),
(23456789, 'Juan Gómez', 'Vespertino'),
(34567890, 'María Rodríguez', 'Nocturno'),
(45678901, 'Carlos López', 'Matutino'),
(56789012, 'Lucía Martínez', 'Vespertino'),
(67890123, 'Pedro Sánchez', 'Nocturno');

INSERT INTO Lab (Num, Equipo) VALUES 
(1, 'Dell OptiPlex'),
(2, 'HP ProDesk'),
(3, 'Lenovo ThinkC.'),
(4, 'Apple iMac'),
(5, 'Asus VivoPC');

INSERT INTO Averia (ID, Tipo) VALUES 
(1, 'Pantalla'),
(2, 'Teclado'),
(3, 'Fuente'),
(4, 'Disco Duro'),
(5, 'Memoria RAM');

INSERT INTO Profesor (CI_Usuario, Materia) VALUES 
(12345678, 'Matemáticas'),
(23456789, 'Programación');

INSERT INTO Asistente (CI_Usuario, Email) VALUES 
(34567890, 'maria@mail.com');

INSERT INTO Estudiante (CI_Usuario, Grupo) VALUES 
(45678901, '5A1'),
(56789012, '5A2'),
(67890123, '6B1');

INSERT INTO Equipo (ID, CI_Garantia, Horario, Categoria) VALUES 
(101, 12345678, '2026-03-01', 'Computadora'),
(102, 23456789, '2026-03-02', 'Impresora'),
(103, 34567890, '2026-03-03', 'Proyector'),
(104, 45678901, '2026-03-04', 'Router'),
(105, 56789012, '2026-03-05', 'Switch');

INSERT INTO Usan (CI_Usuario, Num_Lab) VALUES 
(45678901, 1),
(56789012, 2),
(67890123, 3);

INSERT INTO Mantener (CI_Usuario, ID_Equipo) VALUES 
(34567890, 101),
(12345678, 102);

INSERT INTO Prestamo (CI_Usuario, ID_Equipo, FechaI, FechaF) VALUES 
(45678901, 103, '2026-04-01', '2026-04-05'),
(56789012, 104, '2026-04-02', '2026-04-06');

INSERT INTO Tiene (ID_Equipo, ID_Averia) VALUES 
(101, 1),
(102, 2),
(103, 3);

INSERT INTO Deriva_en (ID_Averia, ID_NuevaAveria) VALUES 
(1, 4),
(2, 5);


-- ==========================================
-- 3. CONSULTAS (60 EN TOTAL - 5 POR CADA TABLA)
-- ==========================================

-- Tabla 1: Usuario
SELECT * FROM Usuario;
SELECT * FROM Usuario WHERE Turno = 'Matutino';
SELECT Nombre FROM Usuario WHERE Turno = 'Nocturno';
SELECT COUNT(*) AS Total_Usuarios FROM Usuario;
SELECT * FROM Usuario ORDER BY Nombre ASC;

-- Tabla 2: Profesor
SELECT * FROM Profesor;
SELECT * FROM Profesor WHERE Materia = 'Matemáticas';
SELECT Materia FROM Profesor;
SELECT COUNT(*) AS Total_Profesores FROM Profesor;
SELECT * FROM Profesor ORDER BY Materia DESC;

-- Tabla 3: Asistente
SELECT * FROM Asistente;
SELECT * FROM Asistente WHERE Email LIKE '%@mail.com';
SELECT Email FROM Asistente;
SELECT COUNT(*) AS Total_Asistentes FROM Asistente;
SELECT CI_Usuario FROM Asistente;

-- Tabla 4: Estudiante
SELECT * FROM Estudiante;
SELECT * FROM Estudiante WHERE Grupo = '5A1';
SELECT DISTINCT Grupo FROM Estudiante;
SELECT COUNT(*) AS Total_Estudiantes FROM Estudiante;
SELECT CI_Usuario FROM Estudiante ORDER BY Grupo ASC;

-- Tabla 5: Lab
SELECT * FROM Lab;
SELECT * FROM Lab WHERE Num = 1;
SELECT Equipo FROM Lab WHERE Equipo LIKE 'Dell%';
SELECT COUNT(*) AS Total_Labs FROM Lab;
SELECT DISTINCT Equipo FROM Lab;

-- Tabla 6: Equipo
SELECT * FROM Equipo;
SELECT * FROM Equipo WHERE Categoria = 'Computadora';
SELECT ID, Horario FROM Equipo;
SELECT COUNT(*) AS Total_Equipos FROM Equipo;
SELECT * FROM Equipo ORDER BY Horario DESC;

-- Tabla 7: Averia
SELECT * FROM Averia;
SELECT * FROM Averia WHERE Tipo = 'Pantalla';
SELECT Tipo FROM Averia;
SELECT COUNT(*) AS Total_Averias FROM Averia;
SELECT ID FROM Averia ORDER BY ID ASC;

-- Tabla 8: Usan
SELECT * FROM Usan;
SELECT * FROM Usan WHERE Num_Lab = 1;
SELECT CI_Usuario FROM Usan WHERE Num_Lab = 2;
SELECT COUNT(*) AS Total_Registros_Usan FROM Usan;
SELECT DISTINCT Num_Lab FROM Usan;

-- Tabla 9: Mantener
SELECT * FROM Mantener;
SELECT * FROM Mantener WHERE ID_Equipo = 101;
SELECT CI_Usuario FROM Mantener WHERE ID_Equipo = 102;
SELECT COUNT(*) AS Total_Mantenimientos FROM Mantener;
SELECT DISTINCT ID_Equipo FROM Mantener;

-- Tabla 10: Prestamo
SELECT * FROM Prestamo;
SELECT * FROM Prestamo WHERE FechaI >= '2026-04-01';
SELECT ID_Equipo FROM Prestamo WHERE CI_Usuario = 45678901;
SELECT COUNT(*) AS Total_Prestamos FROM Prestamo;
SELECT * FROM Prestamo ORDER BY FechaI ASC;

-- Tabla 11: Tiene
SELECT * FROM Tiene;
SELECT * FROM Tiene WHERE ID_Averia = 1;
SELECT ID_Equipo FROM Tiene WHERE ID_Averia = 2;
SELECT COUNT(*) AS Total_Equipos_Averiados FROM Tiene;
SELECT DISTINCT ID_Averia FROM Tiene;

-- Tabla 12: Deriva_en
SELECT * FROM Deriva_en;
SELECT * FROM Deriva_en WHERE ID_Averia = 1;
SELECT ID_NuevaAveria FROM Deriva_en WHERE ID_Averia = 2;
SELECT COUNT(*) AS Total_Derivaciones FROM Deriva_en;
SELECT DISTINCT ID_Averia FROM Deriva_en;
