

DROP PROCEDURE IF EXISTS fecha2; 

DELIMITER $$

CREATE PROCEDURE fecha2(IN fecha DATE) 
BEGIN 
	SELECT CONCAT(day(fecha),"-",month(fecha),"-",year(fecha)) AS fecha;
END $$

DELIMITER ; 