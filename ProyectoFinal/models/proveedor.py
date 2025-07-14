from pymongo.collection import Collection

class Proveedor:
    def __init__(self, coleccion: Collection):
        self.proveedores = coleccion

    def agregar(self, proveedor):
        if self.proveedores.find_one({"cuit": proveedor["cuit"]}):
            print(" Ya existe un proveedor con ese CUIT.")
            return
        result = self.proveedores.insert_one(proveedor)
        print(f" Proveedor agregado con _id: {result.inserted_id}")

    def listar(self):
        lista = list(self.proveedores.find())
        if not lista:
            print(" No hay proveedores cargados.")
            return
        print(" Lista de proveedores:")
        for p in lista:
            print(f"- {p['_id']} | {p['nombre']} | CUIT: {p['cuit']}")
