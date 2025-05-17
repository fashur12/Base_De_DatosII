-- Crear tabla Clientes
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Crear tabla de auditoría
CREATE TABLE Clientes_auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(10),
    id_cliente INT,
    nombre_anterior VARCHAR(100),
    email_anterior VARCHAR(100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger para INSERT
DELIMITER $$
CREATE TRIGGER auditoria_insert
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Clientes_auditoria (accion, id_cliente, nombre_anterior, email_anterior)
    VALUES ('INSERT', NEW.id, NEW.nombre, NEW.email);
END$$
DELIMITER ;

-- Trigger para UPDATE
DELIMITER $$
CREATE TRIGGER auditoria_update
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Clientes_auditoria (accion, id_cliente, nombre_anterior, email_anterior)
    VALUES ('UPDATE', OLD.id, OLD.nombre, OLD.email);
END$$
DELIMITER ;

-- Trigger para DELETE
DELIMITER $$
CREATE TRIGGER auditoria_delete
AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Clientes_auditoria (accion, id_cliente, nombre_anterior, email_anterior)
    VALUES ('DELETE', OLD.id, OLD.nombre, OLD.email);
END$$
DELIMITER ;
