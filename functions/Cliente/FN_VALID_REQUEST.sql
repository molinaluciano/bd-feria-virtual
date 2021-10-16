CREATE OR REPLACE FUNCTION FN_VALID_REQUEST
(   
    ID_USUARIO_IN NUMBER,
    ID_TIPO_SOLICITUD_IN NUMBER,
    KILOS_IN NUMBER,
    ID_FRUTA_IN NUMBER,
    CALIDAD_IN NUMBER,
    CATEGORIA_IN NUMBER
    
)

RETURN NUMBER AS 
    INVALID_MODEL_REQUEST EXCEPTION;
    IS_VALID_MODEL_REQUEST EXCEPTION;
    STATUS_RESULT NUMBER;
    
BEGIN
    IF 
    ID_TIPO_SOLICITUD_IN IS NULL OR ID_TIPO_SOLICITUD_IN = 0 OR 
    ID_USUARIO_IN IS NULL OR ID_USUARIO_IN = 0 OR 
    KILOS_IN IS NULL OR KILOS_IN = 0 OR 
    ID_FRUTA_IN IS NULL OR ID_FRUTA_IN = 0 OR 
    CALIDAD_IN IS NULL OR CALIDAD_IN = 0 OR 
    CATEGORIA_IN IS NULL OR CATEGORIA_IN = 0
    THEN 
        RAISE INVALID_MODEL_REQUEST;
    ELSE 
        RAISE IS_VALID_MODEL_REQUEST;
    END IF;
    
    RETURN STATUS_RESULT;
EXCEPTION
    WHEN INVALID_MODEL_REQUEST THEN 
        STATUS_RESULT:=0;
        RETURN STATUS_RESULT;
    WHEN IS_VALID_MODEL_REQUEST THEN 
        STATUS_RESULT:=1;
        RETURN STATUS_RESULT;
    WHEN OTHERS THEN
        STATUS_RESULT:=-1;
        RETURN STATUS_RESULT;
        DBMS_OUTPUT.PUT_LINE('OCURRIO UN ERROR EN LA FUNCTION ');
END FN_VALID_REQUEST;