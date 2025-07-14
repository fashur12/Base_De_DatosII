from datetime import datetime

class Producto:
    def __init__(self, coleccion):
        self.productos = coleccion

    def agregar(self, producto):
        if self.productos.find_one({"codigo": producto["codigo"]}):
            print(" Ya existe un producto con ese código.")
            return
        producto["fechaUltimaActualizacion"] = datetime.utcnow()
        result = self.productos.insert_one(producto)
        print(f" Producto agregado con _id: {result.inserted_id}")

    def consultar_stock(self, codigo):
        producto = self.productos.find_one({"codigo": codigo})
        if producto:
            print(f" Producto: {producto['nombre']} | Stock: {producto['stockActual']}")
        else:
            print(" Producto no encontrado.")
            
    def stock_bajo(self):
        bajos = self.productos.find({"$expr": {"$lt": ["$stockActual", "$stockMinimo"]}})
        print(" Productos con stock bajo:")
        for p in bajos:
            print(f"- {p['codigo']} | {p['nombre']} | Stock: {p['stockActual']} | Mínimo: {p['stockMinimo']}")        

    def listar_todos(self):
        todos = self.productos.find()
        print(" Lista de productos:")
        for p in todos:
            print(f"- ID: {p['_id']} | Código: {p['codigo']} | Nombre: {p['nombre']} | Stock: {p['stockActual']}")
