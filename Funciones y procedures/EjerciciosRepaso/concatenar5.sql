/* procedimiento que muestre dos cadenas pasadas como parámetros concatenadas y en
mayúsculas*/
DELIMITER $$ 
DROP PROCEDURE IF EXISTS concatenar $$
CREATE PROCEDURE concatenar(cad1 VARCHAR(10),cad2 VARCHAR(10))
BEGIN 
	DECLARE con VARCHAR(20);
	SET con=CONCAT(cad1,cad2);
	SELECT  UPPER(con) AS concatenar;
END $$ 
DELIMITER ;

CALL concatenar("maricon","el que lo lea");