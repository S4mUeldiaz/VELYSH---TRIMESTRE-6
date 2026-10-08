--
-- PostgreSQL database dump
--

\restrict pO7MLAb1HB3NQgE4y0Vm7P5mBPhVZRAMMlp5y2sb9v3ZbnwjNwihHR0fS4grLGZ

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias (id_categoria, nombre_categoria, descripcion, estado, orden, fecha_creacion) VALUES (5, 'Deportivo', 'Calzado deportivo para running, entrenamiento y uso activo.', 'activo', 5, '2026-06-29 01:48:14.372518');
INSERT INTO public.categorias (id_categoria, nombre_categoria, descripcion, estado, orden, fecha_creacion) VALUES (6, 'Casual', 'Calzado para uso diario, cómodo y versátil.', 'activo', 6, '2026-06-29 01:48:14.372518');
INSERT INTO public.categorias (id_categoria, nombre_categoria, descripcion, estado, orden, fecha_creacion) VALUES (7, 'Formal', 'Calzado elegante para oficina y ocasiones especiales.', 'activo', 7, '2026-06-29 01:48:14.372518');
INSERT INTO public.categorias (id_categoria, nombre_categoria, descripcion, estado, orden, fecha_creacion) VALUES (8, 'Botas', 'Botas urbanas, outdoor y de seguridad.', 'activo', 8, '2026-06-29 01:48:14.372518');
INSERT INTO public.categorias (id_categoria, nombre_categoria, descripcion, estado, orden, fecha_creacion) VALUES (10, 'Sandalias', 'Calzado abierto para clima cálido y uso casual de descanso.', 'activo', 10, '2026-06-29 01:48:14.372518');
INSERT INTO public.categorias (id_categoria, nombre_categoria, descripcion, estado, orden, fecha_creacion) VALUES (11, 'Outdoor', 'Calzado para senderismo y actividades al aire libre.', 'activo', 11, '2026-06-29 01:48:14.372518');
INSERT INTO public.categorias (id_categoria, nombre_categoria, descripcion, estado, orden, fecha_creacion) VALUES (9, 'Tenis deportivos', 'Tenis para dama y caballero', 'activo', 2, '2026-06-29 01:48:14.372518');


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id_rol, nombre_rol, descripcion, fecha_creacion) VALUES (1, 'admin', 'Administrador con acceso total', '2026-06-05 19:43:22.052503');
INSERT INTO public.roles (id_rol, nombre_rol, descripcion, fecha_creacion) VALUES (2, 'cliente', 'Cliente de la tienda', '2026-06-05 19:43:22.052503');
INSERT INTO public.roles (id_rol, nombre_rol, descripcion, fecha_creacion) VALUES (3, 'operador', 'Operador de bodega', '2026-06-05 19:43:22.052503');


