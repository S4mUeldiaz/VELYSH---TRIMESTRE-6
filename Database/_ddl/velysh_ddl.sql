-- ============================================================================
--  VELYSH — ddl/velysh_ddl.sql  (DDL: estructura completa de la base de datos)
--  Motor:    PostgreSQL 17 (Supabase)        Esquema: public
--  Fuente:   pg_dump de Supabase (07/10/2026), documentado
--  Tablas:   14
--  Uso:      ejecutar sobre una base de datos VACÍA (crea tipos y tablas).
--            Después, cargar los datos con velysh_data.sql.
--
--  Convenciones de nombres:
--    pk_<tabla>        Llave primaria
--    uc_<tabla>_<col>  Restricción UNIQUE
--    fk_<origen>_<ref> Llave foránea
--    chk_<tabla>_<regla> CHECK constraint
--    idx_<tabla>_<col> Índice
--    fn_<accion>       Función
--    trg_<tabla>_<accion> Trigger
-- ============================================================================

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET client_min_messages = warning;

-- ============================================================================
--  1. TIPOS ENUM
-- ============================================================================

CREATE TYPE public.estado_usuario      AS ENUM ('activo', 'inactivo');
CREATE TYPE public.estado_general      AS ENUM ('activo', 'inactivo');
CREATE TYPE public.estado_producto     AS ENUM ('activo', 'inactivo', 'descontinuado');
CREATE TYPE public.estado_stock        AS ENUM ('disponible', 'bajo', 'agotado');
CREATE TYPE public.genero_tipo         AS ENUM ('hombre', 'mujer', 'unisex');
CREATE TYPE public.metodo_pago_tipo    AS ENUM ('tarjeta', 'pse', 'transferencia', 'contraentrega');
CREATE TYPE public.estado_pago_tipo    AS ENUM ('pendiente', 'pagado', 'fallido');
CREATE TYPE public.estado_pedido_tipo  AS ENUM ('pendiente', 'confirmado', 'preparacion', 'enviado', 'entregado', 'cancelado');
CREATE TYPE public.estado_devolucion   AS ENUM ('solicitada', 'aprobada', 'rechazada', 'procesada');
CREATE TYPE public.tipo_movimiento     AS ENUM ('entrada', 'salida', 'ajuste', 'devolucion');
CREATE TYPE public.tipo_documento_enum AS ENUM ('cedula', 'cedula_extranjeria', 'tarjeta_identidad', 'pasaporte', 'nit');


-- ============================================================================
--  2. TABLAS (en orden de dependencia)
-- ============================================================================

-- ----------------------------------------------------------------------------
--  tipo_documento
-- ----------------------------------------------------------------------------
CREATE TABLE public.tipo_documento (
  id_tipo_documento  SERIAL                      NOT NULL,
  tipo               public.tipo_documento_enum  NOT NULL,
  descripcion        TEXT                        NOT NULL DEFAULT '',
  CONSTRAINT pk_tipo_documento PRIMARY KEY (id_tipo_documento),
  CONSTRAINT uc_tipo_documento UNIQUE (tipo)
);

COMMENT ON TABLE  public.tipo_documento                   IS 'Catálogo de tipos de documento de identidad aceptados (cédula, pasaporte, NIT, etc.).';
COMMENT ON COLUMN public.tipo_documento.id_tipo_documento IS 'Identificador interno autoincremental.';
COMMENT ON COLUMN public.tipo_documento.tipo              IS 'Código ENUM del tipo de documento.';
COMMENT ON COLUMN public.tipo_documento.descripcion       IS 'Texto descriptivo para mostrar en formularios.';


-- ----------------------------------------------------------------------------
--  roles
-- ----------------------------------------------------------------------------
CREATE TABLE public.roles (
  id_rol          SERIAL       NOT NULL,
  nombre_rol      VARCHAR(50)  NOT NULL,
  descripcion     TEXT         NOT NULL DEFAULT '',
  fecha_creacion  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_roles            PRIMARY KEY (id_rol),
  CONSTRAINT uc_roles_nombre_rol UNIQUE (nombre_rol)
);

COMMENT ON TABLE  public.roles                IS 'Roles de acceso al sistema (admin, cliente, operador de bodega, etc.).';
COMMENT ON COLUMN public.roles.id_rol         IS 'Identificador interno del rol.';
COMMENT ON COLUMN public.roles.nombre_rol     IS 'Nombre único del rol. Se usa para lógica de autorización.';
COMMENT ON COLUMN public.roles.descripcion    IS 'Descripción de las capacidades o alcance del rol.';
COMMENT ON COLUMN public.roles.fecha_creacion IS 'Marca de tiempo de creación del registro.';


