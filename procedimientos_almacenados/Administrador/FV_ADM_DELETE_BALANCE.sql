create or replace PROCEDURE FV_ADM_DELETE_BALANCE
 (
    ID_SALDO_IN IN NUMBER,
    STATUS_RESULT_OUT OUT NUMBER
)

AS 
    COUNT_BALANCE NUMBER :=0;
    
   
    BALANCE_NOT_FOUND EXCEPTION;
    BALANCE_DELETED EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO COUNT_BALANCE FROM SALDO WHERE ID_SALDO = ID_SALDO_IN;
    IF COUNT_BALANCE = 0 THEN
            RAISE BALANCE_NOT_FOUND;
    END IF;

    DELETE FROM SALDO WHERE ID_SALDO = ID_SALDO_IN;
    RAISE BALANCE_DELETED;
    
    EXCEPTION
    WHEN BALANCE_DELETED THEN
        STATUS_RESULT_OUT := 1;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('SALDO ELIMINADO' );
    WHEN BALANCE_NOT_FOUND THEN
        STATUS_RESULT_OUT := 0;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('SALDO NO ENCONTRADO' );
    WHEN OTHERS THEN   
        STATUS_RESULT_OUT:= -1;
        DBMS_OUTPUT.PUT_LINE('UPS HUBO UN ERROR EN EL PL' );
        
END;

-- DECLARE
--  STATUS_RESULT_OUT NUMBER;

-- BEGIN
--  FV_ADM_DELETE_BALANCE(1, STATUS_RESULT_OUT);
--      DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT: '||STATUS_RESULT_OUT);

-- END;
    

