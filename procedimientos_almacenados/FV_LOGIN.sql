CREATE OR REPLACE PROCEDURE FV_LOGIN
 (
    CORREO_IN IN  VARCHAR2,
    CONTRASENA_IN IN  VARCHAR2,
    ID_TIPO_USUARIO_IN IN NUMBER,
    STATUS_OUT OUT NUMBER, 
    TIPO_USUARIO_OUT OUT VARCHAR2
)
AS
 COUNT_USER NUMBER := 0;

BEGIN
    IF ID_TIPO_USUARIO_IN NOT BETWEEN 1 AND 5  OR CORREO_IN = '' OR CORREO_IN IS NULL OR CONTRASENA_IN = '' OR CONTRASENA_IN IS NULL THEN
        STATUS_OUT:= 0;
    ELSE       
        CASE ID_TIPO_USUARIO_IN 
            WHEN 1 THEN 
                DBMS_OUTPUT.PUT_LINE('ADMINISTRADOR');
                SELECT COUNT(*) INTO COUNT_USER FROM USUARIO WHERE CORREO = CORREO_IN AND CONTRASENA = CONTRASENA_IN AND ID_TIPO_USUARIO = 1;
                    IF  COUNT_USER > 0 THEN
                        STATUS_OUT:= 1;
                        TIPO_USUARIO_OUT:= 'ADMINISTRADOR';
                    ELSE 
                        STATUS_OUT:= 0;
                    END IF;
            WHEN 2 THEN
                DBMS_OUTPUT.PUT_LINE('CLIENTE');
                SELECT COUNT(*) INTO COUNT_USER FROM USUARIO WHERE CORREO = CORREO_IN AND CONTRASENA = CONTRASENA_IN AND ID_TIPO_USUARIO != 1 AND ID_TIPO_USUARIO != 4;
               
                    IF COUNT_USER > 0 THEN
                        SELECT  TU.CATEGORIA INTO TIPO_USUARIO_OUT FROM USUARIO U JOIN TIPO_USUARIO TU ON (U.ID_TIPO_USUARIO = TU.ID_TIPO_USUARIO) 
                        WHERE CORREO = CORREO_IN AND CONTRASENA = CONTRASENA_IN;
                        
                        STATUS_OUT:=1;
                    ELSE 
                         STATUS_OUT:= 0;
                    END IF;
                    
            WHEN 3 THEN
                DBMS_OUTPUT.PUT_LINE('CONSULTOR');
                SELECT COUNT(*) INTO COUNT_USER FROM USUARIO WHERE CORREO = CORREO_IN AND CONTRASENA = CONTRASENA_IN  AND ID_TIPO_USUARIO = 4;
              
                    IF COUNT_USER > 0 THEN
                        SELECT  TU.CATEGORIA INTO TIPO_USUARIO_OUT FROM USUARIO U JOIN TIPO_USUARIO TU ON (U.ID_TIPO_USUARIO = TU.ID_TIPO_USUARIO) 
                        WHERE U.CORREO = CORREO_IN AND U.CONTRASENA = CONTRASENA_IN AND U.ID_TIPO_USUARIO = 4;
                        
                        STATUS_OUT:=1;
                    ELSE 
                        STATUS_OUT:= 0;
                    END IF;
                    
            WHEN 4 THEN 
                DBMS_OUTPUT.PUT_LINE('PRODUCTOR');
                SELECT COUNT(*) INTO COUNT_USER FROM PRODUCTOR 
                WHERE CORREO = CORREO_IN AND CONTRASENA = CONTRASENA_IN;
                    IF COUNT_USER > 0 THEN
                        STATUS_OUT:=1;
                        TIPO_USUARIO_OUT:= 'PRODUCTOR';
                    ELSE 
                        STATUS_OUT:= 0;
                    END IF;
            WHEN 5 THEN
                DBMS_OUTPUT.PUT_LINE('TRANSPORTISTA');
                SELECT COUNT(*) INTO COUNT_USER FROM TRANSPORTISTA 
                WHERE CORREO = CORREO_IN AND CONTRASENA = CONTRASENA_IN;
                    IF COUNT_USER > 0 THEN
                        STATUS_OUT:=1;
                        TIPO_USUARIO_OUT:= 'TRANSPORTISTA';
                    ELSE 
                        STATUS_OUT:= 0;
                    END IF;
        END CASE;
    END IF;



EXCEPTION
    WHEN OTHERS THEN
        STATUS_OUT:= 0;
        DBMS_OUTPUT.PUT_LINE('UPS HUBO UN ERROR' );
END;