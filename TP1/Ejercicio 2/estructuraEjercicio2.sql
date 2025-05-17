-- Crear base de datos para la simulación
CREATE DATABASE IF NOT EXISTS Universidad;
USE Universidad;

-- Crear tabla de Estudiantes (referenciada)
CREATE TABLE IF NOT EXISTS Estudiantes (
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Crear tabla de Cursos (opcional pero puede completar la lógica)
CREATE TABLE IF NOT EXISTS Cursos (
    id_curso INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Crear tabla Matriculas con claves foráneas a Estudiantes y Cursos
CREATE TABLE IF NOT EXISTS Matriculas (
    id_estudiante INT,
    id_curso INT,
    fecha DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);
