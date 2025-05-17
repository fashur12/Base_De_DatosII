-- Insertar datos válidos en Estudiantes y Cursos
INSERT INTO Estudiantes (id_estudiante, nombre) VALUES
(1, 'Ana Torres'),
(2, 'Luis Ramírez');

INSERT INTO Cursos (id_curso, nombre) VALUES
(101, 'Bases de Datos'),
(102, 'Programación');

-- Inserción válida en Matriculas (referencias existen)
INSERT INTO Matriculas (id_estudiante, id_curso, fecha) VALUES
(1, 101, '2024-03-15');

-- Inserción que viola la restricción de clave foránea (id_estudiante = 99 no existe)
INSERT INTO Matriculas (id_estudiante, id_curso, fecha) VALUES
(99, 101, '2024-03-16');

-- Esta instrucción provocará un error similar a:
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
