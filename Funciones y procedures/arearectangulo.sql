/* Función area rectangulo */

DELIMITER $$

CREATE FUNCTION area_rectangulo(a INT,b INT) RETURNS INT 
BEGIN 
	DECLARE area INT;
	SET area=a*b;
	RETURN(area);
END $$ 

DELIMITER ;