/* Hacemos una consulta simple, sobre la Persona_78910 */
EXPLAIN ANALYZE SELECT * FROM personas WHERE nombre = 'Persona_78910';

/* Creamos un indice*/
CREATE INDEX idx_nombre ON personas(nombre);

/* Repetimos la consulta para comparar */
EXPLAIN ANALYZE
SELECT * FROM personas
WHERE nombre = 'Persona_78910';
