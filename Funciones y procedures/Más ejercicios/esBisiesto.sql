/*Función para saber si un año es bisiesto o no*/
DELIMITER $$
DROP FUNCTION IF EXISTS esBisiesto $$
CREATE FUNCTION esBisiesto(anio INT) RETURNS BOOLEAN
BEGIN 
	IF MOD(anio,4)=0 AND (anio%400=0 OR anio%100!=0) THEN 
		RETURN TRUE;
	ELSE 
		RETURN FALSE;
	END IF;
END $$
DELIMITER ;