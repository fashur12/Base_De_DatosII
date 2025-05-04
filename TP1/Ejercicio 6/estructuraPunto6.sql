
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS Universidad;
USE Universidad;

-- Crear tabla de profesores
CREATE TABLE IF NOT EXISTS profesores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    departamento VARCHAR(100)
);

-- Crear tabla de materias
CREATE TABLE IF NOT EXISTS materias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES profesores(id)
);

-- Insertar datos
INSERT INTO profesores (nombre, departamento) VALUES ('Ana', 'Matemática'), ('Luis', 'Física');
INSERT INTO materias (nombre, profesor_id) VALUES ('Álgebra', 1), ('Física I', 2);
