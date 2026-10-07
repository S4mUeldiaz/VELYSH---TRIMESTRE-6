-- Table order and constraints may not be valid for execution.

--- tabla de tipo de documento ---
CREATE TABLE public.tipo_documento (
  id_tipo_documento integer NOT NULL DEFAULT nextval('tipo_documento_id_tipo_documento_seq'::regclass),
  tipo USER-DEFINED NOT NULL UNIQUE,
  descripcion text NOT NULL DEFAULT ''::text,
  CONSTRAINT tipo_documento_pkey PRIMARY KEY (id_tipo_documento)
);

--- tabla de roles ---
CREATE TABLE public.roles (
  id_rol integer NOT NULL DEFAULT nextval('roles_id_rol_seq'::regclass),
  nombre_rol character varying NOT NULL UNIQUE,
  descripcion text NOT NULL DEFAULT ''::text,
  fecha_creacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT roles_pkey PRIMARY KEY (id_rol)
);

--- tabla de usuarios ----
CREATE TABLE public.usuarios (
  numero_documento character varying NOT NULL,
  id_tipo_documento integer NOT NULL,
  nombre character varying NOT NULL,
  apellido character varying NOT NULL,
  correo character varying NOT NULL UNIQUE,
  telefono character varying NOT NULL UNIQUE,
  password_hash character varying NOT NULL,
  id_rol integer NOT NULL,
  fecha_registro timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_ultima_actividad timestamp without time zone,
  estado USER-DEFINED NOT NULL DEFAULT 'activo'::estado_usuario,
  url_foto_perfil text,
  CONSTRAINT usuarios_pkey PRIMARY KEY (numero_documento),
  CONSTRAINT fk_usuarios_tipo_doc FOREIGN KEY (id_tipo_documento) REFERENCES public.tipo_documento(id_tipo_documento),
  CONSTRAINT fk_usuarios_rol FOREIGN KEY (id_rol) REFERENCES public.roles(id_rol)
);

--- tabla de direcciones ----
CREATE TABLE public.direcciones (
  id_direccion integer NOT NULL DEFAULT nextval('direcciones_id_direccion_seq'::regclass),
  numero_documento character varying NOT NULL,
  direccion character varying NOT NULL,
  ciudad character varying NOT NULL DEFAULT 'Bogotá'::character varying,
  departamento character varying NOT NULL DEFAULT 'Cundinamarca'::character varying,
  codigo_postal character varying NOT NULL DEFAULT ''::character varying,
  CONSTRAINT direcciones_pkey PRIMARY KEY (id_direccion),
  CONSTRAINT fk_direcciones_usuario FOREIGN KEY (numero_documento) REFERENCES public.usuarios(numero_documento)
);

---- tabla de categorias ---
CREATE TABLE public.categorias (
  id_categoria integer NOT NULL DEFAULT nextval('categorias_id_categoria_seq'::regclass),
  nombre_categoria character varying NOT NULL UNIQUE,
  descripcion text NOT NULL DEFAULT ''::text,
  estado USER-DEFINED NOT NULL DEFAULT 'activo'::estado_general,
  orden integer NOT NULL DEFAULT 0,
  fecha_creacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria)
);

----tabla de productos ----
CREATE TABLE public.productos (
  id_producto integer NOT NULL DEFAULT nextval('productos_id_producto_seq'::regclass),
  id_categoria integer NOT NULL,
  referencia character varying NOT NULL UNIQUE,
  nombre character varying NOT NULL,
  descripcion text NOT NULL DEFAULT ''::text,
  marca character varying NOT NULL DEFAULT 'VELYSH'::character varying,
  precio numeric NOT NULL,
  estado USER-DEFINED NOT NULL DEFAULT 'activo'::estado_producto,
  fecha_creacion timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  total_ventas integer NOT NULL DEFAULT 0,
  genero USER-DEFINED NOT NULL DEFAULT 'unisex'::genero_tipo,
  CONSTRAINT productos_pkey PRIMARY KEY (id_producto),
  CONSTRAINT fk_productos_categoria FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria)
);

--- tabla de imagenes_productos ----
CREATE TABLE public.imagenes_producto (
  id_imagen integer NOT NULL DEFAULT nextval('imagenes_producto_id_imagen_seq'::regclass),
  id_producto integer NOT NULL,
  url_imagen character varying NOT NULL,
  orden integer NOT NULL DEFAULT 0,
  fecha_subida timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  color text,
  CONSTRAINT imagenes_producto_pkey PRIMARY KEY (id_imagen),
  CONSTRAINT fk_imagenes_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto)
);

---- tabla de tallas ---
CREATE TABLE public.tallas (
  id_talla integer NOT NULL DEFAULT nextval('tallas_id_talla_seq'::regclass),
  talla character varying NOT NULL UNIQUE,
  orden integer NOT NULL DEFAULT 0,
  CONSTRAINT tallas_pkey PRIMARY KEY (id_talla)
);