-- ----------------------------------------------------------------------------
--  usuarios
-- ----------------------------------------------------------------------------
CREATE TABLE public.usuarios (
  numero_documento        VARCHAR(20)            NOT NULL,
  id_tipo_documento       INT                    NOT NULL,
  nombre                  VARCHAR(100)           NOT NULL,
  apellido                VARCHAR(100)           NOT NULL,
  correo                  VARCHAR(150)           NOT NULL,
  telefono                VARCHAR(15)            NOT NULL,
  password_hash           VARCHAR(255)           NOT NULL,       -- Guarda el id de Supabase Auth, no un hash (ver comentario)
  id_rol                  INT                    NOT NULL,
  fecha_registro          TIMESTAMP              NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_ultima_actividad  TIMESTAMP              DEFAULT NULL,   -- NULL válido: usuario sin sesión aún
  estado                  public.estado_usuario  NOT NULL DEFAULT 'activo',
  url_foto_perfil         TEXT                   DEFAULT NULL,   -- NULL válido: sin foto de perfil
  CONSTRAINT pk_usuarios          PRIMARY KEY (numero_documento),
  CONSTRAINT uc_usuarios_correo   UNIQUE (correo),
  CONSTRAINT uc_usuarios_telefono UNIQUE (telefono),
  CONSTRAINT fk_usuarios_tipo_doc FOREIGN KEY (id_tipo_documento)
    REFERENCES public.tipo_documento (id_tipo_documento),
  CONSTRAINT fk_usuarios_rol      FOREIGN KEY (id_rol)
    REFERENCES public.roles (id_rol)
);

COMMENT ON TABLE  public.usuarios                        IS 'Usuarios registrados en la plataforma: clientes, administradores y operadores.';
COMMENT ON COLUMN public.usuarios.numero_documento       IS 'Número de documento de identidad. PK natural; identifica unívocamente a la persona.';
COMMENT ON COLUMN public.usuarios.id_tipo_documento      IS 'FK al catálogo tipo_documento.';
COMMENT ON COLUMN public.usuarios.nombre                 IS 'Nombre(s) del usuario tal como aparece en su documento.';
COMMENT ON COLUMN public.usuarios.apellido               IS 'Apellido(s) del usuario.';
COMMENT ON COLUMN public.usuarios.correo                 IS 'Correo electrónico único. Usado como credencial de login.';
COMMENT ON COLUMN public.usuarios.telefono               IS 'Teléfono móvil único. Se usa para notificaciones y soporte.';
COMMENT ON COLUMN public.usuarios.password_hash          IS 'Id (UUID) del usuario en Supabase Auth (auth.users.id). Pese al nombre, NO es un hash: la contraseña la guarda y verifica Supabase Auth, encriptada con bcrypt en auth.users.';
COMMENT ON COLUMN public.usuarios.id_rol                 IS 'FK al rol asignado. Define qué funciones puede realizar el usuario.';
COMMENT ON COLUMN public.usuarios.fecha_registro         IS 'Fecha y hora en que el usuario creó su cuenta.';
COMMENT ON COLUMN public.usuarios.fecha_ultima_actividad IS 'Última vez que el usuario inició sesión. NULL si nunca ha iniciado sesión.';
COMMENT ON COLUMN public.usuarios.estado                 IS 'Estado de la cuenta: activo o inactivo (bloqueado/dado de baja).';


-- ----------------------------------------------------------------------------
--  direcciones
-- ----------------------------------------------------------------------------
CREATE TABLE public.direcciones (
  id_direccion      SERIAL        NOT NULL,
  numero_documento  VARCHAR(20)   NOT NULL,
  direccion         VARCHAR(200)  NOT NULL,
  ciudad            VARCHAR(50)   NOT NULL DEFAULT 'Bogotá',
  departamento      VARCHAR(50)   NOT NULL DEFAULT 'Cundinamarca',
  codigo_postal     VARCHAR(10)   NOT NULL DEFAULT '',
  CONSTRAINT pk_direcciones         PRIMARY KEY (id_direccion),
  CONSTRAINT fk_direcciones_usuario FOREIGN KEY (numero_documento)
    REFERENCES public.usuarios (numero_documento) ON DELETE CASCADE
);

COMMENT ON TABLE  public.direcciones                  IS 'Direcciones de entrega registradas por cada usuario. Un usuario puede tener varias.';
COMMENT ON COLUMN public.direcciones.id_direccion     IS 'Identificador autoincremental de la dirección.';
COMMENT ON COLUMN public.direcciones.numero_documento IS 'FK al usuario propietario de la dirección.';
COMMENT ON COLUMN public.direcciones.direccion        IS 'Línea de dirección completa (calle, número, piso, apto).';
COMMENT ON COLUMN public.direcciones.ciudad           IS 'Ciudad de entrega. Por defecto Bogotá.';
COMMENT ON COLUMN public.direcciones.departamento     IS 'Departamento colombiano. Por defecto Cundinamarca.';
COMMENT ON COLUMN public.direcciones.codigo_postal    IS 'Código postal de 6 dígitos. Vacío si no aplica.';