--
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_documento (id_tipo_documento, tipo, descripcion) VALUES (1, 'cedula', 'Cédula de ciudadanía');
INSERT INTO public.tipo_documento (id_tipo_documento, tipo, descripcion) VALUES (2, 'cedula_extranjeria', 'Cédula de extranjería');
INSERT INTO public.tipo_documento (id_tipo_documento, tipo, descripcion) VALUES (3, 'tarjeta_identidad', 'Tarjeta de identidad');
INSERT INTO public.tipo_documento (id_tipo_documento, tipo, descripcion) VALUES (4, 'pasaporte', 'Pasaporte');
INSERT INTO public.tipo_documento (id_tipo_documento, tipo, descripcion) VALUES (5, 'nit', 'NIT');


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('123456788', 1, 'Cristiano', 'Ronaldo', 'cristiano@gmail.com', '3267898763', '6d408065-ddcd-4662-be89-bd2eb765f3ed', 2, '2026-07-18 00:14:59.536619', '2026-07-18 00:15:06.973', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('123456789', 1, 'David', 'Diaz', 'david@gmail.com', '3134678635', '1f0bf707-9267-49e5-a21e-dc64e0740d4e', 2, '2026-06-20 20:20:51.849717', '2026-06-20 20:21:04.372', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('1016716924', 1, 'Stiven', 'Mejia', 'stiven@gmail.com', '3208536605', '7b22bf7e-1467-4072-a1ed-29c566f0abc9', 2, '2026-07-18 01:36:37.17826', '2026-07-18 01:36:55.775', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('123123123', 3, 'stiwi', 'Diaz', 'EJEMPLO@gmail.com', '1231231231', '5742793e-d61f-40f8-92d9-e8f08a028a8b', 2, '2026-09-09 02:57:36.704327', NULL, 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('123456234', 1, 'Santiago', 'Lopez', 'SantiagoLopez@gmail.com', '3241234543', 'be58d64d-67da-4c60-820a-0af5ea63bdf6', 2, '2026-09-09 03:17:02.687419', '2026-09-09 03:17:35.455', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('101245789', 1, 'javier', 'yara', 'javieryara@gmail.com', '3204578961', '29ad9399-b3cb-48b5-9a9c-b75d288e7c96', 2, '2026-06-22 20:48:43.903917', '2026-06-22 20:55:37.996', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('122222222', 2, 'camila', 'gonzales', 'cami@gmail.com', '3003334567', '28d3aaed-3ee3-4630-a9aa-af192ad54f31', 2, '2026-09-09 04:23:31.277809', NULL, 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('7836603', 1, 'angel', 'prieto', 'angel@gmail.com', '3221234566', 'c1665b28-b8e1-4c3f-94d4-38ed31e2d3fb', 2, '2026-06-23 19:51:09.91624', '2026-06-23 20:00:17.653', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('123456mmkk,', 1, 'Javier', '0000', 'javier2@gmail.com', '3217865483', '841a3794-5f16-4a81-a934-47ba0284a439', 2, '2026-09-03 22:23:58.808814', '2026-09-03 22:24:14.56', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('112345678', 1, 'javier', 'yara', 'javier@gmail.com', '3204578962', 'cbfb7daf-3807-4466-99f4-0ddf1e339b70', 2, '2026-06-22 20:47:55.282946', NULL, 'inactivo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('1140917009', 1, 'andres', 'villa', 'andres@gmail.com', '305', 'c7349915-ec55-4ead-8e56-8ede31df2b9f', 2, '2026-09-14 02:32:23.608929', '2026-09-14 02:44:14.606', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('1028840582', 4, 'laura', 'quintero', 'laura12@gmail.com', '3134339317', '45f63dae-ea00-4d50-91e9-dfd1e945981b', 2, '2026-09-10 02:44:03.171483', '2026-09-14 20:48:48.823', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('1023376410', 1, 'katherine', 'arias', 'kathearias@gmail.com', '3246352640', '08dd998e-a2cf-4798-ab1a-918fba5fd06d', 2, '2026-07-01 00:28:03.606442', '2026-07-01 19:45:31.609', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('123456781', 1, 'monica', 'forero', 'monica@gmail.com', '30000000', '6c0f23fd-9e57-40fb-ad64-5cd0aae8a34b', 2, '2026-07-01 19:54:05.030341', '2026-07-01 19:54:31.092', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('1111111111', 1, 'Admin', 'velysh', 'admin@gmail.com', '3001111111', 'aea98490-3e21-4073-9842-753f0834425d', 1, '2026-06-12 19:46:19.933744', '2026-09-22 20:46:29.195', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('1012360085580', 1, 'Santi', 'Prueba', 'pruebasanti@gmail.com', '300', '216a96cd-d8f4-4dc4-adf5-0bccff562a05', 2, '2026-09-15 20:41:03.514245', NULL, 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('1234567890', 1, 'Prueba', 'Móvil', 'pruebamovil@test.com', '3001234567', 'a49f5811-1343-49a1-bbcc-092d7e423aac', 2, '2026-09-09 02:33:03.314275', NULL, 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('1012360084', 1, 'Samueljr', 'arcila', 'samueljeronimodiazguerrero@gmail.com', '3204689732', '8bd7d822-83b1-499e-9b9b-0fcb5ad497e2', 2, '2026-06-20 06:48:56.634174', '2026-09-22 13:54:35.794', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('93481000', 1, 'Javier', 'Yara', 'javier@gmail.co', '3202364445', 'a79985ca-86f7-4756-9b2b-d4925d1c7474', 2, '2026-09-15 21:55:22.015768', '2026-09-15 21:56:31.49', 'activo', NULL);
INSERT INTO public.usuarios (numero_documento, id_tipo_documento, nombre, apellido, correo, telefono, password_hash, id_rol, fecha_registro, fecha_ultima_actividad, estado, url_foto_perfil) VALUES ('1012360083', 1, 'Samuel', 'antonio', 'samuel@gmail.com', '3133457863', '15ab42d5-fa00-495c-8bd7-80fe3b1cd84d', 2, '2026-06-12 04:57:46.403406', '2026-09-22 20:49:41.418', 'activo', 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/fotos-perfil/1012360083.jpg?v=1790048384810');


--
-- Data for Name: direcciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (6, '1012360083', 'Sena de la 30', 'Bogotá', 'Cundinamarca', '110112');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (7, '1012360083', 'prueba sena de la 30', 'Bogotá', 'Cundinamarca', '123456');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (8, '1012360083', 'wall street', 'Bogotá', 'Cundinamarca', '110731');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (9, '1012360083', 'Dg 69c Sur 78l12', 'Bogotá', 'Cundinamarca', '110731');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (10, '1012360083', 'wall street', 'Bogotá', 'Cundinamarca', '110731');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (11, '1012360083', 'calle 100', 'Bogotá', 'Cundinamarca', '110731');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (12, '1012360083', 'calle 100', 'Bogotá', 'Cundinamarca', '110731');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (13, '1012360083', 'wall street', 'Bogotá', 'Cundinamarca', '110731');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (14, '123456789', 'wall street', 'Bogotá', 'Cundinamarca', '110011');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (15, '101245789', 'sena', 'Bogotá', 'Cundinamarca', '110021');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (16, '7836603', 'sena', 'Bogotá', 'Cundinamarca', '1111145');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (17, '7836603', 'sena', 'Bogotá', 'Cundinamarca', '1111145');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (18, '1012360083', 'sena de la 30', 'Bogotá', 'Cundinamarca', '110112');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (19, '1012360083', 'sena de la 30', 'Bogotá', 'Cundinamarca', '110112');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (20, '1023376410', 'calle 65g #77 i 04', 'Bogotá', 'Cundinamarca', '123422');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (21, '123456mmkk,', 'ciudad', 'soacha', 'Cundinamarca', '11');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (22, '1012360083', 'aadadada', 'Bogotá', 'Cundinamarca', '1231');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (23, '1012360083', 'sdfsf', 'Bogotá', 'Cundinamarca', 'sdfsdf');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (24, '1012360083', 'sdfs', 'Bogotá', 'Cundinamarca', 'sdf');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (25, '1140917009', 'vtfyfvuy', 'cali', 'Cundinamarca', '222222');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (26, '1140917009', 'vtfyfvuy', 'cali', 'Cundinamarca', '222222');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (27, '1012360083', 'Casa de Samuel', 'Bogotá', 'Cundinamarca', '123456');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (28, '1012360083', 'Casa de Samuel', 'Bogotá', 'Cundinamarca', '123456');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (29, '93481000', 'sena', 'Bogotá', 'Cundinamarca', '010');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (30, '93481000', 'sena', 'Bogotá', 'Cundinamarca', '010');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (31, '1012360083', 'Bosa', 'Bogotá', 'Cundinamarca', '101107');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (32, '1012360083', 'bosa', 'Bogotá', 'Cundinamarca', '101236');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (33, '1012360083', 'adidas', 'Bogotá', 'Cundinamarca', '1231');
INSERT INTO public.direcciones (id_direccion, numero_documento, direccion, ciudad, departamento, codigo_postal) VALUES (34, '1012360083', 'sena', 'Bogotá', 'Cundinamarca', '0000');


--
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (27, '1012360083', 22, 'VLY-1788475018893', '2026-09-03 22:36:59.0136', NULL, '2026-09-03 22:39:01.023', 0.00, 1500000.00, 'tarjeta', 'pagado', 'entregado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (14, '1012360083', 9, 'VLY-1781930216584', '2026-06-20 04:36:56.59438', NULL, NULL, 0.00, 500000.00, 'tarjeta', 'pendiente', 'cancelado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (28, '1012360083', 23, 'VLY-1788557769822', '2026-09-04 21:36:08.520538', NULL, NULL, 0.00, 1092000.00, 'tarjeta', 'pagado', 'pendiente', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (17, '1012360083', 12, 'VLY-1781941500085', '2026-06-20 07:44:59.998357', NULL, '2026-06-20 07:50:13.017', 0.00, 1000000.00, 'tarjeta', 'pendiente', 'entregado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (29, '1012360083', 24, 'VLY-1788557789126', '2026-09-04 21:36:27.832045', NULL, NULL, 0.00, 600000.00, 'tarjeta', 'pagado', 'pendiente', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (16, '1012360083', 11, 'VLY-1781939936575', '2026-06-20 07:18:56.505101', NULL, '2026-06-20 08:02:50.682', 0.00, 1000000.00, 'tarjeta', 'pendiente', 'entregado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (15, '1012360083', 10, 'VLY-1781938788197', '2026-06-20 06:59:48.138298', NULL, NULL, 0.00, 600000.00, 'tarjeta', 'pendiente', 'confirmado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (18, '1012360083', 13, 'VLY-1781944036392', '2026-06-20 08:27:16.284813', NULL, NULL, 0.00, 600000.00, 'tarjeta', 'pagado', 'pendiente', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (19, '123456789', 14, 'VLY-1781986906666', '2026-06-20 20:21:45.382266', NULL, NULL, 0.00, 200000.00, 'tarjeta', 'pagado', 'pendiente', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (20, '101245789', 15, 'VLY-1782161395815', '2026-06-22 20:49:54.977306', NULL, '2026-06-22 20:55:54.514', 0.00, 400000.00, 'tarjeta', 'pagado', 'entregado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (31, '1140917009', 26, 'VLY-1789353490978', '2026-09-14 02:38:11.222686', NULL, '2026-09-14 02:44:50.941', 0.00, 500000.00, 'contraentrega', 'pagado', 'entregado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (30, '1140917009', 25, 'VLY-1789353487600', '2026-09-14 02:38:08.057925', NULL, '2026-09-14 02:45:03.753', 0.00, 480000.00, 'contraentrega', 'pagado', 'entregado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (22, '7836603', 17, 'VLY-1782244377770', '2026-06-23 19:52:57.859546', NULL, '2026-06-23 19:56:48.451', 0.00, 200000.00, 'contraentrega', 'pagado', 'entregado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (21, '7836603', 16, 'VLY-1782244375764', '2026-06-23 19:52:55.873537', NULL, '2026-06-23 19:57:07.653', 0.00, 200000.00, 'contraentrega', 'pagado', 'entregado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (23, '1012360083', 18, 'VLY-1782851705430', '2026-06-30 20:35:05.823917', NULL, NULL, 0.00, 200000.00, 'tarjeta', 'pagado', 'pendiente', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (24, '1012360083', 19, 'VLY-1782851706700', '2026-06-30 20:35:07.092135', NULL, NULL, 0.00, 1000000.00, 'tarjeta', 'pagado', 'pendiente', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (32, '1012360083', 27, 'MOV-1789450540304', '2026-09-15 05:35:36.383519', NULL, NULL, 0.00, 200000.00, 'tarjeta', 'pagado', 'pendiente', '2026-09-15 05:35:43.404');
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (33, '1012360083', 28, 'MOV-1789450542075', '2026-09-15 05:35:38.130333', NULL, NULL, 0.00, 1000000.00, 'tarjeta', 'pagado', 'pendiente', '2026-09-15 05:35:43.709');
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (25, '1023376410', 20, 'VLY-1782865829472', '2026-07-01 00:30:22.436573', NULL, '2026-07-01 00:36:21.101', 0.00, 200000.00, 'transferencia', 'pagado', 'entregado', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (26, '123456mmkk,', 21, 'VLY-1788474446151', '2026-09-03 22:27:26.256032', NULL, NULL, 0.00, 1000000.00, 'pse', 'pagado', 'pendiente', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (34, '93481000', 29, 'MOV-1789509445655', '2026-09-15 21:57:27.061652', NULL, NULL, 0.00, 400000.00, 'pse', 'pagado', 'pendiente', '2026-09-15 21:57:28.55');
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (35, '93481000', 30, 'MOV-1789509447370', '2026-09-15 21:57:28.753597', NULL, NULL, 0.00, 450000.00, 'pse', 'pagado', 'pendiente', '2026-09-15 21:57:28.819');
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (36, '1012360083', 31, 'MOV-1789845515256', '2026-09-19 19:18:33.574605', NULL, NULL, 0.00, 540000.00, 'contraentrega', 'pagado', 'pendiente', '2026-09-19 19:18:36.757');
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (37, '1012360083', 32, 'MOV-1789961578993', '2026-09-21 03:32:58.725935', NULL, NULL, 0.00, 500000.00, 'contraentrega', 'pagado', 'pendiente', '2026-09-21 03:33:00.483');
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (38, '1012360083', 33, 'VLY-1790052032034', '2026-09-22 04:40:30.904784', NULL, NULL, 0.00, 540000.00, 'tarjeta', 'pagado', 'pendiente', NULL);
INSERT INTO public.pedidos (id_pedido, numero_documento, id_direccion, referencia, fecha_pedido, fecha_estimada_entrega, fecha_entregado, costo_envio, precio_total, metodo_pago, estado_pago, estado_pedido, fecha_actualizacion) VALUES (39, '1012360083', 34, 'MOV-1790110120316', '2026-09-22 20:48:40.13651', NULL, NULL, 0.00, 500000.00, 'tarjeta', 'pagado', 'pendiente', '2026-09-22 20:48:42.024');


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (15, 5, 'VLY-DEP-005', 'Tenis HOOPS CLASSIC', 'Tenis inspirados en la herencia con suela tradicional de caucho para un estilo auténtico.', 'Adidas', 290000.00, 'activo', '2026-06-29 02:57:38.392489', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (23, 7, 'VLY-FML-001', 'Zapato negro formal hombre', 'Zapato de vestir estilo monk. Parte superior fabricada en piel. Ajuste mediante dos hebillas laterales.', 'Zara', 200000.00, 'activo', '2026-06-29 04:12:28.95331', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (12, 5, 'VLY-DEP-002', 'Tenis de Running Runfalcon', 'Incorporan una media suela con amortiguación Cloudfoam que te ofrece una pisada más cómoda y suave', 'Adidas', 280000.00, 'activo', '2026-06-29 02:27:41.986936', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (13, 5, 'VLY-DEP-003', 'Tenis de Running Supernova Ease', 'Estos tenis proporcionan una amortiguación suave y estable para transiciones fluidas. El exterior de malla ligera se adapta suavemente al pie, mientras que la lengüeta acolchada proporciona una sensación de ajuste y seguridad.', 'Adidas', 480000.00, 'activo', '2026-06-29 02:41:48.950186', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (14, 5, 'VLY-DEP-004', 'Tenis de Running Runfalcon', 'Diseñados para un rendimiento constante y diario, te acompañan en tus carreras matutinas y en las exigencias del día a día', 'Adidas', 300000.00, 'activo', '2026-06-29 02:50:51.312553', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (18, 6, 'VLY-CSL-002', 'Nike Air Max 90', 'Esta edición reinventa el lenguaje visual del futbol de principios de los 2000 con las líneas fluidas y los contrastes de color del diseño original.', 'Nike', 600000.00, 'activo', '2026-06-29 03:26:55.310136', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (19, 6, 'VLY-CSL-003', 'Nike Air Max', 'Esta marca de Nike es cómodo de usar debido a su respectivo modelo.', 'Nike', 599000.00, 'activo', '2026-06-29 03:33:18.964424', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (21, 6, 'VLY-CSL-005', 'Nike AL8', 'Un estilo robusto para ofrecer un look deportivo fácil de combinar.', 'Nike', 495000.00, 'activo', '2026-06-29 03:50:28.3679', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (22, 6, 'VLY-CSL-006', 'Nike Court Vision Low', 'Cordones de cinta y las cuentas les dan un look de lo más llamativo.', 'Nike', 460000.00, 'activo', '2026-06-29 04:01:53.731264', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (27, 7, 'VLY-FML-005', 'Zapato Formal ECCO', 'Su diseño elegante y moderno lo hace ideal para la oficina, eventos ejecutivos y ocasiones formales.', 'Ecco', 600000.00, 'activo', '2026-06-29 04:41:34.61192', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (28, 8, 'VLY-BTS-001', 'Timberland PRO', 'Diseñadas para trabajos duros y condiciones impredecibles, estas botas de trabajo impermeables combinan comodidad, durabilidad y protección para ayudarte a mantenerte en movimiento durante todo el día.', 'Timberland', 500000.00, 'activo', '2026-06-30 20:28:53.953729', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (10, 6, 'VLY-CSL-008', 'Adidas VL Court Bold', 'Los Adidas VL Court Bold para mujer destacan por su estilo urbano y su plataforma moderna que aporta altura sin sacrificar comodidad. Son ideales para complementar looks casuales y deportivos con un toque elegante.

Características:
• Diseño moderno con plataforma.
• Exterior resistente y fácil de limpiar.
• Plantilla acolchada para mayor confort.
• Suela de goma con excelente agarre.
• Perfectos para uso diario y salidas casuales.

Marca: Adidas.', 'Adidas', 360000.00, 'activo', '2026-06-20 04:54:54.31757', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (20, 6, 'VLY-CSL-004', 'Nike Gamma Force', 'Este calzado se inspira en la cultura del básquetbol tradicional para brindar comodidad y versatilidad.', 'Nike', 364000.00, 'activo', '2026-06-29 03:45:11.592928', 3, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (30, 8, 'VLY-BTS-004', 'Botas Timberland® Waterproof', 'Inspirado en nuestra bota impermeable original de 6 pulgadas, este estilo para todas las estaciones te ofrece un rendimiento impermeable incansable y un estilo de bota de trabajo reconocible al instante.', 'Timberland', 600000.00, 'activo', '2026-06-30 20:51:04.108561', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (32, 8, 'VLY-BTS-006', 'BOTAS PARA MUJER DAKOTA', 'Su diseño versátil las convierte en el complemento ideal tanto para un día en la ciudad como para una salida nocturna.', 'Fiorenzi', 360000.00, 'activo', '2026-06-30 21:00:06.002897', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (17, 6, 'VLY-CSL-001', 'Air Jordan 3 Retro ', 'Estos Jordan son perfectos para el dia a dia con su estilo clasico y comfortable', 'Nike', 500000.00, 'activo', '2026-06-29 03:20:52.135665', 2, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (25, 7, 'VLY-FML-003', 'Tacones para mujer elegante', 'elegante para oficina, eventos y ocasiones especiales.', 'Arturo calle', 130000.00, 'activo', '2026-06-29 04:25:36.038225', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (16, 5, 'VLY-DEP-006', 'Tenis de Entrenamiento Dropset', 'Tenis de entrenamiento de fuerza funcional para una estabilidad controlada.', 'Adidas', 600000.00, 'activo', '2026-06-29 03:07:37.070738', 1, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (33, 9, 'VLY-GUA-001', 'Puma Hombre Attacanto Firm', ' el zapato ofrece un ajuste estándar, asegurando una sensación cómoda y familiar para la mayoría.', 'Puma', 160000.00, 'activo', '2026-06-30 21:21:48.24564', 3, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (7, 8, ' VLY-BTS-003', ' Botas Urban Classic ', 'Los Tenis Urban Classic Hombre combinan estilo, comodidad y resistencia para acompañarte en cualquier ocasión. Fabricados con materiales de alta calidad, ofrecen un ajuste cómodo y una suela antideslizante que brinda seguridad en cada paso.

Características:
• Diseño casual y versátil.
• Material exterior resistente.
• Plantilla acolchada para mayor comodidad.
• Suela de goma antideslizante.
• Ideales para uso diario.

Perfectos para complementar cualquier look casual o urbano.', 'Reebook', 500000.00, 'activo', '2026-06-20 04:33:09.412124', 8, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (35, 11, 'VLY-OUT-002', 'Terrex Anylander', 'Desde caminatas cortas por el bosque hasta caminatas de un día largo, estos tenis de senderismo adidas Terrex ofrecen sujeción y comodidad en una amplia gama de senderos. ', 'Adidas', 380000.00, 'activo', '2026-06-30 21:42:09.303302', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (24, 7, 'VLY-FML-002', 'Zapato formal cuero', 'en cuero café con diseño clásico y cordones. Combina con trajes y pantalones de vestir.', 'Arturo calle', 280000.00, 'activo', '2026-06-29 04:21:11.324773', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (11, 5, 'VLY-DEP-001', 'Tenis de entrenamiento Control', 'Estos tenis de entrenamiento Adidas te ayudan a mantener los pies en la tierra cuando levantas cargas pesadas.', 'Adidas', 450000.00, 'activo', '2026-06-29 02:06:45.098023', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (26, 7, 'VLY-FML-004', 'Tacones para mujer beige', 'Resalta tu elegancia y estiliza tu figura en cualquier evento u ocasión con estos versátiles tacones para mujer.', 'Arturo calle', 190000.00, 'activo', '2026-06-29 04:34:59.75134', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (29, 8, 'VLY-BTS-002', 'Botas Timberland Mujer', ' Diseñadas para ofrecer confianza en cualquier condición meteorológica, cuentan con piel Timberland® Premium impermeable para mantener los pies secos', 'Timberland', 450000.00, 'activo', '2026-06-30 20:44:24.642009', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (31, 8, 'VLY-BTS-005', 'Botínes para mujer negros', 'Zapato tipo botín en piel. Tacón bajo en bloque. Cierre mediante cremallera lateral con tirador. Acabado en punta redonda.
', 'Zara', 400000.00, 'activo', '2026-06-30 20:57:28.619597', 0, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (34, 11, 'VLY-OUT-001', 'Terrex Agravic', 'Experimenta la velocidad como nunca antes. Los tenis Agravic Speed Ultra son una combinación de nuestra tecnología ganadora de carreras y nuestra experiencia outdoor, diseñados para correr rápido en distancias de ultra trail.', 'Adidas', 540000.00, 'activo', '2026-06-30 21:38:01.243128', 1, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (42, 7, 'VLY-FML-006', 'Mocasines formal hombre', 'Camina con prestancia y sofisticación luciendo este mocasín formal para hombre, ideal para complementar tus trajes ejecutivos de negocios o conjuntos elegantes de noche.', 'Arturo Calle', 270000.00, 'activo', '2026-09-19 17:34:38.853993', 0, 'hombre');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (9, 6, 'VLY-CLS-007', 'Adidas Grand Court', 'Los Adidas Grand Court para mujer combinan un estilo clásico inspirado en el tenis con la comodidad que necesitas para el día a día. Su diseño elegante y versátil los convierte en la opción ideal para complementar cualquier outfit casual.

Características:
• Exterior resistente y ligero.
• Plantilla acolchada para mayor confort.
• Suela de goma con excelente tracción.
• Diseño clásico Adidas con las tres franjas icónicas.
• Perfectos para uso diario y actividades casuales.

Color: Blanco con detalles negros.
Marca: Adidas.', 'Adidas', 200000.00, 'activo', '2026-06-20 04:49:07.981503', 15, 'mujer');
INSERT INTO public.productos (id_producto, id_categoria, referencia, nombre, descripcion, marca, precio, estado, fecha_creacion, total_ventas, genero) VALUES (43, 10, 'VLY-SAN-001', 'Sandalias negras', 'Sandalia fabricada con dos tiras en el empeine. Suela plana a tono.', 'Zara', 90000.00, 'activo', '2026-09-22 15:23:01.445313', 0, 'unisex');


--
-- Data for Name: tallas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tallas (id_talla, talla, orden) VALUES (1, '35', 1);
INSERT INTO public.tallas (id_talla, talla, orden) VALUES (2, '36', 2);
INSERT INTO public.tallas (id_talla, talla, orden) VALUES (3, '37', 3);
INSERT INTO public.tallas (id_talla, talla, orden) VALUES (4, '38', 4);
INSERT INTO public.tallas (id_talla, talla, orden) VALUES (5, '39', 5);
INSERT INTO public.tallas (id_talla, talla, orden) VALUES (6, '40', 6);
INSERT INTO public.tallas (id_talla, talla, orden) VALUES (7, '41', 7);
INSERT INTO public.tallas (id_talla, talla, orden) VALUES (8, '42', 8);
INSERT INTO public.tallas (id_talla, talla, orden) VALUES (9, '43', 9);
INSERT INTO public.tallas (id_talla, talla, orden) VALUES (11, '44', 10);


--
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (202, 42, 5, 'Negro', 6, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (205, 26, 2, 'beige', 8, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (208, 43, 3, 'negro', 7, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (77, 18, 3, 'amarillo', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (78, 18, 4, 'amarillo', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (79, 18, 3, 'gris', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (80, 18, 4, 'gris', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (19, 7, 7, 'azul', 9, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (17, 9, 1, 'rosado', 0, 5, 100, 'agotado', '', '2026-06-30 20:35:05.745');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (6, 7, 2, 'blanco', 2, 5, 100, 'bajo', '', '2026-06-30 20:35:07.014');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (23, 11, 2, 'blanco', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (28, 12, 1, 'rosado', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (29, 12, 2, 'rosado', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (30, 12, 3, 'rosado', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (31, 12, 1, 'blanco', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (33, 12, 3, 'blanco', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (35, 13, 2, 'blanco', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (36, 13, 3, 'blanco', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (38, 13, 2, 'cafe', 24, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (41, 13, 2, 'beige', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (39, 13, 3, 'cafe', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (45, 14, 5, 'blanco', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (48, 14, 5, 'azul', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (56, 16, 4, 'blanco', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (61, 16, 3, 'gris', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (64, 16, 3, 'morado', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (65, 16, 4, 'morado', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (68, 16, 5, 'morado', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (85, 19, 3, 'gris', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (86, 19, 4, 'gris', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (91, 20, 2, 'blanco', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (94, 21, 2, 'blanco', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (99, 22, 1, 'blanco', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (100, 22, 2, 'blanco', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (103, 23, 3, 'negro', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (105, 24, 3, 'cafe', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (106, 24, 4, 'cafe', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (108, 25, 2, 'negro', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (115, 27, 4, 'negro', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (117, 27, 4, 'cafe', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (118, 28, 3, 'negro', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (119, 28, 4, 'negro', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (14, 7, 1, 'blanco', 15, 5, 100, 'disponible', '', '2026-09-15 05:35:42.82');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (16, 7, 1, 'negro', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (20, 11, 6, 'negro', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (22, 11, 1, 'negro', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (25, 12, 1, 'negro', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (27, 12, 3, 'negro', 3, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (37, 13, 1, 'cafe', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (47, 14, 4, 'azul', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (49, 15, 3, 'negro', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (50, 15, 4, 'negro', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (51, 15, 5, 'negro', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (15, 7, 8, 'negro', 4, 5, 100, 'bajo', '', '2026-09-14 02:38:11.797');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (59, 16, 4, 'negro', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (60, 16, 5, 'negro', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (75, 18, 3, 'negro', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (76, 18, 4, 'negro', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (81, 19, 3, 'negro', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (82, 19, 4, 'negro', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (104, 23, 4, 'negro', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (107, 25, 1, 'negro', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (43, 14, 3, 'blanco', 14, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (40, 13, 1, 'beige', 12, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (42, 13, 3, 'beige', 2, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (34, 13, 1, 'blanco', 31, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (32, 12, 2, 'blanco', 13, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (46, 14, 3, 'azul', 11, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (55, 16, 3, 'blanco', 12, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (44, 14, 4, 'blanco', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (116, 27, 3, 'cafe', 1, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (62, 16, 4, 'gris', 0, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (57, 16, 5, 'blanco', 0, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (63, 16, 5, 'gris', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (24, 11, 3, 'blanco', 1, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (93, 21, 1, 'blanco', 3, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (89, 20, 1, 'blanco', 12, 5, 100, 'disponible', '', '2026-09-04 21:36:10.28');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (58, 16, 3, 'negro', 4, 5, 100, 'bajo', '', '2026-09-04 21:36:29.583');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (122, 28, 3, 'cafe', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (203, 42, 7, 'negro', 3, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (206, 26, 3, 'beige', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (123, 28, 4, 'cafe', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (124, 29, 1, 'gris', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (129, 30, 4, 'negro', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (130, 30, 3, 'amarillo', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (131, 30, 4, 'amarillo', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (132, 31, 1, 'negro', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (134, 32, 1, 'negro', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (135, 32, 2, 'negro', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (148, 35, 3, 'negro', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (150, 35, 3, 'cafe', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (151, 35, 4, 'cafe', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (154, 35, 3, 'azul', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (155, 35, 4, 'azul', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (156, 35, 3, 'verde', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (157, 35, 4, 'verde', 20, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (204, 42, 8, 'negro', 8, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (126, 29, 1, 'beige', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (127, 29, 2, 'beige', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (180, 17, 3, 'marfil', 9, 5, 100, 'disponible', '', '2026-09-21 03:32:59.881');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (136, 34, 3, 'blanco', 13, 5, 100, 'disponible', '', '2026-09-22 04:40:32.515');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (207, 43, 2, 'negro', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (168, 10, 1, 'blanco', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (169, 10, 2, 'blanco', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (170, 10, 1, 'negro', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (171, 10, 2, 'negro', 15, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (181, 17, 4, 'marfil', 14, 5, 100, 'disponible', '', '2026-09-22 20:48:41.436');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (174, 10, 1, 'azul', 8, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (175, 10, 2, 'azul', 8, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (176, 10, 1, 'beige', 9, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (177, 10, 2, 'beige', 9, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (18, 9, 2, 'azul', 1, 5, 100, 'agotado', '', '2026-07-01 00:30:29.964');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (26, 12, 2, 'negro', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (114, 27, 3, 'negro', 5, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (199, 15, 4, 'rojo', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (152, 35, 3, 'beige', 3, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (149, 35, 4, 'negro', 8, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (158, 35, 3, 'blanco', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (153, 35, 4, 'beige', 3, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (200, 15, 6, 'rojo', 7, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (128, 30, 3, 'negro', 0, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (159, 35, 4, 'blanco', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (165, 9, 2, 'blanco', 4, 5, 100, 'bajo', '', '2026-09-15 05:35:41.242');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (133, 31, 2, 'negro', 9, 5, 100, 'disponible', '', '2026-09-15 21:57:26.605');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (125, 29, 2, 'gris', 9, 5, 100, 'disponible', '', '2026-09-15 21:57:28.078');
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (193, 33, 6, 'azul', 10, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (194, 33, 7, 'azul', 8, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (195, 33, 6, 'rosado', 4, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (196, 33, 8, 'rosado', 8, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (197, 22, 2, 'negro', 7, 5, 100, 'disponible', '', NULL);
INSERT INTO public.stock (id_stock, id_producto, id_talla, color, stock_actual, stock_minimo, stock_maximo, estado, ubicacion_almacen, fecha_actualizacion) VALUES (198, 22, 3, 'negro', 2, 5, 100, 'disponible', '', NULL);


--
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (6, 15, 17, 3, 200000.00, 600000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (7, 16, 18, 5, 200000.00, 1000000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (9, 18, 17, 3, 200000.00, 600000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (10, 19, 18, 1, 200000.00, 200000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (11, 20, 18, 2, 200000.00, 400000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (12, 21, 17, 1, 200000.00, 200000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (13, 22, 18, 1, 200000.00, 200000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (14, 23, 17, 1, 200000.00, 200000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (15, 24, 6, 2, 500000.00, 1000000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (16, 25, 18, 1, 200000.00, 200000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (18, 27, 14, 3, 500000.00, 1500000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (19, 28, 89, 3, 364000.00, 1092000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (20, 29, 58, 1, 600000.00, 600000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (22, 31, 15, 1, 500000.00, 500000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (23, 32, 165, 1, 200000.00, 200000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (24, 33, 14, 2, 500000.00, 1000000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (25, 34, 133, 1, 400000.00, 400000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (26, 35, 125, 1, 450000.00, 450000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (27, 36, 136, 1, 540000.00, 540000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (28, 37, 180, 1, 500000.00, 500000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (29, 38, 136, 1, 540000.00, 540000.00);
INSERT INTO public.factura (id_detalle, id_pedido, id_stock, cantidad, precio_unitario, subtotal) VALUES (30, 39, 181, 1, 500000.00, 500000.00);


--
-- Data for Name: devoluciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.devoluciones (id_devolucion, id_pedido, id_detalle_pedido, motivo, estado, fecha_solicitud, fecha_respuesta) VALUES (3, 22, 13, 'no queria ese color ', 'rechazada', '2026-06-23 19:57:00.320589', '2026-06-23 19:57:51.281');


--
-- Data for Name: favoritos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.favoritos (id_favorito, numero_documento, id_producto, fecha_agregado) VALUES (11, '101245789', 9, '2026-06-22 20:50:43.413992');
INSERT INTO public.favoritos (id_favorito, numero_documento, id_producto, fecha_agregado) VALUES (23, '1023376410', 25, '2026-07-01 00:29:00.744673');
INSERT INTO public.favoritos (id_favorito, numero_documento, id_producto, fecha_agregado) VALUES (24, '1023376410', 7, '2026-07-01 19:00:04.64509');
INSERT INTO public.favoritos (id_favorito, numero_documento, id_producto, fecha_agregado) VALUES (29, '1140917009', 7, '2026-09-14 02:34:30.480041');
INSERT INTO public.favoritos (id_favorito, numero_documento, id_producto, fecha_agregado) VALUES (30, '1140917009', 20, '2026-09-14 02:34:38.183626');
INSERT INTO public.favoritos (id_favorito, numero_documento, id_producto, fecha_agregado) VALUES (43, '1012360083', 20, '2026-09-22 13:45:48.32485');
INSERT INTO public.favoritos (id_favorito, numero_documento, id_producto, fecha_agregado) VALUES (44, '1012360083', 33, '2026-09-22 13:45:49.487054');


--
-- Data for Name: imagenes_producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (48, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/azul/VL%20azul3.avif', 2, '2026-09-17 03:27:11.049857', 'azul');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (49, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/beige/VL%20beige1.avif', 0, '2026-09-17 03:27:50.872701', 'beige
');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (50, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/beige/VL%20beige2.avif', 1, '2026-09-17 03:28:08.32229', 'beige');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (52, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/blanco/VL%20blanco1.avif', 0, '2026-09-17 03:28:51.78739', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (53, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/blanco/VL%20blanco2.avif', 1, '2026-09-17 03:29:06.590984', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (54, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/blanco/VL%20blanco3.avif', 2, '2026-09-17 03:29:18.631894', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (57, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/negro/VL%20negro01.avif', 0, '2026-09-17 03:35:09.522833', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (58, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/negro/VL%20negro02.avif', 1, '2026-09-17 03:37:33.038923', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (7, 12, 'https://assets.adidas.com/images/w_500,f_auto,q_auto/8a6cd5ffec894cdbbb59fa0a14137376_9366/Tenis_de_Running_Runfalcon_5_Gris_JQ6300_00_plp_standard.jpg', 0, '2026-06-29 02:30:12.698171', NULL);
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (8, 13, 'https://assets.adidas.com/images/w_500,f_auto,q_auto/c2283975922a4d6e8239d293008fe768_9366/Tenis_de_Running_Supernova_Ease_2_Beige_KJ1839_00_plp_standard.jpg', 0, '2026-06-29 02:45:09.769617', NULL);
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (87, 19, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/19-%20Nike%20Air%20Max/gris/air%20max%20gris1.jpg', 0, '2026-09-19 06:07:44.26253', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (24, 20, 'https://nikeco.vtexassets.com/arquivos/ids/1051407-1200-auto?v=639126613739600000&width=1200&height=auto&aspect=true.jpg', 0, '2026-06-29 03:47:50.7985', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (26, 22, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/22-%20Nike%20Court%20Vision%20Low/blanco/court%20vision%20blanco1.webp', 0, '2026-06-29 04:02:29.97185', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (13, 14, 'https://assets.adidas.com/images/w_500,f_auto,q_auto/477fa9123c55462ba2ee66499b5806c9_9366/Tenis_de_Running_Runfalcon_6_Cloudfoam_Azul_KH5565_HM1.jpg', 0, '2026-06-29 02:53:28.746779', NULL);
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (14, 15, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/15-%20Tenis%20HOOPS%20CLASSIC/negro/hoops%20negro1.avif', 0, '2026-06-29 02:58:10.872786', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (29, 24, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/24-%20Zapato%20formal%20cuero/cafe/formal%20cafe1.webp', 0, '2026-06-29 04:22:10.462278', 'cafe');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (30, 25, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/25-%20TACONES%20PARA%20MUJER%20ELEGANTE/negro/tacones%20negros1.webp', 0, '2026-06-29 04:26:38.286997', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (36, 31, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/31-%20Botines%20para%20mujer%20negros/negro/botin%20negro1.jpg', 0, '2026-06-30 20:57:55.654474', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (32, 27, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/27-%20Zapato%20formal%20ECCO/negro/zapato%20ecco%20negro1.jpg', 0, '2026-06-29 04:43:16.014996', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (34, 29, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/29-%20Botas%20Timberland%20Mujer/gris/timberland%20gris1.avif', 0, '2026-06-30 20:46:29.874096', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (35, 30, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/30-%20Botas%20timberland%20waterproof/negro/timberland%20waterproof%20negro1.avif', 0, '2026-06-30 20:51:27.719018', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (40, 34, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/24-%20Terrex%20agravic/blanco/terrex%20agravic%20blanco1.avif', 0, '2026-06-30 21:38:59.110101', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (37, 32, 'https://www.fiorenzi.com.co/cdn/shop/files/DETALLECUADRADO_b1200754-cd67-46b1-b5d4-761d727b2f18.jpg?v=1777989967&width=600', 0, '2026-06-30 21:00:43.312555', NULL);
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (41, 35, 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/4b2b78d674db427493c536d864dc8bcb_9366/Tenis_de_Senderismo_Terrex_Anylander_Cafe_JQ9953_HM1.jpg', 0, '2026-06-30 21:42:26.960435', NULL);
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (3, 7, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/7-%20Botas%20urban%20classic/negro/Reebook%20negras.webp', 0, '2026-06-20 04:41:52.106702', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (16, 17, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/17-%20Air%20jordan%203%20retro/marfil/jordan%203%20marfil1.webp', 0, '2026-06-29 03:22:28.465525', 'marfil');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (42, 7, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/7-%20Botas%20urban%20classic/blanco/reebook%20blancas1.jpg', 0, '2026-09-16 20:26:44.712114', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (15, 16, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/16-%20Tenis%20de%20Entrenamiento%20Dropset/blanco/entrenamiento%20dropset%20blanco1.avif', 0, '2026-06-29 03:08:51.02666', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (46, 9, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/9-%20Adidas%20grand%20court/azul/court%20azul.avif', 0, '2026-09-17 03:11:37.202161', 'azul');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (59, 9, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/9-%20Adidas%20grand%20court/azul/court%20azul2.avif', 1, '2026-09-17 03:46:28.165649', 'azul');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (60, 9, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/9-%20Adidas%20grand%20court/azul/court%20azul3.avif', 2, '2026-09-17 03:46:46.102591', 'azul');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (4, 9, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/9-%20Adidas%20grand%20court/rosado/court%20rosada.avif', 0, '2026-06-20 04:51:34.008781', 'rosado');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (45, 7, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/7-%20Botas%20urban%20classic/azul/reebook%20azules2.webp', 0, '2026-09-16 20:47:29.296851', 'azul');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (5, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/azul/VL%20azul1.avif', 0, '2026-06-20 04:56:09.162446', 'azul');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (47, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/azul/VL%20azul2.avif', 1, '2026-09-17 03:26:51.776534', 'azul');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (51, 10, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/10-%20Adidas%20VL%20Court%20Bold/beige/VL%20beige3.avif', 2, '2026-09-17 03:28:28.130689', 'beige');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (6, 11, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/11-%20Tenis%20de%20entrenamiento%20Control/negro/adidas%20negro.webp', 0, '2026-06-29 02:09:45.411024', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (69, 20, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/20-%20Nike%20Gamma%20Force/blanco/nike%20gamma%20blanca1.webp', 0, '2026-09-19 02:45:04.536877', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (70, 20, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/20-%20Nike%20Gamma%20Force/blanco/nike%20gamme%20blanca2.webp', 1, '2026-09-19 02:45:25.503624', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (71, 17, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/17-%20Air%20jordan%203%20retro/marfil/jordan%203%20marfil2.webp', 1, '2026-09-19 05:32:14.180235', 'marfil');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (72, 17, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/17-%20Air%20jordan%203%20retro/marfil/jordan%203%20marfil3.webp', 2, '2026-09-19 05:32:31.690523', 'marfil');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (73, 16, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/16-%20Tenis%20de%20Entrenamiento%20Dropset/blanco/entrenamiento%20dropset%20blanco2.avif', 1, '2026-09-19 05:43:25.836736', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (74, 16, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/16-%20Tenis%20de%20Entrenamiento%20Dropset/gris/entrenamiento%20dropset%20gris1.avif', 0, '2026-09-19 05:43:37.266496', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (75, 16, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/16-%20Tenis%20de%20Entrenamiento%20Dropset/gris/entrenamiento%20dropset%20gris2.avif', 1, '2026-09-19 05:43:49.711456', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (76, 16, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/16-%20Tenis%20de%20Entrenamiento%20Dropset/morado/entrenamiento%20dropset%20morado1.avif', 0, '2026-09-19 05:44:01.943776', 'morado');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (77, 16, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/16-%20Tenis%20de%20Entrenamiento%20Dropset/morado/entrenamiento%20dropset%20morado2.avif', 1, '2026-09-19 05:44:12.08595', 'morado');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (78, 16, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/16-%20Tenis%20de%20Entrenamiento%20Dropset/negro/entrenamiento%20dropset%20negro1.avif', 0, '2026-09-19 05:44:51.87206', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (79, 16, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/16-%20Tenis%20de%20Entrenamiento%20Dropset/negro/entrenamiento%20dropset%20negro2.avif', 1, '2026-09-19 05:45:01.137682', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (63, 9, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/9-%20Adidas%20grand%20court/blanco/court%20blanco1.avif', 0, '2026-09-18 05:50:43.949714', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (64, 9, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/9-%20Adidas%20grand%20court/blanco/court%20blanco2.avif', 1, '2026-09-18 05:51:02.59671', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (61, 9, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/9-%20Adidas%20grand%20court/rosado/court%20rosado2.avif', 1, '2026-09-17 03:47:04.628494', 'rosado');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (62, 9, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/9-%20Adidas%20grand%20court/rosado/court%20rosado3.avif', 2, '2026-09-17 03:47:18.149875', 'rosado');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (65, 33, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/33-%20Puma%20Hombre%20Attacanto%20Firm/azul/puma%20guayos%20blancos1.avif', 0, '2026-09-19 02:26:17.643712', 'azul');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (66, 33, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/33-%20Puma%20Hombre%20Attacanto%20Firm/azul/puma%20guayos%20blancos2.avif', 1, '2026-09-19 02:26:33.87327', 'azul');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (67, 33, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/33-%20Puma%20Hombre%20Attacanto%20Firm/rosado/puma%20guayos%20rosado1.avif', 0, '2026-09-19 02:35:34.292282', 'rosado');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (68, 33, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/33-%20Puma%20Hombre%20Attacanto%20Firm/rosado/puma%20guayos%20rosado2.avif', 1, '2026-09-19 02:35:49.113893', 'rosado');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (22, 18, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/18-%20Nike%20Air%20Max%2090/negro/air%20max%2090%20negro1.webp', 0, '2026-06-29 03:41:40.040367', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (80, 18, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/18-%20Nike%20Air%20Max%2090/negro/air%20max%2090%20negro2.webp', 1, '2026-09-19 06:01:49.494395', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (81, 18, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/18-%20Nike%20Air%20Max%2090/amarillo/air%20max%2090%20amarillo1.webp', 0, '2026-09-19 06:02:03.296513', 'amarillo');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (82, 18, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/18-%20Nike%20Air%20Max%2090/amarillo/air%20max%2090%20amarillo2.webp', 1, '2026-09-19 06:02:15.142289', 'amarillo');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (83, 18, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/18-%20Nike%20Air%20Max%2090/amarillo/air%20max%2090%20amarillo3.jpg', 2, '2026-09-19 06:02:26.705378', 'amarillo');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (84, 18, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/18-%20Nike%20Air%20Max%2090/gris/air%20max%2090%20gris1.webp', 0, '2026-09-19 06:02:43.081425', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (85, 18, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/18-%20Nike%20Air%20Max%2090/gris/air%20max%2090%20gris2.webp', 1, '2026-09-19 06:02:54.808292', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (86, 18, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/18-%20Nike%20Air%20Max%2090/gris/air%20max%2090%20gris3.webp', 2, '2026-09-19 06:03:05.838966', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (88, 19, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/19-%20Nike%20Air%20Max/gris/air%20max%20gris2.jpg', 1, '2026-09-19 06:07:58.298783', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (89, 19, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/19-%20Nike%20Air%20Max/gris/air%20max%20gris3.jpg', 2, '2026-09-19 06:08:08.286994', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (90, 19, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/19-%20Nike%20Air%20Max/negro/air%20max%20negro1.webp', 0, '2026-09-19 06:08:23.66684', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (91, 19, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/19-%20Nike%20Air%20Max/negro/air%20max%20negro2.webp', 1, '2026-09-19 06:08:34.426414', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (92, 19, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/19-%20Nike%20Air%20Max/negro/air%20max%20negro3.jpg', 2, '2026-09-19 06:08:45.114012', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (25, 21, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/21-%20Nike%20AL8/blanco/AL8%20blanco1.webp', 0, '2026-06-29 03:51:02.370209', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (93, 21, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/21-%20Nike%20AL8/blanco/AL8%20blanco2.webp', 1, '2026-09-19 06:12:39.106387', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (94, 21, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/21-%20Nike%20AL8/blanco/AL8%20blanco3.webp', 2, '2026-09-19 06:12:49.486636', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (95, 21, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/21-%20Nike%20AL8/blanco/AL8%20blanco4.webp', 3, '2026-09-19 06:13:00.544892', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (96, 22, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/22-%20Nike%20Court%20Vision%20Low/blanco/court%20vision%20blanco2.webp', 1, '2026-09-19 06:17:42.460057', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (97, 22, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/22-%20Nike%20Court%20Vision%20Low/negro/court%20vision%20negro1.webp', 0, '2026-09-19 06:17:51.282268', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (98, 22, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/22-%20Nike%20Court%20Vision%20Low/negro/court%20vision%20negro2.webp', 1, '2026-09-19 06:18:09.407393', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (99, 22, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/22-%20Nike%20Court%20Vision%20Low/negro/court%20vision%20negro3.webp', 2, '2026-09-19 06:18:27.090277', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (100, 15, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/15-%20Tenis%20HOOPS%20CLASSIC/negro/hoops%20negro2.avif', 1, '2026-09-19 06:24:32.566499', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (101, 15, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/15-%20Tenis%20HOOPS%20CLASSIC/rojo/hoops%20rojo1.avif', 0, '2026-09-19 06:24:42.223641', 'rojo');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (102, 15, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/15-%20Tenis%20HOOPS%20CLASSIC/rojo/hoops%20rojo2.avif', 1, '2026-09-19 06:24:56.335442', 'rojo');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (103, 24, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/24-%20Zapato%20formal%20cuero/cafe/formal%20cafe2.webp', 1, '2026-09-19 17:18:19.686036', 'cafe');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (104, 24, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/24-%20Zapato%20formal%20cuero/cafe/formal%20cafe3.webp', 2, '2026-09-19 17:18:30.876307', 'cafe');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (105, 25, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/25-%20TACONES%20PARA%20MUJER%20ELEGANTE/negro/tacones%20negros2.webp', 1, '2026-09-19 17:27:26.698508', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (106, 25, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/25-%20TACONES%20PARA%20MUJER%20ELEGANTE/negro/tacones%20negros3.webp', 2, '2026-09-19 17:27:39.581461', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (109, 42, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/42-%20Mocasines%20formal%20hombre/negro/mocasines%20negro1.webp', 1, '2026-09-19 17:38:25.914627', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (110, 42, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/42-%20Mocasines%20formal%20hombre/negro/mocasines%20negro2.webp', 1, '2026-09-19 17:38:37.698665', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (117, 26, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/26-%20Tacones%20para%20mujer%20blancos/beige/tacones%20beige1.jpg', 0, '2026-09-19 17:47:59.933907', 'beige');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (118, 26, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/26-%20Tacones%20para%20mujer%20blancos/beige/tacones%20beige2.jpg', 1, '2026-09-19 17:48:09.170283', 'beige');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (119, 26, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/26-%20Tacones%20para%20mujer%20blancos/beige/tacones%20beige3.jpg', 2, '2026-09-19 17:48:19.02502', 'beige');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (120, 23, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/23-%20zapato%20negro%20formal%20hombre/negro/zapato%20formal%20negro1.jpg', 0, '2026-09-19 18:04:49.527384', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (121, 23, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/23-%20zapato%20negro%20formal%20hombre/negro/zapato%20formal%20negro2.jpg', 1, '2026-09-19 18:05:00.715621', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (122, 23, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/23-%20zapato%20negro%20formal%20hombre/negro/zapato%20formal%20negro3.jpg', 2, '2026-09-19 18:05:09.538606', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (123, 31, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/31-%20Botines%20para%20mujer%20negros/negro/botin%20negro2.jpg', 1, '2026-09-19 18:10:50.539836', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (124, 31, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/31-%20Botines%20para%20mujer%20negros/negro/botin%20negro3.jpg', 2, '2026-09-19 18:11:00.863366', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (125, 27, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/27-%20Zapato%20formal%20ECCO/negro/zapato%20ecco%20negro2.jpg', 1, '2026-09-19 18:18:32.891723', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (126, 27, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/27-%20Zapato%20formal%20ECCO/negro/zapato%20ecco%20negro3.jpg', 2, '2026-09-19 18:18:47.760453', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (127, 27, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/27-%20Zapato%20formal%20ECCO/cafe/zapato%20ecco%20cafe1.jpg', 0, '2026-09-19 18:21:03.471723', 'cafe');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (128, 27, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/27-%20Zapato%20formal%20ECCO/cafe/zapato%20ecco%20cafe2.jpg', 1, '2026-09-19 18:21:13.200997', 'cafe');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (129, 27, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/27-%20Zapato%20formal%20ECCO/cafe/zapato%20ecco%20cafe3.jpg', 2, '2026-09-19 18:21:22.89417', 'cafe');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (130, 28, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/28-%20timberland%20pro/cafe/timberland%20cafe1.avif', 0, '2026-09-19 19:00:25.468759', 'cafe');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (131, 28, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/28-%20timberland%20pro/cafe/timberland%20cafe2.avif', 1, '2026-09-19 19:00:35.98844', 'cafe');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (132, 28, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/28-%20timberland%20pro/cafe/timberland%20cafe3.avif', 2, '2026-09-19 19:00:46.439522', 'cafe');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (133, 28, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/28-%20timberland%20pro/negro/timberland%20negro1.avif', 0, '2026-09-19 19:01:02.839124', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (134, 28, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/28-%20timberland%20pro/negro/timberland%20negro2.avif', 1, '2026-09-19 19:01:20.428173', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (135, 28, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/28-%20timberland%20pro/negro/timberland%20negro3.avif', 2, '2026-09-19 19:01:29.761447', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (136, 29, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/29-%20Botas%20Timberland%20Mujer/gris/timberland%20gris2.avif', 1, '2026-09-19 19:06:28.419328', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (137, 29, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/29-%20Botas%20Timberland%20Mujer/gris/timberland%20gris3.avif', 2, '2026-09-19 19:06:37.178403', 'gris');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (138, 29, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/29-%20Botas%20Timberland%20Mujer/beige/timberland%20beige1.avif', 0, '2026-09-19 19:07:16.924735', 'beige');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (139, 29, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/29-%20Botas%20Timberland%20Mujer/beige/timberland%20beige2.avif', 1, '2026-09-19 19:07:30.031929', 'beige');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (140, 29, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/29-%20Botas%20Timberland%20Mujer/beige/timberland%20beige3.avif', 2, '2026-09-19 19:07:39.287516', 'beige');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (141, 30, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/30-%20Botas%20timberland%20waterproof/negro/timberland%20waterproof%20negro2.avif', 1, '2026-09-19 19:11:16.77616', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (142, 30, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/30-%20Botas%20timberland%20waterproof/negro/timberland%20waterproof%20negro3.avif', 2, '2026-09-19 19:11:25.48998', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (143, 30, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/30-%20Botas%20timberland%20waterproof/amarillo/timberland%20waterproof%20amarillo1.avif', 0, '2026-09-19 19:11:36.863413', 'amarillo');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (144, 30, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/30-%20Botas%20timberland%20waterproof/amarillo/timberland%20waterproof%20amarillo2.avif', 1, '2026-09-19 19:11:45.398537', 'amarillo');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (145, 30, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/30-%20Botas%20timberland%20waterproof/amarillo/timberland%20waterproof%20amarillo3.avif', 2, '2026-09-19 19:11:53.602888', 'amarillo');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (146, 34, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/24-%20Terrex%20agravic/blanco/terrex%20agravic%20blanco2.avif', 1, '2026-09-19 19:17:24.193993', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (147, 34, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/24-%20Terrex%20agravic/blanco/terrex%20agravic%20blanco3.avif', 2, '2026-09-19 19:17:34.118923', 'blanco');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (148, 43, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/43-%20Sandalias%20negras/negro/sandalias%20negras1.jpg', 0, '2026-09-22 15:26:15.65963', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (149, 43, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/43-%20Sandalias%20negras/negro/sandalias%20negras2.jpg', 1, '2026-09-22 15:26:24.124116', 'negro');
INSERT INTO public.imagenes_producto (id_imagen, id_producto, url_imagen, orden, fecha_subida, color) VALUES (150, 43, 'https://ismgmavxqmfenfgovrzt.supabase.co/storage/v1/object/public/productos-imagenes/43-%20Sandalias%20negras/negro/sandalias%20negras3.jpg', 2, '2026-09-22 15:26:31.673222', 'negro');


--
-- Data for Name: movimientos_inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movimientos_inventario (id_movimiento, id_stock, tipo_movimiento, cantidad, stock_anterior, stock_nuevo, motivo, id_pedido, numero_documento, fecha_movimiento, notas) VALUES (1, 165, 'salida', 1, 5, 4, 'Venta - pedido MOV-1789450540304', 32, '1012360083', '2026-09-15 05:35:37.533666', '');
INSERT INTO public.movimientos_inventario (id_movimiento, id_stock, tipo_movimiento, cantidad, stock_anterior, stock_nuevo, motivo, id_pedido, numero_documento, fecha_movimiento, notas) VALUES (2, 14, 'salida', 2, 17, 15, 'Venta - pedido MOV-1789450542075', 33, '1012360083', '2026-09-15 05:35:39.130701', '');
INSERT INTO public.movimientos_inventario (id_movimiento, id_stock, tipo_movimiento, cantidad, stock_anterior, stock_nuevo, motivo, id_pedido, numero_documento, fecha_movimiento, notas) VALUES (3, 133, 'salida', 1, 10, 9, 'Venta - pedido MOV-1789509445655', 34, '93481000', '2026-09-15 21:57:28.18213', '');
INSERT INTO public.movimientos_inventario (id_movimiento, id_stock, tipo_movimiento, cantidad, stock_anterior, stock_nuevo, motivo, id_pedido, numero_documento, fecha_movimiento, notas) VALUES (4, 125, 'salida', 1, 10, 9, 'Venta - pedido MOV-1789509447370', 35, '93481000', '2026-09-15 21:57:29.652507', '');
INSERT INTO public.movimientos_inventario (id_movimiento, id_stock, tipo_movimiento, cantidad, stock_anterior, stock_nuevo, motivo, id_pedido, numero_documento, fecha_movimiento, notas) VALUES (5, 136, 'salida', 1, 15, 14, 'Venta - pedido MOV-1789845515256', 36, '1012360083', '2026-09-19 19:18:34.724615', '');
INSERT INTO public.movimientos_inventario (id_movimiento, id_stock, tipo_movimiento, cantidad, stock_anterior, stock_nuevo, motivo, id_pedido, numero_documento, fecha_movimiento, notas) VALUES (6, 180, 'salida', 1, 10, 9, 'Venta - pedido MOV-1789961578993', 37, '1012360083', '2026-09-21 03:32:59.855045', '');
INSERT INTO public.movimientos_inventario (id_movimiento, id_stock, tipo_movimiento, cantidad, stock_anterior, stock_nuevo, motivo, id_pedido, numero_documento, fecha_movimiento, notas) VALUES (7, 181, 'salida', 1, 15, 14, 'Venta - pedido MOV-1790110120316', 39, '1012360083', '2026-09-22 20:48:41.542041', '');


--
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 12, true);


--
-- Name: devoluciones_id_devolucion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devoluciones_id_devolucion_seq', 3, true);


--
-- Name: direcciones_id_direccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.direcciones_id_direccion_seq', 34, true);


--
-- Name: factura_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factura_id_detalle_seq', 30, true);


--
-- Name: favoritos_id_favorito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favoritos_id_favorito_seq', 45, true);


--
-- Name: imagenes_producto_id_imagen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagenes_producto_id_imagen_seq', 150, true);


--
-- Name: movimientos_inventario_id_movimiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimientos_inventario_id_movimiento_seq', 7, true);


--
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_pedido_seq', 39, true);


--
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 43, true);


--
-- Name: roles_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_rol_seq', 3, true);


--
-- Name: stock_id_stock_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_id_stock_seq', 208, true);


--
-- Name: tallas_id_talla_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tallas_id_talla_seq', 11, true);


--
-- Name: tipo_documento_id_tipo_documento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_documento_id_tipo_documento_seq', 7, true);


--
-- PostgreSQL database dump complete
--

\unrestrict pO7MLAb1HB3NQgE4y0Vm7P5mBPhVZRAMMlp5y2sb9v3ZbnwjNwihHR0fS4grLGZ

