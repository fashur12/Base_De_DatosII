-- Consulta que filtra por múltiples columnas: categoría y fecha
SELECT * FROM Ventas
WHERE categoria = 'Tecnología' AND fecha >= '2024-01-01';

-- Ver plan de ejecución SIN índice
EXPLAIN SELECT * FROM Ventas
WHERE categoria = 'Tecnología' AND fecha >= '2024-01-01';

-- Crear índice individual por categoría
CREATE INDEX idx_categoria ON Ventas(categoria);

-- Crear índice compuesto por categoría y fecha
CREATE INDEX idx_categoria_fecha ON Ventas(categoria, fecha);

-- Ver plan de ejecución CON índice compuesto
EXPLAIN SELECT * FROM Ventas
WHERE categoria = 'Tecnología' AND fecha >= '2024-01-01';

