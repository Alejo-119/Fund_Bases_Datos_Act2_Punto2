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

-- Actividad 5
-- Consulta para identificar programas por facultades
SELECT  Facultad.Nombre_Facultad, Programa_Formacion.Nombre_Programa
FROM Facultad
JOIN Programa_Formacion ON Facultad.ID_Facultad = Programa_Formacion.ID_Facultad;

-- consulta para  identificar los estudiantes matriculados en cursos del programa Ingeniería de Software
SELECT Estudiante.Nombre_Estudiante, Curso.ID_Curso
FROM Estudiante
JOIN Matricula ON Estudiante.ID_Estudiante = Matricula.ID_Estudiante
JOIN Curso ON Matricula.ID_Curso = Curso.ID_Curso
JOIN Modulo ON Curso.ID_Modulo = Modulo.ID_Modulo
JOIN Programa_Formacion ON Modulo.ID_Programa = Programa_Formacion.ID_Programa
WHERE Programa_Formacion.Nombre_Programa = 'Ingeniería de Sistemas';

-- Identificar todos los cursos con estudiantes matriculados, este listado debe relacionar el No. de estudiantes por curso
SELECT Curso.ID_Curso, 
       COUNT(Matricula.ID_Estudiante) AS Numero_Estudiantes
FROM Curso
LEFT JOIN Matricula ON Curso.ID_Curso = Matricula.ID_Curso
GROUP BY Curso.ID_Curso, Curso.ID_Modulo;

-- Identificar el No. de materias matriculadas a cada estudiante
SELECT Estudiante.ID_Estudiante, 
       Estudiante.Nombre_Estudiante, 
       COUNT(Matricula.ID_Curso) AS Numero_Materias_Matriculadas
FROM Estudiante
LEFT JOIN Matricula ON Estudiante.ID_Estudiante = Matricula.ID_Estudiante
GROUP BY Estudiante.ID_Estudiante, Estudiante.Nombre_Estudiante;

-- Identificar los estudiantes que no tiene materias matriculadas
SELECT Estudiante.ID_Estudiante, 
       Estudiante.Nombre_Estudiante
FROM Estudiante
LEFT JOIN Matricula ON Estudiante.ID_Estudiante = Matricula.ID_Estudiante
WHERE Matricula.ID_Curso IS NULL;

-- Identificar el No. de estudiantes a cargo de cada profesor en cada curso
SELECT Profesor.ID_Profesor, 
       Profesor.Nombre_Profesor, 
       Curso.ID_Curso, 
       COUNT(Matricula.ID_Estudiante) AS Numero_Estudiantes
FROM Profesor
JOIN Curso ON Profesor.ID_Profesor = Curso.ID_Profesor
LEFT JOIN Matricula ON Curso.ID_Curso = Matricula.ID_Curso
GROUP BY Profesor.ID_Profesor, 
         Profesor.Nombre_Profesor, 
         Curso.ID_Curso;

-- Actividad 6

-- Crear una vista con los cursos creados por programa
CREATE VIEW Vista_Cursos_Por_Programa AS
SELECT 
    PF.Nombre_Programa,
    M.Nombre_Modulo,
    C.ID_Curso,
    C.Semestre,
    C.Año
FROM 
    Programa_Formacion PF
JOIN 
    Modulo M ON PF.ID_Programa = M.ID_Programa
JOIN 
    Curso C ON M.ID_Modulo = C.ID_Modulo;
    
-- Crear una vista que permita ver todos los estudiantes matriculados en los cursos. Esta vista debe permitir saber a qué programa están asociados los cursos
CREATE VIEW Vista_Estudiantes_Matriculados_Programa AS
SELECT 
    E.Nombre_Estudiante,
    C.ID_Curso,
    M.Nombre_Modulo,
    PF.Nombre_Programa
FROM 
    Estudiante E
JOIN 
    Matricula Mtr ON E.ID_Estudiante = Mtr.ID_Estudiante
JOIN 
    Curso C ON Mtr.ID_Curso = C.ID_Curso
JOIN 
    Modulo M ON C.ID_Modulo = M.ID_Modulo
JOIN 
    Programa_Formacion PF ON M.ID_Programa = PF.ID_Programa;
    
-- Generar una vista que permita ver el número total de cursos con estudiantes por programas
CREATE VIEW Vista_Cursos_Con_Estudiantes_Por_Programa AS
SELECT 
    PF.Nombre_Programa,
    COUNT(DISTINCT C.ID_Curso) AS Total_Cursos_Con_Estudiantes
FROM 
    Programa_Formacion PF
JOIN 
    Modulo M ON PF.ID_Programa = M.ID_Programa