-- ----------------------------------------------------------------------------
--  categorias
-- ----------------------------------------------------------------------------
CREATE TABLE public.categorias (
  id_categoria      SERIAL                 NOT NULL,
  nombre_categoria  VARCHAR(100)           NOT NULL,
  descripcion       TEXT                   NOT NULL DEFAULT '',
  estado            public.estado_general  NOT NULL DEFAULT 'activo',
  orden             INT                    NOT NULL DEFAULT 0,
  fecha_creacion    TIMESTAMP              NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_categorias        PRIMARY KEY (id_categoria),
  CONSTRAINT uc_categorias_nombre UNIQUE (nombre_categoria)
);

COMMENT ON TABLE  public.categorias                  IS 'Categorías para clasificar los productos del catálogo.';
COMMENT ON COLUMN public.categorias.id_categoria     IS 'Identificador autoincremental de la categoría.';
COMMENT ON COLUMN public.categorias.nombre_categoria IS 'Nombre único de la categoría. Se muestra en el menú de la tienda.';
COMMENT ON COLUMN public.categorias.descripcion      IS 'Descripción opcional para SEO o tooltip informativo.';
COMMENT ON COLUMN public.categorias.estado           IS 'Activo: visible en la tienda. Inactivo: oculta temporalmente.';
COMMENT ON COLUMN public.categorias.orden            IS 'Posición ordinal para el orden de aparición en el menú.';
COMMENT ON COLUMN public.categorias.fecha_creacion   IS 'Fecha y hora de creación del registro.';


-- ----------------------------------------------------------------------------
--  productos
-- ----------------------------------------------------------------------------
CREATE TABLE public.productos (
  id_producto     SERIAL                  NOT NULL,
  id_categoria    INT                     NOT NULL,
  referencia      VARCHAR(20)             NOT NULL,
  nombre          VARCHAR(150)            NOT NULL,
  descripcion     TEXT                    NOT NULL DEFAULT '',
  marca           VARCHAR(50)             NOT NULL DEFAULT 'VELYSH',
  precio          NUMERIC(10,2)           NOT NULL,
  estado          public.estado_producto  NOT NULL DEFAULT 'activo',
  fecha_creacion  TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
  total_ventas    INT                     NOT NULL DEFAULT 0,
  genero          public.genero_tipo      NOT NULL DEFAULT 'unisex',
  CONSTRAINT pk_productos            PRIMARY KEY (id_producto),
  CONSTRAINT uc_productos_referencia UNIQUE (referencia),
  CONSTRAINT chk_productos_precio    CHECK (precio >= 0),
  CONSTRAINT fk_productos_categoria  FOREIGN KEY (id_categoria)
    REFERENCES public.categorias (id_categoria)
);

COMMENT ON TABLE  public.productos                IS 'Catálogo de productos. Las variantes (talla/color) se gestionan en stock.';
COMMENT ON COLUMN public.productos.id_producto    IS 'Identificador autoincremental del producto.';
COMMENT ON COLUMN public.productos.id_categoria   IS 'FK a la categoría a la que pertenece el producto.';
COMMENT ON COLUMN public.productos.referencia     IS 'Código de referencia único (SKU padre). Ej: VLY-CAM-001.';
COMMENT ON COLUMN public.productos.nombre         IS 'Nombre comercial del producto visible en la tienda.';
COMMENT ON COLUMN public.productos.descripcion    IS 'Descripción larga del producto: materiales, cuidados, características.';
COMMENT ON COLUMN public.productos.marca          IS 'Marca del producto.';
COMMENT ON COLUMN public.productos.precio         IS 'Precio base de venta en COP.';
COMMENT ON COLUMN public.productos.estado         IS 'activo: visible y vendible. inactivo: oculto. descontinuado: fuera de producción.';
COMMENT ON COLUMN public.productos.fecha_creacion IS 'Fecha de alta del producto en el sistema.';
COMMENT ON COLUMN public.productos.total_ventas   IS 'Unidades vendidas en pedidos no cancelados. Calculado automáticamente por trg_factura_total_ventas y trg_pedidos_total_ventas; los cambios manuales se ignoran.';
COMMENT ON COLUMN public.productos.genero         IS 'Audiencia del producto (hombre/mujer/unisex). Independiente de id_categoria: un producto tiene UN tipo de calzado y UN género, se filtran por separado.';


-- ----------------------------------------------------------------------------
--  imagenes_producto
-- ----------------------------------------------------------------------------
CREATE TABLE public.imagenes_producto (
  id_imagen     SERIAL     NOT NULL,
  id_producto   INT        NOT NULL,
  url_imagen    VARCHAR    NOT NULL,
  orden         INT        NOT NULL DEFAULT 0,
  fecha_subida  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  color         TEXT       DEFAULT NULL,   -- NULL válido: imagen general del producto
  CONSTRAINT pk_imagenes_producto     PRIMARY KEY (id_imagen),
  CONSTRAINT uc_imagenes_url_producto UNIQUE (id_producto, color, url_imagen),
  CONSTRAINT fk_imagenes_producto     FOREIGN KEY (id_producto)
    REFERENCES public.productos (id_producto) ON DELETE CASCADE
);

