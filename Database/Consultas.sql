-- ============================================================================
--  VELYSH — consultas_frecuentes.sql
--  Consultas de uso frecuente sobre la base de datos de VELYSH.
--
--  CÓMO USARLAS (Supabase → SQL Editor)
--    · Selecciona UNA consulta y ejecuta solo esa selección (Ctrl+Enter).
--      Si ejecutas todo el archivo, el editor solo muestra la última.
--    · "← cambia" indica un valor que se puede modificar.
--    · Las secciones 1 a 5 solo leen datos. La sección 6 modifica datos:
--      crea un producto de prueba y al final lo borra (ejecutar en orden).
--
--  ÍNDICE
--    1. Consultas básicas ....................... 1 – 6
--    2. Funciones de agregación ................. 7 – 9
--    3. JOINs ................................... 10 – 15
--    4. Subconsultas ............................ 16 – 21
--    5. CASE, fechas y UNION .................... 22 – 24
--    6. Modificar datos (INSERT, UPDATE, DELETE)  25 – 30
-- ============================================================================


-- ############################################################################
--  1. CONSULTAS BÁSICAS
-- ############################################################################

-- ----------------------------------------------------------------------------
--  1. Productos activos ordenados de menor a mayor precio.
--     Tablas: productos
-- ----------------------------------------------------------------------------
SELECT referencia, nombre, marca, precio
FROM productos
WHERE estado = 'activo'
ORDER BY precio ASC;


-- ----------------------------------------------------------------------------
--  2. Buscar productos por nombre (como el buscador de la tienda).
--     Tablas: productos
-- ----------------------------------------------------------------------------
SELECT referencia, nombre, precio
FROM productos
WHERE nombre ILIKE '%tenis%'          -- ← cambia la palabra a buscar
ORDER BY nombre;


-- ----------------------------------------------------------------------------
--  3. Productos activos de mujer o unisex dentro de un rango de precio.
--     Tablas: productos
-- ----------------------------------------------------------------------------
SELECT nombre, genero, precio
FROM productos
WHERE precio BETWEEN 100000 AND 250000      -- ← cambia el rango
  AND genero IN ('mujer', 'unisex')
  AND estado = 'activo'
ORDER BY precio;


-- ----------------------------------------------------------------------------
--  4. Pedidos que todavía no se han entregado (sin contar los cancelados).
--     Tablas: pedidos
-- ----------------------------------------------------------------------------
SELECT referencia, estado_pedido, fecha_pedido, fecha_estimada_entrega
FROM pedidos
WHERE fecha_entregado IS NULL
  AND estado_pedido <> 'cancelado'
ORDER BY fecha_pedido;


-- ----------------------------------------------------------------------------
--  5. Colores que existen en el inventario, sin repetir.
--     Tablas: stock
-- ----------------------------------------------------------------------------
SELECT DISTINCT color
FROM stock
ORDER BY color;


-- ----------------------------------------------------------------------------
--  6. Los 5 productos más caros.
--     Tablas: productos
-- ----------------------------------------------------------------------------
SELECT nombre, precio
FROM productos
ORDER BY precio DESC
LIMIT 5;


-- ############################################################################
--  2. FUNCIONES DE AGREGACIÓN
-- ############################################################################

-- ----------------------------------------------------------------------------
--  7. Resumen de precios del catálogo: total, mínimo, máximo y promedio.
--     Tablas: productos
-- ----------------------------------------------------------------------------
SELECT
  COUNT(*)              AS total_productos,
  MIN(precio)           AS precio_minimo,
  MAX(precio)           AS precio_maximo,
  ROUND(AVG(precio), 0) AS precio_promedio
FROM productos
WHERE estado = 'activo';


-- ----------------------------------------------------------------------------
--  8. Cantidad de productos por género.
--     Tablas: productos
-- ----------------------------------------------------------------------------
SELECT genero, COUNT(*) AS cantidad_productos
FROM productos
GROUP BY genero
ORDER BY cantidad_productos DESC;