---- tabla de stock ----
CREATE TABLE public.stock (
  id_stock integer NOT NULL DEFAULT nextval('stock_id_stock_seq'::regclass),
  id_producto integer NOT NULL,
  id_talla integer NOT NULL,
  color character varying NOT NULL,
  stock_actual integer NOT NULL DEFAULT 0,
  stock_minimo integer NOT NULL DEFAULT 5,
  stock_maximo integer NOT NULL DEFAULT 100,
  estado USER-DEFINED NOT NULL DEFAULT 'disponible'::estado_stock,
  ubicacion_almacen character varying NOT NULL DEFAULT ''::character varying,
  fecha_actualizacion timestamp without time zone,
  CONSTRAINT stock_pkey PRIMARY KEY (id_stock),
  CONSTRAINT fk_stock_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto),
  CONSTRAINT fk_stock_talla FOREIGN KEY (id_talla) REFERENCES public.tallas(id_talla)
);

--- tabla de pedidos ---
CREATE TABLE public.pedidos (
  id_pedido integer NOT NULL DEFAULT nextval('pedidos_id_pedido_seq'::regclass),
  numero_documento character varying NOT NULL,
  id_direccion integer NOT NULL,
  referencia character varying NOT NULL UNIQUE,
  fecha_pedido timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_estimada_entrega date,
  fecha_entregado timestamp without time zone,
  costo_envio numeric NOT NULL DEFAULT 0,
  precio_total numeric NOT NULL,
  metodo_pago USER-DEFINED NOT NULL,
  estado_pago USER-DEFINED NOT NULL DEFAULT 'pendiente'::estado_pago_tipo,
  estado_pedido USER-DEFINED NOT NULL DEFAULT 'pendiente'::estado_pedido_tipo,
  fecha_actualizacion timestamp without time zone,
  CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido),
  CONSTRAINT fk_pedidos_usuario FOREIGN KEY (numero_documento) REFERENCES public.usuarios(numero_documento),
  CONSTRAINT fk_pedidos_direccion FOREIGN KEY (id_direccion) REFERENCES public.direcciones(id_direccion)
);

--- tabla de factura ---
CREATE TABLE public.factura (
  id_detalle integer NOT NULL DEFAULT nextval('factura_id_detalle_seq'::regclass),
  id_pedido integer NOT NULL,
  id_stock integer NOT NULL,
  cantidad integer NOT NULL,
  precio_unitario numeric NOT NULL,
  subtotal numeric NOT NULL,
  CONSTRAINT factura_pkey PRIMARY KEY (id_detalle),
  CONSTRAINT fk_detalle_pedido FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido),
  CONSTRAINT fk_detalle_stock FOREIGN KEY (id_stock) REFERENCES public.stock(id_stock)
);

---- tabla de devoluciones ----
CREATE TABLE public.devoluciones (
  id_devolucion integer NOT NULL DEFAULT nextval('devoluciones_id_devolucion_seq'::regclass),
  id_pedido integer NOT NULL,
  id_detalle_pedido integer NOT NULL,
  motivo text NOT NULL,
  estado USER-DEFINED NOT NULL DEFAULT 'solicitada'::estado_devolucion,
  fecha_solicitud timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_respuesta timestamp without time zone,
  CONSTRAINT devoluciones_pkey PRIMARY KEY (id_devolucion),
  CONSTRAINT fk_devolucion_pedido FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido),
  CONSTRAINT fk_devolucion_detalle FOREIGN KEY (id_detalle_pedido) REFERENCES public.factura(id_detalle)
);

--- tabla de movimientos_inventario ----
CREATE TABLE public.movimientos_inventario (
  id_movimiento integer NOT NULL DEFAULT nextval('movimientos_inventario_id_movimiento_seq'::regclass),
  id_stock integer NOT NULL,
  tipo_movimiento USER-DEFINED NOT NULL,
  cantidad integer NOT NULL,
  stock_anterior integer NOT NULL,
  stock_nuevo integer NOT NULL,
  motivo character varying NOT NULL DEFAULT ''::character varying,
  id_pedido integer,
  numero_documento character varying NOT NULL,
  fecha_movimiento timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  notas text NOT NULL DEFAULT ''::text,
  CONSTRAINT movimientos_inventario_pkey PRIMARY KEY (id_movimiento),
  CONSTRAINT fk_movimiento_stock FOREIGN KEY (id_stock) REFERENCES public.stock(id_stock),
  CONSTRAINT fk_movimiento_pedido FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido),
  CONSTRAINT fk_movimiento_usuario FOREIGN KEY (numero_documento) REFERENCES public.usuarios(numero_documento)
);

---- tabla de favoritos ---
CREATE TABLE public.favoritos (
  id_favorito integer NOT NULL DEFAULT nextval('favoritos_id_favorito_seq'::regclass),
  numero_documento character varying NOT NULL,
  id_producto integer NOT NULL,
  fecha_agregado timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT favoritos_pkey PRIMARY KEY (id_favorito),
  CONSTRAINT fk_favoritos_usuario FOREIGN KEY (numero_documento) REFERENCES public.usuarios(numero_documento),
  CONSTRAINT fk_favoritos_producto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto)
);