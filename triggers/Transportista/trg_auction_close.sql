CREATE OR REPLACE TRIGGER TRG_AUCTION_CLOSE
BEFORE UPDATE OF CAMION_SELECCIONADO ON SUBASTA 
FOR EACH ROW
DECLARE 
    ID_VENTA_IN NUMBER := 0;
    ID_PRODUCTOR_SELECTED NUMBER := 0;
    PRECIO_PROD_IN NUMBER := 0;
    PRECIO_CAM_IN NUMBER := 0;
    PRECIO_NETO_IN NUMBER := 0;
    PRECIO_BRUTO_IN NUMBER := 0;


BEGIN

    UPDATE SOLICITUD SET ID_ESTADO_SOLICITUD = 5 WHERE ID_SOLICITUD = :old.ID_SOLICITUD;
    
    INSERT INTO VENTA (ID_SOLICITUD, ID_ESTADO_VENTA, ID_TIPO_PAGO) 
    VALUES (:old.ID_SOLICITUD, 1, 2)
    RETURN ID_VENTA INTO ID_VENTA_IN;
    

    -- SELECT PRODUCTOR_SELECCIONADO INTO ID_PRODUCTOR_SELECTED 
    -- FROM SOLICITUD WHERE ID_SOLICITUD = :old.ID_SOLICITUD;



    -- SELECT PRECIO INTO PRECIO_PROD_IN FROM PRODUCTOR_SOLICITUD 
    -- WHERE ID_SOLICITUD = :old.ID_SOLICITUD AND ID_PRODUCTOR = ID_PRODUCTOR_SELECTED;



    -- SELECT PRECIO INTO PRECIO_CAM_IN FROM DETALLE_SUBASTA 
    -- WHERE ID_SUBASTA = :old.ID_SUBASTA AND ID_CAMION = :old.CAMION_SELECCIONADO;


    -- PRECIO_NETO_IN := PRECIO_PROD_IN + PRECIO_CAM_IN;
    -- PRECIO_BRUTO_IN := ROUND((PRECIO_PROD_IN + PRECIO_CAM_IN) * 1.19);

    -- INSERT INTO DETALLE_VENTA 
    -- (
    -- ID_VENTA, 
    -- PRECIO_BRUTO,
    -- PRECIO_NETO,
    -- FECHA_INCIO,
    -- FECHA_FIN
    -- ) VALUES 
    -- (
    -- ID_VENTA_IN,
    -- PRECIO_NETO_IN,
    -- PRECIO_BRUTO_IN,
    -- SYSDATE,
    -- SYSDATE
    -- );

END;


