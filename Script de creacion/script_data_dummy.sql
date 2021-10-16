select * from usuario;
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (1, 'ADMINISTRADOR'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (2, 'CLIENTE_EXTERNO'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (3, 'CLIENTE_LOCAL'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (4, 'CLIENTE_INTERNO'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (5, 'CONSULTOR'); 
INSERT INTO pais  (id_pais, nombre) VALUES (1, 'CHILE'); 

delete from usuario;
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (1,1,1, 'admin', 'admin', 'admin', 'admin@admin.com', 'admin', 12345678, 'K', 'La calle del administrador', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (2,1,2, 'clienteexterno', 'clienteexterno', 'clienteexterno', 'clienteexterno@clienteexterno.com', 'clienteexterno', 12345679, 'K', 'La calle del clienteexterno', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (3,1,3, 'clientelocal', 'clientelocal', 'clientelocal', 'clientelocal@clientelocal.com', 'clientelocal', 12345671, 'K', 'La calle del clientelocal', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (4,1,4, 'clienteinterno', 'clienteinterno', 'clienteinterno', 'clienteinterno@clienteinterno.com', 'clienteinterno', 12345671, 'k', 'La calle del clienteinterno', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (5,1,5, 'consultor', 'consultor', 'consultor', 'consultor@consultor.com', 'consultor', 12345672, 'K', 'La calle del consultor', 343434, 94986612);

INSERT INTO estado_contrato(id_estado_contrato, estado) VALUES (1, 'ACTIVO');
INSERT INTO contrato (id_contrato, descripcion, fecha_emision, fecha_expiracion, firmas, id_estado_contrato) 
VALUES (1, 'descripcion de contrato', SYSDATE, SYSDATE,1,1);

INSERT INTO productor ( id_productor, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono, id_contrato) 
VALUES (1, 'productor1', 'productor1', 'productor1', 'productor@productor.com', 'productor', 12345672, 'k', 'La calle del productor', 343434, 94986612,1);
INSERT INTO  transportista (ID_TRANSPORTISTA, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO) 
VALUES (1, 'transportista1', 'transportista', 'transportista', 'transportista@transportista.com', 'transportista', 21211222, 'k', 'La calle del transportista',  966612, 546456);

-- ##################################################################################################
-- TIPO SOLICITUD
INSERT INTO TIPO_SOLICITUD (ID_TIPO_SOLICITUD, DESCRIPCION) VALUES (1, 'SOLICITUD SALDOS');
INSERT INTO TIPO_SOLICITUD (ID_TIPO_SOLICITUD, DESCRIPCION) VALUES (2, 'SOLICITUD CON PRODUCTOR');
-- ESTADOS DE SOLICITUD
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (0, 'SOLICITUD INICIADA');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (1, 'SOLICITUD RECHAZADA');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (2, 'SOLICITUD ACEPTADA');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (3, 'BUSCANDO PRODUCTOR');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (4, 'SUBASTANDO TRANSPORTE');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (5, 'COTIZACION CLIENTE');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (6, 'SOLICITUD CERRADA');
-- CALIDAD
INSERT INTO CALIDAD (ID_CALIDAD, CALIDAD) VALUES (1,'NORMAL');
INSERT INTO CALIDAD (ID_CALIDAD, CALIDAD) VALUES (2,'PREMIUM');
-- CATEGORIA DE FRUTA
INSERT INTO CATEGORIA_FRUTA (ID_CATEGORIA_FRUTA, CATEGORIA) VALUES (1,'DULCES');
INSERT INTO CATEGORIA_FRUTA (ID_CATEGORIA_FRUTA, CATEGORIA) VALUES (2,'SEMI DULCES');
INSERT INTO CATEGORIA_FRUTA (ID_CATEGORIA_FRUTA, CATEGORIA) VALUES (3,'ACIDAS');
INSERT INTO CATEGORIA_FRUTA (ID_CATEGORIA_FRUTA, CATEGORIA) VALUES (4,'SEMI ACIDAS');
INSERT INTO CATEGORIA_FRUTA (ID_CATEGORIA_FRUTA, CATEGORIA) VALUES (5,'NEUTRAS');
-- FRUTA
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (1, 1, 'Cereza');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (2, 2, 'Mango');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (3, 3, 'Limon');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (4, 4, 'Mandarina');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (5, 5, 'Palta');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (6, 1, 'Manzana');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (7, 2, 'Uva');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (8, 3, 'Naranja');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (9, 4, 'Durazno');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (10, 5, 'Coco');
-- ##################################################################################################
-- NUEVA SOLICITUD 1
INSERT INTO SOLICITUD (ID_USUARIO,ID_TIPO_SOLICITUD, ID_ESTADO_SOLICITUD, ID_SOLICITUD, PRODUCTOR_SELECCIONADO, FECHA_PUBLICACION) 
VALUES (2,2,0,1,NULL,SYSDATE);
-- DETALLE SOLICITUD 1
INSERT INTO DETALLE_SOLICITUD (ID_DETALLE_SOLICITUD,ID_SOLICITUD, ID_FRUTA, ID_CALIDAD, KILOS) VALUES (1,1,1,2,100);
INSERT INTO DETALLE_SOLICITUD (ID_DETALLE_SOLICITUD,ID_SOLICITUD, ID_FRUTA, ID_CALIDAD, KILOS) VALUES (2,1,2,2,200);
-- ##################################################################################################
-- ##################################################################################################
-- NUEVA SOLICITUD 2
INSERT INTO SOLICITUD (ID_USUARIO,ID_TIPO_SOLICITUD, ID_ESTADO_SOLICITUD, ID_SOLICITUD, PRODUCTOR_SELECCIONADO, FECHA_PUBLICACION) 
VALUES (3,2,0,2,NULL,SYSDATE);
-- DETALLE SOLICITUD 2
INSERT INTO DETALLE_SOLICITUD (ID_DETALLE_SOLICITUD,ID_SOLICITUD, ID_FRUTA, ID_CALIDAD, KILOS) VALUES (3,2,5,1,100);
INSERT INTO DETALLE_SOLICITUD (ID_DETALLE_SOLICITUD,ID_SOLICITUD, ID_FRUTA, ID_CALIDAD, KILOS) VALUES (4,2,6,1,200);
-- ##################################################################################################



INSERT INTO productor_solicitud (id_productor_solicitud, precio, id_productor, id_solicitud) values (1,4545,1,1);
INSERT INTO detalle_solicitud (id_solicitud, id_fruta, id_calidad, id_detalle_solicitud, kilos) values (1,1,1,1,50);
INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (1,1,10000);
INSERT INTO tamano_camion (id_tamano_camion, tamano) values (1,'mediano');
INSERT INTO CAMION (PATENTE, MODELO, MARCA, REVISION_TECNICA,id_tamano_camion, id_tipo_camion, id_transportista, disponibilidad) VALUES ('A3X4AA', 'M4', 'BMW', 0,1,1,1, 1);
INSERT INTO estado_subasta (id_estado_subasta, estado) VALUES (1,'INICIADA');
INSERT INTO SUBASTA (id_solicitud, id_estado_subasta, id_subasta, camion_seleccionado,fecha_publicacion, fecha_termino) VALUES (1,1,1,NULL,SYSDATE, SYSDATE);
INSERT INTO Ruta (id_ruta, id_subasta) VALUES (1, 1);
INSERT INTO Detalle_Ruta (id_detalle_ruta, direccion_partida, direccion_destino , id_ruta, observacion, fecha_retiro) VALUES (1, 'bodega productor', 'bodega central', 1, 'carga pesada', SYSDATE );

-- ESTADO VENTAS
INSERT INTO ESTADO_VENTA VALUES (1, 'solicitada');
INSERT INTO ESTADO_VENTA VALUES (2, 'iniciada');
INSERT INTO ESTADO_VENTA VALUES (3, 'en bodega');
INSERT INTO ESTADO_VENTA VALUES (4, 'en camino');
INSERT INTO ESTADO_VENTA VALUES (5, 'entregada');
INSERT INTO ESTADO_VENTA VALUES (6, 'pagada');
INSERT INTO ESTADO_VENTA VALUES (7, 'rechazada');

-- TIPO DE PAGOS
INSERT INTO TIPO_PAGO VALUES (1, 'debito');
INSERT INTO TIPO_PAGO VALUES (2, 'credito');

-- NUEVA VENTA 1
INSERT INTO VENTA (ID_SOLICITUD, ID_ESTADO_VENTA, ID_VENTA, ID_TIPO_PAGO) VALUES (1,2,1,1);
-- NUEVA VENTA 2
INSERT INTO VENTA (ID_SOLICITUD, ID_ESTADO_VENTA, ID_VENTA, ID_TIPO_PAGO) VALUES (2,3,2,1);

