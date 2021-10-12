CREATE OR REPLACE PROCEDURE FV_FINISH_SALE (
    ID_VENTA_IN IN NUMBER,
    RESPONSE_CODE_IN IN NUMBER,
    STATUS_RESULT_OUT OUT NUMBER
)
AS 
    SALE_FINISHED EXCEPTION;
    SALE_REJECTED EXCEPTION;
    SALE_NOT_FOUND EXCEPTION;
    COUNT_SALES NUMBER := 0;
    
BEGIN

    IF RESPONSE_CODE_IN != 0 THEN
        RAISE SALE_REJECTED;
    END IF;
    
    SELECT COUNT(*) INTO COUNT_SALES FROM VENTA WHERE ID_VENTA = ID_VENTA_IN;
    IF COUNT_SALES <= 0 THEN
        RAISE SALE_NOT_FOUND;
    END IF;
    
    IF RESPONSE_CODE_IN = 0 THEN
        UPDATE VENTA SET ID_ESTADO_VENTA = 6 WHERE ID_VENTA = ID_VENTA_IN;
    END IF;
    
EXCEPTION 
    WHEN SALE_REJECTED THEN
        STATUS_RESULT_OUT := 0;
        DBMS_OUTPUT.PUT_LINE('TRANSACCION RECHAZADA');
    WHEN SALE_NOT_FOUND THEN
        STATUS_RESULT_OUT := 0;
        DBMS_OUTPUT.PUT_LINE('VENTA NO ENCONTRADA');
    WHEN SALE_FINISHED THEN
        STATUS_RESULT_OUT := 0;
        DBMS_OUTPUT.PUT_LINE('TRANSACCION EXITOSA');
END;