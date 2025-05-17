/* Los errores planteados en el enunciado, pueden evitarse utilizando
   ON DELETE CASCADE/ON DELETE SET NULL dependiendo lo que nos convenga.
   En caso de que se elimine un estudiante y queramos manejar automáticamente
   sus inscripciones.
*/

/* Ejemplo con ON DELETE CASCADE:
   Si eliminamos un estudiante, se eliminarán automáticamente sus matrículas.
*/

CREATE TABLE IF NOT EXISTS Matriculas_Cascade (
    id_estudiante INT,
    id_curso INT,
    fecha DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante) ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

/* Ejemplo con ON DELETE SET NULL:
   Si eliminamos un estudiante, el campo id_estudiante en la tabla Matriculas
   quedará como NULL (requiere que el campo lo permita).
*/

CREATE TABLE IF NOT EXISTS Matriculas_SetNull (
    id_estudiante INT NULL,
    id_curso INT,
    fecha DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante) ON DELETE SET NULL,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

