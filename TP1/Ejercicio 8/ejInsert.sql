INSERT INTO Clientes (nombre, email) VALUES ('Juan Pérez', 'juan@mail.com');
UPDATE Clientes SET email = 'jperez@mail.com' WHERE id = 1;
DELETE FROM Clientes WHERE id = 1;
SELECT * FROM Clientes_auditoria;
