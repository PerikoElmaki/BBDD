-- Primero cargamos la base de datos 
DROP DATABASE IF EXISTS envios ;
CREATE DATABASE envios ;
USE envios;
SOURCE C:\\envios.sql; -- IMPORTANTE SIN COMILLAS 

-- Procedimiento que muestre el nombre de las piezas que ha enviado un proveedor.
-- Proveedor como param 
DELIMITER $$
DROP PROCEDURE IF EXISTS piezaEnvio $$
CREATE PROCEDURE piezasEnvio(IN proveedor VARCHAR(4))
BEGIN 
	SELECT pnombre AS pieza,cant
	FROM P,SP 
	WHERE P.pn=SP.pn AND sn=proveedor;
END $$
DELIMITER ;
CALL piezasEnvio("S1");

--4. Función que determine el peso total de un envío.
-- como parámetro el código del proveedor y el código de la pieza
DELIMITER $$
DROP FUNCTION IF EXISTS pesoTotal $$
CREATE FUNCTION pesoTotal(proveedor VARCHAR(4),pieza VARCHAR(4)) RETURNS INT 
BEGIN 
	DECLARE pesoPieza,cantidad INT;
	SET pesoPieza=(SELECT peso FROM P WHERE pn=pieza);
	SET cantidad=(SELECT cant FROM SP WHERE pn=pieza AND sn=proveedor);
	RETURN IFNULL(pesoPieza,0)*IFNULL(cantidad,0); -- SUPONGO QUE ES IGUAL QUE NVL()
END $$
DELIMITER ;

SELECT pesoTotal("S1","P1");


DELIMITER $$
