CREATE OR REPLACE PROCEDURE
FV_ADM_UPDATE_SALE_STATES(
ID_VENTA_IN IN NUMBER,
ID_ESTADO_VENTA_IN IN NUMBER,
STATUS_RESULT_OUT OUT NUMBER)

AS
INVALID_MODEL EXCEPTION;
SALE_NOT_FOUND EXCEPTION;
SALE_STATE_UPDATED EXCEPTION;
MIN_ESTADO NUMBER := 0;
MAX_ESTADO NUMBER := 0;
COUNT_SALE NUMBER :=0; 
ID_TEMP_VAR NUMBER :=0;
BEGIN

SELECT COUNT(*) INTO COUNT_SALE FROM VENTA WHERE ID_VENTA = ID_VENTA_IN;
SELECT MIN(ID_ESTADO_VENTA), MAX(ID_ESTADO_VENTA) INTO MIN_ESTADO, MAX_ESTADO FROM ESTADO_VENTA;

IF COUNT_SALE = 0 THEN
    RAISE SALE_NOT_FOUND;
END IF;
IF COUNT_SALE >0 THEN
    IF ID_ESTADO_VENTA_IN NOT BETWEEN MIN_ESTADO AND MAX_ESTADO THEN
        RAISE INVALID_MODEL;
    ELSE
        UPDATE VENTA SET ID_ESTADO_VENTA = ID_ESTADO_VENTA_IN WHERE ID_VENTA = ID_VENTA_IN;
        RAISE SALE_STATE_UPDATED;
    END IF;
END IF;

EXCEPTION
    WHEN SALE_NOT_FOUND THEN
        STATUS_RESULT_OUT:= 0;
        DBMS_OUTPUT.PUT_LINE('VENTA NO ENCONTRADA' );
    WHEN INVALID_MODEL THEN
        STATUS_RESULT_OUT:= -1;
        DBMS_OUTPUT.PUT_LINE('MODELO INGRESADO INVALIDO' );
    WHEN SALE_STATE_UPDATED THEN
        STATUS_RESULT_OUT:= 1;
        DBMS_OUTPUT.PUT_LINE('ESTADO ACTUALIZADO CORRECTAMENTE' );
    WHEN OTHERS THEN
        STATUS_RESULT_OUT:= -2;
        DBMS_OUTPUT.PUT_LINE('UPS HUBO UN ERROR' );
END FV_ADM_UPDATE_SALE_STATES;

/*
SET SERVEROUTPUT ON;    

DECLARE
STATUS_RESULT_OUT NUMBER;
BEGIN
    FV_ADM_UPDATE_SALE_STATES(1,1,STATUS_RESULT_OUT);
    DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT: '||STATUS_RESULT_OUT);
END;
*/