COMMENT ON TABLE  public.imagenes_producto              IS 'Imágenes del catálogo. Cada producto puede tener múltiples imágenes ordenadas.';
COMMENT ON COLUMN public.imagenes_producto.id_imagen    IS 'Identificador autoincremental de la imagen.';
COMMENT ON COLUMN public.imagenes_producto.id_producto  IS 'FK al producto al que pertenece la imagen.';
COMMENT ON COLUMN public.imagenes_producto.url_imagen   IS 'URL absoluta de la imagen en el CDN o servidor de archivos.';
COMMENT ON COLUMN public.imagenes_producto.orden        IS '0 = imagen principal (thumbnail). Valores mayores = imágenes de galería.';
COMMENT ON COLUMN public.imagenes_producto.fecha_subida IS 'Fecha y hora en que se subió la imagen.';
COMMENT ON COLUMN public.imagenes_producto.color        IS 'Color al que pertenece la imagen. Vacío = imagen general del producto (no específica de color).';


-- ----------------------------------------------------------------------------
--  tallas
-- ----------------------------------------------------------------------------
CREATE TABLE public.tallas (
  id_talla  SERIAL      NOT NULL,
  talla     VARCHAR(5)  NOT NULL,
  orden     INT         NOT NULL DEFAULT 0,
  CONSTRAINT pk_tallas PRIMARY KEY (id_talla),
  CONSTRAINT uc_tallas UNIQUE (talla)
);

COMMENT ON TABLE  public.tallas          IS 'Catálogo de tallas disponibles.';
COMMENT ON COLUMN public.tallas.id_talla IS 'Identificador autoincremental de la talla.';
COMMENT ON COLUMN public.tallas.talla    IS 'Código de talla: XS, S, M, L, XL, XXL o numéricas (28, 30, 32...).';
COMMENT ON COLUMN public.tallas.orden    IS 'Orden lógico de presentación de menor a mayor talla.';


-- ----------------------------------------------------------------------------
--  stock
-- ----------------------------------------------------------------------------
CREATE TABLE public.stock (
  id_stock             SERIAL               NOT NULL,
  id_producto          INT                  NOT NULL,
  id_talla             INT                  NOT NULL,
  color                VARCHAR(50)          NOT NULL,
  stock_actual         INT                  NOT NULL DEFAULT 0,
  stock_minimo         INT                  NOT NULL DEFAULT 5,
  stock_maximo         INT                  NOT NULL DEFAULT 100,
  estado               public.estado_stock  NOT NULL DEFAULT 'disponible',
  ubicacion_almacen    VARCHAR(50)          NOT NULL DEFAULT '',
  fecha_actualizacion  TIMESTAMP            DEFAULT NULL,   -- NULL válido: sin cambios desde la creación
  CONSTRAINT pk_stock          PRIMARY KEY (id_stock),
  CONSTRAINT uc_stock_variante UNIQUE (id_producto, id_talla, color),
  CONSTRAINT chk_stock_actual_no_negativo CHECK (stock_actual >= 0),
  CONSTRAINT chk_stock_minimo_maximo      CHECK (stock_minimo >= 0 AND stock_minimo <= stock_maximo),
  CONSTRAINT fk_stock_producto FOREIGN KEY (id_producto)
    REFERENCES public.productos (id_producto) ON DELETE CASCADE,
  CONSTRAINT fk_stock_talla    FOREIGN KEY (id_talla)
    REFERENCES public.tallas (id_talla)
);

COMMENT ON TABLE  public.stock                     IS 'Inventario por variante (SKU). Cada fila = combinación única producto + talla + color.';
COMMENT ON COLUMN public.stock.id_stock            IS 'Identificador autoincremental de la variante de stock.';
COMMENT ON COLUMN public.stock.id_producto         IS 'FK al producto base.';
COMMENT ON COLUMN public.stock.id_talla            IS 'FK a la talla de esta variante.';
COMMENT ON COLUMN public.stock.color               IS 'Color de la variante.';
COMMENT ON COLUMN public.stock.stock_actual        IS 'Unidades disponibles para la venta en este momento.';
COMMENT ON COLUMN public.stock.stock_minimo        IS 'Cantidad mínima antes de emitir alerta de reabastecimiento.';
COMMENT ON COLUMN public.stock.stock_maximo        IS 'Cantidad máxima que se almacena para esta variante.';
COMMENT ON COLUMN public.stock.estado              IS 'Calculado por trg_stock_estado_fecha. agotado: stock <= 0. bajo: stock <= mínimo. disponible: stock > mínimo.';
COMMENT ON COLUMN public.stock.ubicacion_almacen   IS 'Ubicación física en bodega (ej. A-03-15).';
COMMENT ON COLUMN public.stock.fecha_actualizacion IS 'Timestamp del último cambio de la variante. Lo llena trg_stock_estado_fecha.';


