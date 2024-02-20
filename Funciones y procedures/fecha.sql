DELIMITER $$ 
DROP PROCEDURE IF EXISTS fecha $$
CREATE PROCEDURE fecha(IN f DATE)
BEGIN 
	DECLARE d,m,a INT;
	SET d=day(f);
	SET m=month(f);
	SET a=year(f);
	SELECT CONCAT("Dia: ",d) AS Fecha;
	SELECT CONCAT("Mes: ",m) AS Fecha;
	SELECT CONCAT("Año: ",a) AS Fecha;
END $$

DELIMITER ; 