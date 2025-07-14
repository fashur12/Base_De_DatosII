from pymongo import MongoClient
from datetime import datetime

# Conexión a MongoDB local
client = MongoClient("mongodb://localhost:27017/")

# Crear base de datos
db = client["tienda_inventario"]

# Colecciones
productos = db["productos"]
proveedores = db["proveedores"]
movimientos = db["movimientos"]

# Limpiar datos previos (opcional para pruebas)
productos.delete_many({})
proveedores.delete_many({})
movimientos.delete_many({})

# Insertar proveedor de ejemplo
proveedor_id = proveedores.insert_one({
    "nombre": "Distribuidora Tech",
    "contacto": "Juan López",
    "telefono": "+1234567890",
    "email": "ventas@distritech.com",
    "productosOfrecidos": ["PROD001", "PROD002"]
}).inserted_id

print(f"Proveedor insertado con _id: {proveedor_id}")

# Insertar producto de ejemplo
producto_id = productos.insert_one({
    "codigo": "PROD001",
    "nombre": "Laptop HP",
    "categoria": "Electrónicos",
    "precio": 799.99,
    "stockActual": 15,
    "stockMinimo": 5,
    "proveedorId": proveedor_id,
    "fechaUltimaActualizacion": datetime.utcnow()
}).inserted_id

print(f"Producto insertado con _id: {producto_id}")

# Insertar movimiento de ejemplo
movimiento_id = movimientos.insert_one({
    "productoId": producto_id,
    "tipo": "entrada",
    "cantidad": 15,
    "motivo": "Compra inicial",
    "fecha": datetime.utcnow(),
    "usuario": "admin"
}).inserted_id

print(f"Movimiento insertado con _id: {movimiento_id}")

print("Inicialización completa")
