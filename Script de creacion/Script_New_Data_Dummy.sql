-- TIPO_USUARIO
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (1, 'ADMINISTRADOR'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (2, 'CLIENTE_EXTERNO'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (3, 'CLIENTE_LOCAL'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (4, 'CLIENTE_INTERNO'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (5, 'CONSULTOR'); 

-- TIPO_SOLICITUD
INSERT INTO TIPO_SOLICITUD (ID_TIPO_SOLICITUD, DESCRIPCION) VALUES (1, 'SOLICITUD SALDOS');
INSERT INTO TIPO_SOLICITUD (ID_TIPO_SOLICITUD, DESCRIPCION) VALUES (2, 'SOLICITUD CON PRODUCTOR');

-- TIPO_PAGO
INSERT INTO TIPO_PAGO VALUES (1, 'DEBITO');
INSERT INTO TIPO_PAGO VALUES (2, 'CREDITO');

-- TIPO_CAMION
INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (1,1,300);
INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (2,1,500);
INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (3,1,1000);
INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (4,0,300);
INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (5,0,500);
INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (6,0,1000);

-- PAIS
INSERT INTO pais  (id_pais, nombre) VALUES (1, 'CHILE'); 
INSERT INTO pais  (id_pais, nombre) VALUES (2, 'ARGENTINA'); 
INSERT INTO pais  (id_pais, nombre) VALUES (3, 'PERU'); 
INSERT INTO pais  (id_pais, nombre) VALUES (4, 'CHINA'); 
INSERT INTO pais  (id_pais, nombre) VALUES (5, 'ESTADOS UNIDOS'); 

-- ESTADO_CONTRATO
INSERT INTO estado_contrato(id_estado_contrato, estado) VALUES (1, 'ACTIVO');
INSERT INTO estado_contrato(id_estado_contrato, estado) VALUES (2, 'INACTIVO');

-- ESTADO_SOLICITUD
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (0, 'SOLICITUD INICIADA');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (1, 'SOLICITUD RECHAZADA');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (2, 'SOLICITUD ACEPTADA');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (3, 'BUSCANDO PRODUCTOR');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (4, 'SUBASTANDO TRANSPORTE');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (5, 'COTIZACION CLIENTE');
INSERT INTO ESTADO_SOLICITUD (ID_ESTADO_SOLICITUD, DESCRIPCION) VALUES (6, 'SOLICITUD CERRADA');

-- ESTADO_VENTA
INSERT INTO ESTADO_VENTA VALUES (1, 'SOLICITADA');
INSERT INTO ESTADO_VENTA VALUES (2, 'INICIADA');
INSERT INTO ESTADO_VENTA VALUES (3, 'EN BODEGA');
INSERT INTO ESTADO_VENTA VALUES (4, 'EN CAMINO');
INSERT INTO ESTADO_VENTA VALUES (5, 'ENTREGADA');
INSERT INTO ESTADO_VENTA VALUES (6, 'PAGADA');
INSERT INTO ESTADO_VENTA VALUES (7, 'RECHAZADA');

-- ESTADO_SUBASTA
INSERT INTO estado_subasta (id_estado_subasta, estado) VALUES (1,'ABIERTA');
INSERT INTO estado_subasta (id_estado_subasta, estado) VALUES (2,'CERRADA');

-- CALIDAD
INSERT INTO calidad (id_calidad, calidad) values (1,'ESTANDAR');
INSERT INTO calidad (id_calidad, calidad) values (2,'PREMIUM');

-- CATEGORIA_FRUTA
INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (1,'DULCE');
INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (2,'SEMI DULCE');
INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (3,'ACIDA');
INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (4,'SEMI ACIDA');
INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (5,'NEUTRA');

-- FRUTA
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (1, 1, 'Cereza');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (2, 2, 'Mango');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (3, 3, 'Limon');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (4, 4, 'Mandarina');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (5, 5, 'Palta');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (6, 1, 'Manzana');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (7, 1, 'Uva');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (8, 4, 'Naranja');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (9, 1, 'Durazno');
INSERT INTO FRUTA (ID_FRUTA, ID_CATEGORIA_FRUTA, NOMBRE_FRUTA) VALUES (10, 5, 'Coco');


-- TAMANO_CAMION
INSERT INTO tamano_camion (id_tamano_camion, tamano, descripcion) values (1,'CHICO', 'Camion de peque�a embergadura');
INSERT INTO tamano_camion (id_tamano_camion, tamano, descripcion) values (2,'MEDIANO', 'Camion de mediana embergadura');
INSERT INTO tamano_camion (id_tamano_camion, tamano, descripcion) values (3,'GRANDE', 'Camion de gran embergadura');

-- VALORES_ESTATICO
INSERT INTO VALORES_ESTATICO (id_valor_estatico, nombre, descripcion, valor) VALUES (1, 'IVA', 'impuesto sobre el valor agregado', 0.19);

-- USUARIO = ADMIN
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (1,1,1, 'admin', 'admin', 'admin', 'admin@admin.com', 'admin', 123456789, 'K', 'La calle del administrador', 111111, 111111);


-- COMMIT_INSERCIONES
COMMIT;

