-- Generado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   en:        2021-10-05 19:45:23 CLST
--   sitio:      Oracle Database 12c
--   tipo:      Oracle Database 12c



DROP TABLE calidad CASCADE CONSTRAINTS;

DROP TABLE camion CASCADE CONSTRAINTS;

DROP TABLE categoria_fruta CASCADE CONSTRAINTS;

DROP TABLE contrato CASCADE CONSTRAINTS;

DROP TABLE detalle_ruta CASCADE CONSTRAINTS;

DROP TABLE detalle_solicitud CASCADE CONSTRAINTS;

DROP TABLE detalle_subasta CASCADE CONSTRAINTS;

DROP TABLE detalle_venta CASCADE CONSTRAINTS;

DROP TABLE estado_contrato CASCADE CONSTRAINTS;

DROP TABLE estado_solicitud CASCADE CONSTRAINTS;

DROP TABLE estado_subasta CASCADE CONSTRAINTS;

DROP TABLE estado_venta CASCADE CONSTRAINTS;

DROP TABLE fruta CASCADE CONSTRAINTS;

DROP TABLE menu_perfilado CASCADE CONSTRAINTS;

DROP TABLE pais CASCADE CONSTRAINTS;

DROP TABLE productor CASCADE CONSTRAINTS;

DROP TABLE productor_solicitud CASCADE CONSTRAINTS;

DROP TABLE ruta CASCADE CONSTRAINTS;

DROP TABLE solicitud CASCADE CONSTRAINTS;

DROP TABLE subasta CASCADE CONSTRAINTS;

DROP TABLE tamano_camion CASCADE CONSTRAINTS;

DROP TABLE tipo_camion CASCADE CONSTRAINTS;

DROP TABLE tipo_pago CASCADE CONSTRAINTS;

DROP TABLE tipo_usuario CASCADE CONSTRAINTS;

DROP TABLE transportista CASCADE CONSTRAINTS;

DROP TABLE usuario CASCADE CONSTRAINTS;

DROP TABLE valores_estatico CASCADE CONSTRAINTS;

