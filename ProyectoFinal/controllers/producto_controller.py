from models.producto import Producto
from db import productos, proveedores
from bson.objectid import ObjectId

class ProductoController:
    def __init__(self):
        self.modelo = Producto(productos)
        self.proveedores_db = proveedores

    def agregar_producto(self):
        try:
            proveedor_id_str = input("ID proveedor: ").strip()
            if not proveedor_id_str:
                raise ValueError("El ID del proveedor no puede estar vacío.")
            
            try:
                proveedor_object_id = ObjectId(proveedor_id_str)
            except Exception:
                raise ValueError(f"El ID '{proveedor_id_str}' no tiene un formato de ObjectId válido.")
            
            proveedor_existe = self.proveedores_db.find_one({'_id': proveedor_object_id})
            
            if not proveedor_existe:
                raise ValueError(f"El proveedor con ID '{proveedor_id_str}' no existe en la base de datos.")
            
            codigo_str = input("Código: ").strip()
            if not codigo_str.isdigit():
                raise ValueError("El código debe ser un número entero válido.")
            codigo = int(codigo_str)
            if codigo < 0:
                raise ValueError("El código debe ser un entero positivo.")
            
            nombre = input("Nombre: ").strip()
            if not nombre:
                raise ValueError("El nombre no puede estar vacío.")
            
            categoria = input("Categoría: ").strip()
            if not categoria:
                raise ValueError("La categoría no puede estar vacía.")
            
            precio_str = input("Precio: ").strip()
            try:
                precio = float(precio_str)
            except ValueError:
                raise ValueError("El precio debe ser un número válido.")
            if precio < 0:
                raise ValueError("El precio no puede ser negativo.")
            
            stock_str = input("Stock actual: ").strip()
            if not stock_str.isdigit():
                raise ValueError("El stock actual debe ser un número entero válido.")
            stock = int(stock_str)
            if stock < 0:
                raise ValueError("El stock debe ser un entero positivo.")
            
            stock_min_str = input("Stock mínimo: ").strip()
            if not stock_min_str.isdigit():
                raise ValueError("El stock mínimo debe ser un número entero válido.")
            stock_min = int(stock_min_str)
            if stock_min < 0:
                raise ValueError("El stock mínimo debe ser un entero positivo.")

            producto = {
                "codigo": codigo,
                "nombre": nombre,
                "categoria": categoria,
                "precio": precio,
                "stockActual": stock,
                "stockMinimo": stock_min,
                "proveedorId": proveedor_id_str 
            }

            self.modelo.agregar(producto)
            print(f"Producto '{nombre}' (Código: {codigo}) agregado exitosamente!")

        except ValueError as e:
            print(f"Error de entrada de datos: {e}")
        except Exception as e:
            print(f"Ocurrió un error inesperado al agregar el producto: {e}")

    def listar_productos(self):
        print("=== Lista de Todos los Productos ===")
        self.modelo.listar_todos()

    def consultar_stock(self):
        print("=== Consultar Stock por Código ===")
        codigo_str = input("Código de producto: ").strip()
        try:
            if not codigo_str.isdigit():
                raise ValueError("El código de producto debe ser un número entero.")
            codigo = int(codigo_str) 
            if codigo < 0:
                raise ValueError("El código de producto no puede ser negativo.")
            self.modelo.consultar_stock(codigo)
        except ValueError as e:
            print(f"Error de entrada: {e}")
        except Exception as e:
            print(f"Ocurrió un error inesperado al consultar stock: {e}")

    def listar_stock_bajo(self):
        print("=== Productos con Stock Bajo ===")
        self.modelo.stock_bajo()