JOIN 
    Curso C ON M.ID_Modulo = C.ID_Modulo
JOIN 
    Matricula Mtr ON C.ID_Curso = Mtr.ID_Curso
GROUP BY 
    PF.Nombre_Programa;
    
-- Identificar los cursos abiertos con el No. de estudiantes matriculados
CREATE VIEW Vista_Cursos_Abiertos_Con_Estudiantes AS
SELECT 
    C.ID_Curso,
    M.Nombre_Modulo,
    COUNT(Mt.ID_Estudiante) AS Numero_Estudiantes_Matriculados
FROM 
    Curso C
JOIN 
    Modulo M ON C.ID_Modulo = M.ID_Modulo
LEFT JOIN 
    Matricula Mt ON C.ID_Curso = Mt.ID_Curso
GROUP BY 
    C.ID_Curso, M.Nombre_Modulo;

-- Identificar los programas que tiene estudiantes sin cursos matriculados
SELECT 
    PF.Nombre_Programa,
    E.Nombre_Estudiante
FROM 
    Programa_Formacion PF
JOIN 
    Modulo M ON PF.ID_Programa = M.ID_Programa
JOIN 
    Curso C ON M.ID_Modulo = C.ID_Modulo
RIGHT JOIN 
    Matricula Mt ON C.ID_Curso = Mt.ID_Curso
RIGHT JOIN 
    Estudiante E ON Mt.ID_Estudiante = E.ID_Estudiante
WHERE 
    Mt.ID_Curso IS NULL;

-- Identificar las materias con el mayor número de cursos con estudiantes matriculados
SELECT 
    M.Nombre_Modulo, 
    COUNT(DISTINCT C.ID_Curso) AS Numero_Cursos_Con_Estudiantes
FROM 
    Modulo M
JOIN 
    Curso C ON M.ID_Modulo = C.ID_Modulo
JOIN 
    Matricula Mt ON C.ID_Curso = Mt.ID_Curso
GROUP BY 
    M.ID_Modulo, M.Nombre_Modulo
ORDER BY 
    Numero_Cursos_Con_Estudiantes DESC
LIMIT 1;

--  Crear una sentencia SQL que muestre datos de todas las tablas de la base de datos Universidad por medio de 
-- JOIN. Explicar lo que se busca con la consulta.

-- Esta consulta realiza un recorrido completo por las tablas relacionadas en la base de datos. Permite obtener una visión integral de los 
-- estudiantes, sus matrículas en cursos, los módulos que están cursando, el programa de formación al que pertenecen, la facultad que los 
-- acoge, los profesores que imparten esos cursos y clases (fecha y hora) asociadas a dichos cursos. Se obtiene una lista de los estudiantes
-- matriculados en cada curso, junto con información detallada sobre el curso, el módulo y el profesor encargado, además de la clase que se
-- está impartiendo. Es útil para ver cómo todos estos elementos están relacionados y obtener una visión global del sistema académico en la 
-- base de datos.
SELECT 
    Est.ID_Estudiante, 
    Est.Nombre_Estudiante, 
    Fac.Nombre_Facultad, 
    Prog.Nombre_Programa, 
    `Modulo`.Nombre_Modulo, 
    Cur.ID_Curso, 
    Prof.Nombre_Profesor, 
    Cla.Fecha, 
    Cla.Hora, 
    Mat.ID_Matricula
FROM 
    Estudiante Est
JOIN 
    Matricula Mat ON Est.ID_Estudiante = Mat.ID_Estudiante
JOIN 
    Curso Cur ON Mat.ID_Curso = Cur.ID_Curso
JOIN 
    `Modulo` ON Cur.ID_Modulo = `Modulo`.ID_Modulo
JOIN 
    Programa_Formacion Prog ON `Modulo`.ID_Programa = Prog.ID_Programa
JOIN 
    Facultad Fac ON Prog.ID_Facultad = Fac.ID_Facultad
JOIN 
    Profesor Prof ON Cur.ID_Profesor = Prof.ID_Profesor
JOIN 
    Clase Cla ON Cur.ID_Curso = Cla.ID_Curso;

SELECT * FROM Facultad;
SELECT * FROM Programa_Formacion;
SELECT * FROM Modulo;
SELECT * FROM Estudiante;
SELECT * FROM Profesor;
SELECT * FROM Curso;
SELECT * FROM Clase;
SELECT * FROM Matricula;
SELECT * FROM Vista_Cursos_Por_Programa;
SELECT * FROM Vista_Estudiantes_Matriculados_Programa;
SELECT * FROM Vista_Cursos_Con_Estudiantes_Por_Programa;
SELECT * FROM Vista_Cursos_Abiertos_Con_Estudiantes;
