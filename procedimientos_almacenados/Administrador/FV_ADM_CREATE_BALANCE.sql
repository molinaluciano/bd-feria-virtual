create or replace PROCEDURE FV_ADM_CREATE_BALANCE
 (
    ID_FRUTA_IN IN NUMBER,
    ID_CALIDAD_IN IN NUMBER,
    ID_CLIENTE_COMPRADOR_IN IN NUMBER,
    DISPONIBLE_IN IN NUMBER,
    KILOS_IN IN NUMBER,
    ID_RESULT_OUT OUT NUMBER,
    STATUS_RESULT_OUT OUT NUMBER
)

AS 
    COUNT_USER NUMBER :=0;
    COUNT_FRUIT NUMBER :=0;
    COUNT_QUALITY NUMBER :=0;
    
    INVALID_USER EXCEPTION;
    INVALID_FRUIT EXCEPTION;
    INVALID_QUALITY EXCEPTION;
    INVALID_AVAILABILITY EXCEPTION;
    
    BALANCE_CREATED EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO COUNT_USER FROM USUARIO WHERE ID_USUARIO = ID_CLIENTE_COMPRADOR_IN;
    IF COUNT_USER = 0 THEN
            RAISE INVALID_USER;
    END IF;
    
    SELECT COUNT(*) INTO COUNT_FRUIT FROM FRUTA WHERE ID_FRUTA = ID_FRUTA_IN;
    IF COUNT_FRUIT = 0 THEN
        RAISE INVALID_FRUIT;
    END IF;
    
    SELECT COUNT(*) INTO COUNT_QUALITY FROM CALIDAD WHERE ID_CALIDAD = ID_CALIDAD_IN;
    IF COUNT_QUALITY = 0 THEN
        RAISE INVALID_QUALITY;
    END IF;
    
    IF DISPONIBLE_IN NOT BETWEEN 0 AND 1  THEN
        RAISE INVALID_AVAILABILITY;
    END IF;
    
    INSERT INTO SALDO 
    (
    ID_FRUTA, 
    ID_CALIDAD, 
    ID_CLIENTE_COMPRADOR, 
    DISPONIBLE, 
    KILOS) 
    VALUES 
    (
    ID_FRUTA_IN, 
    ID_CALIDAD_IN, 
    ID_CLIENTE_COMPRADOR_IN,
    DISPONIBLE_IN,
    KILOS_IN)
    RETURN ID_SALDO INTO ID_RESULT_OUT;
    RAISE BALANCE_CREATED;
    
    EXCEPTION
    WHEN BALANCE_CREATED THEN
        STATUS_RESULT_OUT := 1;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('SALDO CREADO' );
    WHEN INVALID_USER THEN
        STATUS_RESULT_OUT := 0;
        DBMS_OUTPUT.PUT_LINE('USUARIO INVALIDO' );
    WHEN INVALID_FRUIT THEN
        STATUS_RESULT_OUT := -1;
        DBMS_OUTPUT.PUT_LINE('FRUTA INVALIDA' );
    WHEN INVALID_QUALITY THEN
        STATUS_RESULT_OUT := -2;
        DBMS_OUTPUT.PUT_LINE('CALIDAD INVALIDA' );
    WHEN INVALID_AVAILABILITY THEN
        STATUS_RESULT_OUT := -3;
        DBMS_OUTPUT.PUT_LINE('DISPONIBILIDAD INVALIDA' );
    WHEN OTHERS THEN   
        STATUS_RESULT_OUT:= -4;
        DBMS_OUTPUT.PUT_LINE('UPS HUBO UN ERROR EN EL PL' );
        
END;

-- DECLARE
--  STATUS_RESULT_OUT NUMBER;
-- ID_RESULT_OUT NUMBER;

-- BEGIN
--  FV_ADM_CREATE_BALANCE(1, 1, 1, 0, 1000, ID_RESULT_OUT, STATUS_RESULT_OUT);
--      DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT: '||STATUS_RESULT_OUT);
--      DBMS_OUTPUT.PUT_LINE('ID_RESULT_OUT: '||ID_RESULT_OUT);

-- END;


    

