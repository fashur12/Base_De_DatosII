/* Creamos las dos tablas necesarias para la comprobacion */
CREATE TABLE Estudiante (
    id_estudiante INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT
);

CREATE TABLE Inscripcion(
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante)
);

/* Incertamos parte de los valores necesarios */
INSERT INTO Estudiante (id_estudiante, nombre, edad) VALUES
(1, 'Juan Pérez', 20),
(2, 'María López', 22);

INSERT INTO Inscripcion (id_estudiante, id_curso, fecha_inscripcion) VALUES
(1, 101, '2023-09-01'),
(1, 102, '2023-09-02'),
(2, 201, '2023-09-01'),
(2, 202, '2023-09-03');
