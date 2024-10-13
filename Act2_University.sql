CREATE DATABASE IF NOT EXISTS university;
USE university;

CREATE TABLE Facultad (
    ID_Facultad INT PRIMARY KEY,
    Nombre_Facultad VARCHAR(100) NOT NULL,
    Ubicación VARCHAR(100)
);


CREATE TABLE Programa_Formacion (
    ID_Programa INT PRIMARY KEY,
    Nombre_Programa VARCHAR(100) NOT NULL,
    Descripción TEXT,
    ID_Facultad INT,
    FOREIGN KEY (ID_Facultad) REFERENCES Facultad(ID_Facultad)
);


CREATE TABLE Modulo (
    ID_Modulo INT PRIMARY KEY,
    Nombre_Modulo VARCHAR(100) NOT NULL,
    Descripción TEXT,
    ID_Programa INT,
    FOREIGN KEY (ID_Programa) REFERENCES Programa_Formacion(ID_Programa)
);


CREATE TABLE Estudiante (
    ID_Estudiante INT PRIMARY KEY,
    Nombre_Estudiante VARCHAR(100) NOT NULL,
    Fecha_Nacimiento DATE,
    Dirección VARCHAR(200),
    Correo_Electrónico VARCHAR(100) UNIQUE
);


CREATE TABLE Profesor (
    ID_Profesor INT PRIMARY KEY,
    Nombre_Profesor VARCHAR(100) NOT NULL,
    Fecha_Nacimiento DATE,
    Dirección VARCHAR(200),
    Correo_Electrónico VARCHAR(100) UNIQUE,
    Especialidad VARCHAR(100)
);


CREATE TABLE Curso (
    ID_Curso INT PRIMARY KEY,
    ID_Modulo INT,
    ID_Profesor INT,
    Semestre INT,
    Año INT,
    FOREIGN KEY (ID_Modulo) REFERENCES Modulo(ID_Modulo),
    FOREIGN KEY (ID_Profesor) REFERENCES Profesor(ID_Profesor)
);


CREATE TABLE Clase (
    ID_Clase INT PRIMARY KEY,
    ID_Curso INT,
    Fecha DATE,
    Hora TIME,
    Aula VARCHAR(50),
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso)
);


CREATE TABLE Matricula (
    ID_Matricula INT PRIMARY KEY,
    ID_Estudiante INT,
    ID_Curso INT,
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiante(ID_Estudiante),
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso)
);


INSERT INTO Facultad (ID_Facultad, Nombre_Facultad, Ubicación) VALUES
(1, 'Facultad de Ingeniería', 'Edificio A'),
(2, 'Facultad de Ciencias Sociales', 'Edificio B'),
(3, 'Facultad de Medicina', 'Edificio C');


INSERT INTO Programa_Formacion (ID_Programa, Nombre_Programa, Descripción, ID_Facultad) VALUES
(1, 'Ingeniería de Sistemas', 'Programa de formación en Ingeniería de Sistemas.', 1),
(2, 'Psicología', 'Programa de formación en Psicología.', 2),
(3, 'Medicina General', 'Programa de formación en Medicina General.', 3);


INSERT INTO Modulo (ID_Modulo, Nombre_Modulo, Descripción, ID_Programa) VALUES
(1, 'Programación 1', 'Introducción a la programación.', 1),
(2, 'Estructuras de Datos', 'Estudio de estructuras de datos y algoritmos.', 1),
(3, 'Psicología Clínica', 'Fundamentos de la psicología clínica.', 2),
(4, 'Anatomía Humana', 'Estudio detallado de la anatomía humana.', 3);


INSERT INTO Estudiante (ID_Estudiante, Nombre_Estudiante, Fecha_Nacimiento, Dirección, Correo_Electrónico) VALUES
(1, 'Juan Pérez', '2000-05-15', 'Calle Falsa 123', 'juan.perez@example.com'),
(2, 'María López', '1999-11-22', 'Avenida Siempre Viva 456', 'maria.lopez@example.com'),
(3, 'Pedro Martínez', '2001-03-10', 'Calle del Sol 789', 'pedro.martinez@example.com');


INSERT INTO Profesor (ID_Profesor, Nombre_Profesor, Fecha_Nacimiento, Dirección, Correo_Electrónico, Especialidad) VALUES
(1, 'Dr. Carlos Gómez', '1975-06-30', 'Calle Luna 101', 'carlos.gomez@example.com', 'Sistemas'),
(2, 'Dra. Ana Torres', '1980-12-15', 'Avenida Estrella 202', 'ana.torres@example.com', 'Psicología'),
(3, 'Dr. Luis Fernández', '1970-08-22', 'Calle Marte 303', 'luis.fernandez@example.com', 'Medicina');


INSERT INTO Curso (ID_Curso, ID_Modulo, ID_Profesor, Semestre, Año) VALUES
(1, 1, 1, 1, 2024),
(2, 2, 1, 2, 2024),
(3, 3, 2, 1, 2024),
(4, 4, 3, 2, 2024);


INSERT INTO Clase (ID_Clase, ID_Curso, Fecha, Hora, Aula) VALUES
(1, 1, '2024-09-01', '09:00:00', 'Aula 101'),
(2, 1, '2024-09-03', '09:00:00', 'Aula 101'),
(3, 2, '2024-09-02', '11:00:00', 'Aula 102'),
(4, 3, '2024-09-01', '13:00:00', 'Aula 201'),
(5, 4, '2024-09-02', '15:00:00', 'Aula 202');


INSERT INTO Matricula (ID_Matricula, ID_Estudiante, ID_Curso) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 1, 4);



SELECT * FROM Facultad;

SELECT * FROM Programa_Formacion;

SELECT * FROM Modulo;

SELECT * FROM Estudiante;

SELECT * FROM Profesor;

SELECT * FROM Curso;

SELECT * FROM Clase;

SELECT * FROM Matricula;
