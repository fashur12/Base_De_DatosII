
-- Consultas de prueba

-- Listar todas las materias con su profesor
SELECT m.nombre AS materia, p.nombre AS profesor
FROM materias m
JOIN profesores p ON m.profesor_id = p.id;
