// === Crear Departamentos ===
CREATE (d1:Departamento {nombre: "Desarrollo"})
CREATE (d2:Departamento {nombre: "Marketing"})
CREATE (d3:Departamento {nombre: "Finanzas"})

// === Crear Empleados ===
CREATE (e1:Empleado {nombre: "Fausto"})
CREATE (e2:Empleado {nombre: "Joaco"})
CREATE (e3:Empleado {nombre: "Andy"})

// === Crear Proyectos ===
CREATE (p1:Proyecto {nombre: "Proyecto A"})
CREATE (p2:Proyecto {nombre: "Proyecto B"})

// Relacionar empleados con departamentos
MATCH (e1:Empleado {nombre: "Fausto"}), (d1:Departamento {nombre: "Desarrollo"})
CREATE (e1)-[:PERTENECE_A]->(d1);

MATCH (e2:Empleado {nombre: "Joaco"}), (d2:Departamento {nombre: "Marketing"})
CREATE (e2)-[:PERTENECE_A]->(d2);

MATCH (e3:Empleado {nombre: "Andy"}), (d3:Departamento {nombre: "Finanzas"})
CREATE (e3)-[:PERTENECE_A]->(d3);

// Asignar empleados a proyectos con horas semFaustoles
MATCH (e1:Empleado {nombre: "Fausto"}), (p1:Proyecto {nombre: "Proyecto A"})
CREATE (e1)-[:ASIGNADO_A {horas: 20}]->(p1);

MATCH (e2:Empleado {nombre: "Joaco"}), (p1:Proyecto {nombre: "Proyecto A"})
CREATE (e2)-[:ASIGNADO_A {horas: 15}]->(p1);

MATCH (e2:Empleado {nombre: "Joaco"}), (p2:Proyecto {nombre: "Proyecto B"})
CREATE (e2)-[:ASIGNADO_A {horas: 10}]->(p2);

MATCH (e3:Empleado {nombre: "Andy"}), (p2:Proyecto {nombre: "Proyecto B"})
CREATE (e3)-[:ASIGNADO_A {horas: 25}]->(p2);

// Asignar líder de cada proyecto
MATCH (e1:Empleado {nombre: "Fausto"}), (p1:Proyecto {nombre: "Proyecto A"})
CREATE (e1)-[:LIDERA]->(p1);

MATCH (e3:Empleado {nombre: "Andy"}), (p2:Proyecto {nombre: "Proyecto B"})
CREATE (e3)-[:LIDERA]->(p2);

// === CONSULTAS ===

// === 1) Obtener nombre del proyecto, su líder y empleados asignados ===
MATCH (p:Proyecto)<-[:LIDERA]-(l:Empleado)
OPTIONAL MATCH (p)<-[:ASIGNADO_A]-(e:Empleado)
RETURN p.nombre AS Proyecto, l.nombre AS Lider, collect(e.nombre) AS Empleados_Asignados;

// === 2) Calcular total de horas semanales por proyecto ===
MATCH (e:Empleado)-[a:ASIGNADO_A]->(p:Proyecto)
RETURN p.nombre AS Proyecto, sum(a.horas) AS Total_Horas_Semanales;

// === 3) Listar empleados que trabajan en más de un proyecto ===
MATCH (e:Empleado)-[:ASIGNADO_A]->(p:Proyecto)
WITH e, count(DISTINCT p) AS proyectos
WHERE proyectos > 1
RETURN e.nombre AS Empleado, proyectos;