-- ----------------------------------------------------------------------------
--  9. Productos con menos de 20 unidades en total (sumando tallas y colores).
--     Tablas: stock
-- ----------------------------------------------------------------------------
SELECT id_producto, SUM(stock_actual) AS stock_total
FROM stock
GROUP BY id_producto
HAVING SUM(stock_actual) < 20              -- ← cambia el límite
ORDER BY stock_total;


-- ############################################################################
--  3. JOINS
-- ############################################################################

-- ----------------------------------------------------------------------------
--  10. Productos con el nombre de su categoría.
--     Tablas: productos, categorias
-- ----------------------------------------------------------------------------
SELECT p.nombre, c.nombre_categoria, p.precio
FROM productos p
JOIN categorias c ON c.id_categoria = p.id_categoria
ORDER BY c.nombre_categoria, p.nombre;


-- ----------------------------------------------------------------------------
--  11. Inventario detallado: producto, talla, color, unidades y estado.
--     Tablas: stock, productos, tallas
-- ----------------------------------------------------------------------------
SELECT p.nombre AS producto, t.talla, s.color, s.stock_actual, s.estado
FROM stock s
JOIN productos p ON p.id_producto = s.id_producto
JOIN tallas    t ON t.id_talla    = s.id_talla
ORDER BY p.nombre, t.orden, s.color;


-- ----------------------------------------------------------------------------
--  12. Cantidad de productos por categoría, incluidas las categorías vacías.
--     Tablas: categorias, productos
-- ----------------------------------------------------------------------------
SELECT c.nombre_categoria, COUNT(p.id_producto) AS cantidad_productos
FROM categorias c
LEFT JOIN productos p ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria
ORDER BY cantidad_productos DESC;


-- ----------------------------------------------------------------------------
--  13. Productos que no tienen ninguna imagen.
--     Tablas: productos, imagenes_producto
-- ----------------------------------------------------------------------------
SELECT p.referencia, p.nombre
FROM productos p
LEFT JOIN imagenes_producto i ON i.id_producto = p.id_producto
WHERE i.id_imagen IS NULL;


-- ----------------------------------------------------------------------------
--  14. Unidades vendidas y total vendido por producto (sin pedidos cancelados).
--     Tablas: factura, pedidos, stock, productos
-- ----------------------------------------------------------------------------
SELECT pr.nombre AS producto,
       SUM(f.cantidad) AS unidades_vendidas,
       SUM(f.subtotal) AS total_vendido
FROM factura f
JOIN pedidos   pe ON pe.id_pedido   = f.id_pedido
JOIN stock     s  ON s.id_stock     = f.id_stock
JOIN productos pr ON pr.id_producto = s.id_producto
WHERE pe.estado_pedido <> 'cancelado'
GROUP BY pr.nombre
ORDER BY total_vendido DESC;


-- ----------------------------------------------------------------------------
--  15. Pedidos con el nombre y correo del cliente.
--     Tablas: pedidos, usuarios
-- ----------------------------------------------------------------------------
SELECT pe.referencia,
       u.nombre || ' ' || u.apellido AS cliente,
       u.correo,
       pe.precio_total,
       pe.estado_pedido,
       pe.fecha_pedido
FROM pedidos pe
JOIN usuarios u ON u.numero_documento = pe.numero_documento
ORDER BY pe.fecha_pedido DESC;


-- ############################################################################
--  4. SUBCONSULTAS
-- ############################################################################

-- ----------------------------------------------------------------------------
--  16. Productos con precio mayor al promedio del catálogo.
--     Tablas: productos
-- ----------------------------------------------------------------------------
SELECT nombre, precio
FROM productos
WHERE precio > (SELECT AVG(precio) FROM productos)
ORDER BY precio DESC;


