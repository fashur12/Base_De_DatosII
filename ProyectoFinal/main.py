from controllers.producto_controller import ProductoController
from controllers.movimiento_controller import MovimientoController
from controllers.proveedor_controller import ProveedorController

def menu():
    pc = ProductoController()
    mc = MovimientoController()
    prc = ProveedorController()

    while True:
        print("\n=== Sistema Inventario ===")
        print("1. Agregar producto")
        print("2. Consultar stock")
        print("3. Ver productos con stock bajo")
        print("4. Registrar movimiento de stock")
        print("5. Generar reporte de movimientos")
        print("6. Registrar proveedor")
        print("7. Listar proveedores")
        print("8. Listar todos los productos")
        print("0. Salir")

        opcion = input("Selecciona opción: ")

        if opcion == "1":
            print("Elija un proveedor disponible")
            prc.listar_proveedores()
            pc.agregar_producto()
        elif opcion == "2":
            pc.consultar_stock()
        elif opcion == "3":
            pc.listar_stock_bajo()
        elif opcion == "4":
            mc.registrar_movimiento()
        elif opcion == "5":
            mc.generar_reporte()
        elif opcion == "6":
            prc.agregar_proveedor()
        elif opcion == "7":
            prc.listar_proveedores()
        elif opcion == "8":
            pc.listar_productos()
        elif opcion == "0":
            print(" Cerrando sistema...")
            break
        else:
            print(" Opción inválida.")

menu()