-- REQUIERE FUNCION FN_VALID_USER Y TRIGGER PARA INCREMENTAR IDs DE USUARIO - TRANSPORTISTA Y PRODUCTOR
create or replace PROCEDURE FV_ADM_CREATE_USER
 (
    ID_TIPO_USUARIO_IN IN NUMBER ,
    ID_PAIS_IN IN NUMBER,
    NOMBRE_IN IN VARCHAR2,
    APELLIDO_PATERNO_IN IN VARCHAR2,
    APELLIDO_MATERNO_IN IN VARCHAR2,
    CORREO_IN IN VARCHAR2,
    CONTRASENA_IN IN VARCHAR2,
    RUT_IN IN NUMBER,
    NUMER_IDENTIFICADOR_IN IN VARCHAR2,
    DIRECCION_IN IN VARCHAR2,
    CODIGO_POSTAL_IN IN NUMBER,
    TELEFONO_IN IN NUMBER,
    ID_CONTRATO_IN IN NUMBER,
    ID_RESULT_OUT OUT NUMBER,
    STATUS_RESULT_OUT OUT NUMBER
    
)

AS
    USER_FOUND EXCEPTION;
    INVALID_MODEL EXCEPTION;
    USER_CREATED EXCEPTION;
    COUNT_USER NUMBER := 0;
    IS_VALID_USER NUMBER  := 0;
    -- ID_RESULT_OUT NUMBER := 0;
BEGIN
        SELECT COUNT(*) INTO COUNT_USER FROM USUARIO WHERE CORREO = CORREO_IN;
        IF  COUNT_USER > 0 THEN
            RAISE USER_FOUND;
        END IF;
        
        SELECT COUNT(*) INTO COUNT_USER FROM PRODUCTOR 
        WHERE CORREO = CORREO_IN;
        IF COUNT_USER > 0 THEN
            RAISE USER_FOUND; 
        END IF;
        
        SELECT COUNT(*) INTO COUNT_USER FROM TRANSPORTISTA 
        WHERE CORREO = CORREO_IN;
        IF COUNT_USER > 0 THEN
            RAISE USER_FOUND; 
        END IF;

        SELECT  FN_VALID_USER(
                    ID_PAIS_IN,
                    NOMBRE_IN, 
                    APELLIDO_PATERNO_IN, 
                    APELLIDO_MATERNO_IN, 
                    CORREO_IN, 
                    CONTRASENA_IN, 
                    RUT_IN, 
                    NUMER_IDENTIFICADOR_IN, 
                    DIRECCION_IN, 
                    CODIGO_POSTAL_IN, 
                    TELEFONO_IN
                ) INTO IS_VALID_USER FROM DUAL;

        IF IS_VALID_USER != 1 THEN
            DBMS_OUTPUT.PUT_LINE('HAY PROBLEMA CON LA FUNCION DEBIDO A QUE EL MODELO NO ESTA COMPLETO' );
            RAISE INVALID_MODEL;
        END IF;

        IF ID_TIPO_USUARIO_IN NOT BETWEEN 1 AND 7 THEN
            RAISE INVALID_MODEL;
        ELSE 
            CASE ID_TIPO_USUARIO_IN
            WHEN 6 THEN
                IF ID_CONTRATO_IN IS NULL OR ID_CONTRATO_IN = '' THEN
                    RAISE INVALID_MODEL;
                END IF;

                INSERT INTO PRODUCTOR 
                ( 
                NOMBRE, 
                APELLIDO_PATERNO, 
                APELLIDO_MATERNO, 
                CORREO, 
                CONTRASENA, 
                RUT, 
                NUMERO_IDENTIFICADOR, 
                DIRECCION, 
                CODIGO_POSTAL, 
                TELEFONO,
                ID_CONTRATO
                ) 
                VALUES (
                    NOMBRE_IN, 
                    APELLIDO_PATERNO_IN, 
                    APELLIDO_MATERNO_IN, 
                    CORREO_IN, 
                    CONTRASENA_IN, 
                    RUT_IN, 
                    NUMER_IDENTIFICADOR_IN, 
                    DIRECCION_IN, 
                    CODIGO_POSTAL_IN, 
                    TELEFONO_IN,
                    ID_CONTRATO_IN
                ) RETURN ID_PRODUCTOR INTO ID_RESULT_OUT;
                RAISE USER_CREATED;
            WHEN 7 THEN 
                INSERT INTO TRANSPORTISTA 
                ( 
                NOMBRE, 
                APELLIDO_PATERNO, 
                APELLIDO_MATERNO, 
                CORREO, 
                CONTRASENA, 
                RUT, 
                NUMERO_IDENTIFICADOR, 
                DIRECCION, 
                CODIGO_POSTAL, 
                TELEFONO
                ) 
                VALUES (
                    NOMBRE_IN, 
                    APELLIDO_PATERNO_IN, 
                    APELLIDO_MATERNO_IN, 
                    CORREO_IN, 
                    CONTRASENA_IN, 
                    RUT_IN, 
                    NUMER_IDENTIFICADOR_IN, 
                    DIRECCION_IN, 
                    CODIGO_POSTAL_IN, 
                    TELEFONO_IN
                ) RETURN ID_TRANSPORTISTA INTO ID_RESULT_OUT;
                RAISE USER_CREATED;
            ELSE
                INSERT INTO USUARIO 
                (
                ID_TIPO_USUARIO,
                ID_PAIS, 
                NOMBRE, 
                APELLIDO_PATERNO, 
                APELLIDO_MATERNO, 
                CORREO, 
                CONTRASENA, 
                RUT, 
                NUMERO_IDENTIFICADOR, 
                DIRECCION, 
                CODIGO_POSTAL, 
                TELEFONO
                ) 
                VALUES (
                    ID_TIPO_USUARIO_IN,
                    ID_PAIS_IN,
                    NOMBRE_IN, 
                    APELLIDO_PATERNO_IN, 
                    APELLIDO_MATERNO_IN, 
                    CORREO_IN, 
                    CONTRASENA_IN, 
                    RUT_IN, 
                    NUMER_IDENTIFICADOR_IN, 
                    DIRECCION_IN, 
                    CODIGO_POSTAL_IN, 
                    TELEFONO_IN
                ) RETURN ID_USUARIO INTO ID_RESULT_OUT;
                
                RAISE USER_CREATED;
            END CASE;
        END IF;

       
