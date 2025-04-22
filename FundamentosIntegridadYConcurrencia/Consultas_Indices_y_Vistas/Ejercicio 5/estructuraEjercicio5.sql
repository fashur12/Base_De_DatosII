-- Crear base de datos y tabla Ventas
CREATE DATABASE IF NOT EXISTS Comercio;
USE Comercio;

-- Crear tabla Ventas
CREATE TABLE IF NOT EXISTS Ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(100),
    categoria VARCHAR(50),
    fecha DATE,
    cantidad INT,
    total DECIMAL(10, 2)
);

-- Insertar datos de ejemplo
INSERT INTO Ventas (producto, categoria, fecha, cantidad, total) VALUES
('Notebook', 'Tecnología', '2024-01-15', 1, 1500.00),
('Celular', 'Tecnología', '2024-01-20', 2, 2000.00),
('Silla', 'Muebles', '2024-02-01', 4, 400.00),
('Escritorio', 'Muebles', '2024-02-10', 1, 800.00);