-- ----------------------------------------------------------------------------
--  17. Usuarios que han hecho al menos un pedido.
--     Tablas: usuarios, pedidos
-- ----------------------------------------------------------------------------
SELECT numero_documento, nombre, apellido, correo
FROM usuarios
WHERE numero_documento IN (SELECT numero_documento FROM pedidos)
ORDER BY nombre;


-- ----------------------------------------------------------------------------
--  18. Productos que nunca se han vendido.
--     Tablas: productos, factura, stock
-- ----------------------------------------------------------------------------
SELECT p.referencia, p.nombre
FROM productos p
WHERE NOT EXISTS (
  SELECT 1
  FROM factura f
  JOIN stock s ON s.id_stock = f.id_stock
  WHERE s.id_producto = p.id_producto
)
ORDER BY p.nombre;


-- ----------------------------------------------------------------------------
--  19. Cada producto con su stock total y cuántas veces está en favoritos.
--     Tablas: productos, stock, favoritos
-- ----------------------------------------------------------------------------
SELECT p.nombre,
       COALESCE((SELECT SUM(s.stock_actual) FROM stock s
                  WHERE s.id_producto = p.id_producto), 0) AS stock_total,
       (SELECT COUNT(*) FROM favoritos fa
         WHERE fa.id_producto = p.id_producto)            AS veces_en_favoritos
FROM productos p
ORDER BY veces_en_favoritos DESC, p.nombre;


-- ----------------------------------------------------------------------------
--  20. Clientes que gastaron más que el promedio de gasto de todos los clientes.
--     Tablas: pedidos
-- ----------------------------------------------------------------------------
SELECT gastos.numero_documento, gastos.total_gastado
FROM (
  SELECT numero_documento, SUM(precio_total) AS total_gastado
  FROM pedidos
  WHERE estado_pedido <> 'cancelado'
  GROUP BY numero_documento
) AS gastos
WHERE gastos.total_gastado > (
  SELECT AVG(total_cliente)
  FROM (SELECT SUM(precio_total) AS total_cliente
        FROM pedidos
        WHERE estado_pedido <> 'cancelado'
        GROUP BY numero_documento) AS promedio
)
ORDER BY gastos.total_gastado DESC;


-- ----------------------------------------------------------------------------
--  21. El pedido más reciente de cada cliente.
--     Tablas: pedidos, usuarios
-- ----------------------------------------------------------------------------
SELECT u.nombre || ' ' || u.apellido AS cliente,
       pe.referencia,
       pe.fecha_pedido,
       pe.estado_pedido
FROM pedidos pe
JOIN usuarios u ON u.numero_documento = pe.numero_documento
WHERE pe.fecha_pedido = (
  SELECT MAX(p2.fecha_pedido)
  FROM pedidos p2
  WHERE p2.numero_documento = pe.numero_documento
)
ORDER BY pe.fecha_pedido DESC;


-- ############################################################################
--  5. CASE, FECHAS Y UNION
-- ############################################################################

-- ----------------------------------------------------------------------------
--  22. Productos clasificados en Económico, Medio o Premium según su precio.
--     Tablas: productos
-- ----------------------------------------------------------------------------
SELECT nombre,
       precio,
       CASE
         WHEN precio < 150000 THEN 'Económico'
         WHEN precio < 300000 THEN 'Medio'
         ELSE 'Premium'
       END AS rango_precio
FROM productos
ORDER BY precio;


-- ----------------------------------------------------------------------------
--  23. Cantidad de pedidos y total vendido por mes (sin cancelados).
--     Tablas: pedidos
-- ----------------------------------------------------------------------------
SELECT EXTRACT(YEAR  FROM fecha_pedido) AS anio,
       EXTRACT(MONTH FROM fecha_pedido) AS mes,
       COUNT(*)                         AS pedidos,
       SUM(precio_total)                AS total_ventas
