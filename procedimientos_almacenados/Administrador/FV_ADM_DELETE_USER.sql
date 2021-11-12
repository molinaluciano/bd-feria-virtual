-- CREACIÓN DE PROCEDIMIENTO FV_ADM_DELETE_USER

CREATE OR REPLACE 
PROCEDURE FV_ADM_DELETE_USER
(ID_USUARIO_IN IN NUMBER,
ID_TIPO_USUARIO_IN IN NUMBER,
STATUS_RESULT_OUT OUT NUMBER)
AS
INVALID_MODEL EXCEPTION;
USER_DELETED EXCEPTION;
USER_NOT_FOUND EXCEPTION;
MIN_TIPO NUMBER := 0;
MAX_TIPO NUMBER := 0;
COUNT_USER NUMBER :=0;
BEGIN
    SELECT MIN(ID_TIPO_USUARIO), MAX(ID_TIPO_USUARIO) INTO MIN_TIPO, MAX_TIPO FROM TIPO_USUARIO;
    MAX_TIPO:= MAX_TIPO + 2;
    IF ID_TIPO_USUARIO_IN NOT  BETWEEN MIN_TIPO AND MAX_TIPO THEN
        RAISE INVALID_MODEL;
    END IF;
    DBMS_OUTPUT.PUT_LINE('ID_TIPO_USUARIO_IN: ' || ID_TIPO_USUARIO_IN);
    CASE ID_TIPO_USUARIO_IN
        WHEN 6 THEN 
            SELECT COUNT(*) INTO COUNT_USER FROM PRODUCTOR WHERE ID_PRODUCTOR = ID_USUARIO_IN;
            IF  COUNT_USER = 0 THEN
                RAISE USER_NOT_FOUND;
            ELSE
                DELETE FROM PRODUCTOR WHERE ID_PRODUCTOR = ID_USUARIO_IN;
                RAISE USER_DELETED;
            COMMIT;
            END IF;
        WHEN 7 THEN
            SELECT COUNT(*) INTO COUNT_USER FROM TRANSPORTISTA WHERE ID_TRANSPORTISTA = ID_USUARIO_IN;
            IF  COUNT_USER = 0 THEN
                RAISE USER_NOT_FOUND;
            ELSE
                DELETE FROM TRANSPORTISTA WHERE ID_TRANSPORTISTA = ID_USUARIO_IN;
                RAISE USER_DELETED;
            COMMIT;
            END IF;
        ELSE
            SELECT COUNT(*) INTO COUNT_USER FROM USUARIO WHERE ID_USUARIO = ID_USUARIO_IN;
            IF  COUNT_USER = 0 THEN
                RAISE USER_NOT_FOUND;
            ELSE
                DELETE FROM USUARIO WHERE ID_USUARIO = ID_USUARIO_IN;
                RAISE USER_DELETED;
            COMMIT;
            END IF;
    END CASE;

EXCEPTION
    WHEN USER_NOT_FOUND THEN
        STATUS_RESULT_OUT:= 0;
        DBMS_OUTPUT.PUT_LINE('USUARIO NO ENCONTRADO' );
    WHEN INVALID_MODEL THEN
        STATUS_RESULT_OUT:= -1;
        DBMS_OUTPUT.PUT_LINE('MODELO INGRESADO INVALIDO' );
    WHEN USER_DELETED THEN
        STATUS_RESULT_OUT:= 1;
        DBMS_OUTPUT.PUT_LINE('USUARIO ELIMINADO CORRECTAMENTE' );
        COMMIT;
    WHEN OTHERS THEN
        STATUS_RESULT_OUT:= -2;
        DBMS_OUTPUT.PUT_LINE('UPS HUBO UN ERROR' );
END FV_ADM_DELETE_USER;

/*
SET SERVEROUTPUT ON;    

DECLARE
STATUS_RESULT_OUT NUMBER;
BEGIN
    FV_ADM_DELETE_USER(1,1,STATUS_RESULT_OUT);
    DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT: '||STATUS_RESULT_OUT);
END;
*/