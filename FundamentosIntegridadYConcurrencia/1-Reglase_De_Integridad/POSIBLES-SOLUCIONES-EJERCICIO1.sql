/* Utilizando esta linea, eliminariamos al estudiante, sin embargo no estariamos cumpliendo con la integridad */
DELETE FROM Estudiante WHERE id=1;

/* Una de las soluciones posibles es añadir "ON DELETE RESTRICT" a la hora de crear la tabla. Esto impidiria la eliminacion, si
hay inscriptos de mane
ra activa. Nuestro create table inscriptos quedaria algo como esto: */

CREATE TABLE Inscripcion(
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante) ON DELETE RESTRICT
);

/* Otra solucion es utilizando el "ON DELETE CASCADE", que causa que en caso de eliminar un estudiante, tambien se 
elimine automaticamente sus inscripciones actuales. */
CREATE TABLE Inscripcion(
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante) ON DELETE CASCADE
);