FROM pedidos
WHERE estado_pedido <> 'cancelado'
GROUP BY anio, mes
ORDER BY anio, mes;


-- ----------------------------------------------------------------------------
--  24. Pendientes del administrador en una sola lista: pedidos por atender y
--     devoluciones sin responder.
--     Tablas: pedidos, devoluciones
-- ----------------------------------------------------------------------------
SELECT 'Pedido'            AS tipo,
       referencia          AS referencia,
       estado_pedido::text AS estado,
       fecha_pedido        AS fecha
FROM pedidos
WHERE estado_pedido IN ('pendiente', 'confirmado')

UNION ALL

SELECT 'Devolución',
       'DEV-' || id_devolucion,
       estado::text,
       fecha_solicitud
FROM devoluciones
WHERE estado = 'solicitada'

ORDER BY fecha;


-- ############################################################################
--  6. MODIFICAR DATOS  (⚠ modifican la base; ejecutar en orden 25 → 30)
-- ############################################################################

-- ----------------------------------------------------------------------------
--  25. Crea una categoría de prueba.
--     Tablas: categorias (inserta)
-- ----------------------------------------------------------------------------
INSERT INTO categorias (nombre_categoria, descripcion)
VALUES ('Prueba SQL', 'Categoría temporal para practicar consultas')
RETURNING *;


-- ----------------------------------------------------------------------------
--  26. Crea un producto de prueba dentro de esa categoría.
--     Tablas: productos (inserta), categorias
-- ----------------------------------------------------------------------------
INSERT INTO productos (id_categoria, referencia, nombre, precio, genero)
VALUES (
  (SELECT id_categoria FROM categorias WHERE nombre_categoria = 'Prueba SQL'),
  'PRUEBA-001',
  'Tenis de prueba',
  199900,
  'unisex'
)
RETURNING id_producto, referencia, nombre, precio, total_ventas;


-- ----------------------------------------------------------------------------
--  27. Le agrega 2 unidades en la talla más pequeña, color negro.
--     El trigger deja el estado en 'bajo'.
--     Tablas: stock (inserta), productos, tallas
-- ----------------------------------------------------------------------------
INSERT INTO stock (id_producto, id_talla, color, stock_actual)
SELECT p.id_producto, t.id_talla, 'negro', 2
FROM productos p, tallas t
WHERE p.referencia = 'PRUEBA-001'
  AND t.orden = (SELECT MIN(orden) FROM tallas)
RETURNING id_stock, color, stock_actual, stock_minimo, estado;


-- ----------------------------------------------------------------------------
--  28. Reabastece el producto de prueba con 20 unidades más.
--     El trigger cambia el estado a 'disponible' y llena fecha_actualizacion.
--     Tablas: stock (actualiza), productos
-- ----------------------------------------------------------------------------
UPDATE stock
SET stock_actual = stock_actual + 20
WHERE id_producto = (SELECT id_producto FROM productos WHERE referencia = 'PRUEBA-001')
RETURNING id_stock, stock_actual, estado, fecha_actualizacion;


-- ----------------------------------------------------------------------------
--  29. Intenta dejar el stock en negativo. DEBE FALLAR por el CHECK
--     chk_stock_actual_no_negativo; no modifica nada.
--     Tablas: stock
-- ----------------------------------------------------------------------------
UPDATE stock
SET stock_actual = -1
WHERE id_producto = (SELECT id_producto FROM productos WHERE referencia = 'PRUEBA-001');


-- ----------------------------------------------------------------------------
--  30. Borra el producto de prueba (su stock se borra en cascada) y luego la
--     categoría. Selecciona y ejecuta los dos DELETE juntos.
--     Tablas: productos (borra), stock (borra en cascada), categorias (borra)
-- ----------------------------------------------------------------------------
DELETE FROM productos
WHERE referencia = 'PRUEBA-001';

DELETE FROM categorias
WHERE nombre_categoria = 'Prueba SQL'
RETURNING *;
