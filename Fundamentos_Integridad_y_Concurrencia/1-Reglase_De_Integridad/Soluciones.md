# Ejercicio 1: Reglas de Integridad – Base de Datos II

## Tema: Fundamentos, Integridad y Concurrencia

### Enunciado:
Dado un modelo de base de datos de una universidad, identificar violaciones posibles a la integridad referencial si se elimina un estudiante con cursos inscritos. ¿Qué mecanismos usarías para evitarlo?

## ¿Qué pasa si eliminamos un estudiante?

Si se elimina un estudiante que aún está presente en la tabla de inscripciones, se produce una violación de la integridad referencial. Esto ocurre porque quedarían registros en Inscripciones que hacen referencia a un estudiante que ya no existe, generando inconsistencia en los datos.

### Creación de tablas hipoteticas:

Tablas principales:
- Estudiantes (id_estudiante, nombre, edad)
- Inscripciones (id_estudiante, id_curso, fecha_inscripción)

Relación:
- Inscripciones.id_estudiante es una clave foránea que referencia a Estudiantes.id_estudiante.

## Solucion posible para la falla de integridad

### 1. Restricción al eliminar (ON DELETE RESTRICT)
Impide eliminar al estudiante si tiene inscripciones activas. Esta opción es útil cuando se desea conservar toda la información relacionada y evitar inconsistencias.

### 2. Eliminación en cascada (ON DELETE CASCADE)
Permite que, al eliminar un estudiante, también se eliminen automáticamente sus inscripciones. Se utiliza cuando las inscripciones no tienen sentido sin el estudiante correspondiente.