-- ----------------------------------------------------------------------------
--  pedidos
-- ----------------------------------------------------------------------------
CREATE TABLE public.pedidos (
  id_pedido               SERIAL                     NOT NULL,
  numero_documento        VARCHAR(20)                NOT NULL,
  id_direccion            INT                        NOT NULL,
  referencia              VARCHAR(20)                NOT NULL,
  fecha_pedido            TIMESTAMP                  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_estimada_entrega  DATE                       DEFAULT NULL,   -- NULL válido: hasta confirmar el pedido
  fecha_entregado         TIMESTAMP                  DEFAULT NULL,   -- NULL válido: hasta que se entregue
  costo_envio             NUMERIC(10,2)              NOT NULL DEFAULT 0,
  precio_total            NUMERIC(10,2)              NOT NULL,
  metodo_pago             public.metodo_pago_tipo    NOT NULL,
  estado_pago             public.estado_pago_tipo    NOT NULL DEFAULT 'pendiente',
  estado_pedido           public.estado_pedido_tipo  NOT NULL DEFAULT 'pendiente',
  fecha_actualizacion     TIMESTAMP                  DEFAULT NULL,   -- NULL válido: sin cambios desde la creación
  CONSTRAINT pk_pedidos            PRIMARY KEY (id_pedido),
  CONSTRAINT uc_pedidos_referencia UNIQUE (referencia),
  CONSTRAINT chk_pedidos_montos    CHECK (precio_total >= 0 AND costo_envio >= 0),
  CONSTRAINT fk_pedidos_usuario    FOREIGN KEY (numero_documento)
    REFERENCES public.usuarios (numero_documento),
  CONSTRAINT fk_pedidos_direccion  FOREIGN KEY (id_direccion)
    REFERENCES public.direcciones (id_direccion)
);

COMMENT ON TABLE  public.pedidos                        IS 'Cabecera de pedidos: quién compró, a dónde enviar, cómo pagó y estado del pedido.';
COMMENT ON COLUMN public.pedidos.id_pedido              IS 'Identificador interno autoincremental del pedido.';
COMMENT ON COLUMN public.pedidos.numero_documento       IS 'FK al usuario que realizó el pedido.';
COMMENT ON COLUMN public.pedidos.id_direccion           IS 'FK a la dirección de entrega seleccionada.';
COMMENT ON COLUMN public.pedidos.referencia             IS 'Código amigable visible para el cliente (ej. VLY-2024-0001).';
COMMENT ON COLUMN public.pedidos.fecha_pedido           IS 'Fecha y hora exacta en que se creó el pedido.';
COMMENT ON COLUMN public.pedidos.fecha_estimada_entrega IS 'Fecha esperada de entrega. NULL hasta que se confirme el pedido.';
COMMENT ON COLUMN public.pedidos.fecha_entregado        IS 'Fecha real de entrega. La llena trg_pedidos_fechas cuando estado_pedido pasa a entregado.';
COMMENT ON COLUMN public.pedidos.costo_envio            IS 'Costo del servicio de mensajería en COP. 0 si envío gratis.';
COMMENT ON COLUMN public.pedidos.precio_total           IS 'Total: suma de subtotales de factura más costo_envio.';
COMMENT ON COLUMN public.pedidos.metodo_pago            IS 'Método de pago: tarjeta, PSE, transferencia o contraentrega.';
COMMENT ON COLUMN public.pedidos.estado_pago            IS 'Estado de la transacción: pendiente, pagado o fallido.';
COMMENT ON COLUMN public.pedidos.estado_pedido          IS 'Etapa logística: pendiente → confirmado → preparacion → enviado → entregado (o cancelado).';
COMMENT ON COLUMN public.pedidos.fecha_actualizacion    IS 'Última modificación del pedido. La llena trg_pedidos_fechas.';


-- ----------------------------------------------------------------------------
--  factura (detalle de pedido)
-- ----------------------------------------------------------------------------
CREATE TABLE public.factura (
  id_detalle       SERIAL         NOT NULL,
  id_pedido        INT            NOT NULL,
  id_stock         INT            NOT NULL,
  cantidad         INT            NOT NULL,
  precio_unitario  NUMERIC(10,2)  NOT NULL,
  subtotal         NUMERIC(10,2)  NOT NULL,
  CONSTRAINT pk_detalles_pedido       PRIMARY KEY (id_detalle),
  CONSTRAINT uc_detalles_pedido_stock UNIQUE (id_pedido, id_stock),
  CONSTRAINT chk_factura_cantidad        CHECK (cantidad > 0),
  CONSTRAINT chk_factura_precio_unitario CHECK (precio_unitario >= 0),
  CONSTRAINT fk_detalle_pedido        FOREIGN KEY (id_pedido)
    REFERENCES public.pedidos (id_pedido) ON DELETE CASCADE,
  CONSTRAINT fk_detalle_stock         FOREIGN KEY (id_stock)
    REFERENCES public.stock (id_stock)
);

COMMENT ON TABLE  public.factura                 IS 'Líneas de detalle de cada pedido: variante comprada, precio y unidades.';
COMMENT ON COLUMN public.factura.id_detalle      IS 'Identificador autoincremental del ítem de factura.';
COMMENT ON COLUMN public.factura.id_pedido       IS 'FK al pedido al que pertenece esta línea.';
COMMENT ON COLUMN public.factura.id_stock        IS 'FK a la variante (SKU) exacta que se compró.';
COMMENT ON COLUMN public.factura.cantidad        IS 'Número de unidades adquiridas de esta variante.';
COMMENT ON COLUMN public.factura.precio_unitario IS 'Precio vigente al momento de la compra. Congelado para historial correcto.';
COMMENT ON COLUMN public.factura.subtotal        IS 'cantidad × precio_unitario. Lo calcula trg_factura_subtotal.';


