from datetime import datetime
from bson import ObjectId

class Movimiento:
    def __init__(self, coleccion_movimientos, coleccion_productos):
        self.movimientos = coleccion_movimientos
        self.productos = coleccion_productos

    def registrar(self, movimiento):
        producto = self.productos.find_one({"_id": ObjectId(movimiento["productoId"])})

        if not producto:
            print(" Error: Producto no encontrado.")
            return

        if movimiento["tipo"] == "entrada":
            nuevo_stock = producto["stockActual"] + movimiento["cantidad"]
        elif movimiento["tipo"] == "salida":
            if producto["stockActual"] < movimiento["cantidad"]:
                print(" Error: Stock insuficiente para salida.")
                return
            nuevo_stock = producto["stockActual"] - movimiento["cantidad"]
        else:
            print(" Error: Tipo de movimiento inválido.")
            return

        self.productos.update_one(
            {"_id": producto["_id"]},
            {"$set": {
                "stockActual": nuevo_stock,
                "fechaUltimaActualizacion": datetime.utcnow()
            }}
        )

        movimiento["productoId"] = ObjectId(movimiento["productoId"])
        movimiento["fecha"] = datetime.utcnow()

        result = self.movimientos.insert_one(movimiento)
        print(f" Movimiento registrado con _id: {result.inserted_id} | Nuevo stock: {nuevo_stock}")

    def reporte(self, fecha_inicio, fecha_fin):
        resultados = self.movimientos.find({
            "fecha": {
                "$gte": fecha_inicio,
                "$lte": fecha_fin
            }
        }).sort("fecha", 1)

        print(f" Reporte de movimientos del {fecha_inicio} al {fecha_fin}:")

        for m in resultados:
            print(f"- ProductoID: {m['productoId']} | Tipo: {m['tipo']} | Cantidad: {m['cantidad']} | Motivo: {m['motivo']} | Fecha: {m['fecha']}")