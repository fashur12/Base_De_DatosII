# Ejercicio Nro 10

 - Mediante el codigo cargado previamente creamos un usuario de nombre "Andy" con el rol de "readWrite" sobre los datos de la db "Empresa".

 - Para la siguiente parte del ejercicio necesitamos tener instalado mongodump y mongorestore. 

 ### Generar un BACKUP:

 - Para la segunda parte del ejercicio, que nos pide mostrar los pasos en consola para crear un back up de nuestros datos, usaremos las siguientes lineas de comando. 

  ```bash
    mongodump --db empresa --out ./backups
  ```

 - En este caso, el backup lo haremos a la base de datos reciente, "empresa".

 - Y con esta linea de comando, tendremos en la carpeta seleccionada en --out nuestro archivo .bson.

 ### Restaurar una base de datos:

  ```bash
    mongorestore --db empresa ./backups
  ```

  - Con esta linea, buscamos en la carpeta indicada ese archivo .bson para restaurar nuestra base de datos.