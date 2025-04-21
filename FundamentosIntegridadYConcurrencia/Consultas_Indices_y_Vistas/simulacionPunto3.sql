
-- Este script simula dos sesiones intentando actualizar el mismo saldo

-- Sesión A (leer saldo)
START TRANSACTION;
SELECT saldo FROM cuentas WHERE id = 1;
-- (Esperar antes de actualizar)

-- Sesión B (actualizar saldo)
START TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
COMMIT;

-- Luego, Sesión A intenta actualizar también
-- Dependiendo del aislamiento, puede haber problemas de concurrencia

-- Cambiar nivel de aislamiento para pruebas
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- o
-- SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
