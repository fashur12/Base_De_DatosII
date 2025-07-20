
# 📦 Proyecto Final - Sistema de Inventario de Tienda

**Materia:** Bases de Datos II  
**Profesor:** Gustavo Ramocelli  
**Ayudantes de Cátedra:** Sergio Antozzi, Gianluca Fagherazzi  
**Integrantes:**  
- García, Andy  
- Desch, Fausto  
- Benamo Ortega, Joaquín  
- Robles, Gianfranco  
- Peratta, Lucas  

---

## 📚 Descripción

Este proyecto corresponde al Proyecto 4 del programa de la materia y consiste en un sistema de gestión de inventario para una tienda, desarrollado en Python con base de datos MongoDB. Se implementa un CRUD básico para productos, proveedores y movimientos de stock.

> Dificultad: ⭐⭐⭐

---

## ✅ Requerimientos Funcionales

- 📦 Catálogo de productos con stock actual.
- 🧾 Registro de proveedores y sus productos.
- 🔁 Movimientos de entrada y salida de stock.
- 🚨 Alertas de stock bajo (comparado con el mínimo definido).

---

## ⚙️ Funciones Implementadas

- `agregarProducto(producto)` → Añadir producto al catálogo.  
- `registrarMovimiento(movimiento)` → Registrar entrada o salida de stock.  
- `consultarStock(codigo)` → Ver stock actual de un producto.  
- `productosStockBajo()` → Listar productos con stock por debajo del mínimo.  
- `reporteMovimientos(fechaInicio, fechaFin)` → Generar reporte de movimientos por período.

---

## 🗂️ Estructura del Proyecto

```
ProyectoFinal/
│
├── assets/                      # Capturas de pantalla del sistema
│   ├── Menú.jpeg
│   ├── Opción_0.jpeg
│   ├── Opción_1.jpeg
│   ├── Opción_2.jpeg
│   ├── Opción_3.jpeg
│   ├── Opción_4-Entrada.jpeg
│   ├── Opción_4-Salida.jpeg
│   ├── Opción_5.jpeg
│   ├── Opción_6.jpeg
│   ├── Opción_7.jpeg
│   └── Opción_8.jpeg
│
├── controllers/
│   ├── producto_controller.py
│   ├── proveedor_controller.py
│   └── movimiento_controller.py
│
├── models/
│   ├── producto.py
│   ├── proveedor.py
│   └── movimiento.py
│
├── db.py                       # Conexión a MongoDB
├── init_db.py                 # Inicialización de datos de ejemplo
└── main.py                    # Menú principal de interacción
```

---

## 🖥️ Tecnologías Utilizadas

- 🐍 Python 3.x  
- 🍃 MongoDB + PyMongo  
- 🧠 MongoDB Compass (visualización y validación de datos)

---

## 🧪 Inicialización de la Base de Datos

Para ejecutar el sistema con datos de prueba, correr:

```bash
python init_db.py
```

Esto insertará un proveedor, un producto y un movimiento inicial en la base `tienda_inventario`.

---

## ▶️ Ejecución del Sistema

```bash
python main.py
```

Se desplegará el siguiente menú:

```
1. Agregar producto
2. Consultar stock
3. Ver productos con stock bajo
4. Registrar movimiento de stock
5. Generar reporte de movimientos
6. Registrar proveedor
7. Listar proveedores
8. Listar todos los productos
0. Salir
```

---

## 📸 Capturas del Sistema

Las siguientes imágenes ilustran el uso del sistema desde consola:

- `assets/Menú.jpeg`  
- `assets/Opción_0.jpeg`  
- `assets/Opción_1.jpeg`  
- `assets/Opción_2.jpeg`  
- `assets/Opción_3.jpeg`  
- `assets/Opción_4-Entrada.jpeg`  
- `assets/Opción_4-Salida.jpeg`  
- `assets/Opción_5.jpeg`  
- `assets/Opción_6.jpeg`  
- `assets/Opción_7.jpeg`  
- `assets/Opción_8.jpeg`  

---

## 🔚 Conclusión

Este proyecto demuestra la aplicación de conceptos fundamentales de persistencia de datos, manejo de colecciones en MongoDB, operaciones CRUD y validación de datos desde consola. Representa un entorno simulado de inventario real para tiendas.
