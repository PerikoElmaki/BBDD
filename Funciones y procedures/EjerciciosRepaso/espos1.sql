/* procedimiento que indique si un número (de tipo entero) pasado como 
parámetro es positivo, negativo o cero.*/
DELIMITER $$
DROP PROCEDURE IF EXISTS espos $$
CREATE PROCEDURE espos(num INT)
BEGIN 
	IF num>0 THEN 
		SELECT CONCAT(num," es positivo") AS Resultado;
	ELSE  
		SELECT CONCAT(num," es negativo") AS Resultado;
	END IF;
	IF num=0 THEN 
		SELECT CONCAT(num," es cero") AS Resultado;
	END IF;
END $$
DELIMITER ;