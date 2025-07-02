:connect

// === 1) Crear Usuarios ===
CREATE (u1:Usuario {id: 1, nombre: "Ana"})
CREATE (u2:Usuario {id: 2, nombre: "Bruno"})
CREATE (u3:Usuario {id: 3, nombre: "Carla"})
CREATE (u4:Usuario {id: 4, nombre: "Diego"})

// === 2) Crear Conexiones ===
MATCH (u1:Usuario {nombre: "Ana"}), (u2:Usuario {nombre: "Bruno"}) 
CREATE (u1)-[:CONOCE]->(u2);

MATCH (u1:Usuario {nombre: "Ana"}), (u3:Usuario {nombre: "Carla"})
CREATE (u1)-[:CONOCE]->(u3);

MATCH (u2:Usuario {nombre: "Bruno"}), (u3:Usuario {nombre: "Carla"})
CREATE (u2)-[:CONOCE]->(u3);

MATCH (u3:Usuario {nombre: "Carla"}), (u4:Usuario {nombre: "Diego"})
CREATE (u3)-[:CONOCE]->(u4);

MATCH (u4:Usuario {nombre: "Diego"}), (u1:Usuario {nombre: "Ana"})
CREATE (u4)-[:CONOCE]->(u1);

// === 3) Crear Posts ===
CREATE (p1:Post {contenido: "Post de Ana", fecha: date("2025-07-01")})
CREATE (p2:Post {contenido: "Post de Bruno", fecha: date("2025-07-01")})
CREATE (p3:Post {contenido: "Post de Carla", fecha: date("2025-07-01")})

// === 4) Relacionar Usuarios con Posts ===
MATCH (u1:Usuario {nombre: "Ana"}), (p1:Post {contenido: "Post de Ana"})
CREATE (u1)-[:PUBLICA]->(p1);

MATCH (u2:Usuario {nombre: "Bruno"}), (p2:Post {contenido: "Post de Bruno"})
CREATE (u2)-[:PUBLICA]->(p2);

MATCH (u3:Usuario {nombre: "Carla"}), (p3:Post {contenido: "Post de Carla"})
CREATE (u3)-[:PUBLICA]->(p3);

// === 5) Crear Habilidades ===
CREATE (:Habilidad {nombre: "Java"})
CREATE (:Habilidad {nombre: "Python"})
CREATE (:Habilidad {nombre: "SQL"})
CREATE (:Habilidad {nombre: "C#"})
CREATE (:Habilidad {nombre: "Node.js"})
CREATE (:Habilidad {nombre: "React"})
CREATE (:Habilidad {nombre: "Docker"})
CREATE (:Habilidad {nombre: "AWS"})

// === 6) Relacionar Usuarios con Habilidades ===
MATCH (u1:Usuario {nombre: "Ana"}), (h1:Habilidad {nombre: "Java"})
CREATE (u1)-[:TIENE]->(h1);

MATCH (u1:Usuario {nombre: "Ana"}), (h2:Habilidad {nombre: "Python"})
CREATE (u1)-[:TIENE]->(h2);

MATCH (u2:Usuario {nombre: "Bruno"}), (h3:Habilidad {nombre: "SQL"})
CREATE (u2)-[:TIENE]->(h3);

MATCH (u2:Usuario {nombre: "Bruno"}), (h4:Habilidad {nombre: "C#"})
CREATE (u2)-[:TIENE]->(h4);

MATCH (u3:Usuario {nombre: "Carla"}), (h5:Habilidad {nombre: "Node.js"})
CREATE (u3)-[:TIENE]->(h5);

MATCH (u3:Usuario {nombre: "Carla"}), (h6:Habilidad {nombre: "React"})
CREATE (u3)-[:TIENE]->(h6);

MATCH (u4:Usuario {nombre: "Diego"}), (h7:Habilidad {nombre: "Docker"})
CREATE (u4)-[:TIENE]->(h7);

// === 7) Endosos ===
// Ana endosa SQL y Node.js
MATCH (u1:Usuario {nombre: "Ana"}), (h3:Habilidad {nombre: "SQL"})
CREATE (u1)-[:ENDOSA]->(h3);

MATCH (u1:Usuario {nombre: "Ana"}), (h5:Habilidad {nombre: "Node.js"})
CREATE (u1)-[:ENDOSA]->(h5);

// Bruno endosa Java y Python
MATCH (u2:Usuario {nombre: "Bruno"}), (h1:Habilidad {nombre: "Java"})
CREATE (u2)-[:ENDOSA]->(h1);

MATCH (u2:Usuario {nombre: "Bruno"}), (h2:Habilidad {nombre: "Python"})
CREATE (u2)-[:ENDOSA]->(h2);

// Carla endosa Docker
MATCH (u3:Usuario {nombre: "Carla"}), (h7:Habilidad {nombre: "Docker"})
CREATE (u3)-[:ENDOSA]->(h7);

// Diego endosa React
MATCH (u4:Usuario {nombre: "Diego"}), (h6:Habilidad {nombre: "React"})
CREATE (u4)-[:ENDOSA]->(h6);

//Consultas necesarias para cumplir con el ejercicio
// === Usuarios con más conexiones ===
MATCH (u:Usuario)-[:CONOCE]->(otro:Usuario)
RETURN u.nombre AS Usuario, COUNT(otro) AS Conexiones
ORDER BY Conexiones DESC

// === Los 2 usuarios con más publicaciones
MATCH (u:Usuario)-[:PUBLICA]->(p:Post)
RETURN u.nombre AS Usuario, COUNT(p) AS Publicaciones
ORDER BY Publicaciones DESC
LIMIT 2

// === Habilidades más endosadas ===
MATCH (:Usuario)-[:ENDOSA]->(h:Habilidad)
RETURN h.nombre AS Habilidad, COUNT(*) AS Total_Endosos
ORDER BY Total_Endosos DESC

// === Habilidades que un usuario NO ha endosado ===
MATCH (h:Habilidad)
WHERE NOT EXISTS {
  MATCH (:Usuario {nombre: "Ana"})-[:ENDOSA]->(h)
}
RETURN h.nombre AS HabilidadesNoEndosadas
ORDER BY h.nombre