-- ----------------------------------------------------------------------------
--  devoluciones
-- ----------------------------------------------------------------------------
CREATE TABLE public.devoluciones (
  id_devolucion      SERIAL                    NOT NULL,
  id_pedido          INT                       NOT NULL,
  id_detalle_pedido  INT                       NOT NULL,
  motivo             TEXT                      NOT NULL,
  estado             public.estado_devolucion  NOT NULL DEFAULT 'solicitada',
  fecha_solicitud    TIMESTAMP                 NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_respuesta    TIMESTAMP                 DEFAULT NULL,   -- NULL válido: hasta que el admin responda
  CONSTRAINT pk_devoluciones        PRIMARY KEY (id_devolucion),
  CONSTRAINT fk_devolucion_pedido   FOREIGN KEY (id_pedido)
    REFERENCES public.pedidos (id_pedido),
  CONSTRAINT fk_devolucion_detalle  FOREIGN KEY (id_detalle_pedido)
    REFERENCES public.factura (id_detalle)
);

COMMENT ON TABLE  public.devoluciones                   IS 'Solicitudes de devolución o cambio por ítem específico de un pedido.';
COMMENT ON COLUMN public.devoluciones.id_devolucion     IS 'Identificador autoincremental de la solicitud.';
COMMENT ON COLUMN public.devoluciones.id_pedido         IS 'FK al pedido origen.';
COMMENT ON COLUMN public.devoluciones.id_detalle_pedido IS 'FK al ítem de factura que el cliente quiere devolver.';
COMMENT ON COLUMN public.devoluciones.motivo            IS 'Motivo del cliente (talla incorrecta, producto defectuoso, etc.).';
COMMENT ON COLUMN public.devoluciones.estado            IS 'Flujo: solicitada → aprobada/rechazada → procesada.';
COMMENT ON COLUMN public.devoluciones.fecha_solicitud   IS 'Fecha en que el cliente creó la solicitud.';
COMMENT ON COLUMN public.devoluciones.fecha_respuesta   IS 'Fecha de respuesta del administrador. NULL mientras esté pendiente.';


-- ----------------------------------------------------------------------------
--  movimientos_inventario
-- ----------------------------------------------------------------------------
CREATE TABLE public.movimientos_inventario (
  id_movimiento     SERIAL                  NOT NULL,
  id_stock          INT                     NOT NULL,
  tipo_movimiento   public.tipo_movimiento  NOT NULL,
  cantidad          INT                     NOT NULL,
  stock_anterior    INT                     NOT NULL,
  stock_nuevo       INT                     NOT NULL,
  motivo            VARCHAR(200)            NOT NULL DEFAULT '',
  id_pedido         INT                     DEFAULT NULL,   -- NULL válido: no todo movimiento viene de una venta
  numero_documento  VARCHAR(20)             NOT NULL,
  fecha_movimiento  TIMESTAMP               NOT NULL DEFAULT CURRENT_TIMESTAMP,
  notas             TEXT                    NOT NULL DEFAULT '',
  CONSTRAINT pk_movimientos_inventario PRIMARY KEY (id_movimiento),
  CONSTRAINT fk_movimiento_stock       FOREIGN KEY (id_stock)
    REFERENCES public.stock (id_stock),
  CONSTRAINT fk_movimiento_pedido      FOREIGN KEY (id_pedido)
    REFERENCES public.pedidos (id_pedido),
  CONSTRAINT fk_movimiento_usuario     FOREIGN KEY (numero_documento)
    REFERENCES public.usuarios (numero_documento)
);

COMMENT ON TABLE  public.movimientos_inventario                  IS 'Bitácora de auditoría de inventario. Registra cada cambio con antes/después, responsable y motivo.';
COMMENT ON COLUMN public.movimientos_inventario.id_movimiento    IS 'Identificador autoincremental del movimiento.';
COMMENT ON COLUMN public.movimientos_inventario.id_stock         IS 'FK a la variante de stock afectada.';
COMMENT ON COLUMN public.movimientos_inventario.tipo_movimiento  IS 'entrada, salida, ajuste o devolucion.';
COMMENT ON COLUMN public.movimientos_inventario.cantidad         IS 'Unidades afectadas (siempre positivo; dirección determinada por tipo_movimiento).';
COMMENT ON COLUMN public.movimientos_inventario.stock_anterior   IS 'Valor de stock_actual antes del movimiento.';
COMMENT ON COLUMN public.movimientos_inventario.stock_nuevo      IS 'Valor de stock_actual después del movimiento.';
COMMENT ON COLUMN public.movimientos_inventario.motivo           IS 'Descripción corta del motivo.';
COMMENT ON COLUMN public.movimientos_inventario.id_pedido        IS 'FK al pedido causante. NULL para ajustes manuales o entradas de proveedor.';
COMMENT ON COLUMN public.movimientos_inventario.numero_documento IS 'FK al usuario (admin u operador) que registró el movimiento.';
COMMENT ON COLUMN public.movimientos_inventario.fecha_movimiento IS 'Fecha y hora exacta del movimiento.';
COMMENT ON COLUMN public.movimientos_inventario.notas            IS 'Notas libres del operador de bodega.';


