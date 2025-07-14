from models.proveedor import Proveedor
from db import proveedores

class ProveedorController:
    def __init__(self):
        self.modelo = Proveedor(proveedores)

    def agregar_proveedor(self):
        print("== Agregar nuevo proveedor ==")
        nombre = input("Nombre: ").strip()
        direccion = input("Direccion: ").strip()
        telefono = input("Telefono: ").strip()
        cuit = input("CUIT: ").strip()

        proveedor = {
            "nombre": nombre,
            "direccion": direccion,
            "telefono": telefono,
            "cuit": cuit
        }

        self.modelo.agregar(proveedor)

    def listar_proveedores(self):
        self.modelo.listar()
