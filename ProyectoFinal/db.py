"""
Conexion unica al proyecto.
"""

from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["tienda_inventario"]

productos = db["productos"]
proveedores = db["proveedores"]
movimientos = db["movimientos"]