-- ----------------------------------------------------------------------------
--  favoritos
-- ----------------------------------------------------------------------------
CREATE TABLE public.favoritos (
  id_favorito       SERIAL       NOT NULL,
  numero_documento  VARCHAR(20)  NOT NULL,
  id_producto       INT          NOT NULL,
  fecha_agregado    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_favoritos          PRIMARY KEY (id_favorito),
  CONSTRAINT uc_favoritos          UNIQUE (numero_documento, id_producto),
  CONSTRAINT fk_favoritos_usuario  FOREIGN KEY (numero_documento)
    REFERENCES public.usuarios (numero_documento) ON DELETE CASCADE,
  CONSTRAINT fk_favoritos_producto FOREIGN KEY (id_producto)
    REFERENCES public.productos (id_producto) ON DELETE CASCADE
);

COMMENT ON TABLE  public.favoritos                  IS 'Lista de deseos: productos marcados como favoritos por el usuario.';
COMMENT ON COLUMN public.favoritos.id_favorito      IS 'Identificador autoincremental del favorito.';
COMMENT ON COLUMN public.favoritos.numero_documento IS 'FK al usuario propietario de la lista de deseos.';
COMMENT ON COLUMN public.favoritos.id_producto      IS 'FK al producto marcado como favorito.';
COMMENT ON COLUMN public.favoritos.fecha_agregado   IS 'Fecha en que el usuario añadió el producto a favoritos.';


-- ============================================================================
--  3. ÍNDICES
-- ============================================================================

CREATE INDEX idx_productos_categoria_genero ON public.productos USING btree (id_categoria, genero);


-- ============================================================================
--  4. FUNCIONES
--     search_path vacío + nombres calificados (recomendación de Supabase).
-- ============================================================================

-- ----------------------------------------------------------------------------
--  stock: estado calculado + fecha de actualización
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.fn_stock_estado_fecha()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = ''
AS $$
BEGIN
  NEW.estado := CASE
    WHEN NEW.stock_actual <= 0                THEN 'agotado'::public.estado_stock
    WHEN NEW.stock_actual <= NEW.stock_minimo THEN 'bajo'::public.estado_stock
    ELSE 'disponible'::public.estado_stock
  END;

  IF TG_OP = 'UPDATE' THEN
    NEW.fecha_actualizacion := CURRENT_TIMESTAMP;
  END IF;

  RETURN NEW;
END;
$$;

-- ----------------------------------------------------------------------------
--  pedidos: fecha de actualización + fecha de entrega
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.fn_pedidos_fechas()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = ''
AS $$
BEGIN
  NEW.fecha_actualizacion := CURRENT_TIMESTAMP;

  IF NEW.estado_pedido = 'entregado'
     AND OLD.estado_pedido IS DISTINCT FROM 'entregado'
     AND NEW.fecha_entregado IS NULL THEN
    NEW.fecha_entregado := CURRENT_TIMESTAMP;
  END IF;

  RETURN NEW;
END;
$$;

-- ----------------------------------------------------------------------------
--  factura: subtotal siempre consistente
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.fn_factura_subtotal()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = ''
AS $$
BEGIN
  NEW.subtotal := NEW.cantidad * NEW.precio_unitario;
  RETURN NEW;
END;
$$;

-- ----------------------------------------------------------------------------
--  productos.total_ventas: recálculo para un producto
--
--  Cuenta las unidades vendidas en pedidos NO cancelados. Es un recálculo
--  completo (no suma ni resta), así que nunca se desincroniza aunque un
--  trigger se dispare más de una vez.
--
--  La bandera velysh.recalculando_ventas le avisa al trigger protector que
--  este cambio sí está permitido. Solo se llama desde los triggers de
--  factura y pedidos (que corren como SECURITY DEFINER, ver abajo).
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.fn_recalcular_total_ventas(p_id_producto INT)
RETURNS void
LANGUAGE plpgsql
SET search_path = ''
AS $$
BEGIN
  PERFORM set_config('velysh.recalculando_ventas', 'on', true);

  UPDATE public.productos p
     SET total_ventas = COALESCE((
           SELECT SUM(f.cantidad)
             FROM public.factura f
             JOIN public.stock   s  ON s.id_stock   = f.id_stock
             JOIN public.pedidos pe ON pe.id_pedido = f.id_pedido
            WHERE s.id_producto     = p_id_producto
              AND pe.estado_pedido <> 'cancelado'
         ), 0)
   WHERE p.id_producto = p_id_producto;

  PERFORM set_config('velysh.recalculando_ventas', 'off', true);
