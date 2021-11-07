select * from usuario;
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (1, 'ADMINISTRADOR'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (2, 'CLIENTE_EXTERNO'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (3, 'CLIENTE_LOCAL'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (4, 'CLIENTE_INTERNO'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (5, 'CONSULTOR'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (6, 'PRODUCTOR');
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (7, 'TRANSPORTISTA'); 
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
INSERT INTO estado_subasta (id_estado_subasta, estado) VALUES (2,'CERRADA');
INSERT INTO SUBASTA (id_solicitud, id_estado_subasta, camion_seleccionado,fecha_publicacion, fecha_termino) VALUES (1,1,NULL,SYSDATE, NULL);
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

-- NUEVA DATA BASE

*TIPO_USUARIO*
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (1, 'Administrador');
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (2, 'CLIENTE EXTERNO');
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (3, 'CLIENTE LOCAL');
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (4, 'CLIENTE INTERNO');
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (5, 'CONSULTOR');

*PAIS* 

INSERT INTO pais  (id_pais, nombre) VALUES (1, 'ARGENTINA');
INSERT INTO pais  (id_pais, nombre) VALUES (2, 'PARAGUAY');
INSERT INTO pais  (id_pais, nombre) VALUES (3, 'CHILE');
INSERT INTO pais  (id_pais, nombre) VALUES (2, 'PARAGUAY');
INSERT INTO pais  (id_pais, nombre) VALUES (1, 'ARGENTINA'); 


*USUARIO*
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 

VALUES (1,3,1, 'luciano', 'molina', 'arias', 'luciano@gmail.com', 'aaa', 12345678, 'k', 'los acacios', 343434, 94986612);


INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 

VALUES (2,2,2, 'carlos', 'cordova', 'vasquez', 'carlos@gmail.com', 'bbb', 12435678, '1', 'los alamos', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 

VALUES (2,1,3, 'juan', 'paganini', 'rojas', 'juan@gmail.com', 'ccc', 20896735, '7', 'villarrica', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 

VALUES (4,3,4, 'alejandro', 'arias', 'sepulveda', 'alejandro@gmail.com', 'ddd', 18374587, '1', 'el canelo', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 

VALUES (5,3,5, 'katherine', 'gaete', 'escudero', 'katherine@gmaiil.com', 'fff', 20289021, 'k', 'las torres', 343434, 94986612);


*TIPO_SOLICITUD*
INSERT INTO tipo_solicitud (id_tipo_solicitud, descripcion) VALUES (1,'SOLICITUD SALDOS');
INSERT INTO tipo_solicitud (id_tipo_solicitud, descripcion) VALUES (2,'SOLICITUD CON PRODUCTOR');

*ESTADO_SOLICITUD*
INSERT INTO estado_solicitud (id_estado_solicitud, descripcion) VALUES (0,'SOLICITUD INICIADA');
INSERT INTO estado_solicitud (id_estado_solicitud, descripcion) VALUES (1,'SOLICITUD RECHAZADA');
INSERT INTO estado_solicitud (id_estado_solicitud, descripcion) VALUES (2,'SOLICITUD ACEPTADA');


INSERT INTO estado_solicitud (id_estado_solicitud, descripcion) VALUES (3,'BUSCANDO PRODUCTOR');
INSERT INTO estado_solicitud (id_estado_solicitud, descripcion) VALUES (4,'SUBASTANDO TRASNPORTE');
INSERT INTO estado_solicitud (id_estado_solicitud, descripcion) VALUES (5,'COTIZACION CLIENTE');
INSERT INTO estado_solicitud (id_estado_solicitud, descripcion) VALUES (6,'SOLICITUD CERRADA');

*ESTADO_CONTRATO*
INSERT INTO estado_contrato(id_estado_contrato, estado) VALUES (1, 'ACTIVO');


INSERT INTO estado_contrato(id_estado_contrato, estado) VALUES (2, 'INACTIVO');



*CONTRATO*
INSERT INTO contrato (id_contrato, descripcion, fecha_emision, fecha_expiracion, firmas, id_estado_contrato) 
VALUES (1, 'descripcion de contrato', SYSDATE, SYSDATE,1,1);
INSERT INTO contrato (id_contrato, descripcion, fecha_emision, fecha_expiracion, firmas, id_estado_contrato) 
VALUES (2, 'descripcion de contrato', SYSDATE, SYSDATE,1,1);
INSERT INTO contrato (id_contrato, descripcion, fecha_emision, fecha_expiracion, firmas, id_estado_contrato) 
VALUES (3, 'descripcion de contrato', SYSDATE, SYSDATE,1,1);
INSERT INTO contrato (id_contrato, descripcion, fecha_emision, fecha_expiracion, firmas, id_estado_contrato) 
VALUES (4, 'descripcion de contrato', SYSDATE, SYSDATE,1,2);
INSERT INTO contrato (id_contrato, descripcion, fecha_emision, fecha_expiracion, firmas, id_estado_contrato) 
VALUES (5, 'descripcion de contrato', SYSDATE, SYSDATE,1,2);





*PRODUCTOR*
INSERT INTO PRODUCTOR (ID_PRODUCTOR, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO, ID_CONTRATO) 

VALUES (1, 'nicolai', 'el', 'productor', 'productor@productor.com', '123', 22567435, 'K', 'porahi', '123332', 22,1);


INSERT INTO PRODUCTOR (ID_PRODUCTOR, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO, ID_CONTRATO) 

VALUES (2, 'nicolai', 'el', 'productor', 'productor@productor.com', '456', 18579843, '9', 'tajamaral', '123332', 22,2);


INSERT INTO PRODUCTOR (ID_PRODUCTOR, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO, ID_CONTRATO) 

VALUES (3, 'nicolai', 'el', 'productor', 'productor@productor.com', '789', 15458657, '0', 'bellohorizonte', '123332', 22,3);


INSERT INTO PRODUCTOR (ID_PRODUCTOR, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO, ID_CONTRATO) 

VALUES (4, 'nicolai', 'el', 'productor', 'productor@productor.com', '101', 13654578, '3', 'el alerce', '123332', 22,4);


INSERT INTO PRODUCTOR (ID_PRODUCTOR, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO, ID_CONTRATO) 

VALUES (5, 'nicolai', 'el', 'productor', 'productor@productor.com', '121', 18905647, '6', 'roma', '123332', 22,5);



*SOLICITUD*
INSERT INTO solicitud (ID_USUARIO, ID_TIPO_SOLICITUD, id_estado_solicitud, id_solicitud, productor_seleccionado, fecha_publicacion) VALUES (2,1,0,1,NULL,SYSDATE);
INSERT INTO solicitud (ID_USUARIO, ID_TIPO_SOLICITUD, id_estado_solicitud, id_solicitud, productor_seleccionado, fecha_publicacion) VALUES (3,1,1,2,NULL,SYSDATE);
INSERT INTO solicitud (ID_USUARIO, ID_TIPO_SOLICITUD, id_estado_solicitud, id_solicitud, productor_seleccionado, fecha_publicacion) VALUES (4,1,2,3,NULL,SYSDATE);
INSERT INTO solicitud (ID_USUARIO, ID_TIPO_SOLICITUD, id_estado_solicitud, id_solicitud, productor_seleccionado, fecha_publicacion) VALUES (3,2,3,4,NULL,SYSDATE);
INSERT INTO solicitud (ID_USUARIO, ID_TIPO_SOLICITUD, id_estado_solicitud, id_solicitud, productor_seleccionado, fecha_publicacion) VALUES (2,2,4,5,NULL,SYSDATE);




*CATEGORIA_FRUTA*
INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (1,'dulces');
INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (2,'semi dulces');

INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (3,'acidas');

INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (4,'semi acidas');

INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (5,'neutras');



*CALIDAD*
INSERT INTO calidad (id_calidad, calidad) values (1,'normal');

INSERT INTO calidad (id_calidad, calidad) values (2,'premium');

*FRUTA*
INSERT INTO fruta (id_fruta, nombre_fruta) values (1,'frutilla');


INSERT INTO fruta (id_fruta, nombre_fruta) values (2,'manzana');
INSERT INTO fruta (id_fruta, nombre_fruta) values (3,'pera');
INSERT INTO fruta (id_fruta, nombre_fruta) values (4,'platano');
INSERT INTO fruta (id_fruta, nombre_fruta) values (5,'uva');

*PRODUCTOR_SOLICITUD*
INSERT INTO productor_solicitud (id_productor_solicitud, precio, id_productor, id_solicitud) values (1,45445,1,1);

INSERT INTO productor_solicitud (id_productor_solicitud, precio, id_productor, id_solicitud) values (2,45425,2,2);

INSERT INTO productor_solicitud (id_productor_solicitud, precio, id_productor, id_solicitud) values (3,45445,3,3);

INSERT INTO productor_solicitud (id_productor_solicitud, precio, id_productor, id_solicitud) values (4,45465,4,4);

INSERT INTO productor_solicitud (id_productor_solicitud, precio, id_productor, id_solicitud) values (5,454895,5,5);


*DETALLE_SOLICITUD*
INSERT INTO detalle_solicitud (id_solicitud, id_fruta, id_calidad, id_detalle_solicitud, kilos) values (1,1,1,1,50);
INSERT INTO detalle_solicitud (id_solicitud, id_fruta, id_calidad, id_detalle_solicitud, kilos) values (2,2,1,2,54);
INSERT INTO detalle_solicitud (id_solicitud, id_fruta, id_calidad, id_detalle_solicitud, kilos) values (3,3,1,3,60);
INSERT INTO detalle_solicitud (id_solicitud, id_fruta, id_calidad, id_detalle_solicitud, kilos) values (4,4,2,4,80);
INSERT INTO detalle_solicitud (id_solicitud, id_fruta, id_calidad, id_detalle_solicitud, kilos) values (5,5,2,5,30);


*TRANSPORTISTA*
INSERT INTO TRANSPORTISTA (ID_TRANSPORTISTA, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO) 

VALUES (1, 'nicolai', 'el', 'transportista', 'transportista1@transportador.com', 'hhh', 21211222, 'k', 'praga',  966612, 546456);
INSERT INTO TRANSPORTISTA (ID_TRANSPORTISTA, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO) 

VALUES (2, 'fernando', 'el', 'transportista', 'transportista2@transportador.com', 'iii', 21211223, '2', 'el roble',  966612, 546456);


INSERT INTO TRANSPORTISTA (ID_TRANSPORTISTA, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO) 

VALUES (3, 'rafael', 'el', 'transportista', 'transportista3@transportador.com', 'jjj', 21211224, '5', 'enrique soro',  966612, 546456);


INSERT INTO TRANSPORTISTA (ID_TRANSPORTISTA, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO) 

VALUES (4, 'oscar', 'el', 'transportista', 'transportista4@transportador.com', 'kkk', 21211225, '7', 'salomon sack',  966612, 546456);


INSERT INTO TRANSPORTISTA (ID_TRANSPORTISTA, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO) 

VALUES (5, 'rodrigo', 'el', 'transportista', 'transportista5@transportador.com', 'mmm', 21211226, '1', 'rio bamba',  966612, 546456);





*TIPO_CAMION*
INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (1,1,300);

INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (2,1,500);
INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (3,1,1000);


INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (4,0,300);

INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (5,0,500);


INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (6,0,1000);

*TAMANO_CAMION*
INSERT INTO tamano_camion (id_tamano_camion, tamano, descripcion) values (1,'chico', 'camion chico');

INSERT INTO tamano_camion (id_tamano_camion, tamano, descripcion) values (2,'mediano', 'camion mediano');

INSERT INTO tamano_camion (id_tamano_camion, tamano, descripcion) values (3,'grande', 'camion grande');


*CAMION*
INSERT INTO CAMION (PATENTE, MODELO, MARCA, REVISION_TECNICA,id_tamano_camion, id_tipo_camion, id_transportista, disponibilidad) 
VALUES ('A3X4AA', 'M4', 'BMW', 0,3,1,1, 1);
INSERT INTO CAMION (PATENTE, MODELO, MARCA, REVISION_TECNICA,id_tamano_camion, id_tipo_camion, id_transportista, disponibilidad) 
VALUES ('A3X4AB', 'M5', 'JAC', 1,2,2,2, 1);

INSERT INTO CAMION (PATENTE, MODELO, MARCA, REVISION_TECNICA,id_tamano_camion, id_tipo_camion, id_transportista, disponibilidad) 
VALUES ('A3X4BN', 'M6', 'CHEVROLET', 0,2,3,3, 1);

INSERT INTO CAMION (PATENTE, MODELO, MARCA, REVISION_TECNICA,id_tamano_camion, id_tipo_camion, id_transportista, disponibilidad) 
VALUES ('A3X4IU', 'M7', 'HYUNDAI', 0,3,6,4, 0);
INSERT INTO CAMION (PATENTE, MODELO, MARCA, REVISION_TECNICA,id_tamano_camion, id_tipo_camion, id_transportista, disponibilidad) 
VALUES ('A3X4PP', 'M8', 'VOLVO', 0,3,3,5, 1);



*ESTADO_SUBASTA*
INSERT INTO estado_subasta (id_estado_subasta, estado) VALUES (1,'ABIERTA');
INSERT INTO estado_subasta (id_estado_subasta, estado) VALUES (2,'CERRADA');

*SUBASTA*
INSERT INTO SUBASTA (id_solicitud, id_estado_subasta, id_subasta, camion_seleccionado,fecha_publicacion, fecha_termino) VALUES (1,1,1,NULL,SYSDATE, SYSDATE);

INSERT INTO SUBASTA (id_solicitud, id_estado_subasta, id_subasta, camion_seleccionado,fecha_publicacion, fecha_termino) VALUES (2,1,2,NULL,SYSDATE, SYSDATE);

INSERT INTO SUBASTA (id_solicitud, id_estado_subasta, id_subasta, camion_seleccionado,fecha_publicacion, fecha_termino) VALUES (3,2,3,NULL,SYSDATE, SYSDATE);

INSERT INTO SUBASTA (id_solicitud, id_estado_subasta, id_subasta, camion_seleccionado,fecha_publicacion, fecha_termino) VALUES (4,2,4,NULL,SYSDATE, SYSDATE);

INSERT INTO SUBASTA (id_solicitud, id_estado_subasta, id_subasta, camion_seleccionado,fecha_publicacion, fecha_termino) VALUES (5,2,5,NULL,SYSDATE, SYSDATE);


*RUTA*
INSERT INTO Ruta (id_ruta, id_subasta) VALUES (1, 1);

INSERT INTO Ruta (id_ruta, id_subasta) VALUES (2, 2);
INSERT INTO Ruta (id_ruta, id_subasta) VALUES (3, 3);
INSERT INTO Ruta (id_ruta, id_subasta) VALUES (4, 4);
INSERT INTO Ruta (id_ruta, id_subasta) VALUES (5, 5);

*DETALLE_RUTA*
INSERT INTO Detalle_Ruta (id_detalle_ruta, direccion_partida, direccion_destino , id_ruta, observacion, fecha_retiro) 
VALUES (1, 'bodega productor', 'bodega central', 1, 'carga media', SYSDATE );
INSERT INTO Detalle_Ruta (id_detalle_ruta, direccion_partida, direccion_destino , id_ruta, observacion, fecha_retiro) 
VALUES (2, 'bodega central', 'puerto', 2, 'carga pesada', SYSDATE );




INSERT INTO Detalle_Ruta (id_detalle_ruta, direccion_partida, direccion_destino , id_ruta, observacion, fecha_retiro) 
VALUES (3, 'bodega productor', 'bodega central', 3, 'carga pesada', SYSDATE );




INSERT INTO Detalle_Ruta (id_detalle_ruta, direccion_partida, direccion_destino , id_ruta, observacion, fecha_retiro) 
VALUES (4, 'bodega central', 'puerto', 4, 'carga pesada', SYSDATE );




INSERT INTO Detalle_Ruta (id_detalle_ruta, direccion_partida, direccion_destino , id_ruta, observacion, fecha_retiro) 
VALUES (5, 'bodega productor', 'bodega central', 5, 'carga liviana', SYSDATE );









*VALORES ESTATICOS*
INSERT INTO VALORES_ESTATICO (id_valor_estatico, nombre, descripcion, valor) VALUES (1, IVA, 'impuesto sobre el valor agregado', 0.19);


*DETALLE_SUBASTA*
INSERT INTO DETALLE_SUBASTA (id_subasta, id_detalle_subasta, patente, precio) VALUES (1,1,'A3X4AA',300000);

INSERT INTO DETALLE_SUBASTA (id_subasta, id_detalle_subasta, patente, precio) VALUES (2,2,'A3X4AB',400000);
INSERT INTO DETALLE_SUBASTA (id_subasta, id_detalle_subasta, patente, precio) VALUES (3,3,'A3X4PP',200000);

*ESTADO_VENTA*
INSERT INTO estado_venta (id_estado_venta, estado) VALUES (1,'solicitada');

INSERT INTO estado_venta (id_estado_venta, estado) VALUES (2,'iniciada');

INSERT INTO estado_venta (id_estado_venta, estado) VALUES (3'en bodega');

INSERT INTO estado_venta (id_estado_venta, estado) VALUES (4,'en camino');

INSERT INTO estado_venta (id_estado_venta, estado) VALUES (5,'entregada');

INSERT INTO estado_venta (id_estado_venta, estado) VALUES (6,'pagada');

INSERT INTO estado_venta (id_estado_venta, estado) VALUES (7,'rechazada');


*DETALLE_VENTA*
INSERT INTO detalle_venta (id_detalle_venta, precio_bruto, id_venta, precio_neto, fecha_incio, fecha_fin) VALUES (1,100000,1,110000,SYSDATE,SYSDATE);
INSERT INTO detalle_venta (id_detalle_venta, precio_bruto, id_venta, precio_neto, fecha_incio, fecha_fin) VALUES (2,200000,2,210000,SYSDATE,SYSDATE);
INSERT INTO detalle_venta (id_detalle_venta, precio_bruto, id_venta, precio_neto, fecha_incio, fecha_fin) VALUES (3,300000,3,310000,SYSDATE,SYSDATE);
INSERT INTO detalle_venta (id_detalle_venta, precio_bruto, id_venta, precio_neto, fecha_incio, fecha_fin) VALUES (4,120000,4,121000,SYSDATE,SYSDATE);
INSERT INTO detalle_venta (id_detalle_venta, precio_bruto, id_venta, precio_neto, fecha_incio, fecha_fin) VALUES (5,90000,5,100000,SYSDATE,SYSDATE);

*VENTA*
INSERT INTO VENTA (id_solicitud, id_estado_venta, id_venta, id_tipo_pago) VALUES (1,3,1,1);
INSERT INTO VENTA (id_solicitud, id_estado_venta, id_venta, id_tipo_pago) VALUES (2,1,2,2);
INSERT INTO VENTA (id_solicitud, id_estado_venta, id_venta, id_tipo_pago) VALUES (3,4,3,1);
INSERT INTO VENTA (id_solicitud, id_estado_venta, id_venta, id_tipo_pago) VALUES (4,2,4,1);
INSERT INTO VENTA (id_solicitud, id_estado_venta, id_venta, id_tipo_pago) VALUES (5,6,5,2);
INSERT INTO VENTA (id_solicitud, id_estado_venta, id_venta, id_tipo_pago) VALUES (6,7,6,1);
INSERT INTO VENTA (id_solicitud, id_estado_venta, id_venta, id_tipo_pago) VALUES (7,5,7,2);

*TIPO_PAGO*
INSERT INTO TIPO_PAGO (ID_TIPO_PAGO, TIPO_PAGO) VALUES (1,'DEBITO');
INSERT INTO TIPO_PAGO (ID_TIPO_PAGO, TIPO_PAGO) VALUES (2,'CREDITO');