EXCEPTION
    WHEN USER_CREATED THEN
        STATUS_RESULT_OUT:= 1;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('USUARIO CREADO' );
    WHEN USER_FOUND THEN
        STATUS_RESULT_OUT:= 0;
        DBMS_OUTPUT.PUT_LINE('SE ENCONTRO EL USUARIO' );
    WHEN INVALID_MODEL THEN
        STATUS_RESULT_OUT:= -1;
        DBMS_OUTPUT.PUT_LINE('MODELO INGRESADO INVALIDO' );
    WHEN OTHERS THEN
        STATUS_RESULT_OUT:= -2;
        DBMS_OUTPUT.PUT_LINE('UPS HUBO UN ERROR' );
   
END;




-- EJECUCION
-- DECLARE 
--      ID_RESULT_OUT NUMBER;
--      STATUS_RESULT_OUT NUMBER;
-- BEGIN
--     FV_ADM_CREATE_USER(1,1,'NUEVOADMIN','NUEVOADMIN','NUEVOADMIN', 'NUEVOADMIN@NUEVOADMIN.com','NUEVOADMIN',12345678,'k','Rencas 1673', 80001, 94986612, NULL,ID_RESULT_OUT, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('ID_RESULT_OUT EXTERNO ='||ID_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
--     FV_ADM_CREATE_USER(2,1,'NUEVOCLIENTEEXTERNO','NUEVOCLIENTEEXTERNO','NUEVOCLIENTEEXTERNO', 'NUEVOCLIENTEEXTERNO@NUEVOCLIENTEEXTERNO.com','NUEVOCLIENTEEXTERNO',12345678,'k','Rencas 1673', 80001, 94986612, NULL,ID_RESULT_OUT, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('ID_RESULT_OUT EXTERNO ='||ID_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
--     FV_ADM_CREATE_USER(3,1,'NUEVOCLIENTELOCAL','NUEVOCLIENTELOCAL','NUEVOCLIENTELOCAL', 'NUEVOCLIENTELOCAL@NUEVOCLIENTELOCAL.com','NUEVOCLIENTELOCAL',12345678,'k','Rencas 1673', 80001, 94986612, NULL,ID_RESULT_OUT, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('ID_RESULT_OUT EXTERNO ='||ID_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
--     FV_ADM_CREATE_USER(4,1,'NUEVOCLIENTEINTERNO','NUEVOCLIENTEINTERNO','NUEVOCLIENTEINTERNO', 'NUEVOCLIENTEINTERNO@NUEVOCLIENTEINTERNO.com','NUEVOCLIENTEINTERNO',12345678,'k','Rencas 1673', 80001, 94986612, NULL,ID_RESULT_OUT, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('ID_RESULT_OUT EXTERNO ='||ID_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
--     FV_ADM_CREATE_USER(5,1,'NUEVOCONSULTOR','NUEVOCONSULTOR','NUEVOCONSULTOR', 'NUEVOCONSULTOR@NUEVOCONSULTOR.com','NUEVOCONSULTOR',12345678,'k','Rencas 1673', 80001, 94986612, NULL,ID_RESULT_OUT, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('ID_RESULT_OUT EXTERNO ='||ID_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
--     FV_ADM_CREATE_USER(6,1,'NUEVOPRODUCTOR','NUEVOPRODUCTOR','NUEVOPRODUCTOR', 'NUEVOPRODUCTOR@NUEVOPRODUCTOR.com','NUEVOPRODUCTOR',12345678,'k','Rencas 1673', 80001, 94986612, 1,ID_RESULT_OUT, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('ID_RESULT_OUT EXTERNO ='||ID_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
--     FV_ADM_CREATE_USER(7,1,'NUEVOTRASNPORTISTA','NUEVOTRASNPORTISTA','NUEVOTRASNPORTISTA', 'NUEVOTRASNPORTISTA@NUEVOTRASNPORTISTA.com','NUEVOTRASNPORTISTA',12345678,'k','Rencas 1673', 80001, 94986612, NULL,ID_RESULT_OUT, STATUS_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('ID_RESULT_OUT EXTERNO ='||ID_RESULT_OUT);
--     DBMS_OUTPUT.PUT_LINE('STATUS_RESULT_OUT EXTERNO ='||STATUS_RESULT_OUT);
-- END;