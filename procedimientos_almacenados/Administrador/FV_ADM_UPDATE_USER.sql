create or replace PROCEDURE FV_ADM_UPDATE_USER
 (
    NOMBRE_IN IN VARCHAR2,
    APELLIDO_PATERNO_IN IN VARCHAR2,
    APELLIDO_MATERNO_IN IN VARCHAR2,
    CORREO_IN IN VARCHAR2,
    CONTRASENA_IN IN VARCHAR2,
    RUT_IN IN NUMBER,
    NUMERO_IDENTIFICADOR_IN IN VARCHAR2,
    DIRECCION_IN IN VARCHAR2,
    CODIGO_POSTAL_IN IN NUMBER,
    TELEFONO_IN IN NUMBER,
    ID_CONTRATO_IN IN NUMBER,
    STATUS_RESULT_OUT OUT NUMBER
    
)

AS
    ID_TEMP_VAR NUMBER := 0;
    USER_EDITED EXCEPTION;
    USER_NOT_FOUND EXCEPTION;
    COUNT_USER NUMBER := 0;
    COUNT_USER_WITH_CONTRACT NUMBER := 0;
    COUNT_CONTRACT NUMBER:= 0;
    AFTER_CONTRACT NUMBER:= 0;
    INVALID_MODEL EXCEPTION;
BEGIN

        IF ID_CONTRATO_IN IS NOT NULL OR ID_CONTRATO_IN = 0 THEN 
            SELECT COUNT(*) INTO COUNT_CONTRACT FROM CONTRATO WHERE ID_CONTRATO = ID_CONTRATO_IN;
            IF COUNT_CONTRACT = 0 THEN 
                RAISE INVALID_MODEL;
            END IF;
            
            SELECT COUNT(*) INTO COUNT_USER_WITH_CONTRACT FROM PRODUCTOR WHERE ID_CONTRATO = ID_CONTRATO_IN AND CORREO != CORREO_IN;
            IF COUNT_USER_WITH_CONTRACT != 0 THEN 
                RAISE INVALID_MODEL;
            END IF;
        END IF;
        
        SELECT COUNT(*) INTO COUNT_USER FROM USUARIO WHERE CORREO = CORREO_IN;
        IF  COUNT_USER > 0 THEN
            SELECT ID_USUARIO INTO ID_TEMP_VAR FROM USUARIO WHERE CORREO = CORREO_IN;
            UPDATE USUARIO 
            SET 
            NOMBRE =  COALESCE (NOMBRE_IN, NOMBRE), 
            APELLIDO_PATERNO = COALESCE (APELLIDO_PATERNO_IN, APELLIDO_PATERNO ), 
            APELLIDO_MATERNO = COALESCE (APELLIDO_MATERNO_IN, APELLIDO_MATERNO), 
            CONTRASENA = COALESCE (CONTRASENA_IN, CONTRASENA), 
            RUT = COALESCE (RUT_IN, RUT), 
            NUMERO_IDENTIFICADOR = COALESCE (NUMERO_IDENTIFICADOR_IN, NUMERO_IDENTIFICADOR), 
            DIRECCION = COALESCE (DIRECCION_IN, DIRECCION), 
            CODIGO_POSTAL = COALESCE (CODIGO_POSTAL_IN, CODIGO_POSTAL), 
            TELEFONO = COALESCE (TELEFONO_IN, TELEFONO) 
            WHERE ID_USUARIO = ID_TEMP_VAR ;
            RAISE USER_EDITED;
        END IF; 
        
        
        SELECT COUNT(*) INTO COUNT_USER FROM PRODUCTOR WHERE CORREO = CORREO_IN;
        IF COUNT_USER > 0 THEN
            SELECT ID_PRODUCTOR INTO ID_TEMP_VAR FROM PRODUCTOR WHERE CORREO = CORREO_IN;
            UPDATE PRODUCTOR SET 
            NOMBRE =  COALESCE (NOMBRE_IN, NOMBRE), 
            APELLIDO_PATERNO = COALESCE (APELLIDO_PATERNO_IN, APELLIDO_PATERNO ), 
            APELLIDO_MATERNO = COALESCE (APELLIDO_MATERNO_IN, APELLIDO_MATERNO), 
            CONTRASENA = COALESCE (CONTRASENA_IN, CONTRASENA), 
            RUT = COALESCE (RUT_IN, RUT), 
            NUMERO_IDENTIFICADOR = COALESCE (NUMERO_IDENTIFICADOR_IN, NUMERO_IDENTIFICADOR), 
            DIRECCION = COALESCE (DIRECCION_IN, DIRECCION), 
            CODIGO_POSTAL = COALESCE (CODIGO_POSTAL_IN, CODIGO_POSTAL), 
            TELEFONO = COALESCE (TELEFONO_IN, TELEFONO),
            ID_CONTRATO = COALESCE (ID_CONTRATO_IN, ID_CONTRATO) 
            WHERE ID_PRODUCTOR = ID_TEMP_VAR;
            RAISE USER_EDITED;
        END IF;
        
        
        SELECT COUNT(*) INTO COUNT_USER FROM TRANSPORTISTA WHERE CORREO = CORREO_IN;
        IF COUNT_USER > 0 THEN
            SELECT ID_TRANSPORTISTA INTO ID_TEMP_VAR FROM TRANSPORTISTA WHERE CORREO = CORREO_IN;
            UPDATE TRANSPORTISTA SET 
            NOMBRE =  COALESCE (NOMBRE_IN, NOMBRE), 
            APELLIDO_PATERNO = COALESCE (APELLIDO_PATERNO_IN, APELLIDO_PATERNO ), 
            APELLIDO_MATERNO = COALESCE (APELLIDO_MATERNO_IN, APELLIDO_MATERNO), 
            CONTRASENA = COALESCE (CONTRASENA_IN, CONTRASENA), 
            RUT = COALESCE (RUT_IN, RUT), 
            NUMERO_IDENTIFICADOR = COALESCE (NUMERO_IDENTIFICADOR_IN, NUMERO_IDENTIFICADOR), 
            DIRECCION = COALESCE (DIRECCION_IN, DIRECCION), 
            CODIGO_POSTAL = COALESCE (CODIGO_POSTAL_IN, CODIGO_POSTAL), 
            TELEFONO = COALESCE (TELEFONO_IN, TELEFONO) 
            WHERE ID_TRANSPORTISTA = ID_TEMP_VAR;
            RAISE USER_EDITED;
        END IF;

        IF COUNT_USER = 0 THEN
            RAISE USER_NOT_FOUND;
        END IF;