DROP TABLE venta CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE calidad (
    id_calidad NUMBER NOT NULL,
    calidad    VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE calidad ADD CONSTRAINT calidad_pk PRIMARY KEY ( id_calidad );

CREATE TABLE camion (
    id_tipo_camion   NUMBER NOT NULL,
    id_tamano_camion NUMBER NOT NULL,
    id_camion        NUMBER NOT NULL,
    patente          VARCHAR2(15) NOT NULL,
    modelo           VARCHAR2(30) NOT NULL,
    marca            VARCHAR2(30) NOT NULL,
    revision_tecnica NUMBER NOT NULL,
    id_transportista NUMBER NOT NULL,
    disponibilidad   NUMBER NOT NULL
)
LOGGING;

ALTER TABLE camion ADD CONSTRAINT id_camion_pk PRIMARY KEY ( id_camion );

CREATE TABLE categoria_fruta (
    id_categoria_fruta NUMBER NOT NULL,
    categoria          VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE categoria_fruta ADD CONSTRAINT categoria_fruta_pk PRIMARY KEY ( id_categoria_fruta );

CREATE TABLE contrato (
    id_contrato        NUMBER NOT NULL,
    descripcion        VARCHAR2(100) NOT NULL,
    fecha_emision      DATE NOT NULL,
    fecha_expiracion   DATE NOT NULL,
    firmas             CHAR(1) NOT NULL,
    id_estado_contrato NUMBER NOT NULL
)
LOGGING;

ALTER TABLE contrato ADD CONSTRAINT contrato_pk PRIMARY KEY ( id_contrato );

CREATE TABLE detalle_ruta (
    id_detalle_ruta   NUMBER NOT NULL,
    direccion_partida VARCHAR2(100) NOT NULL,
    direccion_destino VARCHAR2(100) NOT NULL,
    id_ruta           NUMBER NOT NULL,
    observacion       VARCHAR2(100),
    fecha_retiro      DATE NOT NULL
)
LOGGING;

ALTER TABLE detalle_ruta ADD CONSTRAINT detalle_ruta_pk PRIMARY KEY ( id_detalle_ruta );

CREATE TABLE detalle_solicitud (
    id_solicitud         NUMBER NOT NULL,
    id_fruta             NUMBER NOT NULL,
    id_calidad           NUMBER NOT NULL,
    id_detalle_solicitud NUMBER NOT NULL,
    kilos                NUMBER NOT NULL
)
LOGGING;

ALTER TABLE detalle_solicitud ADD CONSTRAINT detalle_solicitud_pk PRIMARY KEY ( id_detalle_solicitud );

CREATE TABLE detalle_subasta (
    id_subasta         NUMBER NOT NULL,
    id_detalle_subasta NUMBER NOT NULL,
    patente            VARCHAR2(15) NOT NULL,
    precio             NUMBER
)
LOGGING;

CREATE UNIQUE INDEX detalle_subasta__idx ON
    detalle_subasta (
        patente
    ASC );

CREATE TABLE detalle_venta (
    id_detalle_venta NUMBER NOT NULL,
    precio_bruto     NUMBER NOT NULL,
    id_venta         NUMBER NOT NULL,
    precio_neto      NUMBER,
    fecha_incio      DATE NOT NULL,
    fecha_fin        DATE
)
LOGGING;

CREATE UNIQUE INDEX detalle_venta__idx ON
    detalle_venta (
        id_venta
    ASC );

ALTER TABLE detalle_venta ADD CONSTRAINT detalle_venta_pk PRIMARY KEY ( id_detalle_venta );

CREATE TABLE estado_contrato (
    id_estado_contrato NUMBER NOT NULL,
    estado             VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE estado_contrato ADD CONSTRAINT tipo_estado_pk PRIMARY KEY ( id_estado_contrato );

CREATE TABLE estado_solicitud (
    id_estado_solicitud NUMBER NOT NULL,
    descripcion         VARCHAR2(25) NOT NULL
)
LOGGING;

ALTER TABLE estado_solicitud ADD CONSTRAINT estado_solicitud_pk PRIMARY KEY ( id_estado_solicitud );

CREATE TABLE estado_subasta (
    id_estado_subasta NUMBER NOT NULL,
    estado            VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE estado_subasta ADD CONSTRAINT estado_subasta_pk PRIMARY KEY ( id_estado_subasta );

CREATE TABLE estado_venta (
    id_estado_venta NUMBER NOT NULL,
    estado          VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE estado_venta ADD CONSTRAINT estado_venta_pk PRIMARY KEY ( id_estado_venta );

CREATE TABLE fruta (
    id_categoria_fruta NUMBER,
    id_fruta           NUMBER NOT NULL,
    nombre_fruta       VARCHAR2(15) NOT NULL
)
LOGGING;

ALTER TABLE fruta ADD CONSTRAINT fruta_pk PRIMARY KEY ( id_fruta );

CREATE TABLE menu_perfilado (
    id_menu         NUMBER NOT NULL,
    url             VARCHAR2(100) NOT NULL,
    nombre          VARCHAR2(100) NOT NULL,
    descripcion     VARCHAR2(200),
    id_tipo_usuario NUMBER NOT NULL
)
LOGGING;

ALTER TABLE menu_perfilado ADD CONSTRAINT menu_perfilado_pk PRIMARY KEY ( id_menu );

CREATE TABLE pais (
    id_pais NUMBER NOT NULL,
    nombre  VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE productor (
    id_productor         NUMBER NOT NULL,
    nombre               VARCHAR2(20) NOT NULL,
    apellido_paterno     VARCHAR2(25) NOT NULL,
    apellido_materno     VARCHAR2(30),
    correo               VARCHAR2(50) NOT NULL,
    contrasena           VARCHAR2(50) NOT NULL,
    rut                  NUMBER NOT NULL,
    numero_identificador VARCHAR2(1) NOT NULL,
    direccion            VARCHAR2(150) NOT NULL,
    codigo_postal        NUMBER NOT NULL,
    telefono             NUMBER NOT NULL,
    id_contrato          NUMBER NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX productor__idx ON
    productor (
        id_contrato
    ASC );

ALTER TABLE productor ADD CONSTRAINT productor_pk PRIMARY KEY ( id_productor );

CREATE TABLE productor_solicitud (
    id_productor_solicitud NUMBER NOT NULL,
    precio                 NUMBER NOT NULL,
    id_productor           NUMBER NOT NULL,
    id_solicitud           NUMBER NOT NULL
)
LOGGING;

ALTER TABLE productor_solicitud ADD CONSTRAINT productor_solicitud_pk PRIMARY KEY ( id_productor_solicitud,
                                                                                    id_productor );

CREATE TABLE ruta (
    id_ruta    NUMBER NOT NULL,
    id_subasta NUMBER NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX ruta__idx ON
    ruta (
        id_subasta
    ASC );

ALTER TABLE ruta ADD CONSTRAINT ruta_pk PRIMARY KEY ( id_ruta );

CREATE TABLE solicitud (
    id_usuario             NUMBER NOT NULL,
    id_estado_solicitud    NUMBER NOT NULL,
    id_solicitud           NUMBER NOT NULL,
    productor_seleccionado NUMBER,
    fecha_publicacion      DATE NOT NULL
)
LOGGING;

ALTER TABLE solicitud ADD CONSTRAINT solicitud_pk PRIMARY KEY ( id_solicitud );

CREATE TABLE subasta (
    id_solicitud        NUMBER NOT NULL,
    id_estado_subasta   NUMBER NOT NULL,
    id_subasta          NUMBER NOT NULL,
    fecha_publicacion   DATE NOT NULL,
    fecha_termino       DATE,
    camion_seleccionado VARCHAR2(15)
)
LOGGING;

CREATE UNIQUE INDEX subasta__idx ON
    subasta (
        id_solicitud
    ASC );

ALTER TABLE subasta ADD CONSTRAINT subasta_pk PRIMARY KEY ( id_subasta );

CREATE TABLE tamano_camion (
    id_tamano_camion NUMBER NOT NULL,
    tamano           VARCHAR2(20) NOT NULL,
    descripcion      VARCHAR2(200)
)
LOGGING;

ALTER TABLE tamano_camion ADD CONSTRAINT tamano_camion_pk PRIMARY KEY ( id_tamano_camion );

CREATE TABLE tipo_camion (
    id_tipo_camion NUMBER NOT NULL,
    refrigeracion  CHAR(1) NOT NULL,
    capacidad_kg   NUMBER NOT NULL
)
LOGGING;

ALTER TABLE tipo_camion ADD CONSTRAINT tipo_camion_pk PRIMARY KEY ( id_tipo_camion );

CREATE TABLE tipo_pago (
    id_tipo_pago NUMBER NOT NULL,
    tipo_pago    VARCHAR2(20) NOT NULL
)
LOGGING;

ALTER TABLE tipo_pago ADD CONSTRAINT tipo_pago_pk PRIMARY KEY ( id_tipo_pago );

CREATE TABLE tipo_usuario (
    id_tipo_usuario NUMBER NOT NULL,
    categoria       VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE tipo_usuario ADD CONSTRAINT tipo_usuario_pk PRIMARY KEY ( id_tipo_usuario );

CREATE TABLE transportista (
    id_transportista     NUMBER NOT NULL,
    nombre               VARCHAR2(50) NOT NULL,
    apellido_paterno     VARCHAR2(50) NOT NULL,
    apellido_materno     VARCHAR2(50),
    correo               VARCHAR2(100) NOT NULL,
    contrasena           VARCHAR2(50) NOT NULL,
    rut                  NUMBER NOT NULL,
    numero_identificador VARCHAR2(1) NOT NULL,
    direccion            VARCHAR2(150) NOT NULL,
    codigo_postal        NUMBER NOT NULL,
    telefono             NUMBER NOT NULL
)
LOGGING;

ALTER TABLE transportista ADD CONSTRAINT transportista_pk PRIMARY KEY ( id_transportista );

CREATE TABLE usuario (
    id_tipo_usuario      NUMBER NOT NULL,
    id_pais              NUMBER NOT NULL,
    id_usuario           NUMBER NOT NULL,
    nombre               VARCHAR2(50) NOT NULL,
    apellido_paterno     VARCHAR2(50) NOT NULL,
    apellido_materno     VARCHAR2(50),
    correo               VARCHAR2(100) NOT NULL,
    contrasena           VARCHAR2(50) NOT NULL,
    rut                  NUMBER NOT NULL,
    numero_identificador VARCHAR2(1) NOT NULL,
    direccion            VARCHAR2(150) NOT NULL,
    codigo_postal        NUMBER NOT NULL,
    telefono             NUMBER NOT NULL
)
LOGGING;

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE valores_estatico (
    id_valor_estatico NUMBER NOT NULL,
    nombre            VARCHAR2(50) NOT NULL,
    descripcion       VARCHAR2(200),
    valor             NUMBER NOT NULL
)
LOGGING;

ALTER TABLE valores_estatico ADD CONSTRAINT valores_estatico_pk PRIMARY KEY ( id_valor_estatico );

CREATE TABLE venta (
    id_solicitud    NUMBER NOT NULL,
    id_estado_venta NUMBER NOT NULL,
    id_venta        NUMBER NOT NULL,
    id_tipo_pago    NUMBER NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX venta__idx ON
    venta (
        id_solicitud
    ASC );

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( id_venta );

ALTER TABLE camion
    ADD CONSTRAINT camion_tamano_camion_fk FOREIGN KEY ( id_tamano_camion )
        REFERENCES tamano_camion ( id_tamano_camion )
    NOT DEFERRABLE;

ALTER TABLE camion
    ADD CONSTRAINT camion_tipo_camion_fk FOREIGN KEY ( id_tipo_camion )
        REFERENCES tipo_camion ( id_tipo_camion )
    NOT DEFERRABLE;

ALTER TABLE camion
    ADD CONSTRAINT camion_transportista_fk FOREIGN KEY ( id_transportista )
        REFERENCES transportista ( id_transportista )
    NOT DEFERRABLE;

ALTER TABLE contrato
    ADD CONSTRAINT contrato_estado_contrato_fk FOREIGN KEY ( id_estado_contrato )
        REFERENCES estado_contrato ( id_estado_contrato )
    NOT DEFERRABLE;

ALTER TABLE detalle_ruta
    ADD CONSTRAINT detalle_ruta_ruta_fk FOREIGN KEY ( id_ruta )
        REFERENCES ruta ( id_ruta )
    NOT DEFERRABLE;

ALTER TABLE detalle_solicitud
    ADD CONSTRAINT detalle_solicitud_calidad_fk FOREIGN KEY ( id_calidad )
        REFERENCES calidad ( id_calidad )
    NOT DEFERRABLE;

ALTER TABLE detalle_solicitud
    ADD CONSTRAINT detalle_solicitud_fruta_fk FOREIGN KEY ( id_fruta )
        REFERENCES fruta ( id_fruta )
    NOT DEFERRABLE;

ALTER TABLE detalle_solicitud
    ADD CONSTRAINT detalle_solicitud_solicitud_fk FOREIGN KEY ( id_solicitud )
        REFERENCES solicitud ( id_solicitud )
    NOT DEFERRABLE;

ALTER TABLE detalle_subasta
    ADD CONSTRAINT detalle_subasta_camion_fk FOREIGN KEY ( patente )
        REFERENCES camion ( patente )
    NOT DEFERRABLE;

ALTER TABLE detalle_subasta
    ADD CONSTRAINT detalle_subasta_subasta_fk FOREIGN KEY ( id_subasta )
        REFERENCES subasta ( id_subasta )
    NOT DEFERRABLE;

ALTER TABLE detalle_venta
    ADD CONSTRAINT detalle_venta_venta_fk FOREIGN KEY ( id_venta )
        REFERENCES venta ( id_venta )
    NOT DEFERRABLE;

ALTER TABLE fruta
    ADD CONSTRAINT fruta_categoria_fruta_fk FOREIGN KEY ( id_categoria_fruta )
        REFERENCES categoria_fruta ( id_categoria_fruta )
    NOT DEFERRABLE;

ALTER TABLE menu_perfilado
    ADD CONSTRAINT menu_perfilado_tipo_usuario_fk FOREIGN KEY ( id_tipo_usuario )
        REFERENCES tipo_usuario ( id_tipo_usuario )
    NOT DEFERRABLE;

ALTER TABLE productor
    ADD CONSTRAINT productor_contrato_fk FOREIGN KEY ( id_contrato )
        REFERENCES contrato ( id_contrato )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE productor_solicitud
    ADD CONSTRAINT productor_solicitud_productor_fk FOREIGN KEY ( id_productor )
        REFERENCES productor ( id_productor )
    NOT DEFERRABLE;

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE productor_solicitud
    ADD CONSTRAINT productor_solicitud_solicitud_fk FOREIGN KEY ( id_solicitud )
        REFERENCES solicitud ( id_solicitud )
    NOT DEFERRABLE;

ALTER TABLE ruta
    ADD CONSTRAINT ruta_subasta_fk FOREIGN KEY ( id_subasta )
        REFERENCES subasta ( id_subasta )
    NOT DEFERRABLE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_estado_solicitud_fk FOREIGN KEY ( id_estado_solicitud )
        REFERENCES estado_solicitud ( id_estado_solicitud )
    NOT DEFERRABLE;

ALTER TABLE solicitud
    ADD CONSTRAINT solicitud_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario )
    NOT DEFERRABLE;

ALTER TABLE subasta
    ADD CONSTRAINT subasta_estado_subasta_fk FOREIGN KEY ( id_estado_subasta )
        REFERENCES estado_subasta ( id_estado_subasta )
    NOT DEFERRABLE;

ALTER TABLE subasta
    ADD CONSTRAINT subasta_solicitud_fk FOREIGN KEY ( id_solicitud )
        REFERENCES solicitud ( id_solicitud )
    NOT DEFERRABLE;

ALTER TABLE usuario
    ADD CONSTRAINT usuario_pais_fk FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais )
    NOT DEFERRABLE;

ALTER TABLE usuario
    ADD CONSTRAINT usuario_tipo_usuario_fk FOREIGN KEY ( id_tipo_usuario )
        REFERENCES tipo_usuario ( id_tipo_usuario )
    NOT DEFERRABLE;

ALTER TABLE venta
    ADD CONSTRAINT venta_estado_venta_fk FOREIGN KEY ( id_estado_venta )
        REFERENCES estado_venta ( id_estado_venta )
    NOT DEFERRABLE;

ALTER TABLE venta
    ADD CONSTRAINT venta_solicitud_fk FOREIGN KEY ( id_solicitud )
        REFERENCES solicitud ( id_solicitud )
    NOT DEFERRABLE;

ALTER TABLE venta
    ADD CONSTRAINT venta_tipo_pago_fk FOREIGN KEY ( id_tipo_pago )
        REFERENCES tipo_pago ( id_tipo_pago )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            28
-- CREATE INDEX                             6
-- ALTER TABLE                             53
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
