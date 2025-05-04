
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS Banco;
USE Banco;

-- Crear tabla de cuentas
CREATE TABLE IF NOT EXISTS cuentas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    saldo DECIMAL(10,2)
);

-- Insertar datos
INSERT INTO cuentas (nombre, saldo) VALUES ('Usuario1', 1000.00);