EXCEPTION
    WHEN USER_EDITED THEN
        STATUS_RESULT_OUT:= 1;
        DBMS_OUTPUT.PUT_LINE('USUARIO UPDATEADO' );
    WHEN USER_NOT_FOUND THEN
        STATUS_RESULT_OUT:= -1;
        DBMS_OUTPUT.PUT_LINE('EL USUARIO QUE SE DESEA EDITAR NO EXISTE O EL MAIL ES INVALIDO' );
     WHEN INVALID_MODEL THEN
        STATUS_RESULT_OUT:= 0;
        DBMS_OUTPUT.PUT_LINE('MODELO INVALIDO - INVALIDO EL CONTRATO - O NO EXITE O ESTA SIENDO UTILIZADO' );
    WHEN OTHERS THEN
        STATUS_RESULT_OUT:= -2;
        DBMS_OUTPUT.PUT_LINE('UPS HUBO UN ERROR' );
   
END;








-- SET SERVEROUTPUT ON SIZE 1000000

-- -- EJECUCION
-- DECLARE 
--      STATUS_RESULT_OUT NUMBER;
-- BEGIN
--     FV_ADM_UPDATE_USER('NOMBRE ADMIN',NULL,'NUEVOADMIN', 'Administrador@Administrador.com','NUEVOADMIN',12345678,'k','Rencas 1673', 55, 94986612, NULL, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
    -- FV_ADM_UPDATE_USER('NOMBRE PRODUCTOR',NULL,'NUEVOPROD', 'Productor@Productor.com',NULL,12345678,'k','Rencas 1673', 444, 1111, 2, STATUS_RESULT_OUT);
    -- DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
--     FV_ADM_UPDATE_USER('NOMBRE TRANSPORTISTA',NULL,'NUEVOPROD', 'Transportista@Transportista.com',NULL,12345678,'k','Rencas 1673', 333, 1111, 2, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
-- END;