END;
$$;

-- ----------------------------------------------------------------------------
--  factura → recalcula total_ventas del producto vendido
--
--  SECURITY DEFINER (aquí y en fn_pedidos_total_ventas): el recálculo corre
--  con permisos del dueño de las tablas, así funciona sin importar qué rol
--  hizo la compra (anon, authenticated o service_role) ni las reglas de RLS
--  sobre productos. Las funciones RETURNS trigger no se pueden llamar desde
--  la API, solo las dispara la base de datos.
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.fn_factura_total_ventas()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
DECLARE
  v_producto_nuevo INT;
  v_producto_viejo INT;
BEGIN
  IF TG_OP IN ('INSERT', 'UPDATE') THEN
    SELECT id_producto INTO v_producto_nuevo
      FROM public.stock WHERE id_stock = NEW.id_stock;
    PERFORM public.fn_recalcular_total_ventas(v_producto_nuevo);
  END IF;

  IF TG_OP IN ('UPDATE', 'DELETE') THEN
    SELECT id_producto INTO v_producto_viejo
      FROM public.stock WHERE id_stock = OLD.id_stock;
    IF v_producto_viejo IS DISTINCT FROM v_producto_nuevo THEN
      PERFORM public.fn_recalcular_total_ventas(v_producto_viejo);
    END IF;
  END IF;

  RETURN NULL;
END;
$$;

-- ----------------------------------------------------------------------------
--  pedidos → al cancelar (o reactivar) un pedido, recalcula sus productos
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.fn_pedidos_total_ventas()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
BEGIN
  PERFORM public.fn_recalcular_total_ventas(x.id_producto)
     FROM (SELECT DISTINCT s.id_producto
             FROM public.factura f
             JOIN public.stock s ON s.id_stock = f.id_stock
            WHERE f.id_pedido = NEW.id_pedido) x;

  RETURN NULL;
END;
$$;

-- ----------------------------------------------------------------------------
--  productos: total_ventas solo lo cambia fn_recalcular_total_ventas
--  (si el admin edita el producto y manda total_ventas, se ignora)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.fn_productos_proteger_total_ventas()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = ''
AS $$
BEGIN
  IF current_setting('velysh.recalculando_ventas', true) IS DISTINCT FROM 'on' THEN
    NEW.total_ventas := OLD.total_ventas;
  END IF;
  RETURN NEW;
END;
$$;

-- fn_recalcular_total_ventas no debe poder llamarse desde la API pública
-- (/rest/v1/rpc): solo la usan los triggers.
REVOKE EXECUTE ON FUNCTION public.fn_recalcular_total_ventas(INT) FROM PUBLIC;
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'anon') THEN
    EXECUTE 'REVOKE EXECUTE ON FUNCTION public.fn_recalcular_total_ventas(INT) FROM anon, authenticated';
  END IF;
END;
$$;


-- ============================================================================
--  5. TRIGGERS
-- ============================================================================

CREATE TRIGGER trg_stock_estado_fecha
  BEFORE INSERT OR UPDATE ON public.stock
  FOR EACH ROW EXECUTE FUNCTION public.fn_stock_estado_fecha();

CREATE TRIGGER trg_pedidos_fechas
  BEFORE UPDATE ON public.pedidos
  FOR EACH ROW EXECUTE FUNCTION public.fn_pedidos_fechas();

CREATE TRIGGER trg_factura_subtotal
  BEFORE INSERT OR UPDATE ON public.factura
  FOR EACH ROW EXECUTE FUNCTION public.fn_factura_subtotal();

CREATE TRIGGER trg_factura_total_ventas
  AFTER INSERT OR DELETE OR UPDATE OF id_stock, id_pedido, cantidad ON public.factura
  FOR EACH ROW EXECUTE FUNCTION public.fn_factura_total_ventas();

CREATE TRIGGER trg_pedidos_total_ventas
  AFTER UPDATE OF estado_pedido ON public.pedidos
  FOR EACH ROW
  WHEN ((OLD.estado_pedido = 'cancelado') IS DISTINCT FROM (NEW.estado_pedido = 'cancelado'))
  EXECUTE FUNCTION public.fn_pedidos_total_ventas();

CREATE TRIGGER trg_productos_proteger_total_ventas
  BEFORE UPDATE OF total_ventas ON public.productos
  FOR EACH ROW EXECUTE FUNCTION public.fn_productos_proteger_total_ventas();


-- ============================================================================
--  6. ROW LEVEL SECURITY
--     Activo en todas las tablas, sin políticas: la API pública (anon /
--     authenticated) no tiene acceso; los backends usan service_role.
-- ============================================================================

ALTER TABLE public.tipo_documento         ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.roles                  ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.usuarios               ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.direcciones            ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.categorias             ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.productos              ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.imagenes_producto      ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tallas                 ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.stock                  ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.pedidos                ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.factura                ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.devoluciones           ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.movimientos_inventario ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.favoritos              ENABLE ROW LEVEL SECURITY;

-- ============================================================================
--  FIN DEL SCRIPT
-- ============================================================================
