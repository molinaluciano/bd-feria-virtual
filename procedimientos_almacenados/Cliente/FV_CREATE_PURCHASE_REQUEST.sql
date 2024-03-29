CREATE OR REPLACE PROCEDURE FV_CREATE_PURCHASE_REQUEST (
    ID_USUARIO_IN IN NUMBER,
    ID_TIPO_SOLICITUD_IN IN NUMBER,
    KILOS_IN IN NUMBER,
    ID_FRUTA_IN IN NUMBER,
    CALIDAD_IN IN NUMBER,
    ID_RESULT_OUT OUT NUMBER,
    ID_REQUEST_DETAIL_RESULT_OUT OUT NUMBER,
    STATUS_RESULT_OUT OUT NUMBER
)
AS
    INVALID_MODEL EXCEPTION;
    REQUEST_CREATED EXCEPTION;
    
    INVALID_TYPE_REQUEST EXCEPTION;
    INVALID_USER EXCEPTION;
    INVALID_FRUIT EXCEPTION;
    INVALID_QUALITY EXCEPTION;

    
    IS_VALID_REQUEST NUMBER := 0;
    ID_REQUEST_VAL NUMBER := 0;
    ID_DETAIL_REQUEST_VAL NUMBER := 0;
    MIN_ESTADO NUMBER :=0;
    MAX_ESTADO NUMBER :=0;
    COUNT_USER NUMBER :=0;
    COUNT_FRUIT NUMBER :=0;
    COUNT_QUALITY NUMBER :=0;


BEGIN

    SELECT FN_VALID_REQUEST(ID_USUARIO_IN, ID_TIPO_SOLICITUD_IN, KILOS_IN, ID_FRUTA_IN, CALIDAD_IN) INTO IS_VALID_REQUEST FROM DUAL;
    IF IS_VALID_REQUEST != 1 THEN
            DBMS_OUTPUT.PUT_LINE('HAY PROBLEMA CON LA FUNCION DEBIDO A QUE EL MODELO NO ESTA COMPLETO' );
            RAISE INVALID_MODEL;
    END IF;
    
    SELECT MIN(ID_TIPO_SOLICITUD), MAX(ID_TIPO_SOLICITUD) INTO MIN_ESTADO, MAX_ESTADO FROM TIPO_SOLICITUD;
    IF ID_TIPO_SOLICITUD_IN NOT BETWEEN MIN_ESTADO AND MAX_ESTADO THEN
            RAISE INVALID_TYPE_REQUEST;
    END IF;
    
    SELECT COUNT(*) INTO COUNT_USER FROM USUARIO WHERE ID_USUARIO = ID_USUARIO_IN;
    IF COUNT_USER = 0 THEN
            RAISE INVALID_USER;
    END IF;
    
    SELECT COUNT(*) INTO COUNT_FRUIT FROM FRUTA WHERE ID_FRUTA = ID_FRUTA_IN;
    IF COUNT_FRUIT = 0 THEN
        RAISE INVALID_FRUIT;
    END IF;
    
    SELECT COUNT(*) INTO COUNT_QUALITY FROM CALIDAD WHERE ID_CALIDAD = CALIDAD_IN;
    IF COUNT_QUALITY = 0 THEN
        RAISE INVALID_QUALITY;
    END IF;
    
    INSERT INTO SOLICITUD (ID_USUARIO, ID_TIPO_SOLICITUD, ID_ESTADO_SOLICITUD, PRODUCTOR_SELECCIONADO, FECHA_PUBLICACION) VALUES (ID_USUARIO_IN, ID_TIPO_SOLICITUD_IN, 0, null, sysdate) RETURN ID_SOLICITUD INTO ID_REQUEST_VAL;
    INSERT INTO DETALLE_SOLICITUD (ID_SOLICITUD, ID_FRUTA, ID_CALIDAD, KILOS) VALUES (ID_REQUEST_VAL, ID_FRUTA_IN, CALIDAD_IN, KILOS_IN) RETURN ID_DETALLE_SOLICITUD INTO ID_DETAIL_REQUEST_VAL;
    RAISE REQUEST_CREATED;

EXCEPTION
    WHEN REQUEST_CREATED THEN
        ID_RESULT_OUT:= ID_REQUEST_VAL;
       ID_REQUEST_DETAIL_RESULT_OUT:= ID_DETAIL_REQUEST_VAL;
        STATUS_RESULT_OUT:= 1;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('SOLICITUD CREADA' );
    WHEN INVALID_MODEL THEN
        STATUS_RESULT_OUT:= 0;
        DBMS_OUTPUT.PUT_LINE('MODELO INVALIDO' );
    WHEN INVALID_TYPE_REQUEST THEN
        STATUS_RESULT_OUT:= -1;
        DBMS_OUTPUT.PUT_LINE('TIPO DE SOLICITUD INVALIDO' );
    WHEN INVALID_USER THEN
        STATUS_RESULT_OUT:= -2;
        DBMS_OUTPUT.PUT_LINE('USUARIO NO ENCONTRADO' );
    WHEN INVALID_FRUIT THEN
        STATUS_RESULT_OUT:= -3;
        DBMS_OUTPUT.PUT_LINE('FRUTA NO ENCONTRADA' );
    WHEN INVALID_QUALITY THEN
        STATUS_RESULT_OUT:= -4;
        DBMS_OUTPUT.PUT_LINE('CALIDAD INVALIDA' );
    WHEN OTHERS THEN 
        STATUS_RESULT_OUT:= -5;
        DBMS_OUTPUT.PUT_LINE('UPS HUBO UN ERROR' );
END;


-- DECLARE
-- STATUS_RESULT_OUT NUMBER;
-- ID_RESULT_OUT NUMBER;
-- ID_REQUEST_DETAIL_RESULT_OUT NUMBER;

-- BEGIN
--     FV_CREATE_PURCHASE_REQUEST(1,1,1500,1,1,ID_RESULT_OUT,ID_REQUEST_DETAIL_RESULT_OUT, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT: '||STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('ID_RESULT_OUT: '||ID_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('ID_REQUEST_DETAIL_RESULT_OUT: '||ID_REQUEST_DETAIL_RESULT_OUT);


-- END;
    
    
    