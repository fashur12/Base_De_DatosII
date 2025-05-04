import pymysql

conexion = pymysql.connect(
    host='127.0.0.1',
    user='root',
    password='root',
    database='ejercicio4tp1bd2'
)

cursor = conexion.cursor()

# Insertar personas
personas = [('Persona_' + str(i),) for i in range(1, 100001)]
sql = "INSERT INTO personas (nombre) VALUES (%s)"
cursor.executemany(sql, personas)

conexion.commit()
cursor.close()
conexion.close()