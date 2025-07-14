from models.movimiento import Movimiento
from db import productos, movimientos
from bson.objectid import ObjectId
from datetime import datetime

class MovimientoController:

    def __init__(self):
        self.modelo = Movimiento(movimientos, productos)
        self.producto_db = productos

    def registrar_movimiento(self):
        print("Registrar movimiento:")
        try:
            
            producto_id_str = input("ID del producto: ").strip()
            if not producto_id_str:
                raise ValueError("El ID del producto no puede estar vacío.")
            
            try:
                producto_object_id = ObjectId(producto_id_str)
            except Exception:
                raise ValueError(f"El ID '{producto_id_str}' no tiene un formato de ObjectId válido.")
            
            producto_existe = self.producto_db.find_one({"_id": producto_object_id})
            if not producto_existe:
                raise ValueError("No existe un producto con el ID proporcionado.")

            tipo = input("Tipo (entrada/salida): ").strip().lower()
            if tipo not in ["entrada", "salida"]:
                raise ValueError("El tipo de movimiento debe ser 'entrada' o 'salida'.")

            cantidad_str = input("Cantidad: ").strip()
            if not cantidad_str.isdigit():
                raise ValueError("La cantidad debe ser un número entero válido.")
            cantidad = int(cantidad_str)
            if cantidad <= 0:
                raise ValueError("La cantidad debe ser un número entero positivo.")
            
            motivo = input("Motivo: ").strip()
            if not motivo:
                raise ValueError("El motivo no puede estar vacío.")

            movimiento = {
                "productoId": producto_object_id,
                "tipo": tipo,
                "cantidad": cantidad,
                "motivo": motivo,
                "fecha": datetime.now()
            }

            self.modelo.registrar(movimiento)
            print("Movimiento creado!")

        except ValueError as e:
            print(f"Error de entrada de datos: {e}")
        except Exception as e:
            print(f"Ocurrió un error inesperado al registrar el movimiento: {e}")

    def generar_reporte(self):
        print("\n--- Generar Reporte de Movimientos ---")
        try:
            fecha_inicio_str = input("Fecha inicio (YYYY-MM-DD): ").strip()
            fecha_fin_str = input("Fecha fin (YYYY-MM-DD): ").strip()

            fecha_inicio = datetime.strptime(fecha_inicio_str, "%Y-%m-%d")
            fecha_fin = datetime.strptime(fecha_fin_str, "%Y-%m-%d")

            if fecha_inicio > fecha_fin:
                raise ValueError("La fecha de inicio no puede ser posterior a la fecha de fin.")
            
            self.modelo.reporte(fecha_inicio, fecha_fin)

        except ValueError as e:
            print(f"Error de fecha: {e}. Por favor, use el formato YYYY-MM-DD y asegúrese que la fecha de inicio sea anterior o igual a la de fin.")
        except Exception as e:
            print(f"Ocurrió un error inesperado al generar el reporte: {e}")
