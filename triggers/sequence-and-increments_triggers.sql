-- SECUENCIA DE USUARIO - RANSPORTISTA Y PRODUCTOR

DROP SEQUENCE D_VENTA_INCREMENTO;
CREATE SEQUENCE D_VENTA_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE USUARIO_INCREMENTO;
CREATE SEQUENCE USUARIO_INCREMENTO
START WITH 2 
INCREMENT BY 1;

DROP SEQUENCE TRA_INCREMENTO;
CREATE SEQUENCE TRA_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE PRODUCTOR_INCREMENTO;
CREATE SEQUENCE PRODUCTOR_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE CONTRATO_INCREMENTO;
CREATE SEQUENCE CONTRATO_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE SOLICITUD_INCREMENTO;
CREATE SEQUENCE SOLICITUD_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE DETAILREQ_INCREMENTO;
CREATE SEQUENCE DETAILREQ_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE CAMION_INCREMENTO;
CREATE SEQUENCE CAMION_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE SUBASTA_INCREMENTO;
CREATE SEQUENCE SUBASTA_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE PRODUCTOR_SOLICITUD_INCREMENTO;
CREATE SEQUENCE PRODUCTOR_SOLICITUD_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE D_SUBASTA_INCREMENTO;
CREATE SEQUENCE D_SUBASTA_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE VENTA_INCREMENTO;
CREATE SEQUENCE VENTA_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE SALDO_INCREMENTO;
CREATE SEQUENCE SALDO_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE RUTA_INCREMENTO;
CREATE SEQUENCE RUTA_INCREMENTO
START WITH 1 
INCREMENT BY 1;

DROP SEQUENCE DETALLE_RUTA_INCREMENTO;
CREATE SEQUENCE DETALLE_RUTA_INCREMENTO
START WITH 1 
INCREMENT BY 1;

-- TRIIGER DE ID DE INCREMENTO DE USUARIO - RANSPORTISTA Y PRODUCTOR

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_DETALLE_RUTA
BEFORE INSERT ON DETALLE_RUTA 
FOR EACH ROW
BEGIN
    SELECT DETALLE_RUTA_INCREMENTO.NEXTVAL INTO :NEW.ID_DETALLE_RUTA FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_RUTA
BEFORE INSERT ON RUTA 
FOR EACH ROW
BEGIN
    SELECT RUTA_INCREMENTO.NEXTVAL INTO :NEW.ID_RUTA FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_SALDO
BEFORE INSERT ON SALDO 
FOR EACH ROW
BEGIN
    SELECT SALDO_INCREMENTO.NEXTVAL INTO :NEW.ID_SALDO FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_USUARIO
BEFORE INSERT ON USUARIO 
FOR EACH ROW
BEGIN
    SELECT USUARIO_INCREMENTO.NEXTVAL INTO :NEW.ID_USUARIO FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCR_ID_TRA
BEFORE INSERT ON TRANSPORTISTA 
FOR EACH ROW
BEGIN
    SELECT TRA_INCREMENTO.NEXTVAL INTO :NEW.ID_TRANSPORTISTA FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_PRODUCTOR
BEFORE INSERT ON PRODUCTOR 
FOR EACH ROW
BEGIN
    SELECT PRODUCTOR_INCREMENTO.NEXTVAL INTO :NEW.ID_PRODUCTOR FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_CONTRATO
BEFORE INSERT ON CONTRATO 
FOR EACH ROW
BEGIN
    SELECT CONTRATO_INCREMENTO.NEXTVAL INTO :NEW.ID_CONTRATO FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_SOLICITUD
BEFORE INSERT ON SOLICITUD 
FOR EACH ROW
BEGIN
    SELECT SOLICITUD_INCREMENTO.NEXTVAL INTO :NEW.ID_SOLICITUD FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_DETAILREQ
BEFORE INSERT ON DETALLE_SOLICITUD 
FOR EACH ROW
BEGIN
    SELECT DETAILREQ_INCREMENTO.NEXTVAL INTO :NEW.ID_DETALLE_SOLICITUD FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_CAMION
BEFORE INSERT ON CAMION 
FOR EACH ROW
BEGIN
    SELECT CAMION_INCREMENTO.NEXTVAL INTO :NEW.ID_CAMION FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_SUBASTA
BEFORE INSERT ON SUBASTA 
FOR EACH ROW
BEGIN
    SELECT SUBASTA_INCREMENTO.NEXTVAL INTO :NEW.ID_SUBASTA FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_PROD_SOLI
BEFORE INSERT ON PRODUCTOR_SOLICITUD 
FOR EACH ROW
BEGIN
    SELECT PRODUCTOR_SOLICITUD_INCREMENTO.NEXTVAL INTO :NEW.ID_PRODUCTOR_SOLICITUD FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_D_SUBASTA
BEFORE INSERT ON DETALLE_SUBASTA 
FOR EACH ROW
BEGIN
    SELECT D_SUBASTA_INCREMENTO.NEXTVAL INTO :NEW.ID_DETALLE_SUBASTA FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INCREMENTO_ID_VENTA
BEFORE INSERT ON VENTA 
FOR EACH ROW
BEGIN
    SELECT VENTA_INCREMENTO.NEXTVAL INTO :NEW.ID_VENTA FROM DUAL;
END;

CREATE OR REPLACE TRIGGER TRG_INC_ID_D_VENTA
BEFORE INSERT ON DETALLE_VENTA 
FOR EACH ROW
BEGIN
    SELECT D_VENTA_INCREMENTO.NEXTVAL INTO :NEW.ID_DETALLE_VENTA FROM DUAL;
END;



