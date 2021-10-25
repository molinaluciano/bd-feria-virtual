CREATE OR REPLACE TRIGGER TRG_AUCTION_CREATION
BEFORE UPDATE OF PRODUCTOR_SELECCIONADO ON SOLICITUD 
FOR EACH ROW
BEGIN
    INSERT INTO SUBASTA (ID_SOLICITUD, ID_ESTADO_SUBASTA, FECHA_PUBLICACION) VALUES (:old.ID_SOLICITUD, 1, SYSDATE); 
END;

