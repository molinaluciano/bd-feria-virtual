select * from usuario;
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (1, 'ADMINISTRADOR'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (2, 'CLIENTE_EXTERNO'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (3, 'CLIENTE_LOCAL'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (4, 'CLIENTE_INTERNO'); 
INSERT INTO tipo_usuario  (id_tipo_usuario, categoria) VALUES (5, 'CONSULTOR'); 
INSERT INTO pais  (id_pais, nombre) VALUES (1, 'CHILE'); 

delete from usuario;
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (1,1,1, 'admin', 'molina', 'arias', 'admin@admin.com', 'admin', 12345678, 'k', 'los acacios', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (2,1,2, 'clienteexterno', 'amand', 'frias', 'clienteexterno@clienteexterno.com', 'clienteexterno', 12345679, 'k', 'los acacios', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (3,1,3, 'clientelocal', 'martinez', 'loqsea', 'clientelocal@clientelocal.com', 'clientelocal', 12345671, 'k', 'los acacios', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (4,1,4, 'clienteinterno', 'martinez', 'loqsea', 'clienteinterno@clienteinterno.com', 'clienteinterno', 12345671, 'k', 'los acacios', 343434, 94986612);
INSERT INTO usuario (id_tipo_usuario,id_pais, id_usuario, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono) 
VALUES (5,1,5, 'consultor', 'poblete', 'loqsea', 'consultor@consultor.com', 'consultor', 12345672, 'k', 'los acacios', 343434, 94986612);

INSERT INTO estado_contrato(id_estado_contrato, estado) VALUES (1, 'ACTIVO');
INSERT INTO contrato (id_contrato, descripcion, fecha_emision, fecha_expiracion, firmas, id_estado_contrato) 
VALUES (1, 'descripcion de contrato', SYSDATE, SYSDATE,1,1);
INSERT INTO productor ( id_productor, nombre, apellido_paterno, apellido_materno, correo, contrasena, rut, numero_identificador, direccion, codigo_postal, telefono, id_contrato) 
VALUES (1, 'productor1', 'productor1', 'productor1', 'productor@productor.com', 'productor', 12345672, 'k', 'los acacios', 343434, 94986612,1);

INSERT INTO  transportista (ID_TRANSPORTISTA, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO) 
VALUES (1, 'transportista1', 'transportista', 'transportista', 'transportista@transportista.com', 'transportista', 21211222, 'k', 'porahi',  966612, 546456);

-- -----------------------------------
INSERT INTO solicitud (ID_USUARIO, ID_TIPO_SOLICITUD, id_estado_solicitud, id_solicitud, productor_seleccionado, fecha_publicacion) VALUES (1,1,1,1,NULL,SYSDATE);


INSERT INTO categoria_fruta (id_categoria_fruta, categoria) values (1,'dulce');
INSERT INTO calidad (id_calidad, calidad) values (1,'buena');
INSERT INTO fruta (id_fruta, nombre_fruta) values (1,'frutilla');

INSERT INTO productor_solicitud (id_productor_solicitud, precio, id_productor, id_solicitud) values (1,4545,1,1);
INSERT INTO detalle_solicitud (id_solicitud, id_fruta, id_calidad, id_detalle_solicitud, kilos) values (1,1,1,1,50);
INSERT INTO TRANSPORTISTA (ID_TRANSPORTISTA, NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, CORREO, CONTRASENA, RUT, NUMERO_IDENTIFICADOR, DIRECCION, CODIGO_POSTAL, TELEFONO) 
VALUES (1, 'nicolai', 'el', 'transportista', 'transportista@transportador.com', '123asd', 21211222, 'k', 'porahi',  966612, 546456);

INSERT INTO tipo_camion (id_tipo_camion, refrigeracion, capacidad_kg) values (1,1,10000);
INSERT INTO tamano_camion (id_tamano_camion, tamano) values (1,'mediano');
INSERT INTO CAMION (PATENTE, MODELO, MARCA, REVISION_TECNICA,id_tamano_camion, id_tipo_camion, id_transportista, disponibilidad) VALUES ('A3X4AA', 'M4', 'BMW', 0,1,1,1, 1);
INSERT INTO estado_subasta (id_estado_subasta, estado) VALUES (1,'INICIADA');
INSERT INTO SUBASTA (id_solicitud, id_estado_subasta, id_subasta, camion_seleccionado,fecha_publicacion, fecha_termino) VALUES (1,1,1,NULL,SYSDATE, SYSDATE);
INSERT INTO Ruta (id_ruta, id_subasta) VALUES (1, 1);
INSERT INTO Detalle_Ruta (id_detalle_ruta, direccion_partida, direccion_destino , id_ruta, observacion, fecha_retiro) VALUES (1, 'bodega productor', 'bodega central', 1, 'carga pesada', SYSDATE );



